function dr20_prm_pursuit()
    %% 1. Cargar y preparar el mapa
    load('Celdas_binarias_ejercicio.mat','sm4b');
    resolution = 8;               % celdas/m para DR20
    map = binaryOccupancyMap(sm4b, resolution);
    robotWidth = 0.25;            % ancho del DR20
    inflate(map, robotWidth/2);   % inflar obstáculos

    %% 2. Definir puntos de inicio y meta (Inf-Der → Sup-Izq)
    startMap = [map.XWorldLimits(2)-0.5, map.YWorldLimits(1)+0.2];
    goalMap  = [map.XWorldLimits(1)+0.15, map.YWorldLimits(2)-0.45];

    %% 3. Planificar PRM automático
    prm = robotics.PRM(map);
    prm.NumNodes           = 300;
    prm.ConnectionDistance = 5;
    pathPRM_auto = findpath(prm, startMap, goalMap);
    if isempty(pathPRM_auto)
        error('❌ No se encontró ruta PRM automática.');
    end

    %% 4. Cargar rutas desde .xlm con importdata
    S1 = importdata('pathPRM.xlm');
    if isstruct(S1)
        pathPRM = S1.data(:,1:2);
    else

        
        pathPRM = S1(:,1:2);
    end

    S2 = importdata('pathRRT.xlm');
    if isstruct(S2)
        pathRRT = S2.data(:,1:2);
    else
        pathRRT = S2(:,1:2);
    end

    %% 5. Visualizar rutas en el mapa MATLAB
    figure('Name','Rutas en coordenadas de mapa','NumberTitle','off');
    show(prm); hold on;
      plot(pathPRM_auto(:,1), pathPRM_auto(:,2), 'r--','LineWidth',1.5);
      plot(pathPRM(:,1),      pathPRM(:,2),      'm-','LineWidth',2);
      plot(pathRRT(:,1),      pathRRT(:,2),      'b-','LineWidth',2);
      plot(startMap(1), startMap(2), 'go','MarkerSize',8,'LineWidth',2);
      plot(goalMap(1),  goalMap(2),  'kx','MarkerSize',8,'LineWidth',2);
    legend('PRM auto','PRM cargada','RRT cargada','Inicio','Meta','Location','best');
    title('Rutas en coordenadas de mapa'); grid on; hold off;
    disp('Presiona ENTER para conectar con CoppeliaSim y transformar...');
    input('','s'); close;

    %% 6. Conectar con CoppeliaSim y leer pose inicial
    sim = remApi('remoteApi');
    sim.simxFinish(-1);
    clientID = sim.simxStart('127.0.0.1',19999,true,true,5000,5);
    assert(clientID > -1,'No se pudo conectar a CoppeliaSim.');
    sim.simxSynchronous(clientID,true);
    sim.simxStartSimulation(clientID, sim.simx_opmode_blocking);

    [~, leftMotor]  = sim.simxGetObjectHandle(clientID,'dr20_leftWheelJoint_',  sim.simx_opmode_blocking);
    [~, rightMotor] = sim.simxGetObjectHandle(clientID,'dr20_rightWheelJoint_', sim.simx_opmode_blocking);
    [~, robotBase]  = sim.simxGetObjectHandle(clientID,'dr20',                sim.simx_opmode_blocking);

    sim.simxGetObjectPosition(clientID,robotBase,-1,sim.simx_opmode_streaming);
    sim.simxGetObjectOrientation(clientID,robotBase,-1,sim.simx_opmode_streaming);
    pause(0.5);
    [~, pos0] = sim.simxGetObjectPosition(clientID,robotBase,-1,sim.simx_opmode_buffer);
    [~, ori0] = sim.simxGetObjectOrientation(clientID,robotBase,-1,sim.simx_opmode_buffer);
    initPose = [pos0(1), pos0(2), ori0(3)];

    %% 7. Transformar waypoints al frame de CoppeliaSim
    offset = initPose(1:2) - startMap;
    pathPRM_sim  = pathPRM  + offset;
    pathRRT_sim  = pathRRT  + offset;
    pathAuto_sim = pathPRM_auto + offset;
    goalSim      = goalMap + offset;

    %% 8. Visualizar rutas transformadas
    figure('Name','Rutas transformadas en Sim','NumberTitle','off');
    plot(pathAuto_sim(:,1), pathAuto_sim(:,2), 'r--','LineWidth',1.5); hold on;
    plot(pathPRM_sim(:,1),  pathPRM_sim(:,2),  'm-','LineWidth',2);
    plot(pathRRT_sim(:,1),  pathRRT_sim(:,2),  'b-','LineWidth',2);
    plot(initPose(1), initPose(2), 'go','MarkerSize',8,'LineWidth',2);
    plot(goalSim(1),    goalSim(2),    'kx','MarkerSize',8,'LineWidth',2);
    legend('PRM auto','PRM cargada','RRT cargada','InicioSim','MetaSim','Location','best');
    title('Rutas en frame de CoppeliaSim'); grid on; hold off;
    disp('Presiona ENTER para iniciar seguimiento...'); input('','s'); close;

    %% 9. Configurar controlador PurePursuit
    controller = robotics.PurePursuit;
    controller.Waypoints = pathPRM_sim;      % o pathRRT_sim
    controller.DesiredLinearVelocity = 0.5;
    controller.MaxAngularVelocity   = 1.2;
    controller.LookaheadDistance     = 0.10;
    release(controller);

    %% 10. Seguir la ruta con debug
    currentPose = initPose;
    goalRadius  = 0.1;
    pathReached = false;
    loopCount   = 0;

    while ~pathReached && loopCount < 5000
        loopCount = loopCount + 1;
        [v, w] = controller(currentPose);
        vL = v - (w * robotWidth)/2;
        vR = v + (w * robotWidth)/2;

        sim.simxSetJointTargetVelocity(clientID, leftMotor,  vL, sim.simx_opmode_streaming);
        sim.simxSetJointTargetVelocity(clientID, rightMotor, vR, sim.simx_opmode_streaming);
        sim.simxSynchronousTrigger(clientID);

        [~, pos] = sim.simxGetObjectPosition(clientID,robotBase,-1,sim.simx_opmode_buffer);
        [~, ori] = sim.simxGetObjectOrientation(clientID,robotBase,-1,sim.simx_opmode_buffer);
        currentPose = [pos(1), pos(2), ori(3)];

        dists = vecnorm(controller.Waypoints - currentPose(1:2),2,2);
        [~, idx] = min(dists);
        nextWP = controller.Waypoints(idx,:);
        fprintf('Iter %d → Pose: [%.2f,%.2f]  NextWP [%d]: [%.2f,%.2f]\n',...
                loopCount, currentPose(1),currentPose(2), idx, nextWP(1),nextWP(2));

        if norm(currentPose(1:2)-goalSim) < goalRadius
            pathReached = true;
        end
    end

    %% 11. Finalizar simulación
    sim.simxSetJointTargetVelocity(clientID, leftMotor,  0, sim.simx_opmode_oneshot);
    sim.simxSetJointTargetVelocity(clientID, rightMotor, 0, sim.simx_opmode_oneshot);
    sim.simxStopSimulation(clientID, sim.simx_opmode_blocking);
    sim.simxFinish(clientID);
    sim.delete();

    fprintf('\n✅ Llegada en Sim: [%.2f,%.2f] tras %d iteraciones\n',...
            currentPose(1), currentPose(2), loopCount);
end

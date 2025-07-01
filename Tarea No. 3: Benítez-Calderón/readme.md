<div align="center">
<picture>
    <source srcset="https://imgur.com/5bYAzsb.png" media="(prefers-color-scheme: dark)">
    <source srcset="https://imgur.com/Os03JoE.png" media="(prefers-color-scheme: light)">
    <img src="https://imgur.com/Os03JoE.png" alt="Escudo UNAL" width="350px">
</picture>
  
# Tarea No. 3: Navegacion por campo potencial 
</div>

## Integrantes:
Julián David Benítez Martínez
Jhon Alexander Calderón Suárez

## Parámetros:
Robot: Dr20
Resolución: 8 celdas/m
Entrada: Inferior-Derecha
Salida: Superior-Izquierda 




## Modelo cinemático del robot
El robot DR20 es un robot móvil con tracción diferencial, es decir, se desplaza gracias a dos ruedas motrices ubicadas a los costados izquierdo y derecho del chasis. Este tipo de robots se controla mediante las velocidades individuales de sus ruedas, y su movimiento puede modelarse con un conjunto de ecuaciones cinemáticas simples.

<div align="center">

<img src="https://github.com/user-attachments/assets/527477ea-889e-4d46-9a0d-88fbb4532f8a" alt="fig1" width="500"/>

Figura 1: Modelo del robot Dr20

</div>

Suposiciones:
* El robot se mueve en un plano 2D.
* No hay deslizamiento (contacto puro de rodadura).
* El centro de masa está entre ambas ruedas.
* El robot tiene ruedas idénticas, separadas por una distancia fija  L (ancho del eje o trackWidth).
* Las ruedas tienen un radio r constante.
  
Las ecuaciones cinemáticas del robot diferencial: <br>
dx/dt = v * cos(theta) <br>
dy/dt = v * sin(theta) <br>
dtheta/dt = omega

Donde:  <br>
v = r/2 * (v_R + v_L)<br>
w = r/L * (v_R - v_L)<br>
v_L = v - (wL)/2<br>
v_R = v + (wL)/2<br>

---

### ¿Qué es la función sigmoidal y para qué se usa en navegación robótica?

La **función sigmoidal** (por ejemplo, `sigmoid(x) = 1 / (1 + e^{-x})`) es una función matemática continua y suave con forma de "S", que **crece gradualmente desde 0 hasta 1**. También se conoce como función logística.

En navegación robótica, puede usarse para construir el **campo de repulsión de obstáculos** dentro de algoritmos de **campos potenciales artificiales**. Suaviza la interacción con los obstáculos y evita fuerzas infinitas cerca de ellos.

### Campo de repulsión sigmoidal

Una posible forma del campo:

`U_rep(d) = 1 / (1 + exp(k * (d - d0)))`

Donde:
- \( d \): distancia al obstáculo  
- \( d_0 \): distancia de activación (cuando empieza a actuar la repulsión)  
- \( k \): pendiente (qué tan brusco es el cambio)

---

### ✅ Ventajas sobre el campo paraboloide:
- Suave y continua → menos oscilaciones.
- Repulsión limitada → evita fuerzas excesivas.
- Ajustable mediante parámetros → más control.


## Mapas
El radio del circulo circunscrito al robot presenta un valor de 0,125 metros; por lo tanto el valor de corrección k tendrá un valor igual a 1,25.

El mapa denominado "arena2025", con la aplicación de k, corresponderá al siguiente:

![image](https://github.com/user-attachments/assets/0ade7b8a-a56b-4832-b87c-72ff4e7abd03)

A continuación se muestran los valores de las posiciones de los puntos de llegada y salida:


Luego se realiza la navegación por campos potenciales con 3 diferentes orientaciones iniciales, 




![image](https://github.com/user-attachments/assets/c1b6f823-c42a-4439-9ac0-e45fa560081d)

Ahora se realiza la ruta óptima por planeación PRM, para ello se utilizan los siguientes parámetros:
MaxNumNodes: 300
MaxConnectionDistance: 5.00


![image](https://github.com/user-attachments/assets/e2fab62e-aa91-4a6b-b3af-116f78fae8fb)

Ruta óptima (tabla):<br>
| Punto |     X      |     Y      |
|-------|------------|------------|
| 1     | 6.0000     | 0.2000     |
| 2     | 6.1093     | 0.2913     |
| 3     | 5.8411     | 0.9569     |
| 4     | 5.8718     | 2.1775     |
| 5     | 6.0323     | 4.3446     |
| 6     | 4.6045     | 4.5314     |
| 7     | 4.3644     | 5.5040     |
| 8     | 2.3795     | 5.6634     |
| 9     | 0.2203     | 6.0818     |
| 10    | 0.1500     | 6.0500     |


Costo total de la ruta óptima: 11.40 metros

Finalmente se realiza la ruta por planeación RRT, para ello se utilizan los siguientes parámetros:
MinIterations: 2000
ConnectionDistance: 2.50

![image](https://github.com/user-attachments/assets/50f82954-ce8b-4f2f-8014-9ac7551e5b5c)

| Punto |     X      |     Y      |
|-------|------------|------------|
| 1     | 6.0000     | 0.2000     |
| 2     | 5.6198     | 2.6500     |
| 3     | 5.2534     | 2.7228     |
| 4     | 5.6960     | 2.5375     |
| 5     | 6.0755     | 3.2219     |
| 6     | 5.8168     | 4.5380     |
| 7     | 5.8165     | 4.5728     |
| 8     | 4.3493     | 4.2371     |
| 9     | 4.4771     | 4.3274     |
| 10    | 4.2312     | 6.0482     |
| 11    | 4.6360     | 5.8744     |
| 12    | 4.0438     | 5.7817     |
| 13    | 3.7956     | 5.9304     |
| 14    | 3.6233     | 5.6919     |
| 15    | 3.4241     | 5.4407     |
| 16    | 1.0018     | 5.8915     |
| 17    | 0.1500     | 6.0500     |


Costo total de la ruta óptima (RRT): 16.15 met

## Simulacion en Matlab y CoppeliaSim
Para la simulación en CoppeliaSim se utilizó la escena de mapa2.ttt y se agregó el robot dr20 , al cual se le proporcionó el siguiente script enlazado para poder manipular su moviento a través de Matlab:
```lua
function sysCall_init()
    sim = require('sim')
    simRemoteApi.start(19999)
    -- do some initialization here
end

function sysCall_actuation()
    -- put your actuation code here
end

function sysCall_sensing()
    -- put your sensing code here
end

function sysCall_cleanup()
    -- do some clean-up here
end

-- See the user manual or the available code snippets for additional callback functions and details
```
En la siguiente imagen se pueden observar las dimensiones del laberinto el cual posee una forma cuadrada de 6.5m x 6.5m y una altura de pared de 0.4m, esto es suficiente para verse bien representado el movimiento del robot a demás de ser fiel a los mapas encontrados anteriormente 


![image](https://github.com/user-attachments/assets/3480665e-57a4-40d5-bc78-a6b7b8b887db)

Para incluir las rutas PRM y RRT a CoppeliaSim utilizamos el siguiente código: el cual incluye ambas rutas y traza una a partir de las dos, para esto utiliza unos archivos denominados PATH los cuales son archivos de ubicaciones que representan el movimiento a lo largo del laberinto, además de poder ajustar la posición inicial y la velocidad a la que el robot se desplaza, este código tambien permite observar la ruta planeada antes de ejecutarse en CoppeliaSim.


![image](https://github.com/user-attachments/assets/ae531d3d-b968-45ef-a4e9-e00a98076822)

``` Matlab
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

```
A partir de esto obtenemos en la simulación el siguiente resultado:

https://github.com/user-attachments/assets/61aa0548-805e-4de6-adab-8ef610d04e78

## Conclusiones y dificultades

-El uso de la Remote API permite controlar robots virtuales desde MATLAB, lo que facilita la implementación, prueba y depuración de algoritmos de navegación sin necesidad de hardware físico.

-Fue necesario alinear correctamente laS rutas PRM y RRT con el sistema de coordenadas de CoppeliaSim, ya que el mapa en MATLAB y el entorno de simulación no siempre comparten el mismo origen o escala.

-PRM y RRT son métodos efectivos para planificar trayectorias en mapas binarios, cada uno con ventajas distintas. PRM genera rutas más suaves en espacios abiertos, mientras que RRT es más eficiente en entornos complejos con muchos obstáculos.

-La lectura de rutas desde archivos externos (como .xls o .xlm) puede causar errores de formato o incompatibilidad con readmatrix/xlsread, complicando el flujo de trabajo si no se estandarizan correctamente.

-Se probaron diferentes rutas ya que algunas daban muy justas y el robot lograba chocar con las paredes, por lo tanto es importante verificar la ruta antes de implementar.







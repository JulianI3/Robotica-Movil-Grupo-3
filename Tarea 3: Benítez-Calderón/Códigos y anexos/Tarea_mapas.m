clear; clc;


load('Celdas_binarias_ejercicio.mat'); 

resolution = 8; % celdas/m
map = binaryOccupancyMap(sm4b, resolution);


figure(1);
show(map);
title('Figura 1: Mapa binario original');
xlabel('X (m)');
ylabel('Y (m)');

robot_TrackWidth = 0.25; % metros
inflate(map, robot_TrackWidth/2);

% Crear el planificador PRM
prm = robotics.PRM(map);

%Ejecutar planeación PRM
prm.NumNodes = 300;                % Ajustable según el mapa
prm.ConnectionDistance = 5;        % Ajustable según el mapa

% Guardar los valores usados para el reporte
MaxNumNodes = prm.NumNodes;
MaxConnectionDistance = prm.ConnectionDistance;

% Definir los puntos de inicio y objetivo
start = [map.XWorldLimits(2)-0.5, map.YWorldLimits(1)+0.2]; % Esquina inferior derecha
goal  = [map.XWorldLimits(1)+0.15, map.YWorldLimits(2)-0.45];  % Esquina superior izquierda

% Encontrar la ruta óptima
path = findpath(prm, start, goal);

% Mostrar el grafo y la ruta
figure(2);
show(prm);
hold on;
if ~isempty(path)
    plot(path(:,1), path(:,2), 'r-', 'LineWidth', 2);
    title('Figura 2: Ruta óptima PMR');
else
    title('Figura 2: No se encontró ruta');
end
hold off;

% Calcular la función de costo (distancia total)
if ~isempty(path)
    path_cost = 0;
    for i = 1:(size(path,1)-1)
        path_cost = path_cost + norm(path(i+1,:) - path(i,:));
    end
else
    path_cost = Inf;
end

% Presentar la ruta en tabla
if ~isempty(path)
    ruta_tabla = array2table(path, 'VariableNames', {'X', 'Y'});
    disp('Ruta óptima (tabla):');
    disp(ruta_tabla);
else
    disp('No se encontró ruta.');
end

% Reportar parámetros y función de costo
fprintf('\n--- Reporte ---\n');
fprintf('MaxNumNodes: %d\n', MaxNumNodes);
fprintf('MaxConnectionDistance: %.2f\n', MaxConnectionDistance);
fprintf('Función de costo: Suma de distancias euclidianas entre nodos consecutivos.\n');
fprintf('Costo total de la ruta óptima: %.2f metros\n', path_cost);


%% 4. Planeacion RRT

% Crear espacio de estados SE2 para 2D
stateSpace = stateSpaceSE2;
stateSpace.StateBounds = [map.XWorldLimits; map.YWorldLimits; [-pi pi]];

% Crear validador de estados (usando el mapa inflado)
validator = validatorOccupancyMap(stateSpace);
validator.Map = map;  % Usa el mapa inflado
validator.ValidationDistance = 0.05;  % Ajustable según la resolución y mapa

% Crear planificador RRT
rrt = plannerRRT(stateSpace, validator);
rrt.MaxIterations = 2000;              % Ajustable, mayor número mejora la probabilidad de éxito
rrt.MaxConnectionDistance = 2.5;       % Ajustable, influye en la conectividad

% Guardar valores para reporte
MinIterations = rrt.MaxIterations;
ConnectionDistanceRRT = rrt.MaxConnectionDistance;

% Definir start y goal como [x y theta]
start_rrt = [start, 0];  
goal_rrt  = [goal, 0];  

% Ejecutar planeación con RRT
[pthObj, solnInfo] = plan(rrt, start_rrt, goal_rrt);


figure(3); 
show(map); 
hold on;
if solnInfo.IsPathFound
    path_rrt = pthObj.States(:,1:2);
    plot(path_rrt(:,1), path_rrt(:,2), 'm-', 'LineWidth', 2);
    title('Figura 3: Ruta por RRT');
else
    title('Figura 3: No se encontró ruta con RRT');
end
hold off;


% Calcular la función de costo
if solnInfo.IsPathFound
    path_cost_rrt = 0;
    for i = 1:(size(path_rrt,1)-1)
        path_cost_rrt = path_cost_rrt + norm(path_rrt(i+1,:) - path_rrt(i,:));
    end
else
    path_cost_rrt = Inf;
end

% Presentar la ruta en tabla
if solnInfo.IsPathFound
    ruta_rrt_tabla = array2table(path_rrt, 'VariableNames', {'X', 'Y'});
    disp('Ruta óptima RRT (tabla):');
    disp(ruta_rrt_tabla);
else
    disp('No se encontró ruta con RRT.');
end

% Reporte
fprintf('\n--- Reporte RRT ---\n');
fprintf('MinIterations: %d\n', MinIterations);
fprintf('ConnectionDistance: %.2f\n', ConnectionDistanceRRT);
fprintf('Función de costo: Suma de distancias euclidianas entre nodos consecutivos.\n');
fprintf('Costo total de la ruta óptima (RRT): %.2f metros\n', path_cost_rrt);



%% Función auxiliar: buscar la celda libre más cercana
function nearest = findNearestFreeCell(map, point)
    % Define un radio de búsqueda creciente
    radius = 0.1; % metros
    while true
        [xGrid, yGrid] = meshgrid(point(1)-radius:0.05:point(1)+radius, ...
                                  point(2)-radius:0.05:point(2)+radius);
        % Filtra puntos que están libres
        isFree = ~checkOccupancy(map, [xGrid(:), yGrid(:)]);
        if any(isFree)
            % Devuelve el más cercano
            freePoints = [xGrid(isFree), yGrid(isFree)];
            dists = vecnorm(freePoints - point, 2, 2);
            [~, idx] = min(dists);
            nearest = freePoints(idx, :);
            return;
        end
        radius = radius + 0.05; % Aumentar radio de búsqueda
    end
end

% Ecuaciones del movimiento
function dst = robot_eom(t, state, v_r, v_l, L)
    x = state(1); y = state(2); th = state(3);
    vr = v_r(t); vl = v_l(t);
    v = (vr + vl)/2;
    omega = (vr - vl)/L;
    dst = [v*cos(th); v*sin(th); omega];
end


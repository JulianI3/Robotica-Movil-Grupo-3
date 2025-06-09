clear; clc;

%% Cargar mapa
load('Celdas_binarias_ejercicio.mat'); 
resolution = 8; % celdas/m
map = binaryOccupancyMap(sm4b, resolution);

% Inflar obstáculos por el radio del robot
robot_TrackWidth = 0.28; % m
inflate(map, robot_TrackWidth / 2);

% Puntos de inicio y objetivo
start = [map.XWorldLimits(2)-0.5, map.YWorldLimits(1)+0.2];
goal  = [map.XWorldLimits(1)+0.15, map.YWorldLimits(2)-0.45];

%% Planeación PRM
prm = robotics.PRM(map);
prm.NumNodes = 300;
prm.ConnectionDistance = 5;
pathPRM = findpath(prm, start, goal);

if isempty(pathPRM)
    error('No se encontró una ruta PRM');
end

%% Crear carpeta para guardar rutas
saveDir = fullfile(pwd, 'rutas_guardadas');
if ~exist(saveDir, 'dir')
    mkdir(saveDir);
end

%% Guardar pathPRM en archivo XML
xmlFile = fullfile(saveDir, 'pathPRM.xml');
fileID = fopen(xmlFile, 'w');
if fileID == -1
    error('No se pudo abrir el archivo para escribir: %s', xmlFile);
end

fprintf(fileID, '<?xml version="1.0" encoding="UTF-8"?>\n');
fprintf(fileID, '<PathPRM>\n');
for i = 1:size(pathPRM,1)
    fprintf(fileID, '  <Point index="%d">\n', i);
    fprintf(fileID, '    <X>%.6f</X>\n', pathPRM(i,1));
    fprintf(fileID, '    <Y>%.6f</Y>\n', pathPRM(i,2));
    fprintf(fileID, '  </Point>\n');
end
fprintf(fileID, '</PathPRM>\n');
fclose(fileID);

fprintf('Archivo guardado en: %s\n', xmlFile);

%% Mostrar camino PRM
figure;
show(map); hold on;
plot(pathPRM(:,1), pathPRM(:,2), 'r-', 'LineWidth', 2);
legend('PRM');
title('Ruta PRM');
hold off;


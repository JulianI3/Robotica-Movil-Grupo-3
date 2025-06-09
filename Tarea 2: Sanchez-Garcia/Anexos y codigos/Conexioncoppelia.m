% Ruta objetivo (x, y)
path = [0 0; 1 0; 2 0.5; 3 1]; 
robotRadius = 0.1;

% Crear objeto de trayectoria
refPath = robotics.PurePursuit;
refPath.Waypoints = path;
refPath.LookaheadDistance = 0.3;
refPath.DesiredLinearVelocity = 0.2;
refPath.MaxAngularVelocity = 2;

% Posición inicial [x, y, theta]
pose = [0 0 0];

% Simulación
sampleTime = 0.1;
for k = 1:100
    [v, omega] = refPath(pose);
    
    % Convertir v, omega a velocidades de ruedas
    wheelRadius = 0.05;
    wheelBase = 0.2;
    
    vL = (2*v - omega*wheelBase)/(2*wheelRadius);
    vR = (2*v + omega*wheelBase)/(2*wheelRadius);
    
    % Enviar a CoppeliaSim (ver siguiente sección)
    
    % (opcional) actualizar pose simulada
    pose = updatePose(pose, v, omega, sampleTime);
end

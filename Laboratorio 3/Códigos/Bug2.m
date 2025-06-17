% Conectar con EV3
clear all
myev3 = legoev3('usb');

% Motores
motorLeft = motor(myev3, 'A');
motorRight = motor(myev3, 'B');

% Sensores
gyro = gyroSensor(myev3, 2);
% Se debe poner los sensores en las terminales necearias
frontSensor = sonicSensor(myev3, 3);
% rightSensor = sonicSensor(myev3, 4);
rightSensor = irSensor(myev3, 4);
colSensor = colorSensor(myev3,1);
% Se debe hacer el montaje con un ultrasonico y un infrasrojo, toca ver la
% salida del infrarojo
% Resetear sensores
resetRotation(motorLeft);
resetRotation(motorRight);
resetRotationAngle(gyro);


% Parámetros
goal = [80, 0]; % Posición objetivo en cm
pose = [0, 0];     % Asumimos que inicia en [0, 0]
theta = 0;         % Ángulo inicial

wheelBase = 12.4;    % cm entre ruedas
wheelRadius = 2.8; % radio de las ruedas en cm

state = 'GO_TO_GOAL';
dt = 0.1;
goal_tolerance = 10;

minDistToGoal = inf;
start = pose;

while true
    % --- Leer sensores ---
    frontDist = readDistance(frontSensor)*100; % cm
    rightDist = readProximity(rightSensor);
    clo=readColor(colSensor);
    %  rightDist; 
    %Se debe verificar como analizar la lectura de salida del sensor
    %infrarojo y cambiar la forma de considerarlo en seguir el muro
    theta = double(readRotationAngle(gyro)); % grados
    
    % --- Estimar pose (simple odometría por encoder) ---
    angle1 = double(readRotation(motorLeft));  % fuerza el tipo
    angle2 = double(readRotation(motorRight)); 
    dL = deg2rad(angle1) * wheelRadius;
    dR = deg2rad(angle2) * wheelRadius;
    dCenter = (dL + dR)/2;
    pose(1) = pose(1) + dCenter * cosd(theta);
    pose(2) = pose(2) + dCenter * sind(theta);
    resetRotation(motorLeft); resetRotation(motorRight);
    disp(pose)
%     disp('y',pose(2))
    % --- Control principal ---
    toGoal = goal - pose;
    distToGoal = norm(toGoal);
    angleToGoal = atan2d(toGoal(2), toGoal(1));
    angleError = angleToGoal - theta;
    
    % Normalizar ángulo
%     angleError = mod(angleError + 180, 360) - 180;
    
%     if distToGoal < goal_tolerance
%         stop(motorLeft);
%         stop(motorRight);
%         disp('Meta alcanzada');
%         break;
%     end
    if strcmp(clo, 'black')
        stop(motorLeft);
        stop(motorRight);
        disp('Meta alcanzada');
        break;
    end
%     if pose(1) >120
%         stop(motorLeft);
%         stop(motorRight);
%         disp('Meta alcanzada');
%         break;
%     end        
    
    switch state
        case 'GO_TO_GOAL'
            if frontDist < 20 % obstáculo
                state = 'FOLLOW_WALL';
                minDistToGoal = distToGoal;
                pause(1)
            else
                % Control para seguir en línea recta a la meta
%                 v = 10; % velocidad base
%                 k = 1;  % ganancia
%                 turn = k * angleError;
                
%                 vL = v - turn;
%                 vR = v + turn;
                theta = double(readRotationAngle(gyro));
                clo = readColor(colSensor);  % ← función para leer el color actual
                    
                if theta > 0 && strcmpi(clo, 'red') == 0
                    vL = 20;
                    vR = 25;
                    setMotorSpeeds(motorLeft, motorRight, vL, vR);
                    disp('Corrigiendo hacia la izquierda (theta > 0)');
                        
                elseif theta < 0 && strcmpi(clo, 'red') == 0
                    vL = 25;
                    vR = 20;
                    setMotorSpeeds(motorLeft, motorRight, vL, vR);
                    disp('Corrigiendo hacia la derecha (theta < 0)');
                        
                else
                    vL = 21;
                    vR = 20;
                    setMotorSpeeds(motorLeft, motorRight, vL, vR);
                    disp('Siguiendo línea roja');
                 end
                
                 pause(0.1);  % Espera para no sobrecargar el sistema
            end
            
        case 'FOLLOW_WALL'
            onMLine = isOnMLine(pose, start, goal);
            disp('Seguir muro')
%             if onMLine && distToGoal < minDistToGoal && frontDist > 20
            if strcmp(clo, 'red')
                while theta > -5
                        setMotorSpeeds(motorLeft, motorRight, -10, 10);
                        theta = double(readRotationAngle(gyro));
                        disp('Giro ')
                        disp(theta)
                end
                state = 'GO_TO_GOAL';
            else
                % Lógica simple para seguir pared por la derecha
                if frontDist < 20
                    % Girar izquierda
                    while theta > -85
                        setMotorSpeeds(motorLeft, motorRight, -10, 10);
                        theta = double(readRotationAngle(gyro));
                        disp('Giro izquierda')
                        disp(theta)
                    end

%                 elseif 15 >rightDist && rightDist > 10
%                     % Acercarse a la pared
%                     setMotorSpeeds(motorLeft, motorRight, 10, 5);
%                     disp('acer 1')
%                 elseif rightDist < 10 && 5 < rightDist 
%                     % Alejarse de la pared
%                     setMotorSpeeds(motorLeft, motorRight, 5, 10);
%                     disp('acer 2')
                elseif rightDist > 20
                    theta = double(readRotationAngle(gyro));
                    while theta > -5
                        setMotorSpeeds(motorLeft, motorRight, 10, -10);
                        theta = double(readRotationAngle(gyro));
                        disp('Borde')
                        disp(rightDist)
                    end

                else
                    % Seguir paralelo
                    setMotorSpeeds(motorLeft, motorRight, 10, 10);
                    disp('Adelante')
                end
            end
    end
    pause(dt);
end

function setMotorSpeeds(mL, mR, vL, vR)
    start(mL); start(mR);
    mL.Speed = max(min(vL, 100), -100);
    mR.Speed = max(min(vR, 100), -100);
end

function onLine = isOnMLine(pos, start, goal)
    % Distancia perpendicular desde pos a la línea entre start y goal
    vec1 = goal - start;
    vec2 = pos - start;
    d = abs(det([vec1; vec2])) / norm(vec1);
    onLine = d < 5; % cm
end

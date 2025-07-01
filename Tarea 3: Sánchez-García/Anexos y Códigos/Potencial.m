sim = remApi('remoteApi');
sim.simxFinish(-1);  % cerrar otras conexiones
clientID = sim.simxStart('127.0.0.1',19999,true,true,5000,5);
usar_escala_fuerza = true;
velocidad_max = 0.04;   % m/s
giro_max = 0.61;        % rad/s
if clientID < 0
    error('No se pudo conectar a CoppeliaSim');
end
disp('Conectado a CoppeliaSim');

% Obtener handles
[returnCode, leftMotor] = sim.simxGetObjectHandle(clientID, 'bubbleRob_leftMotor', sim.simx_opmode_blocking);
[returnCode, rightMotor] = sim.simxGetObjectHandle(clientID, 'bubbleRob_rightMotor', sim.simx_opmode_blocking);
[returnCode, robot] = sim.simxGetObjectHandle(clientID, 'bubbleRob', sim.simx_opmode_blocking);

% Iniciar streaming de pose
sim.simxGetObjectPosition(clientID, robot, -1, sim.simx_opmode_streaming);
sim.simxGetObjectOrientation(clientID, robot, -1, sim.simx_opmode_streaming);

% Parámetros
r = 0.05;     % radio rueda (m)
L = 0.15;     % distancia entre ruedas (m)

goal = [1, 1];  % objetivo, mismo sistema de arena2025 (escala 8 * 0.8)

K_att = 5;
K_rep = 0.905;
d0 = 0.4;     % umbral sigmoidal
a = 11.2;       % pendiente sigmoide

%Obtener mapa de obstáculos
% [CC, RC, k] = arena2025();  % visualización y datos

% obstaculos = CC;
% obstaculos_radios = RC;

% Loop de navegación
while true
    % Obtener pose
    [returnCode, pos] = sim.simxGetObjectPosition(clientID, robot, -1, sim.simx_opmode_buffer);
    [returnCode, ori] = sim.simxGetObjectOrientation(clientID, robot, -1, sim.simx_opmode_buffer);

    x = pos(1);
    y = pos(2);
    theta = ori(3);  % orientación en Z
    disp(pos)
    % Campo potencial
    if norm([x y]-[goal(1) goal(2)]) <= 0.3
        att =  K_att*([x y]-[goal(1) goal(2)]);
    else 
        att = 0.5/norm([goal(1) goal(2)]-[x y]) * K_att*([goal(1) goal(2)]-[x y]);
    end
    % att = K_att * (goal - [x, y]);

    rep = [0, 0];
    for i = 1:size(CC, 1)
        obs = CC(i, :);
        radio_obs = RC(i);
        diff = [x, y] - obs;
        d = norm(diff) - radio_obs;
        if d < d0
            sigma = 1 / (1 + exp(-a * (d - d0)));
            dsigma_dd = a * sigma * (1 - sigma);
            rep = rep + K_rep * (dsigma_dd / (d + radio_obs)) * diff;
        end
    end

    F = att + rep;

    if usar_escala_fuerza
        F = 0.5 * F;  % Escalar fuerza total
    end
    
    %% Modelo cinemático
    Fx = F(1); Fy = F(2);
    v = Fx * cos(theta) + Fy * sin(theta);
    w = (-Fx * sin(theta) + Fy * cos(theta)) / 0.1;

    theta_ref = atan2(-Fy, -Fx);
    error_theta = theta_ref - theta;

    % Limitar velocidades
    if usar_escala_fuerza
        v = max(min(v, velocidad_max), -velocidad_max);
        w = max(min(w, giro_max), -giro_max);
    end

    % if abs(error_theta) <= pi/4
    %     alpha = (pi/4 - abs(error_theta)) / pi/4;
    %     w = min( alpha*norm(-F), 0.04 );
    % else
    %     w = -0.02;
    % end

    % if norm(rep)>10
    %     vL = (2*v - w*L)/(2*r)+1;
    %     vR = (2*v + w*L)/(2*r)-1;
    % else
    %     v=max(min(v, velocidad_max), -velocidad_max);
    %     vL = (2*v - w*L)/(2*r);
    %     vR = (2*v + w*L)/(2*r);
    % end
    % Modelo diferencial: velocidades de rueda

    vL = (2*v - w*L)/(2*r);
    vR = (2*v + w*L)/(2*r);

    % Enviar a motores
    sim.simxSetJointTargetVelocity(clientID, leftMotor, vL, sim.simx_opmode_streaming);
    sim.simxSetJointTargetVelocity(clientID, rightMotor, vR, sim.simx_opmode_streaming);

    % Condición de llegada
    if norm([x - goal(1), y - goal(2)]) < 0.15
        disp('🏁 Meta alcanzada');
        break;
    end

    pause(0.1);
end
%% Finalizar
sim.simxSetJointTargetVelocity(clientID, leftMotor, 0, sim.simx_opmode_streaming);
sim.simxSetJointTargetVelocity(clientID, rightMotor, 0, sim.simx_opmode_streaming);
sim.simxFinish(clientID);
sim.delete();

disp('🚩 Navegación finalizada.');
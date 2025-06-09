sim = remApi('remoteApi');
sim.simxFinish(-1);  % cerrar otras conexiones
clientID = sim.simxStart('127.0.0.1',19999,true,true,5000,5);
if clientID == -1
    error('No se pudo conectar con CoppeliaSim');
end
[returnCode, leftMotor] = sim.simxGetObjectHandle(clientID, 'bubbleRob_leftMotor', sim.simx_opmode_blocking);
[returnCode, rightMotor] = sim.simxGetObjectHandle(clientID,'bubbleRob_rightMotor', sim.simx_opmode_blocking);
%path = [4.800    0.00; 4.81050000000000	0.152100000000000;4.61080000000000	0.541900000000000; 4.69950000000000	1.24370000000000;4.07690000000000	1.66890000000000;3.51640000000000	1.62150000000000;2.59050000000000	0.931300000000000;1.34670000000000	0.769400000000000;1.86970000000000	1.34210000000000;0.867900000000000	1.50360000000000; 0.402400000000000	0.0663000000000000; 0.400000000000000	0];
controller = robotics.PurePursuit;
controller.Waypoints = path;  % ruta planificada
controller.LookaheadDistance = 0.3;
controller.DesiredLinearVelocity = 0.2;
controller.MaxAngularVelocity = 2;
pose = [4.8 0 90];
function [vL, vR] = velocidadRuedas(v, omega, L, r)
    vL = (2*v - omega*L)/(2*r);
    vR = (2*v + omega*L)/(2*r);
end

[returnCode, robotHandle] = sim.simxGetObjectHandle(clientID, 'bubbleRob', sim.simx_opmode_blocking);
function pose = obtenerPoseDesdeSimulacion(sim, clientID, robotHandle)
    [returnCode, position] = sim.simxGetObjectPosition(clientID, robotHandle, -1, sim.simx_opmode_buffer);
    [returnCode, orientation] = sim.simxGetObjectOrientation(clientID, robotHandle, -1, sim.simx_opmode_buffer);

    x = position(1);
    y = position(2);
    theta = orientation(3);  % Rotación sobre eje Z
    pose = [x, y, theta];
   
end


% Iniciar stream
sim.simxGetObjectPosition(clientID, robotHandle, -1, sim.simx_opmode_streaming);
sim.simxGetObjectOrientation(clientID, robotHandle, -1, sim.simx_opmode_streaming);
pause(0.1);
for k = 1:500
    pose = obtenerPoseDesdeSimulacion(sim, clientID, robotHandle);  % si estás leyendo del simulador

    [v, omega] = controller(pose);
    [vL, vR] = velocidadRuedas(v, omega, wheelBase, wheelRadius);

    [returnCode] = sim.simxSetJointTargetVelocity(clientID, leftMotor, vL, sim.simx_opmode_streaming);
    [returnCode] = sim.simxSetJointTargetVelocity(clientID, rightMotor, vR, sim.simx_opmode_streaming);
    
    pause(0.1);
end

sim.simxFinish(clientID);

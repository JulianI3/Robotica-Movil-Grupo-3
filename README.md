# Robotica-Movil-Grupo-3
## Grupo 3 conformado por:
* Julián David Benítez Martínez
* Jhon Alexander Calderón Suárez
* Juan Pablo García Galvis
* Juan Diego Sánchez Forero

  

# Simulación de robot EV3 en CoppeliaSim

## Modelo del robot EV3

Haciendo disposición del modelo [EV-R3P](https://github.com/albmardom/EV-R3P), el cual posee gran calidad en el modelado y simulación, se logró hacer una rutina simple como primer acercamiento a la programación del robot.
![image](https://github.com/user-attachments/assets/01cca1c6-c5aa-4dbe-9b59-4ad374cdfbf7)

## Código empleado en CoppeliaSim

Se utilizó un Script creado en **LUA** enlazado al modelo del robot para simular la misma rutina hecha en el laboratorio.

```lua
function sysCall_init()
    -- Obtener handles de los motores del robot EV3
    leftMotor = sim.getObjectHandle("Motor_B")   -- motor izquierdo
    rightMotor = sim.getObjectHandle("Motor_C")  -- motor derecho
end

function sysCall_thread()
    -- Definir velocidades
    local speed = 5.0  -- velocidad base (ajustable)
    -- 1) Mueve recto por 5 segundos al 30%
    sim.setJointTargetVelocity(leftMotor, speed)
    sim.setJointTargetVelocity(rightMotor, speed)
    sim.wait(5.0)
    -- 2) Gira (motor B) por 1.3 segundos al 30%
    sim.setJointTargetVelocity(leftMotor, speed)
    sim.setJointTargetVelocity(rightMotor, 0)
    sim.wait(1.3)
    -- Detener ambos motores
    sim.setJointTargetVelocity(leftMotor, 0)
    sim.setJointTargetVelocity(rightMotor, 0)
    sim.wait(0.5)
    -- 3) Gira suavemente a la izquierda (left = -speed, right = speed) durante 5 seg
    sim.setJointTargetVelocity(leftMotor, 4.7)
    sim.setJointTargetVelocity(rightMotor, speed)
    sim.wait(5.0)
    sim.setJointTargetVelocity(leftMotor, 0)
    sim.setJointTargetVelocity(rightMotor, 0)
    sim.wait(0.2)
    -- 4) Gira en su lugar con motor D por 1.5 seg (solo motor derecho)
    sim.setJointTargetVelocity(leftMotor, 0)
    sim.setJointTargetVelocity(rightMotor, speed)
    sim.wait(1.5)
    sim.setJointTargetVelocity(leftMotor, 0)
    sim.setJointTargetVelocity(rightMotor, 0)
    sim.wait(0.2)
    -- 5) Avanza recto por 2.5 segundos al 30%
    sim.setJointTargetVelocity(leftMotor, speed)
    sim.setJointTargetVelocity(rightMotor, speed)
    sim.wait(2.5)
    sim.setJointTargetVelocity(leftMotor, 0)
    sim.setJointTargetVelocity(rightMotor, 0)
    sim.wait(0.2)
    -- 6) Gira en su eje (1 rotaci?n): izq avanza, der retrocede
    sim.setJointTargetVelocity(leftMotor, speed)
    sim.setJointTargetVelocity(rightMotor, -speed)
    sim.wait(1.0)  -- ajustar seg?n el robot para 1 giro
    sim.setJointTargetVelocity(leftMotor, 0)
    sim.setJointTargetVelocity(rightMotor, 0)
    sim.wait(0.2)
    -- 7) Ambos motores recto por 3 seg
    sim.setJointTargetVelocity(leftMotor, speed)
    sim.setJointTargetVelocity(rightMotor, speed)
    sim.wait(3.0)
    -- 8) Detener
    sim.setJointTargetVelocity(leftMotor, 0)
    sim.setJointTargetVelocity(rightMotor, 0)
end


```
## Video de simulación en CoppeliaSim
https://github.com/user-attachments/assets/3d2d4835-b559-4099-bcda-2a529e7941ca




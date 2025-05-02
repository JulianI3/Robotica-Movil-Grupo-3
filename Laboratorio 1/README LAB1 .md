<div align="center">
<picture>
    <source srcset="https://imgur.com/5bYAzsb.png" media="(prefers-color-scheme: dark)">
    <source srcset="https://imgur.com/Os03JoE.png" media="(prefers-color-scheme: light)">
    <img src="https://imgur.com/Os03JoE.png" alt="Escudo UNAL" width="350px">
</picture>


# Laboratorio 1 - Introducción a los Robots Móviles </h3>
## Grupo 3
</div>

## 1. Resumen
## 2. Introducción
## 3. Desarrollo
### 3.1 Que es un robot móvil
### 3.2 Descripción de los robots
#### 3.2.1 Robot EV3
#### 3.2.2 Robot Kuboki
### 3.3 APIs y lenguajes de programación
### 3.4 Herramientas de desarrollo propias
### 3.5 Sensores del robot
#### 3.5.1 Sensores del robot EV3
El robot EV3 de la marca lego cuenta con diversa cantidad de sensores que le permiten interactuar con el entorno junto a la herramienta propia de la empresa; en el laboratorio se logró trabajar con 5 sensores los cuales se muestran a continuación:

**Sensor de ultrasonido:** Este sensor permite determinar distancias por medio de la medición del tiempo que tarda en viajar una onda ultrasónica emitida por el mismo, la resolución del dispositivo visualizada en el software es de 0.1cm de diferencia entre mediciones y su rango va desde los 0 cm hasta los 255 cm. Este sensor permite que el robot mida a que distancia se encuentran objetos de el respecto a la orientación del sensor, permitiendo la toma de acciones en función del valor medido.

<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/main/Laboratorio%201/Imagenes/Sensor%20de%20ultrasonido.png?raw=true" alt="Sensor de ultrasonido" style="width:350px;">
</p>

En la siguiente imagen se aprecia como se registra la medición del sensor dentro del software Education EV3 Classroom, allí se observa no solo el dato medido sino también el canal al cuál se encuentra conectado, para el caso se encuentra en el canal 2.

<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/2f0023e0737243841457d766d6df322e7618aec6/Laboratorio%201/Imagenes/Ultrasonico%20software.png" style="width:450px;">
</p>

**Sensor infrarojo:** Este sensor al igual que el anterior es utilizado para medir distancias entre el robot y un objeto ubicado en frente del plano de emisión de onda electromagneticas infrarojas del sensor; sin embargo, en este caso el valor medido se presenta en forma de porcentaje, siendo 100% un objeto muy lejano y 0% un objeto muy cercano, el sensor infrarojo es capaz de medir distancias hasta 70 centíemtros.


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/941b8a7d66f46e9d716183e99d32cd04b769d204/Laboratorio%201/Imagenes/Sensor%20infrarojo.png" style="width:350px;">
</p>

Dentro del software la conexión y medida porcentual de este sensor se denota con el simbolo que se observa conectado en la siguiente imagen en el canal 4.

<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/941b8a7d66f46e9d716183e99d32cd04b769d204/Laboratorio%201/Imagenes/Sensor%20infrarojo%20en%20el%20software.png" style="width:350px;">
</p>

**Sensor de color:** El sensor de color tiene la capacidad de determinar el color al cuál está apuntando o determinar la intensidad de luz que se percibe en el ambiente, la medida arrojada por el mismo cuando mida la intensidad va desde el 0% (muy oscuro) y el 100% (muy luminoso).


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/20e63cb746e2b7fb85892cd002e67d4f8efaf7d1/Laboratorio%201/Imagenes/Sensor%20de%20color1.png" style="width:350px;">
</p>

Dentro del software propio de la compañía el simbolo representativo para este sensor corresponde al mostrado a continuación en el canal 1.


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/20e63cb746e2b7fb85892cd002e67d4f8efaf7d1/Laboratorio%201/Imagenes/Sensor%20de%20color%20en%20el%20software.png" style="width:350px;">
</p>


**Giroscopio:** El giroscopio es un sensor con la capacidad de medir rotaciones en un único eje notado por las flechas indicadas en el sensor, este permite medir ángulos de giro en el robot, permitiendole realizar acciones en función de su rotación.


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/ad8b466f0ed0807acbeb8d409e149f061cf45d0a/Laboratorio%201/Imagenes/Giroscopio.png" style="width:350px;">
</p>

El giroscopio mide el ángulo rotacional del robot en el eje según la instalación del sensor, este ángulo es medido en grados y se indica en el software mediante el siguiente simbolo.

<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/ad8b466f0ed0807acbeb8d409e149f061cf45d0a/Laboratorio%201/Imagenes/Giroscopio%20en%20el%20software.png" style="width:350px;">
</p>


**Sensor táctil:** Este sensor es un dispositivo analógico que permite determinar 2 estados; funcionando como pulsador es capaz de mostrar un estado "presionado" y un estado "no presionado", permitiendo ejecutar acciones en función de su pulsación o no pulsación.


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/10595dd38c77c1d85a18bf84a714e925da0686e3/Laboratorio%201/Imagenes/Sensor%20Tactil.png" style="width:350px;">
</p>

En el software el simbolo que representa la conexión tendrá unicamente 2 estados, 1 denotará que se encuentra pulsado el sensor mientras que el valor de 0 indicará lo contrario; en la sigueinte imagen se observa el sensor conectado en el canal 1 el robot.

<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/e1bdcf3494ddd3fd4ee545e0e1b94d14a7a58de4/Laboratorio%201/Imagenes/Sensor%20Tactil%20en%20el%20software.png" style="width:350px;">
</p>

### 3.6 Simulación de robot EV3 en CoppeliaSim

#### 3.6.1 Modelo del robot EV3

Haciendo disposición del modelo [EV-R3P](https://github.com/albmardom/EV-R3P), el cual posee gran calidad en el modelado y simulación, se logró hacer una rutina simple como primer acercamiento a la programación del robot.


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/da5048aaf74b5c031c2fa1c4e51024c8bc22229e/Laboratorio%201/Imagenes/Modelado%20EV3.png" style="width:350px;">
</p>


#### Código empleado en CoppeliaSim

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

#### Video de simulación en CoppeliaSim


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/c86af46e6ba849646f5b356e3e775dc81ba99532/Laboratorio%201/Imagenes/Simulaci%C3%B3n%20EV3.mp4" style="width:350px;">
</p>


### 3.7 Programa simple de movimiento
### 3.8 Reflexión y discusión

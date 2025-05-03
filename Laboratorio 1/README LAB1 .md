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
En este laboratorio hemos trabajado con robots móviles, que son fundamentales en áreas como la exploración, la automatización y la logística, gracias a su capacidad de desplazarse y adaptarse a diferentes entornos. Estos robots pueden ejecutar tareas específicas de manera autónoma, combinando sensores, actuadores y algoritmos de control para percibir el entorno, ubicarse y desplazarse de forma eficiente.

Durante las prácticas utilizamos dos plataformas: LEGO EV3 y Kuboki. El EV3 es ideal para introducirse en la programación y la robótica, ya que su diseño modular y facilidad de uso permiten experimentar con lógica, sensores y movimientos de forma sencilla. Por otro lado, Kuboki ofrece características más avanzadas como navegación autónoma y esquiva de obstáculos, lo que lo convierte en una excelente opción para aplicar conceptos de control, planificación de trayectorias y toma de decisiones.

Ambos robots nos permitieron aprender de forma práctica y desarrollar habilidades clave como la resolución de problemas, la lógica algorítmica y el pensamiento crítico, todo en un entorno interactivo y dinámico.
### 3.1 ¿Qué es un robot móvil?
Un robot móvil es un sistema capaz de desplazarse por su entorno de manera autónoma o semi-autónoma, tomando decisiones basadas en la información que obtiene de sus sensores. A diferencia de los robots estacionarios, los móviles pueden adaptarse a entornos cambiantes y realizar tareas como navegación, esquiva de obstáculos o seguimiento de trayectorias, lo cual los hace útiles en una gran variedad de aplicaciones reales.        
### 3.2 Descripción de los robots
#### 3.2.1 Robot EV3
El robot LEGO EV3 es una plataforma educativa muy conocida por su flexibilidad y facilidad de uso. Está compuesto por un bloque inteligente (el "brick") que funciona como procesador, varios sensores (como ultrasonido, contacto y giroscopio) y motores que permiten el movimiento. Es ideal para estudiantes, ya que su programación se puede realizar tanto de forma gráfica como con lenguajes más avanzados, facilitando la comprensión de conceptos básicos de robótica.
<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/b6cdbf55e3151190e02eb9437f1195d4a5057957/Laboratorio%201/Imagenes/EV3.jpg" alt="Brick de EV3" style="width:350px;">
</p>

#### 3.2.2 Robot Kuboki
El robot Kuboki es una plataforma más avanzada, basada en la estructura del robot TurtleBot. Está diseñado para trabajar con ROS (Robot Operating System), lo que permite desarrollar aplicaciones de navegación autónoma, mapeo y control. Incluye sensores como odometría, giroscopios y soporte para cámaras o LIDAR. Es una herramienta útil para experimentar con algoritmos más complejos de planificación y percepción.
<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/b6cdbf55e3151190e02eb9437f1195d4a5057957/Laboratorio%201/Imagenes/Kobuki.jpg" alt="Cuerpo del Kobuki" style="width:350px;">
</p>

### 3.3 Estado actual del robot y sistema de control.
En el caso del EV3, logramos implementar rutinas de control simples como avanzar, girar y detenerse ante obstáculos con ayuda del sensor de ultrasonido, todo mediante programación en el software propio de EV3. El sistema de control responde adecuadamente a las entradas de sensores como el ultrasónico y responde rápidamente ante las órdenes dadas.

Para el robot Kuboki, el sistema de control basado en ROS fue configurado con éxito para tareas de navegación autónoma. Se probaron nodos de control de movimiento y lectura de sensores, logrando que el robot siga rutas definidas y esquive obstáculos en su entorno. Aún se pueden hacer mejoras en la precisión de la localización y en la integración de sensores más avanzados.

En general, el sistema de control en ambos robots funciona correctamente para los objetivos planteados en el laboratorio, aunque existen oportunidades de optimización y ampliación de funcionalidades.
### 3.4 APIs y lenguajes de programación
Durante el laboratorio utilizamos distintas APIs según el robot. Para el EV3, trabajamos con entornos como EV3Dev o software de LEGO que permite programación en lenguajes como Python o bloques gráficos. En el caso de Kuboki, utilizamos ROS, una herramienta muy potente para robótica que permite controlar el robot mediante nodos escritos en Python o C++. Estas APIs facilitan el acceso a sensores, actuadores y algoritmos de control.
### 3.5 Herramientas de desarrollo propias
Para el desarrollo de nuestras prácticas, implementamos código personalizado en Python (en el caso del EV3) y también creamos nodos en ROS para controlar funciones específicas del Kuboki. Además, diseñamos scripts para pruebas de navegación, captura de datos de sensores y control de movimientos. Estas herramientas fueron esenciales para adaptar el comportamiento de los robots a las actividades del laboratorio y para entender mejor cómo se integran los distintos componentes de un sistema robótico.
### 3.6 Sensores del robot
#### 3.6.1 Sensores del robot EV3
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
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/941b8a7d66f46e9d716183e99d32cd04b769d204/Laboratorio%201/Imagenes/Sensor%20infrarojo%20en%20el%20software.png" style="width:450px;">
</p>

**Sensor de color:** El sensor de color tiene la capacidad de determinar el color al cuál está apuntando o determinar la intensidad de luz que se percibe en el ambiente, la medida arrojada por el mismo cuando mida la intensidad va desde el 0% (muy oscuro) y el 100% (muy luminoso).


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/20e63cb746e2b7fb85892cd002e67d4f8efaf7d1/Laboratorio%201/Imagenes/Sensor%20de%20color1.png" style="width:350px;">
</p>

Dentro del software propio de la compañía el simbolo representativo para este sensor corresponde al mostrado a continuación en el canal 1.


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/20e63cb746e2b7fb85892cd002e67d4f8efaf7d1/Laboratorio%201/Imagenes/Sensor%20de%20color%20en%20el%20software.png" style="width:450px;">
</p>


**Giroscopio:** El giroscopio es un sensor con la capacidad de medir rotaciones en un único eje notado por las flechas indicadas en el sensor, este permite medir ángulos de giro en el robot, permitiendole realizar acciones en función de su rotación.


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/ad8b466f0ed0807acbeb8d409e149f061cf45d0a/Laboratorio%201/Imagenes/Giroscopio.png" style="width:350px;">
</p>

El giroscopio mide el ángulo rotacional del robot en el eje según la instalación del sensor, este ángulo es medido en grados y se indica en el software mediante el siguiente simbolo.

<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/ad8b466f0ed0807acbeb8d409e149f061cf45d0a/Laboratorio%201/Imagenes/Giroscopio%20en%20el%20software.png" style="width:450px;">
</p>


**Sensor táctil:** Este sensor es un dispositivo analógico que permite determinar 2 estados; funcionando como pulsador es capaz de mostrar un estado "presionado" y un estado "no presionado", permitiendo ejecutar acciones en función de su pulsación o no pulsación.


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/10595dd38c77c1d85a18bf84a714e925da0686e3/Laboratorio%201/Imagenes/Sensor%20Tactil.png" style="width:350px;">
</p>

En el software el simbolo que representa la conexión tendrá unicamente 2 estados, 1 denotará que se encuentra pulsado el sensor mientras que el valor de 0 indicará lo contrario; en la sigueinte imagen se observa el sensor conectado en el canal 1 el robot.

<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/e1bdcf3494ddd3fd4ee545e0e1b94d14a7a58de4/Laboratorio%201/Imagenes/Sensor%20Tactil%20en%20el%20software.png" style="width:450px;">
</p>

### 3.7 Simulación de robot EV3 en CoppeliaSim

#### 3.7.1 Modelo del robot EV3

Haciendo disposición del modelo [EV-R3P](https://github.com/albmardom/EV-R3P), el cual posee gran calidad en el modelado y simulación, se logró hacer una rutina simple como primer acercamiento a la programación del robot.


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/da5048aaf74b5c031c2fa1c4e51024c8bc22229e/Laboratorio%201/Imagenes/Modelado%20EV3.png" style="width:500px;">
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


https://github.com/user-attachments/assets/31f8fee7-eaf8-4b98-b97a-1c2e73c6789d



### 3.8 Programa simple de movimiento

#### Programa de movimiento para el EV3

En el laboratorio se realizó la ejecución de un programa sencillo de movimiento programado en el software Education EV3 Classroom, el programa buscaba ejecutar una rutina de movimiento que involucrase el uso de alguno de los sensores disponibles para el robot; por ello, se ejecutó un código que desplaza el robot hacia adelante una vez se pulse el sensor tactil, luego girase el mismo aproximadamente 90 grados, luego un nuevo movimiento recto hasta que el sensor ultrasónico detectase un obstáculo, cuando se alcanzaba cierta medida de distancia se volvía a ejecutar un giro para esquivar el obstáculo y finalmente la rutina culminaba con la detención del robot y un sonido característico cuando se encontraba otro obstáculo en el camino.

El programa utilizado para la ejecución del movimiento descrito anteriormente corresponde al siguiente.


<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/2d5d2b11c032eeda34bfaedd5671d5484ea2e218/Laboratorio%201/Imagenes/Rutina%20EV3.png" style="width:450px;">
</p>


La rutina de movimiento del robot EV3 corresponde a la siguiente.


https://github.com/user-attachments/assets/45263156-bc22-4b56-a7cd-2d424d29bfe7

### 3.9 Simulacion de robot Kuboki

#### 3.9.1 Modelo del robot Kuboki

Se realizo un modelamiento simplificado del robot Kuboki, tomando en cuenta sus medidas generales. La disposicion de los elementos esta dada para matener los elementos moviles(ruedas) con el mismo tamaño y disposicion.

<p align="center">
<img src="https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/main/Laboratorio%201/Imagenes/Kuboki%20coppelia.png" style="width:500px;">
</p>

#### Video de simulación en CoppeliaSim

Siguiendo el mismo programa de movimiento para realizar una comparacaion más comoda se obtuvo el siguiente resultado:



https://github.com/user-attachments/assets/c86dfbb3-b9a4-47ab-a173-2f4d79f08f1c




### 3.10 Reflexión y discusión

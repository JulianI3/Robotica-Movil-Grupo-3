<div align="center">
<picture>
    <source srcset="https://imgur.com/5bYAzsb.png" media="(prefers-color-scheme: dark)">
    <source srcset="https://imgur.com/Os03JoE.png" media="(prefers-color-scheme: light)">
    <img src="https://imgur.com/Os03JoE.png" alt="Escudo UNAL" width="350px">
</picture>


# Proyecto: Seguimiento de un robot con RPLidar </h3>
## Grupo 3
- Julián David Benítez Martínez
- Jhon Alexander Calderón Suárez
- Juan Pablo García Galvis
- Juan Diego Sánchez Forero
</div>

## 1. Resumen
En el presente informe se detalla el proceso realizado por el equipo para hacer un sistema de dos robots, en el que el primer robot (robot lider) sigue una ruta prestablecida utilizando sensores y algoritmos de navegación en tiempo real, y el segundo robot (robot seguidor) tiene el objetivo de seguir al primero detectando y rastreando su posición. 

## 2. Introducción
El seguimiento entre robots móviles es un campo crucial del desarrollo de sistemas autónomos colaborativos. Este sistema de un robot lider y un robor seguidor consiste en que un robot seguidor detecta y rastrea a otro robot, el cual tiene como objetivo seguir una ruta o alcanzar un objetivo, utilizando sensores y algoritmos de navegación en tiempo real. En áreas como la exploración, la logística automatizada, vigilancia, y robótica en entornos no estructurados, esta actividad se hace fundamental, ya que son casos donde la coordinación sin intervención humana resulta esencial.

Existen dos enfoques principales de navegación en robótica móvil:

1. Navegación planeada o deliberativa: Se fundamenta en la inteligencia artificial (IA) simbólica o clásica, y se apoya en la construcción de un modelo interno del entorno. El robot utiliza esta representación para planificar rutas mediante algoritmos, evaluando el mejor camino hacia el objetivo. Este enfoque requiere tiempo de procesamiento y conocimiento previo del entorno o la capacidad de mapearlo.

2. Navegación reactiva: Se basa en comportamientos simples que permiten responder directamente a los estímulos de los sensores sin necesidad de un modelo del entorno. Emplea técnicas de IA conexionista o de comportamiento, como control por reglas o redes neuronales, permitiendo al robot reaccionar rápidamente ante obstáculos u otros cambios dinámicos. Este enfoque es especialmente útil en entornos desconocidos o altamente cambiantes.

En este proyecto, se utilizarán estos enfoques de navegación para construir el sistema de robot lider y robot seguidor.

### 2.1 Objetivos
El proyecto requiere del desarrollo de dos robots móviles, donde se necesita que:
1. El robot lider debe seguir una ruta establecida
2. El robot lider debe utilizar algoritmos de navegación para movilizarse correctamente.
3. El robot seguidor debe rastrear y seguir al robot lider planificando una ruta que lo lleve a él.

Adicional a esto, se creó una página web donde se presentan los robots de forma más sencilla, y con un enfoque hacia vender la idea como si fuese un modelo de negocio y los robots unos productos. La página web es accesible desde [aquí](https://contrabass-garlic-xgj9.squarespace.com/), donde se ingresa la contraseña "robotica" para acceder.


### 2.2 Materiales y métodos
Para esta tarea, se requirió el uso de:
1. Dos robots Kobuki.
2. Dos portátiles, uno para el código de cada Kobuki.
3. El uso del software ROS
4. Simulaciones en CoppeliaSim
5. El sensor RPLidar

<div align="center">
    
<img src="https://github.com/user-attachments/assets/982f36f5-3516-4e8f-a5da-d05a05a1208d" width="400">

Figura 1: Robot Kobuki lider

<img src="https://github.com/user-attachments/assets/39a44263-efc4-4c81-8e6e-bf1767d12095" width="400">

Figura 2: Robot Kobuki seguidor

</div>

   
## 3. Procedimiento
Teniendo los dos robots Kobuki, el primer paso fue crear el código necesario para que el robot lider siguiera una ruta establecida. Para este primer paso se realizó el código en ROS 1, utilizando los nodos de seguimiento de rutas (nombre) y el nodo del Minimal Launch para hacer la conexión con los motores del Kobuki. Este robot seguía una ruta fija, sin evitar obstáculos o "analizar su entorno", simplemente siguiendo una órden de velocidades y tiempos.

El código de ROS utilizado para esta función fue:


El segundo robot, el "Robot Seguidor", buscaba al Robot Lider utilizando el sensor RPLidar. Una problemática encontrada fue que al usar el nodo del sensor este no entregaba información, por lo que era esencialmente imposible su correcto uso. Para esto se utilizó un código en Python que leía los datos del sensor y estos datos fueron tratados para solo tener en cuenta información de objetos a menos de un metro de distancia, y con el sensor limitado a solo medir a 70º frente a él, para evitar que el sensor sensara el propio cuerpo del Kobuki. El código Python utilizado para sensar fue:


Una vez se tenía la información del sensor se utilizó el nodo de Minimal Launch para poder generar movimiento en el seguidor basado en la posición relativa del robot lider. Donde se generó un perfil de velocidades a partir de la posición del robot, si el robot lider estaba frente al seguidor el robot se movería de forma recta, y la velocidad variaría de forma proporcional de acuerdo a la distancia entre ambos robots.

Para generar las velocidades se tenía una distancia objetivo de 0.4 metros; si el lider estaba entre 40 a 100 centímetros el seguidor buscaría al lider con una velocidad máxima de XX metros por segundo, y si el lider estaba a menos de 40 cm de distancia se generaría una velocidad "negativa", 1.5 veces mayor al movimiento frontal, para alejarse del lider y mantener siempre la distancia objetivo.

El código de ROS utilizado para la programación del Robot Seguidor fue:



## 4. Funcionamiento
En la anterior sección se mostraron los parámetros de movimiento, donde la velocidad máxima de aproximamiento es de XX metros por segundo, y la velocidad máxima de alejamiento es de 1.5 veces.


Para poder correr el código de ROS se probó a utilizar una CPU de Raspberry Pi, pero al no ser posible se decidió utilizar dos computadores portátiles conectados a cada Kobuki, con una configuración como se observa en la siguiente imagen:

<div align="center">
    
<img src="https://github.com/user-attachments/assets/ad88ccc7-c450-42d8-a79a-0eae1c334167" width="400">

Figura 3: Fotografia de los dos robots en funcionamiento.

</div>

### 4.1 Simulación en CoppeliaSim
Para conocer el posible resultado de la configuración de los robots se realizó previamente una simulación en CoppeliaSim de los dos robots, con un robot siguiendo una ruta y el otro siguiendolo activamente.

<p align="center">
  <a href="https://youtu.be/KqK5t52ybKo">
    <img src="https://img.youtube.com/vi/KqK5t52ybKo/0.jpg" alt="Ver video en YouTube: Control LEGO EV3" width="600">
  </a>

Video 1: Simulación realizada en CoppeliaSIM.
    
</p>


### 4.2 Funcionamiento en un entorno real
Una vez comprobado el funcionamiento del sistema de robots se hizo una prueba física, donde se observa el correcto funcionamiento de los robots. Pero sin realizar alteraciones al funcionamiento, como interferir con el sensor o mover obligadamente a algún robot.

<p align="center">
  <a href="https://youtu.be/juj5Y9sdpFU">
    <img src="https://video.squarespace-cdn.com/content/v1/687b037e7ef6e3334151ac3d/94f54668-cb02-4825-83b1-c6e594d9bfdf/thumbnail" width="600">
  </a>
    
Video 2: Grabación de los dos robots funcionando coordinadamente.
</p>

## 5. Resultados del proyecto
El proyecto cumplió con el alcance que buscaba el equipo, que era un alcance muy básico para el objetivo de solo perseguir a un robot. Un límite muy claro es que el sensor seguirá a los cuerpos que encuentre a menos de un metro y tengan una geometría "alargada", pues el robot lider se configuró con un cuaderno en la parte posterior para generar un área grande que encuentre el sensor y se configuró el seguidor para que siga cuerpos con un área "grande".

### Dificultades
1. Una dificultad inicial fue en el intento por usar una CPU Raspberry Pi, pues la versión de Ubuntu que podría ser instalada en la Raspberry era la versión 24.04, y en esta versión no podía ser utilizado ROS 1 sino ROS 2, y el equipo encontró limitante utilizar ROS 2 por las dificultades que podríamos tener con los drivers necesarios o el apoyo de la comunidad o IA para resolver errores.
2. Otra dificultad fue
### Autoevaluación del equipo
5.0

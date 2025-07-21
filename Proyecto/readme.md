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
Teniendo los dos robots Kobuki, el primer paso fue crear el código necesario para que el robot lider siguiera una ruta establecida, 

### 3.1 Código

## 4. Funcionamiento

<div align="center">
    
<img src="https://github.com/user-attachments/assets/ad88ccc7-c450-42d8-a79a-0eae1c334167" width="400">

Figura 3: Fotografia de los dos robots en funcionamiento.

</div>

### 4.1 Simulación en CoppeliaSim


### 4.2 Funcionamiento en un entorno real

<p align="center">
  <a href="https://video.squarespace-cdn.com/content/v1/687b037e7ef6e3334151ac3d/94f54668-cb02-4825-83b1-c6e594d9bfdf/thumbnail&quot">
    <img src="https://github.com/user-attachments/assets/ad88ccc7-c450-42d8-a79a-0eae1c334167" width="600">
  </a>
Video 1: Grabación de los dos robots funcionando coordinadamente.

</p>


## 5. Resultados del proyecto
### Dificultades

### Autoevaluación del equipo

<div align="center">
<picture>
    <source srcset="https://imgur.com/5bYAzsb.png" media="(prefers-color-scheme: dark)">
    <source srcset="https://imgur.com/Os03JoE.png" media="(prefers-color-scheme: light)">
    <img src="https://imgur.com/Os03JoE.png" alt="Escudo UNAL" width="350px">
</picture>


# Proyecto: Seguimiento de un robot con RpLidar </h3>
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

Existen dos enfoques principales de navegación en robótica móvil, tradicionalmente considerados opuestos, pero que pueden combinarse para mejorar el rendimiento del sistema:

1. Navegación planeada o deliberativa: Se fundamenta en la inteligencia artificial (IA) simbólica o clásica, y se apoya en la construcción de un modelo interno del entorno. El robot utiliza esta representación para planificar rutas mediante algoritmos, evaluando el mejor camino hacia el objetivo. Este enfoque requiere tiempo de procesamiento y conocimiento previo del entorno o la capacidad de mapearlo.

2. Navegación reactiva: Se basa en comportamientos simples que permiten responder directamente a los estímulos de los sensores sin necesidad de un modelo del entorno. Emplea técnicas de IA conexionista o de comportamiento, como control por reglas o redes neuronales, permitiendo al robot reaccionar rápidamente ante obstáculos u otros cambios dinámicos. Este enfoque es especialmente útil en entornos desconocidos o altamente cambiantes.

En este proyecto, se utilizarán estos enfoques de navegación para construir el sistema de robot lider y robot seguidor.

## 3. No recuerdo:
### 3.1 Menciona al menos dos características de la navegación planeada y de la navegación basada en comportamientos, y cómo influyen en el tipo de respuesta del robot.

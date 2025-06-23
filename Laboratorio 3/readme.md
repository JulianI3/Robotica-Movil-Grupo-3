<div align="center">
<picture>
    <source srcset="https://imgur.com/5bYAzsb.png" media="(prefers-color-scheme: dark)">
    <source srcset="https://imgur.com/Os03JoE.png" media="(prefers-color-scheme: light)">
    <img src="https://imgur.com/Os03JoE.png" alt="Escudo UNAL" width="350px">
</picture>


# Laboratorio 3: Algoritmos bug y solución de laberinto </h3>
## Grupo 3
</div>

## 1. Resumen

## 2. Introducción
La navegación en robótica móvil se refiere a la capacidad de un robot para desplazarse desde una posición inicial hasta un objetivo, basándose en el conocimiento parcial de su entorno y la información proporcionada por sus sensores. El objetivo es alcanzar el destino de forma eficiente, segura y confiable, adaptándose a las condiciones del entorno.

Existen dos enfoques principales de navegación en robótica móvil, tradicionalmente considerados opuestos, pero que pueden combinarse para mejorar el rendimiento del sistema:

Navegación planeada o deliberativa: Se fundamenta en la inteligencia artificial (IA) simbólica o clásica, y se apoya en la construcción de un modelo interno del entorno. El robot utiliza esta representación para planificar rutas mediante algoritmos, evaluando el mejor camino hacia el objetivo. Este enfoque requiere tiempo de procesamiento y conocimiento previo del entorno o la capacidad de mapearlo.

Navegación reactiva: Se basa en comportamientos simples que permiten responder directamente a los estímulos de los sensores sin necesidad de un modelo del entorno. Emplea técnicas de IA conexionista o de comportamiento, como control por reglas o redes neuronales, permitiendo al robot reaccionar rápidamente ante obstáculos u otros cambios dinámicos. Este enfoque es especialmente útil en entornos desconocidos o altamente cambiantes.

En la práctica, ambos enfoques se pueden integrar en lo que se conoce como un sistema de navegación híbrido. Este enfoque combina la planificación de alto nivel de la navegación deliberativa con la capacidad de respuesta inmediata de la navegación reactiva. La inteligencia artificial juega un papel clave en esta integración, permitiendo el uso de algoritmos de aprendizaje automático y técnicas adaptativas para mejorar la toma de decisiones en tiempo real. Así, los sistemas híbridos ofrecen una solución más robusta y flexible para enfrentar los desafíos de la navegación autónoma en entornos complejos.

## 3. Búsqueda Bibliográfica:
### 3.1 Menciona al menos dos características de la navegación planeada y de la navegación basada en comportamientos, y cómo influyen en el tipo de respuesta del robot.
#### 3.1.1 Carac 1
#### 3.1.2 Carac 2

### 3.2 Investigaciones destacadas y robots desarrollados por los robotistas Rodney Brooks y Mark Tilden (máximo dos párrafos de cada uno).
#### 3.2.1 Rodney Brooks:

#### 3.2.2 Mark Tilden:

### 3.3 Mencione al menos tres algoritmos de planificación de rutas para espacios con obstáculos.
#### 3.3.1 Algoritmo 1:
#### 3.3.2 Algoritmo 2:
#### 3.3.3 Algoritmo 3:
#### 3.3.4 Algoritmo 4: Por si acaso

### 3.4 Describa brevemente los algoritmos Bug 0, Bug 1 y Bug 2.
#### 3.4.0 Bug 0:
#### 3.4.1 Bug 1:
#### 3.4.2 Bug 2:

### 3.5 Describa al menos un algoritmo de solución de laberintos (maze algorithm) aplicado en robótica móvil.
#### 3.5.1 XD

## 4. Misión 1: Superar Obstáculos

Se realiza el montaje del trayecto con dos obstaculos, en este caso son cajas de carton dispuestas horizontalmente sobre el trayecto delimitado con cinta de color rojo como se muestra en la siguiente imágen: 

![Precisión y Exactitud](https://github.com/user-attachments/assets/c2a33800-0c77-4539-8101-6da1acff9278)

La solución implementada consiste en un robot móvil LEGO EV3 programado en MATLAB, cuyo objetivo es alcanzar una meta definida en coordenadas dentro de un espacio plano, mientras evita colisiones con al menos dos obstáculos. Para lograr esto, el robot está equipado con sensores ultrasónicos, de color, giroscópico e infrarrojo, que permiten detectar distancias, orientación y colores en su entorno inmediato.

El control del robot se basa en un sistema de estados finitos con dos comportamientos principales: ir hacia la meta (GO_TO_GOAL) y seguir paredes (FOLLOW_WALL). El cambio entre estos comportamientos depende de la detección de obstáculos y del color rojo (señal de alineación con el camino). El robot corrige constantemente su trayectoria según el ángulo reportado por el giroscopio, y estima su posición mediante odometría con los encoders de los motores.

## Características

- Navegación hacia una meta en un espacio 2D.

- Evita obstáculos detectando la distancia frontal y lateral.

- Cambia entre dos comportamientos: GO_TO_GOAL (ir a la meta) y FOLLOW_WALL (seguir obstáculos).

- Detección de línea de referencia mediante sensor de color (rojo) y detección de meta mediante color negro.

- Estimación de posición con odometría y corrección de rumbo mediante sensor giroscópico


## Archivos

- `Bug2.m`: Código principal en MATLAB para EV3.
  
El cual se explica en formato pseudocódigo de la siguiente manera:

```
Inicializar conexión con el EV3 y los sensores
Configurar motores y sensores (ultrasónico, infrarrojo, color, giroscopio)
Establecer parámetros iniciales de posición, orientación, meta y tolerancia

Mientras no se alcance la meta:
    Leer sensores (distancia frontal, lateral, color, ángulo giroscópico)
    Estimar posición actual con odometría

    Si se detecta color negro:
        Detener motores y terminar

    Si el estado es GO_TO_GOAL:
        Si hay obstáculo al frente:
            Cambiar a estado FOLLOW_WALL
        Si no:
            Corregir rumbo según ángulo giroscópico y color:
                Si theta > 0 y no hay rojo: girar ligeramente izquierda
                Si theta < 0 y no hay rojo: girar ligeramente derecha
                Si color rojo detectado: seguir recto

    Si el estado es FOLLOW_WALL:
        Si se detecta línea (color rojo):
            Realizar giro de corrección hasta volver al rumbo
            Cambiar a estado GO_TO_GOAL
        Si obstáculo al frente:
            Girar hacia la izquierda
        Si mucha distancia lateral y cierto ángulo:
            Realizar giro correctivo para acercarse al muro
        Si distancia lateral correcta:
            Avanzar paralelo al muro

    Esperar dt segundos

Finalizar programa al alcanzar meta
```
## Requisitos

- MATLAB con soporte para EV3.
- Kit LEGO Mindstorms EV3 con sensores: giroscopio, ultrasónico, infrarrojo y color.

Haciendo uso de los sensores tales como el seguidor de linea (color), ultrasonido, infrarrojo y giroscopio, dependeiendo de las lecturas de estos el robot girará las ruedas de determinada forma al comprender algún obstacúlo.


<p align="center">
  <img src="https://github.com/user-attachments/assets/ebf393ce-3e18-4c60-85df-955063936c37" alt="Precisión y Exactitud" width="600">
</p>



## Sensores y actuadores conectados en las siguientes posiciones:

- Motor izquierdo: Puerto A

- Motor derecho: Puerto B

- Sensor giroscópico: Puerto 2

- Sensor ultrasónico (frontal): Puerto 3

- Sensor infrarrojo (lateral): Puerto 4

- Sensor de color (frontal): Puerto 1

## Pasos:

1. Conectar el robot EV3 al computador vía USB.

2. Cargar y ejecutar el archivo `Bug2.m` desde MATLAB.

3. El robot comenzará a moverse hacia la meta y cambiará de comportamiento automáticamente si detecta obstáculos o líneas de referencia.

Con este montaje se espera que el robot siga la siguiente trayectoria 

![Precisión y Exactitud](https://github.com/user-attachments/assets/a7f19a4b-3f77-4ec2-bf03-85287f637a72)

Se pueden ver los resultados en el siguiente video:

<p align="center">
  <a href="https://www.youtube.com/watch?v=p34uNsFeaVA">
    <img src="https://img.youtube.com/vi/p34uNsFeaVA/0.jpg" alt="Ver video en YouTube: Control LEGO EV3" width="600">
  </a>
</p>


## 5. Misión 2: Superar el Laberinto

Se realiza el montaje del trayecto con dos obstaculos, en este caso son cajas de carton dispuestas horizontalmente sobre el trayecto delimitado con cinta de color rojo como se muestra en la siguiente imágen: 

![image](https://github.com/user-attachments/assets/dfc3757d-88b5-49e7-8b89-1707c782dfd5)


La solución implementada es un sistema de navegación para un robot LEGO EV3 diseñado para atravesar un laberinto de forma autónoma. El robot emplea sensores ultrasónicos, giroscópicos, de infrarrojos y de color para obtener información del entorno. Se utiliza un enfoque reactivo con máquina de estados, alternando entre avanzar hacia el objetivo y rotar para evitar obstáculos. La orientación se controla mediante el sensor giroscópico, y se estiman posiciones mediante odometría básica. El robot detecta la meta cuando encuentra el color azul.
## Características

- Navegación autónoma basada en sensores: Usa un conjunto de sensores para percibir el entorno y tomar decisiones en tiempo real.

- Control por máquina de estados: Gestiona los comportamientos del robot con estados como "GO_TO_GOAL" y "ROTAR".

- Detección de meta por color: El robot identifica su objetivo al detectar el color azul con un sensor de color.

- Giros precisos con sensor giroscópico: Utiliza el giroscopio para realizar giros controlados y mantener la orientación.

- Estimación de la posición con odometría: Calcula su ubicación basándose en los encoders de los motores.


## Archivos

- `Lab3Laberinto.m`: Código principal en MATLAB para EV3.
  
El cual se explica en formato pseudocódigo de la siguiente manera:

```
Inicializar sensores y motores
Establecer pose inicial y parámetros del robot
Estado inicial: GO_TO_GOAL

Mientras no se detecte color azul:
    Leer sensores (distancia frontal, lateral, color, giroscopio)
    Estimar nueva posición usando odometría

    Si color detectado es azul:
        Detener motores y finalizar

    Si robot ha avanzado más de cierta distancia:
        Detener y reiniciar pose

    Si estado es GO_TO_GOAL:
        Si obstáculo al frente:
            Cambiar a estado ROTAR
        Sino si contador es 3 y camino a la derecha está libre:
            Ejecutar giro especial de 90 grados a la izquierda
            Reiniciar contador
        Sino:
            Corregir rumbo usando ángulo del giroscopio
            Avanzar

    Si estado es ROTAR:
        Si hay pared a la derecha:
            Girar a la izquierda hasta cierto ángulo
            Incrementar contador
        Sino:
            Girar a la derecha 90 grados
            Reiniciar contador
        Cambiar a estado GO_TO_GOAL

    Esperar un tiempo dt
```
## Requisitos

- MATLAB con soporte para EV3.
- Kit LEGO Mindstorms EV3 con sensores: giroscopio, ultrasónico, infrarrojo y color.

Haciendo uso de los sensores tales como el seguidor de linea (color), ultrasonido, infrarrojo y giroscopio, dependeiendo de las lecturas de estos el robot girará las ruedas de determinada forma al comprender la estructura del laberinto.


<p align="center">
  <img src="https://github.com/user-attachments/assets/c600b723-2f6c-4e96-894a-6bd4fa2a15bf" alt="Precisión y Exactitud" width="600">
</p>


## Sensores y actuadores conectados en las siguientes posiciones:

- Motor izquierdo: Puerto A

- Motor derecho: Puerto B

- Sensor giroscópico: Puerto 2

- Sensor ultrasónico (frontal): Puerto 3

- Sensor infrarrojo (lateral): Puerto 4

- Sensor de color (frontal): Puerto 1

## Pasos:

1. Conectar el robot EV3 al computador vía USB.

2. Cargar y ejecutar el archivo `Lab3Laberinto.m` desde MATLAB.

3. El robot comenzará a moverse hacia la meta y cambiará de comportamiento automáticamente si detecta paredes.

Se pueden ver los resultados en el siguiente video:

<p align="center">
  <a href="https://www.youtube.com/watch?v=PIAAdvywirU">
    <img src="https://img.youtube.com/vi/PIAAdvywirU/0.jpg" alt="Ver video en YouTube: PIAAdvywirU" width="600">
  </a>
</p>


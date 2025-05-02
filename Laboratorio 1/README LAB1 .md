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


### 3.6 Modelado de los robots
### 3.7 Programa simple de movimiento
### 3.8 Reflexión y discusión

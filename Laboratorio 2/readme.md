<div align="center">
<picture>
    <source srcset="https://imgur.com/5bYAzsb.png" media="(prefers-color-scheme: dark)">
    <source srcset="https://imgur.com/Os03JoE.png" media="(prefers-color-scheme: light)">
    <img src="https://imgur.com/Os03JoE.png" alt="Escudo UNAL" width="350px">
</picture>


# Laboratorio 2 - Caracteristicas de sensores </h3>
## Grupo 3
</div>

## 1. Resumen

## 2. Introducción
Los sensores son elementos fundamentales para que los robots móviles puedan cumplir con su función. Estos dispositivos poseen un conjunto de características técnicas que se clasifican en características estáticas y características dinámicas. Asociadas a dichas características existe un conjunto de valores de error que conforman la incertidumbre de medida.

A medida que se busca un mejor desempeño de los robots, estos errores se vuelven más evidentes y adquieren mayor relevancia. Reconocer su existencia, magnitud y comportamiento permite controlarlos mediante el preprocesamiento de señales, o al menos identificar por qué el comportamiento del robot difiere del esperado.

En este contexto, el uso de ROS (Robot Operating System) se ha convertido en un estándar fundamental para el desarrollo de robots móviles. ROS proporciona una infraestructura flexible que facilita la integración de diversos componentes de hardware, como sensores, actuadores y unidades de procesamiento, mediante una arquitectura modular basada en nodos y mensajes. Gracias a ROS, es posible gestionar de manera eficiente la adquisición, procesamiento y distribución de datos de sensores, permitiendo el desarrollo de sistemas más robustos, escalables y reutilizables.

### 3.1 ¿Qué es el Vocabulario Internacional de Metrología (VIM)?
El Vocabulario Internacional de Metrología (VIM) es un documento que establece definiciones y términos utilizados en metrología. Incluye conceptos fundamentales sobre mediciones, trazabilidad metrológica, incertidumbre de medición y propiedades cualitativas. El archivo del VIM tercera edición (2012), se puede consultar en el siguiente [enlace]((https://www.cem.es/sites/default/files/vim-cem-2012web.pdf)) del Centro Español de Metrología.
### 3.2 Según el VIM, defina los siguientes conceptos:
#### 3.2.1 Exactitud de medida
En la sección 2.13, página 31, se dice que la "Exactitud de medida" es la "proximidad entre un valor medido y un valor verdadero de un mensurando". Y se tiene una nota que menciona que: "El concepto “exactitud de medida” no es una magnitud y no se expresa numéricamente. Se dice que una medición es más exacta cuanto más pequeño es el error de medida. "
#### 3.2.2 Precisión de medida
En la sección 2.15, página 31, se dice que la "Precisión de medida" es la "proximidad entre las indicaciones o los valores medidos obtenidos en mediciones repetidas de un mismo objeto, o de objetos similares, bajo condiciones especificadas". Aquí se tiene una nota que dice que "La precisión se utiliza para definir la repetibilidad de medida, la precisión intermedia y la reproducibilidad."

Una forma gráfica de entender los conceptos anteriores se puede dar con la siguiente imagen, tomada de "[https://www.orbitalesmoleculares.com/precision-y-exactitud/](https://www.orbitalesmoleculares.com/precision-y-exactitud/)":
![Precisión y Exactitud](https://github.com/user-attachments/assets/d66d8e89-9db5-4246-a63b-b024c6bb75ea)

#### 3.2.3 Error de medida
En la sección 2.16, página 32, se dice que el "Error de medida" es la "diferencia entre un valor medido de una magnitud y un valor de referencia". Se tiene una nota que menciona que "El error de medida puede emplearse cuando exista un único valor de referencia, ... , o cuando se toma un valor convencional, en cuyo caso el error es conocido."
#### 3.2.4 Incertidumbre de medida
En la sección 2.26, página 34, se dice que la "Incertidumbre de medida" es el "parámetro no negativo que caracteriza la dispersión de los valores atribuidos a un mensurando, a partir de la información que se utiliza"

### 3.3 Explique la diferencia entre un error sistemático y un error aleatorio.
### 3.4 De acuerdo con la teoría estadística: ¿qué es el valor medio? ¿Qué magnitudes se utilizan para medir la dispersión de los datos?
### 3.5 Busque una definición de que es ROS y sus principales ventajas
### 3.6 Investigue sobre qué comandos se pueden usar con rosnode, rostopic, rosparam, rosservice, rosmsg y rospack.
### 3.7 Investigue acerca del robot TurtleBot2 y su relación con la base Kobuki.
### 3.8 ¿Para que sirve los sensores cliff en el Kobuki?
### 3.9 ¿Como leer un evento de dicho sensor?
### 3.10 ¿Qué protocolo de comunicación usa el Lego Ev3 con sus sensores y actuadores?
### 3.11 ¿Qué opciones de conexión permiten integrar sensores no nativos al sistema LEGO EV3?

<div align="center">
<picture>
    <source srcset="https://imgur.com/5bYAzsb.png" media="(prefers-color-scheme: dark)">
    <source srcset="https://imgur.com/Os03JoE.png" media="(prefers-color-scheme: light)">
    <img src="https://imgur.com/Os03JoE.png" alt="Escudo UNAL" width="350px">
</picture>
  
# Tarea No. 3: Navegacion por campo potencial 
</div>

## Integrantes:
Julián David Benítez Martínez
Jhon Alexander Calderón Suárez

## Parámetros:
Robot: Dr20
Resolución: 8 celdas/m
Entrada: Inferior-Derecha
Salida: Superior-Izquierda 




## Modelo cinemático del robot
El robot DR20 es un robot móvil con tracción diferencial, es decir, se desplaza gracias a dos ruedas motrices ubicadas a los costados izquierdo y derecho del chasis. Este tipo de robots se controla mediante las velocidades individuales de sus ruedas, y su movimiento puede modelarse con un conjunto de ecuaciones cinemáticas simples.

<div align="center">

<img src="https://github.com/user-attachments/assets/527477ea-889e-4d46-9a0d-88fbb4532f8a" alt="fig1" width="500"/>

Figura 1: Modelo del robot Dr20

</div>

Suposiciones:
* El robot se mueve en un plano 2D.
* No hay deslizamiento (contacto puro de rodadura).
* El centro de masa está entre ambas ruedas.
* El robot tiene ruedas idénticas, separadas por una distancia fija  L (ancho del eje o trackWidth).
* Las ruedas tienen un radio r constante.
  
---

### ¿Qué es la función sigmoidal y para qué se usa en navegación robótica?

La **función sigmoidal** (por ejemplo, `sigmoid(x) = 1 / (1 + e^{-x})`) es una función matemática continua y suave con forma de "S", que **crece gradualmente desde 0 hasta 1**. También se conoce como función logística.

En navegación robótica, puede usarse para construir el **campo de repulsión de obstáculos** dentro de algoritmos de **campos potenciales artificiales**. Suaviza la interacción con los obstáculos y evita fuerzas infinitas cerca de ellos.

### Campo de repulsión sigmoidal

Una posible forma del campo:

`U_rep(d) = 1 / (1 + exp(k * (d - d0)))`

Donde:
- \( d \): distancia al obstáculo  
- \( d_0 \): distancia de activación (cuando empieza a actuar la repulsión)  
- \( k \): pendiente (qué tan brusco es el cambio)

---

### ✅ Ventajas sobre el campo paraboloide:
- Suave y continua → menos oscilaciones.
- Repulsión limitada → evita fuerzas excesivas.
- Ajustable mediante parámetros → más control.


## Mapas
El radio del circulo circunscrito al robot presenta un valor de 0,125 metros; por lo tanto el valor de corrección k tendrá un valor igual a 1,25.

El mapa denominado "arena2025", con la aplicación de k, corresponderá al siguiente:

<div align="center">

<img src="https://github.com/user-attachments/assets/0ade7b8a-a56b-4832-b87c-72ff4e7abd03" alt="fig1" width="500"/>

Figura 2: Mapa Arena

</div>



A continuación se muestran los valores de las posiciones de los puntos de llegada y salida, teniendo como referencia que la posición 0 se encuentra en el centro del obstáculo de mayor tamaño:

| Punto  |     X      |     Y      |
|--------|------------|------------|
| Inicio | -1.0625    | -1.1250    |
| Meta   |  1.1875    |  1.1250    |

Luego se realiza la navegación por campos potenciales con 3 diferentes orientaciones iniciales; 45 grados, 30 grados y 60 grados respecto al eje horizontal, para esta simulación se utiliza Matlab.   Los resultados de las simulaciones se observan a continuación:
### Orientación inicial 45 grados:

<div align="center">

<img src="https://github.com/user-attachments/assets/4ea55855-67f0-49ef-9ecc-331bcb749754" alt="fig1" width="500"/>

Figura 3: Orientación inical 45 grados 

</div>

### Orientación inicial 30 grados:

<div align="center">
    
<img src="https://github.com/user-attachments/assets/2aa0f3a3-ef77-459d-a67b-d890aad75147" alt="fig1" width="500"/>

Figura 4: Orientación inical 30 grados 

</div>

### Orientación inicial 60 grados:

<div align="center">
    
<img src="https://github.com/user-attachments/assets/7f111dad-24fa-45cc-bc1c-4cd374070bc7" alt="fig1" width="500"/>

Figura 5: Orientación inical 60 grados 

</div>


Para producir estas trayectorias fue necesario modificar los parámetros que modifican la relevancia de fuerza potencia que generan los objetos dentro del escenario, para la fuerza potencial de la llegada se modifica el valor de ζ, se dejó un valor estándar de 1, respecto al valor de η se implementó un valor mucho menor al valor de ζ, permitiendo que su fuerza de repulsión se presente de forma leve frente a la atracción general del mapa; finalmente Q\* define la distancia de influencia de los obstáculos, define el radio dentro del cual un obstáculo afecta al robot; permitiendo la detección temprana de un obstáculo por parte del robot.

| Parámetro | Valor  |
|-----------|--------|
| ζ         | 1.0    |
| η         | 0.02   |
| Q\*       | 0.3    |

Estas trayectorias funcionaban a base del siguiente campo vectorial:

![image](https://github.com/user-attachments/assets/31945472-9c4f-4b3b-8007-8bf074f53138)

Como se observa, la mayor influencia es generada por el punto de llegada, y los obstáculos generan una repulsión en una pequeña área circundante a ellos mismos, permitiendo que el robot se dirija en dirección a la meta y evite obstáculos cuando sea necesario.

## Simulación en CoppeliaSim
Para la simulación en CoppeliaSim se generó una escena que involucra los 6 obstáculos propuestos en el ejercicio, además del robot dr20 correspondiente a esta actividad, los obstáculos se ubicaron en base a el factor de correción k y sus dimensiones también se encuentran ajustadas en función de este mismo valor de correción, los obstáculos se encuentran fijados por sensores de fuerza al suelo, permitiendo que no sean desplazados por el robot en caso de una colisión, la siguiente imagen muestra la escena en el software.

![image](https://github.com/user-attachments/assets/ead6e34f-f0c9-4eaa-9ff1-7ced937e88c4)



El código en CoppeliaSim implementa campos potenciales artificiales (APF). Durante el bucle principal, el robot obtiene su posición y orientación, calcula una fuerza atractiva hacia la meta y una fuerza repulsiva desde los obstáculos cercanos. La fuerza total se convierte en velocidades lineales y angulares, que a su vez se traducen en velocidades de rueda usando el modelo cinemático diferencial.  Esto permite que el robot avance en direcció al objetivo y gire cuando detecte una repulsión, el siguiente video muestra el comportamiento del robot.

https://github.com/user-attachments/assets/61aa0548-805e-4de6-adab-8ef610d04e78


## Conclusiones y dificultades

-Se evidenció que la implementación de la función sigmoidal permite un control más fino de la zona de repulsión, pero su efecto puede ser difícil de apreciar visualmente si no se ajustan correctamente los parámetros de pendiente (k) y distancia de activación (d₀).

-Al utilizar la sigmoide, se redujeron las fuerzas bruscas cerca de los obstáculos en comparación con el campo paraboloide, sin embargo, también aumentó la probabilidad de que el robot no reaccionara a tiempo ante ciertos obstáculos si el gradiente era demasiado suave.

-En varias pruebas, cuando el valor d₀ muy pequeño, el robot presentaba trayectorias menos reactivas, lo que generaba colisiones o acercamientos peligrosos.

-Se observó que al combinar la función sigmoidal con un campo de atracción constante, el movimiento del robot era más fluido, aunque en entornos con obstáculos densos aún se presentaban puntos muertos si no se ajustaba bien la ganancia de repulsión.

-El comportamiento suave de la sigmoide reduce el efecto de “vibración” o “zigzagueo” del robot, pero también puede dificultar su capacidad de escapar de trampas locales si no se complementa con estrategias adicionales.

-Cuando se presentan objetos cercanos entre sí, sus campos de repulsión pueden ocasionar que se genere un estancamiento en el moviemiento del robot por la gran influencia de esta suma de campos repulsivos, para solucionar esto es necesario modificar los parámetros relacionados con esta repulsión, permitiendo generar un pasillo vectorial que permita el paso del robot.






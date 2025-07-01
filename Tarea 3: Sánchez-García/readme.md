<div align="center">
<picture>
    <source srcset="https://imgur.com/5bYAzsb.png" media="(prefers-color-scheme: dark)">
    <source srcset="https://imgur.com/Os03JoE.png" media="(prefers-color-scheme: light)">
    <img src="https://imgur.com/Os03JoE.png" alt="Escudo UNAL" width="350px">
</picture>
  
# Tarea No. 3: Navegacion por campo potencial

</div>

### FRM - Grupo:
- Juan Pablo García Galvis
- Juan Diego Sánchez Forero
### Robot asignado:
* Robot: BubbleRob

## Modelo del robot BubbleRob
El robot BubbleRob no es un robot encontrado en los modelos de CoppeliaSim sino que viene de una escena ejemplo del programa. El robot en cuestión puede ser encerrado en un cubo de 0.2 x 0.2 x 0.2 metros, y su forma física es la siguiente:

<div align="center">

<img src="https://github.com/user-attachments/assets/0c8f80d4-4c3f-4aac-a30b-b42f176691b0" alt="Fig0" width="500"/>

Figura 1: Robot BubbleRob
</div>

Por ende, si se encierra el robot en el cubo de lado 0.2 m,  el circulo que encierra al robot tendrá un radio de 0.1414 metros, o 14.14 centímetros. Este valor de R es requerido para aplicar un valor k=10*R en el algoritmo de MatLab sugerido para la presente actividad. El valor K por ende es de 1.141 y se obtiene el siguiente mapa de obstáculos:

<div align="center">

<img src="https://github.com/user-attachments/assets/e80292ac-c067-4827-8bab-264f59e0d4fc" alt="fig1" width="500"/>

Figura 2: Mapa de obstáculos creado por el algoritmo de MatLab

</div>

Con esto, el origen del robot lo encontramos en X= -1.20 m y Y= -1.27 m, y la meta se encuentra en X= 1.34 m y Y= 1.27 m.

### Función tangente sigmoidal (o función sigmoide)
Esta función de activación está dada por la siguiente expresión matemática:
<div align="center">
<img src="https://github.com/user-attachments/assets/c4368744-6158-4158-a11b-2c88acc72af9" alt="fig2" width="150"/>
</div>

Cuando x es pequeño, el valor de la función sigmoidea es cercano a 0. Cuando x es grande, el valor de sigmoide es cercano a 1. La función sigmoidea transforma un número real y contínuo a un valor dos límites, donde los límites cuando se tiende a infinito y menos infinito son 1 y 0, respectivamente. La función sigmoide guarda parecido con la función tangente hiperbólica, pero esta última está acotada de entre -1 a 1.

## Navegacion por Campo Potencial
Se implementó el algoritmo de planeación por campo potencial artificial (Artificial Potential Fields), utilizando los parámetros presentados en la tabla 1. Este algoritmo utilizó los parámetros de los campos, la pose inicial del robot en X= -1.20 m y Y= -1.27 m, variando el ángulo inicial entre 30, 45 y 60 grados, y la meta en X= 1.34 m y Y= 1.27 m.
Los obstáculos fueron generados por el código [arena2025](https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/9e8c0b3d1e0d174f7e00d8f1e3c00d6ecd0a68bd/Tarea%203%3A%20S%C3%A1nchez-Garc%C3%ADa/Anexos%20y%20C%C3%B3digos/arena2025.m), y los 6 obstáculos creados son 6 cilindros (círculos en 2D), con las siguientes propiedade:

<div align="center">
    
| Obstáculo | Centro                    | Radio   |
|-----------|---------------------------|---------|
| Obst1     | X=0.4242,  Y=-0.9898      | 0.1414  |
| Obst2     | X=-0.707,  Y=-0.707       | 0.2121  |
| Obst3     | X=0,       Y=0            | 0.3535  |
| Obst4     | X=-1.1312, Y=0.8484       | 0.1414  |
| Obst5     | X=0.1414,  Y=0.8484       | 0.1697  |
| Obst6     | X=0.9898,  Y=0.5656       | 0.2828  |

Tabla 1: Obstáculos en el campo vectorial.
</div>

El código [Planeacion_AFP](https://github.com/JulianI3/Robotica-Movil-Grupo-3/blob/9e8c0b3d1e0d174f7e00d8f1e3c00d6ecd0a68bd/Tarea%203%3A%20S%C3%A1nchez-Garc%C3%ADa/Anexos%20y%20C%C3%B3digos/Planeacion_AFP.m) fue basado en el siguiente [ejemplo](https://la.mathworks.com/matlabcentral/fileexchange/126455-artificial-potential-field-path-planning-algorithm) de MatLab. El codigo utilizó estas propiedades y generó el movimiento del robot através del campo potencial, utilizando los siguientes parámetros:

<div align="center">

| Parámetro | Descripción                                 | Valor   |
|-----------|---------------------------------------------|---------|
| `zeta`    | Coeficiente del campo atractivo             | 1.1547  |
| `eta`     | Coeficiente del campo repulsivo             | 0.0732  |
| `dstar`   | Distancia de transición del campo atractivo | 0.3     |
| `Qstar`   | Radio de influencia del campo repulsivo     | 0.2     |

Tabla 2: Parámetros del modelo utilizado.
</div>

El resultado del modelo para cada configuración inicial es el siguiente:

<div align="center">

<img src="https://github.com/user-attachments/assets/0dc7723d-cf28-4dea-a743-ba263c2b295a" alt="fig3" width="500"/>

Figura 3: Trayectoria de navegación con orientación a 30°

<img src="https://github.com/user-attachments/assets/cc2a7fe5-2c0f-4463-8582-71d0988cea35" alt="fig4" width="500"/>

Figura 4: Trayectoria de navegación con orientación a 45°

<img src="https://github.com/user-attachments/assets/2244e5b8-bdc5-4553-bcf8-61627da5c66d" alt="fig5" width="500"/>

Figura 5: Trayectoria de navegación con orientación a 60°
</div>

El cambio solo es observable al inicio de la trayectoria pues el robot sin importar cómo esté orientado, buscará seguir la ruta más corta evitando los obstáculos.

## Gradiente del Campo Potencial
El campo vectorial fue ajustado para dar vectores de la misma magnitud pero solo variando su dirección, esto porque las magnitudes máximas, cerca a los obstáculos, opacaban a las fuerzas más pequeñas. Por lo que el siguiente gráfico solo es representativo.

<div align="center">

<img src="https://github.com/user-attachments/assets/5498b56d-00a0-4039-bf60-fd228b74faf6" alt="fig6" width="500"/>

Figura 6: Gradiente del Campo Potencial de navegación

</div>


## Coppelia

La simulacion de coppelia se realizo con el siguiente montaje

<div align="center">
    
![Captura de pantalla de 2025-07-01 13-54-09](https://github.com/user-attachments/assets/a896a449-e0a0-40c3-a1a0-a65dfd1f9510)

</div>

Dando como resultado:



https://github.com/user-attachments/assets/dc9c5fad-8539-417a-9ef5-6541912d11c0

El codigo se puede encontrar en anexos.

## Conclusiones
- Se observa que la orientación inicial no afecta significativamente a la ruta que debe serguir el robot, debido a que desde el inicio de su recorrido buscará mejorar la trayectoria para hacer la ruta más corta.
- Se presentaron variaos problemas tecnicos al momento de realizar la simulacion en Coppelia puesto que el robot terminaba quedando en puntos muertos varias veces, teniendo que modificar las constantes de repulsion y atracción hasta llegar a un punto óptimo de movimiento.
- Al momento de realizar la simulaion el efecto de la sigmoide varias veces no se apreciaba, con el movimiento del robot no se veia ese cambio suave ademas de presentar pitching de la direccion.
- Si el diámetro mínimo para la repulsion era muy grande era más propenso a quedar en puntos muertos el robot.




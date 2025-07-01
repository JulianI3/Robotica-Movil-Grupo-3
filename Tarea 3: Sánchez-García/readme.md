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

Con esto, el origen del robot lo encontramos en X= -1.20 m y Y= -1.27m, y la meta se encuentra en X= 1.34 m y Y= 1.27 m.

### Función tangente sigmoidal (o función sigmoide)
Esta función de activación está dada por la siguiente expresión matemática:
<div align="center">
<img src="https://github.com/user-attachments/assets/c4368744-6158-4158-a11b-2c88acc72af9" alt="fig2" width="150"/>
</div>

Cuando x es pequeño, el valor de la función sigmoidea es cercano a 0. Cuando x es grande, el valor de sigmoide es cercano a 1. La función sigmoidea transforma un número real y contínuo a un valor dos límites, donde los límites cuando se tiende a infinito y menos infinito son 1 y 0, respectivamente. La función sigmoide guarda parecido con la función tangente hiperbólica, pero esta última está acotada de entre -1 a 1.

## Navegacion por Campo Potencial
3.1. Implementar el algoritmo de navegacion por campos potenciales para desplazar un agente desde un punto de inicio hasta un objetivo, considerando tres casos con orientaciones iniciales de 30°, 45° y 60°, utilizando MATLAB, Lua o Python.

3.2. Ajustar los parametros de atracción y repulsión para lograr una navegación exitosa.

3.3. Mostrar la trayectoria seguida por el robot desde el punto inicial hasta el objetivo en la figura 3 (superpuesta al mapa original).

<div align="center">

<img src="https://github.com/user-attachments/assets/0dc7723d-cf28-4dea-a743-ba263c2b295a" alt="fig3" width="500"/>

Figura 3: Trayectoria de navegación con orientación a 30°

<img src="https://github.com/user-attachments/assets/cc2a7fe5-2c0f-4463-8582-71d0988cea35" alt="fig4" width="500"/>

Figura 4: Trayectoria de navegación con orientación a 45°

<img src="https://github.com/user-attachments/assets/2244e5b8-bdc5-4553-bcf8-61627da5c66d" alt="fig5" width="500"/>

Figura 5: Trayectoria de navegación con orientación a 60°
</div>


3.4. Incluir una tabla con los parametros usados. 

<div align="center">

| Parámetro | Descripción                                 | Valor   |
|-----------|---------------------------------------------|---------|
| `zeta`    | Coeficiente del campo atractivo             | 1.1547  |
| `eta`     | Coeficiente del campo repulsivo             | 0.0732  |
| `dstar`   | Distancia de transición del campo atractivo | 0.3     |
| `Qstar`   | Radio de influencia del campo repulsivo     | 0.2     |

</div>

## Gradiente del Campo Potencial
Presentar en una figura (figura 4) el gradiente del campo potencial usado para navegacion. 

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



## Conclusiones
- Se preserntaron variaos problemas tecnicos al momento de realizar la simulacion en coppelia puesto que el robot terminava quedando en puntos muertos varias veces, teniento de modificar las constantes de repulsion y atracción hasta llegar a un punto optimo de movimiento.
- Al momento de realizar la simulaion el efecto de la sigmoide varias veces no se veia, con el movimiento del robot no se veia ese cambio suve ademas de presenta un libre bamboleo de la direccion.
- Si el diametro minimo para la repulsion era muy grande era más propenso a quedar en puntos muertos el robot  



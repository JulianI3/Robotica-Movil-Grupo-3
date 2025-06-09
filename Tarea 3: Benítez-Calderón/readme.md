<div align="center">
<picture>
    <source srcset="https://imgur.com/5bYAzsb.png" media="(prefers-color-scheme: dark)">
    <source srcset="https://imgur.com/Os03JoE.png" media="(prefers-color-scheme: light)">
    <img src="https://imgur.com/Os03JoE.png" alt="Escudo UNAL" width="350px">
</picture>
  
# Tarea No. 3: Navegacion por planeación
</div>

## Integrantes:
Julián David Benítez Martínez
Jhon Alexander Calderón 

## Parámetros:
Robot: Dr20
Resolución: 8 celdas/m
Entrada: Inferior-Derecha
Salida: Superior-Izquierda 

## Modelo cinemático del robot
El robot DR20 es un robot móvil con tracción diferencial, es decir, se desplaza gracias a dos ruedas motrices ubicadas a los costados izquierdo y derecho del chasis. Este tipo de robots se controla mediante las velocidades individuales de sus ruedas, y su movimiento puede modelarse con un conjunto de ecuaciones cinemáticas simples.

Suposiciones:
* El robot se mueve en un plano 2D.
* No hay deslizamiento (contacto puro de rodadura).
* El centro de masa está entre ambas ruedas.
* El robot tiene ruedas idénticas, separadas por una distancia fija  L (ancho del eje o trackWidth).
* Las ruedas tienen un radio r constante.
  
Las ecuaciones cinemáticas del robot diferencial: <br>
dx/dt = v * cos(theta) <br>
dy/dt = v * sin(theta) <br>
dtheta/dt = omega

Donde:  <br>
v = r/2 * (v_R + v_L)<br>
w = r/L * (v_R - v_L)<br>
v_L = v - (wL)/2<br>
v_R = v + (wL)/2<br>

## Mapa
A continuación se presenta el mapa binario generado en Matlab:

![image](https://github.com/user-attachments/assets/558a9989-bca9-424b-b365-0fc17da6350e)


Posteriormente se realiza el inflado del mapa, que corresponde a la mitad del valor de la trocha del robot la cuál, según el modelo de coppeliaSim es de 0.25 metros <br>

![image](https://github.com/user-attachments/assets/c1b6f823-c42a-4439-9ac0-e45fa560081d)

Ahora se realiza la ruta óptima por planeación PRM, para ello se utilizan los siguientes parámetros:
MaxNumNodes: 300
MaxConnectionDistance: 5.00


![image](https://github.com/user-attachments/assets/e2fab62e-aa91-4a6b-b3af-116f78fae8fb)

Ruta óptima (tabla):<br>
| Punto |     X      |     Y      |
|-------|------------|------------|
| 1     | 6.0000     | 0.2000     |
| 2     | 6.1093     | 0.2913     |
| 3     | 5.8411     | 0.9569     |
| 4     | 5.8718     | 2.1775     |
| 5     | 6.0323     | 4.3446     |
| 6     | 4.6045     | 4.5314     |
| 7     | 4.3644     | 5.5040     |
| 8     | 2.3795     | 5.6634     |
| 9     | 0.2203     | 6.0818     |
| 10    | 0.1500     | 6.0500     |


Costo total de la ruta óptima: 11.40 metros

Finalmente se realiza la ruta por planeación RRT, para ello se utilizan los siguientes parámetros:
MinIterations: 2000
ConnectionDistance: 2.50

![image](https://github.com/user-attachments/assets/50f82954-ce8b-4f2f-8014-9ac7551e5b5c)

| Punto |     X      |     Y      |
|-------|------------|------------|
| 1     | 6.0000     | 0.2000     |
| 2     | 5.6198     | 2.6500     |
| 3     | 5.2534     | 2.7228     |
| 4     | 5.6960     | 2.5375     |
| 5     | 6.0755     | 3.2219     |
| 6     | 5.8168     | 4.5380     |
| 7     | 5.8165     | 4.5728     |
| 8     | 4.3493     | 4.2371     |
| 9     | 4.4771     | 4.3274     |
| 10    | 4.2312     | 6.0482     |
| 11    | 4.6360     | 5.8744     |
| 12    | 4.0438     | 5.7817     |
| 13    | 3.7956     | 5.9304     |
| 14    | 3.6233     | 5.6919     |
| 15    | 3.4241     | 5.4407     |
| 16    | 1.0018     | 5.8915     |
| 17    | 0.1500     | 6.0500     |


Costo total de la ruta óptima (RRT): 16.15 metros

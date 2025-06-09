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

Donde:  
v = r/2 * (v_R + v_L)
w = r/L * (v_R - v_L)
v_L = (2v - wL)/2r
v_R = (2v + wL)/2r

## Mapa
A continuación se presenta el mapa binario generado en Matlab:

![image](https://github.com/user-attachments/assets/558a9989-bca9-424b-b365-0fc17da6350e)


Posteriormente se realiza el inflado del mapa, que corresponde a la mitad del valor de la trocha del robot la cuál, según el modelo de coppeliaSim es de 0.25 metros <br>

![image](https://github.com/user-attachments/assets/c1b6f823-c42a-4439-9ac0-e45fa560081d)

Ahora se realiza la ruta óptima por planeación PRM, para ello se utilizan los siguientes paraámetros:
MaxNumNodes: 300
MaxConnectionDistance: 5.00
Costo total de la ruta óptima: 11.40 metros

![image](https://github.com/user-attachments/assets/e2fab62e-aa91-4a6b-b3af-116f78fae8fb)


Ruta óptima (tabla):<br>
| Punto |     X      |     Y      |
|-------|------------|------------|
|     1 |     6.0000 |     0.2000 |
|     2 |     6.0247 |     0.0451 |
|     3 |     5.7224 |     1.7465 |
|     4 |     6.2151 |     3.8073 |
|     5 |     5.4194 |     4.5853 |
|     6 |     4.8126 |     4.5319 |
|     7 |     4.4605 |     4.8214 |
|     8 |     4.3088 |     5.6022 |
|     9 |     1.9312 |     5.6388 |
|    10 |     0.0412 |     6.0449 |
|    11 |     0.1500 |     6.0500 |

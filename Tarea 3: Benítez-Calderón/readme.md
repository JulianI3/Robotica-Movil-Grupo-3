<div align="center">
<picture>
    <source srcset="https://imgur.com/5bYAzsb.png" media="(prefers-color-scheme: dark)">
    <source srcset="https://imgur.com/Os03JoE.png" media="(prefers-color-scheme: light)">
    <img src="https://imgur.com/Os03JoE.png" alt="Escudo UNAL" width="350px">
</picture>
  
# Tarea No. 3: Navegacion por planeación

<div align="center">
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


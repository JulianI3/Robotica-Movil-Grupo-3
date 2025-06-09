<div align="center">
<picture>
    <source srcset="https://imgur.com/5bYAzsb.png" media="(prefers-color-scheme: dark)">
    <source srcset="https://imgur.com/Os03JoE.png" media="(prefers-color-scheme: light)">
    <img src="https://imgur.com/Os03JoE.png" alt="Escudo UNAL" width="350px">
</picture>
  
# Tarea No. 2: Navegacion por planeación

</div>

### FRM - Grupo:
- Juan Pablo García Galvis
- Juan Diego Sánchez Forero
### Robot asignado:
* Robot: BubbleRob
* Resolución: 10 celdas/m
* Entrada: Inf-Der
* Salida: Inf-Izq



## Modelo del robot BubbleRob
El robot BubbleRob no es un robot encontrado en los modelos de CoppeliaSim sino que viene de una escena ejemplo del programa. El robot en cuestión puede ser encerrado en un cubo de 0.2 x 0.2 x 0.2 metros, y su forma física es la siguiente:
![image](https://github.com/user-attachments/assets/0c8f80d4-4c3f-4aac-a30b-b42f176691b0)

Las indicaciones para la tarea eran que el robot ingresa desde la esquina inferior derecha y sale en la esquina inferior izquierda. Teniendo esto y una resolución de 10 celdas/metro, el modelo cinemático planteado y el mapa resultante son:
Figura 1: Modelo cinemático usando la ruta: []
![image](https://github.com/user-attachments/assets/93ac804e-6ce8-4a9a-9d57-f8251e75ff6b)
Figura 2: Mapa a 10 celdas/m

Conociendo que el BubbleRob se encierra en un cubo de 0.2 metros, el inflado de los muros debe ser de 0.1 metros para evitar choques durante la simulación.
## Planeación de la ruta por PRM
Con un código basado en el ejemplo de MatLab llamado “PathFollwingControllerExample”, se realizaron las actividades previamente mencionadas y la plafinicación de la ruta. Se dejaron los parámetros del algoritmo por defecto, que serían Número de Nodos = 100 y Distancia de Conexión máxima = 10. Y basado en el mapa anteriormente mostrado una pose inicial igual a (4.8, 0, 90) y u final (0.4, 0, 180), donde la estructura es (x, y, tetha).

El resultado de aplicar el algoritmo es la siguiente ruta:

Path = 

Que organizado en el mapa se ve de la siguiente forma:

Imagen

Todo esto con el algoritmo buscando aleatoriamente puntos y luego eligiendo entre las rutas posibles la que tuviese la menor distancia recorrida.


## Planeación de la ruta por RRT
De igual forma, el código del ejemplo fue modificado utilizando la ayuda de la IA generativa, y utilizando los parámetros de Número de iteraciones = 1000 y Distancia de Conexión máxima = 2.
El resultado de aplicar el algoritmo es la siguiente ruta:

Path = 

Que organizado en el mapa se ve de la siguiente forma:

Imagen






## Simulación de Matlab y coppelia:

Para esta se escogio la ruta generado por el metodo de PRM presentado anteriormente, con el mapa de simulacion como:


![Captura de pantalla de 2025-06-09 12-55-13](https://github.com/user-attachments/assets/4cbbcdff-3b5f-40bc-a2fa-886ab7afae93)

Los codigos utilizados y simulaciones realizadas se encuentran en la carpeta de anexos y codigos.Como resultados de la union de los dos sistemas se dio el movimiento de:



## Conclusiones:


- Se pudo realizar de forma satisfacoria la conexion entre los dos sistemas, en donde la mayor problematica en su momento fue el llamar como objetos a los motores, puesto que estaban como parte del robot. Saliendo de este problema se vuelve facil el control del robot
- En el desarrollo de la ruta por PRM se ve el problema que podian dar rutas poco efiecientes al no generar puntos en lugares estrategicos, ademas de ser necesario reinicir el codigo hasta llegar aun resultado aceptable.
- Es importante que la velocidad de las ruedas del robot no sea demaciado alta porque se podia llegar a problemas al cabiar la direccopn del moviento.




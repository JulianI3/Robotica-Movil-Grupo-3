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
El Vocabulario Internacional de Metrología (VIM) es un documento que establece definiciones y términos utilizados en metrología. Incluye conceptos fundamentales sobre mediciones, trazabilidad metrológica, incertidumbre de medición y propiedades cualitativas. El archivo del VIM tercera edición (2012), se puede consultar en el siguiente [enlace](https://www.cem.es/sites/default/files/vim-cem-2012web.pdf) del Centro Español de Metrología.
### 3.2 Según el VIM, defina los siguientes conceptos:
#### 3.2.1 Exactitud de medida
En la sección 2.13, página 31, se dice que la "Exactitud de medida" es la "proximidad entre un valor medido y un valor verdadero de un mensurando". Y se tiene una nota que menciona que: "El concepto “exactitud de medida” no es una magnitud y no se expresa numéricamente. Se dice que una medición es más exacta cuanto más pequeño es el error de medida. "
#### 3.2.2 Precisión de medida
En la sección 2.15, página 31, se dice que la "Precisión de medida" es la "proximidad entre las indicaciones o los valores medidos obtenidos en mediciones repetidas de un mismo objeto, o de objetos similares, bajo condiciones especificadas". Aquí se tiene una nota que dice que "La precisión se utiliza para definir la repetibilidad de medida, la precisión intermedia y la reproducibilidad."

Una forma gráfica de entender los conceptos anteriores se puede dar con la siguiente imagen, tomada de "[https://www.orbitalesmoleculares.com/precision-y-exactitud/](https://www.orbitalesmoleculares.com/precision-y-exactitud/)":
<div align="center">
    
![Precisión y Exactitud](https://github.com/user-attachments/assets/d66d8e89-9db5-4246-a63b-b024c6bb75ea)

</div>

#### 3.2.3 Error de medida
En la sección 2.16, página 32, se dice que el "Error de medida" es la "diferencia entre un valor medido de una magnitud y un valor de referencia". Se tiene una nota que menciona que "El error de medida puede emplearse cuando exista un único valor de referencia, ... , o cuando se toma un valor convencional, en cuyo caso el error es conocido."
#### 3.2.4 Incertidumbre de medida
En la sección 2.26, página 34, se dice que la "Incertidumbre de medida" es el "parámetro no negativo que caracteriza la dispersión de los valores atribuidos a un mensurando, a partir de la información que se utiliza"

### 3.3 Explique la diferencia entre un error sistemático y un error aleatorio.
Basado en las definiciones del VIM:
- 2.17 "Error Sistemático de medida: componente del error de medida que, en mediciones repetidas, permanece constante o varía de manera predecible."
NOTA 1 El valor de referencia para un error sistemático es un valor verdadero, un valor medido de  un patrón cuya incertidumbre de medida es despreciable, o un valor convencional de una magnitud.

- 2.19 "Error Aleatorio de medida: componente del error de medida que, en mediciones repetidas, varía de manera impredecible."
NOTA 1 El valor de referencia para un error aleatorio es la media que se obtendría de un número  infinito de mediciones repetidas del mismo mensurando. 
- Así la diferencia entre estas dos es por su naturaleza, pues el error sistemático es predecible o constante, y el error aleatorio es inesperado o impredecible.

### 3.4 De acuerdo con la teoría estadística: ¿qué es el valor medio? ¿Qué magnitudes se utilizan para medir la dispersión de los datos?
El valor medio puede entenderse por la mediana o por el promedio. Estas dos magnitudes son:
- Mediana: Es el valor del medio de todos los datos ordenados de menor a mayor. La mediana divide todo el conjunto de datos ordenados en dos partes iguales.
- Promedio / Media: Es una medida de tendencia central que se calcula sumando todos los valores de un conjunto de datos y dividiendo esa suma por el número total de valores.
Las magnitudes de dispersión de datos son:
- Varianza: Es la media de los cuadrados de las diferencias entre cada valor y la media del conjunto de datos.
- Desviación estándar: Indica cuánto se alejan los valores de los datos de la media. Se calcula como la raíz cuadrada de la varianza.
- Rango: Es la diferencia entre el valor máximo y el valor mínimo de los datos.
- Coeficiente de variación: Es la relación entre la desviación estándar y la media, expresada como un porcentaje.
### 3.5 Busque una definición de que es ROS y sus principales ventajas.
ROS (Robot Operating System)
La definición dada en la página [lovtechnology]( https://lovtechnology.com/que-es-el-ros-robot-operating-system-como-funciona-y-para-que-sirve/) : es que ROS es un framework de código abierto que proporciona librerías de software y herramientas para ayudar a los desarrolladores a crear aplicaciones robóticas complejas. Fue desarrollado en 2007 por Willow Garage.

La arquitectura de ROS se basa en una colección de nodos que se comunican entre sí mediante mensajes. Un nodo es un proceso que realiza una tarea específica, como leer los datos de un sensor o controlar un motor. Los nodos pueden estar escritos en C++, Python u otros lenguajes de programación.
### 3.6 Investigue sobre qué comandos se pueden usar con `rosnode`, `rostopic`, `rosparam`, `rosservice`, `rosmsg` y `rospack`.
#### rosnode: Se usa para interactuar con los nodos activos del sistema ROS. Comandos útiles:
- `rosnode list`: muestra todos los nodos actualmente ejecutándose.
- `rosnode info /nombre_del_nodo`: da información sobre las publicaciones, suscripciones y servicios de un nodo.
- `rosnode ping /nombre_del_nodo`: verifica si un nodo está activo.
- `rosnode kill /nombre_del_nodo`: finaliza un nodo específico.
#### rostopic: Permite inspeccionar y manipular tópicos, que son canales de comunicación entre nodos.
- `rostopic list`: muestra todos los tópicos activos.
- `rostopic echo /nombre_topico`: imprime en consola los datos que se publican en ese tópico.
- `rostopic info /nombre_topico`: da detalles sobre publicadores y suscriptores de ese tópico.
- `rostopic pub /nombre_topico tipo_mensaje 'datos'`: publica un mensaje manualmente (útil para pruebas).
#### rosparam: Gestiona parámetros en el Parameter Server de ROS.
- `rosparam list`: muestra todos los parámetros disponibles.
- `rosparam get /nombre_parametro`: consulta el valor de un parámetro.
- `rosparam set /nombre_parametro valor`: cambia o crea un nuevo parámetro.
- `rosparam delete /nombre_parametro`: elimina un parámetro.
#### rosservice: Permite descubrir e interactuar con servicios ROS (funciones que se ejecutan a demanda).
- `rosservice list`: muestra todos los servicios activos.
- `rosservice call /nombre_servicio [args]`: ejecuta un servicio con argumentos.
- `rosservice type /nombre_servicio`: muestra el tipo de mensaje que usa el servicio.
- `rosservice info /nombre_servicio`: detalla el nodo que lo proporciona y los tipos de mensaje.
#### rosmsg: Permite explorar los tipos de mensajes usados por ROS.
- `rosmsg list`: muestra todos los tipos de mensajes disponibles.
- `rosmsg show nombre_mensaje`: muestra la estructura del mensaje (por ejemplo, std_msgs/String).
#### rospack: Sirve para gestionar y buscar paquetes ROS instalados.
- `rospack list`: lista todos los paquetes disponibles.
- `rospack find nombre_paquete`: da la ruta del paquete en el sistema de archivos.
- `rospack depends nombre_paquete`: muestra las dependencias de un paquete.
### 3.7 Investigue acerca del robot TurtleBot2 y su relación con la base Kobuki.
El robot Turtlebot 2 es un kit de desarrollo robótico de bajo costo y código abierto diseñado para aplicaciones móviles, y cuenta con una base Kobuki para su movilidad, un dual-core netbook compatible con ROS, sensor Orbbec Astra Pro y un giroscopio. El TurtleBot no está disponible para ventas, el actual es el TurtleBot 4 lanzado en 2022.
### 3.8 ¿Para qué sirve los sensores cliff en el Kobuki?
Los sensores de acantilado (cliff sensors) en la base Kobuki son cruciales para la seguridad del robot. Estos sensores detectan cambios bruscos en la altura del suelo, como bordes de mesas o escaleras, y ayudan a prevenir caídas accidentales. Los sensores de acantilado emiten señales infrarrojas hacia el suelo. Cuando detectan una ausencia de reflejo, interpretan que hay un borde o un cambio en la altura.
### 3.9 ¿Como leer un evento de dicho sensor?
#### Debe utilizarse ROS, para tener comunicación con el robot.
#### En ROS debe configurarse el nodo de Kobuki, usando el siguiente comando:
```matlab
roslaunch kobuki_node minimal.launch
```
#### Con el nodo activado se debe suscribir al tema del sensor, que en este caso es `CliffEvent`, donde se debe recibir la información y preservar el nodo activo. Una forma de hacerlo en Python es con:
```python
import rospy
from kobuki_msgs.msg import CliffEvent

def cliff_callback(data):
    if data.state == CliffEvent.CLIFF:
        rospy.loginfo("Acantilado detectado en el sensor %d", data.sensor)
    else:
        rospy.loginfo("Sensor %d está en terreno seguro", data.sensor)

rospy.init_node('cliff_listener', anonymous=True)
rospy.Subscriber('/kobuki/cliff', CliffEvent, cliff_callback)
rospy.spin()
```

### 3.10 ¿Qué protocolo de comunicación usa el Lego Ev3 con sus sensores y actuadores?
1. El protocolo de comunicación usado es el UART (Universal Asynchronous Receiver/Transmitter), el cuál define un conjunto de normas para el intercambio de datos en serie, lo que lo hace esencial en diversas aplicaciones tecnológicas, no solo el LEGO EV3. 
2. Con sensores EV3 modernos se utiliza el protocolo I2C (Inter-Integrated Circuit).
3. Comunicación con dispositivos por Bluetooth
4. Comunicación con dispositivos por USB
### 3.11 ¿Qué opciones de conexión permiten integrar sensores no nativos al sistema LEGO EV3?
Es posible utilizar sensores no nativos conectándolos a los puertos de sensores del EV3. Sin embargo, para configurar adecuadamente los protocolos de comunicación y hacerlos funcionales, es recomendable utilizar el sistema operativo EV3Dev, que permite un mayor control sobre el hardware. Además, en algunos casos puede ser necesario el uso de adaptadores o interfaces especiales para conectar sensores de terceros, como los provenientes de plataformas como Arduino o Raspberry Pi.


## 4. Sensores
Para realizar la medición con el sensor Hokuyo y el RPLidar se utilizó la misma estructura optando por tomas en diferentes puntos para cada sensor, el cuarto hecho para la pueba se muestra a continuación con las dimensiones dadas en cm y tomando su eje cordenado en una esquina a partir de la cual se midieron todas las poses para ambos sensores.



![Precisión y Exactitud](https://github.com/user-attachments/assets/ca95fd3f-4b42-43b2-b0b6-622a5448b9ac)

<div align="center">
    
![Precisión y Exactitud](https://github.com/user-attachments/assets/09758b11-50d5-437f-98e0-3413be3969fd)

</div>
Hay que tener en cuenta que en el diagrama no se expresa el espesor de las paredes, ya que no es importatnte para medir el espacio interno, sin embargo, en el pasillo abierto hay que saber este valor, pues la pared sobresale hacia la parte interiror y el sensor la mide, por lo tanto teniendo en cuenta qu eel espesor de esta pared es de 2 cm notamos que al hacer la sumatoria de todos los valores en Y nos resulta exactamente igual al valor de la pared opuesta que es recta de 53 cm.

### 4.1 Sensor Hokuyo
Para el sensor Hokuyo se usaron 3 poses diferentes las cuales son medidas desde el origen y el angulo expresado en ° es medido desde el eje x positivo.

Pose 1: x = 14.8, y = 9.4, θ =  108°

Pose 2: x = 13.3, y = 28.8, θ = 292° 

Pose 3: x = 13.8, y = 22.8, θ =  15°
#### 4.1.1 Mapas de detección del sensor

Utilizando el código de matlab proporcionado en el repositorio para la toma de datos resultaron tres tablas de 3 filas y 682 columnas, en donde las filas corresponden a cada toma de datos de las cuales se hicieron 3 con un tiempo de 3 segundos para cada pose y las columnas indican el número de muestra, es decir existen 682 muestras tomadas a lo largo de 240° grados que logra capturar el sensor.
A partir de estos datos se realiza un código en matlab el cual se encarga de procesar los datos y plotearlos en un gráfico donde sea evidente la pose del sensor y los puntos que detectó para construir las paredes de la siguiente forma:
```matlab
% === Cargar datos ===
load('lidar1.mat');  % Carga LidarSet1, LidarSet2 ó LidarSet3 

% === Pose del sensor ===
x_cm      = (posición x en cm);
y_cm      = (posición y en cm)=;
theta_deg = (ángulo de la pose en grados);
theta_rad = deg2rad(theta_deg);

nBeams   = 682;
angles   = linspace(-120, 120, nBeams);  % en grados
angles   = deg2rad(angles);              % → radianes

% Pose del sensor en el mundo (en metros)
sensorPose = [x_cm / 100, y_cm / 100, theta_rad];

% === Inicializar nube de puntos combinada ===
puntos_globales = [];

% === Procesar los 3 primeros escaneos ===
for i = 1:3
    scan_mm = double(LidarSet3(i, :));
    scan_m = scan_mm / 1000;

    scan = lidarScan(scan_m, angles);
    scanWorld = transformScan(scan, sensorPose);

    % Acumular los puntos transformados
    puntos_globales = [puntos_globales; scanWorld.Cartesian];
end

% === Graficar solo paredes + ubicación del sensor ===
figure;
plot(puntos_globales(:,1), puntos_globales(:,2), 'b.', 'MarkerSize', 6);  % paredes en azul
hold on;
plot(sensorPose(1), sensorPose(2), 'ro', 'MarkerSize', 10, 'LineWidth', 2); % sensor en rojo

% === Dibujar la dirección del sensor como flecha ===
longitud_flecha = 0.05;  % longitud más corta de la flecha en metros
dx = longitud_flecha * cos(sensorPose(3));
dy = longitud_flecha * sin(sensorPose(3));
quiver(sensorPose(1), sensorPose(2), dx, dy, 0, 'r', 'LineWidth', 2, 'MaxHeadSize', 2);

% Mejoras visuales
title('Mapa de paredes detectadas por el Hokuyo pose (1, 2 o 3)');
legend('Paredes detectadas', 'Ubicación del sensor', 'Dirección del sensor');

axis equal;
grid on;
xlim([0 0.6]);
ylim([0 0.6]);

xticks(0:0.05:0.6);
yticks(0:0.05:0.6);
xlabel('X (m)');
ylabel('Y (m)');
```
Utilizando este código y cambiando la base de datos correspondiente a cada prueba y la pose podemos obtener los siguientes gráficos que representan los resultados de cada prueba:

##### 4.1.1.1 Mapa de detección del sensor Hokuyo para la pose 1
<div align="center">
    
![image](https://github.com/user-attachments/assets/c7de72e1-8646-4b3a-8d74-2586090bda78)
</div>
##### 4.1.1.2 Mapa de detección del sensor Hokuyo para la pose 2
<div align="center">
    
![image](https://github.com/user-attachments/assets/2fe0b660-f058-4c9c-9ac7-66b62b455adb)
</div>
##### 4.1.1.3 Mapa de detección del sensor Hokuyo para la pose 3
<div align="center">
    
![image](https://github.com/user-attachments/assets/01090f24-ec1c-4aa7-9cca-ee474d0aad50)
</div>
#### 4.1.2 Mapas de ocupación del sensor

Utilizando los mismos datos obtenidos por el sensor y utilizando matlab para generar un nuevo código obtenemos el siguiente código cambiando la base de datos para cada prueba:

```matlab
%% Script completo: Mapa de ocupación — lidar1 con ejes más finos

% Parámetros del entorno y mapa
mapWidth   = 0.8;     % 80 cm → 0.8 m
mapHeight  = 0.7;     % 70 cm → 0.7 m
resolution = 500;    % celdas/m → 1 mm por celda

% Crear occupancyMap vacío
map1 = occupancyMap(mapWidth, mapHeight, resolution);

% Posición y orientación del sensor (prueba 1)
x_cm      = (posición x en cm);
y_cm      = (posición y en cm)=;
theta_deg = (ángulo de la pose en grados);

% Convertir a metros y radianes (no modificamos la pose para desplazar)
sensorPose = [x_cm+10, y_cm+10] / 100;      % → [0.144, 0.094] m
sensorPose(3) = deg2rad(theta_deg);   % 108° → radianes

% Parámetros del Hokuyo
nBeams   = 682;                                % número de muestras
angles   = linspace(-120, 120, nBeams);        % en grados
angles   = deg2rad(angles);                    % a radianes
maxRange = 30;                                  % rango amplio (m)

% Carga datos y conversión de unidades (mm → m)
S      = load('lidar1.mat');                   % Carga Lidar1, Lidar2 ó Lidar3 
fn     = fieldnames(S);
raw    = S.(fn{1});                            % 3×682 en mm
ranges = double(raw) / 1000;                   % → metros

% Insertar todos los escaneos en el mapa
for scanIdx = 1:size(ranges,1)
    scan = lidarScan(ranges(scanIdx,:), angles);
    insertRay(map1, sensorPose, scan, maxRange);
end

% Mostrar resultado
figure('Color','w');
show(map1);
axis equal

% Definir límites desplazados +0.0 m (ponemos xlim/ylim a [0,map] y luego compensamos en labels)
xlim([0, mapWidth]);
ylim([0, mapHeight]);

% Crear ticks cada 0.05 m en esos límites
xL = xlim;
yL = ylim;
xTicks = xL(1):0.05:xL(2);
yTicks = yL(1):0.05:yL(2);
set(gca, 'XTick', xTicks, 'YTick', yTicks);

% Ajustar etiquetas restando 0.1 a la posición de cada tick
xLabels = arrayfun(@(v) sprintf('%.2f', v-0.10), xTicks, 'UniformOutput', false);
yLabels = arrayfun(@(v) sprintf('%.2f', v-0.10), yTicks, 'UniformOutput', false);
set(gca, 'XTickLabel', xLabels, 'YTickLabel', yLabels);

xlabel('X [m]')
ylabel('Y [m]')
title('Mapa de ocupación Hokuyo pose 1, 2 0 3')
grid on
box on
```
Utilizando este código y cambiando la base de datos correspondiente a cada prueba y la pose podemos obtener los siguientes gráficos que representan los resultados de cada prueba:

##### 4.1.2.1 Mapa de ocupación del sensor Hokuyo para la pose 1
<div align="center">
    
![image](https://github.com/user-attachments/assets/122029f1-3a85-4eb6-b36f-c1794ee29881)
</div>
También podemos observar lo que registra el sensor en el software:
<div align="center">
    
![image](https://github.com/user-attachments/assets/3c8a95f9-088b-46b7-a662-2b4a8464086f)

</div>
##### 4.1.2.2 Mapa de ocupación del sensor Hokuyo para la pose 2
<div align="center">
    
![image](https://github.com/user-attachments/assets/bbc8fda1-5094-4ab5-acd6-047933c9b16d)
</div>
También podemos observar lo que registra el sensor en el software:
<div align="center">
    
![image](https://github.com/user-attachments/assets/78112350-a9d2-4aa0-9281-202debfcf3c7)
</div>
##### 4.1.2.3 Mapa de ocupación del sensor Hokuyo para la pose 3
<div align="center">
    
![image](https://github.com/user-attachments/assets/ee4f60ab-c4e4-43c0-b069-b9050427045a)
</div>
También podemos observar lo que registra el sensor en el software:
<div align="center">
    
![image](https://github.com/user-attachments/assets/75546c50-9f6b-412c-b98a-5a600fec8707)
</div>
#### 4.1.3 Mapa de ocupación total del sensor

Mediante un código en Matlab que combine todos los datos y tome las 3 poses al mismo tiempo podemos obtener el siguiente mapa de ocupación para las 3 pruiebas:

```matlab
%% Script: Mapa de ocupación con múltiples escaneos y poses

% Parámetros del mapa
mapWidth   = 0.8;     % 0.8 m (80 cm)
mapHeight  = 0.7;     % 0.7 m (70 cm)
resolution = 500;    % 1000 celdas/m = 1 mm por celda
map = occupancyMap(mapWidth, mapHeight, resolution);

% Parámetros del sensor Hokuyo
nBeams   = 682;
angles   = linspace(-120, 120, nBeams);  % grados
angles   = deg2rad(angles);              % radianes
maxRange = 30;                           % rango amplio

% Datos de las poses (en cm y grados)
poses_cm = [...
    14.4, 9.4, 108;  % lidar1
    13.3, 28.8, 292;  % lidar2
    13.8, 22.8, 15   % lidar3
];

% Archivos de datos
archivos = {'lidar1.mat', 'lidar2.mat', 'lidar3.mat'};

% Bucle para cargar, convertir e insertar los escaneos
for i = 1:3
    % Cargar archivo
    S = load(archivos{i});
    fn = fieldnames(S);
    raw = S.(fn{1});        % 3x682, en mm
    ranges = double(raw) / 1000;  % Convertir a metros
    
    % Pose actual del sensor
    x_m = (poses_cm(i,1) + 10) / 100;  % sumar 0.1 m
    y_m = (poses_cm(i,2) + 10) / 100;
    theta_rad = deg2rad(poses_cm(i,3));
    sensorPose = [x_m, y_m, theta_rad];
    
    % Insertar cada escaneo
    for scanIdx = 1:size(ranges,1)
        scan = lidarScan(ranges(scanIdx,:), angles);
        insertRay(map, sensorPose, scan, maxRange);
    end
end

%% Mostrar resultado
figure('Color','w');
show(map);
axis equal
xlim([0, mapWidth])
ylim([0, mapHeight])

% Ticks cada 0.05 m y etiquetas desplazadas -0.1
xTicks = 0:0.05:mapWidth;
yTicks = 0:0.05:mapHeight;
set(gca, 'XTick', xTicks, 'YTick', yTicks)
xLabels = arrayfun(@(v) sprintf('%.2f', v - 0.1), xTicks, 'UniformOutput', false);
yLabels = arrayfun(@(v) sprintf('%.2f', v - 0.1), yTicks, 'UniformOutput', false);
set(gca, 'XTickLabel', xLabels, 'YTickLabel', yLabels)

xlabel('X [m]')
ylabel('Y [m]')
title('Mapa de ocupación combinado — 3 poses del sensor Hokuyo')
grid on
box on
```
<div align="center">
    
![image](https://github.com/user-attachments/assets/9bbe0fde-01cf-46ca-a6e7-3f4e22e82a9a)

</div>
De la misma forma podemos utilizar el siguiente código para evidenciar las poses de cada prueba:

```matlab
%% Script: Mapa de ocupación con múltiples escaneos y poses

% Parámetros del mapa
mapWidth   = 0.8;     % 0.8 m (80 cm)
mapHeight  = 0.7;     % 0.7 m (70 cm)
resolution = 500;     % 500 celdas/m = 2 mm por celda
map = occupancyMap(mapWidth, mapHeight, resolution);

% Parámetros del sensor Hokuyo
nBeams   = 682;
angles   = linspace(-120, 120, nBeams);  % grados
angles   = deg2rad(angles);              % radianes
maxRange = 30;                           % rango amplio

% Datos de las poses (en cm y grados)
poses_cm = [
    14.4, 9.4, 108;   % lidar1
    13.3, 28.8, 292;  % lidar2
    13.8, 22.8, 15    % lidar3
];

% Archivos de datos
archivos = {'lidar1.mat', 'lidar2.mat', 'lidar3.mat'};

% Convertir poses a metros y radianes (+0.1 m en x/y como desplazamiento de ejes)
poses_m = [(poses_cm(:,1:2) + 10) / 100, deg2rad(poses_cm(:,3))];

% Insertar escaneos
for i = 1:3
    % Cargar archivo
    S = load(archivos{i});
    fn = fieldnames(S);
    raw = S.(fn{1});                 % 3x682 en mm
    ranges = double(raw) / 1000;     % Convertir a metros

    % Pose del sensor
    sensorPose = poses_m(i,:);

    % Insertar escaneos
    for scanIdx = 1:size(ranges,1)
        scan = lidarScan(ranges(scanIdx,:), angles);
        insertRay(map, sensorPose, scan, maxRange);
    end
end

%% Mostrar resultado
figure('Color','w');
show(map);
axis equal
xlim([0, mapWidth])
ylim([0, mapHeight])

% Ticks cada 0.05 m y etiquetas desplazadas -0.1
xTicks = 0:0.05:mapWidth;
yTicks = 0:0.05:mapHeight;
set(gca, 'XTick', xTicks, 'YTick', yTicks)
xLabels = arrayfun(@(v) sprintf('%.2f', v - 0.1), xTicks, 'UniformOutput', false);
yLabels = arrayfun(@(v) sprintf('%.2f', v - 0.1), yTicks, 'UniformOutput', false);
set(gca, 'XTickLabel', xLabels, 'YTickLabel', yLabels)

xlabel('X [m]')
ylabel('Y [m]')
title('Mapa de ocupación combinado — 3 poses del sensor Hokuyo')
grid on
box on

% Dibujar poses del sensor en el mapa
hold on
scatter(poses_m(:,1), poses_m(:,2), 100, 'ro', 'filled') % puntos rojos
quiver(poses_m(:,1), poses_m(:,2), ...
       0.05*cos(poses_m(:,3)), 0.05*sin(poses_m(:,3)), ...
       0, 'r', 'LineWidth', 1.5)  % flechas de orientación

% Etiquetas con desplazamientos personalizados
poseLabels = {'Pose 1', 'Pose 2', 'Pose 3'};
textOffsets = [0.015, 0.015;
               0.015, 0.02;
              -0.07, -0.035];

for i = 1:3
    text(poses_m(i,1) + textOffsets(i,1), ...
         poses_m(i,2) + textOffsets(i,2), ...
         poseLabels{i}, ...
         'Color', 'r', ...
         'FontSize', 9, ...
         'FontWeight', 'bold', ...
         'BackgroundColor', 'w', ...
         'Margin', 1);
end
hold off
```
<div align="center">
    
![image](https://github.com/user-attachments/assets/674574fa-5fa5-436a-9fb5-410e642675a8)
</div>
#### 4.1.4 Error en la medición del sensor

Para tomar el error total en la medición del sensor notamos el sector donde mayor diferencia se encuentre frente a las mediciones realizadas en el laboratorio, de esta manera encontramos que la parte donde la diferencia es mayor es en esta:
<div align="center">
    
![image](https://github.com/user-attachments/assets/ff48aa7d-0984-4e10-bbc8-66209b05dc16)
</div>
tomando los datos los puntos más alejados de esta zona los cuales corresponden a x = 0.36 donde y1 = 0.335649, y2 = 0.549108, así podemos conocer esta distancia haciendo la diferencia:

d =  0.549108 - 0.335649 = 0.2134459 m = 21.34459 cm

Conociendo que la distancia en esa zona es de 16.5 cm podemos encontrar el error de la siguiente manera:

$Err = \frac{21.3459 - 16.5}{16.5}*100 \approx 29.4$%

Podemos evidenciar que se trata de un error grande, sin embargo estamos suponiendo que la pared no tiene espesor, es decir los datos tomados por el sensor de un lado de la pared se tomaron como los puntos máximos sin considerar su espesor, de esta manera es correcto afirmar que este error no es cierto y debemos considerar este espesor, de esta manera obtenemos unos nuevos puntos considertando los puntos del otro lado de la pared, x = 0.49 donde y1 = 0.361585, y2 = 0.536402, así podemos conocer esta distancia haciendo la diferencia:

d =  0.536402 - 0.361585 = 0.174817 m = 17.4817 cm
$Err = \frac{17.4817 - 16.5}{16.5}*100 \approx 5.95$%

Podemos evidenciar que al considerar esta pared el error disminuye bastante, y por lo tanto este error ya es mas aceptable aunque se tengan algunas diferencias, seguramente estas se deban a limitaciones internas como la resolución angular y la precisión del láser, así como a condiciones del entorno, como superficies colocadas de manera incorrecta o la presencia de irregularidades en las paredes. También influyen factores mecánicos como vibraciones o una mala instalación, y errores en el procesamiento, como una transformación incorrecta de coordenadas o una pose mal estimada.

### 4.2 Sensor RPLidar

Para el sensor RPlidar se usaron 3 poses diferentes las cuales son medidas desde el origen y el angulo expresado en ° es medido desde el eje x positivo.

Pose 1: x = 15.9, y = 23.6, θ =  45°
<div align="center">
    
![image](https://github.com/user-attachments/assets/1fb30a37-fd6e-4d72-bb98-83ef239ca0c6)

</div>
Pose 2: x = 13.8, y = 31.9, θ = 223° 
<div align="center">
    
![image](https://github.com/user-attachments/assets/18d2c598-5423-4a17-8c23-a7ec6d4d8f44)

</div>
Pose 3: x = 23.4, y = 36.6, θ =  104°
<div align="center">
    
![image](https://github.com/user-attachments/assets/95328eb5-3613-499d-bf4c-de3bef43aac7)

</div>
#### 4.2.1 Mapas de detección del sensor

Utilizando el código de matlab proporcionado en el repositorio para la toma de datos resultaron tres tablas de 2 columnas, en donde las filas corresponden a cada toma de datos de las cuales se hicieron aproximadamente 3 con un tiempo de 3 segundos para cada pose y las columnas indican el ámgulo en radianes y la distancia medida en m, estas muestras son tomadas a lo largo de 360° grados que logra capturar el sensor.
A partir de estos datos se realiza un código en matlab el cual se encarga de procesar los datos y plotearlos en un gráfico donde sea evidente la pose del sensor y los puntos que detectó para construir las paredes de la siguiente forma:
```matlab
% Script completo para cargar datos RPLidar desde CSV y graficar correctamente 

% 1. Cargar datos desde CSV 
% Si el CSV tiene una línea de encabezado, descomenta la opción 'NumHeaderLines'
% data = readmatrix('RPLidar1.csv', 'NumHeaderLines', 1); %Cargar datos RPLidar1, RPLidar2, RPLidar3
data = readmatrix('RPLidar1.csv');    % Cada fila: [ángulo (rad), distancia (mm)]

% 2. Parámetros del sensor 
x_cm      = colocar valor;     % posición X del sensor en cm
y_cm      = colocar valor;      % posición Y del sensor en cm
theta_deg = colocar valor;      % orientación del sensor en grados
theta_rad = deg2rad(theta_deg);

sensorPose = [x_cm/100, y_cm/100, theta_rad];  % [X, Y, θ] en metros y radianes

% 3. Extraer ángulos y distancias 
angles   = data(:,1);                % ya en radianes, medidos en sentido horario
ranges_m = double(data(:,2)) / 1000; % convertir mm → m

% 4. Coordenadas locales corrigiendo sentido de barrido ya que el sensor toma datos en sentido antihorario
% Invertimos el signo si el LIDAR mide en sentido horario
x_local = ranges_m .* cos(-angles);
y_local = ranges_m .* sin(-angles);

% 5. Transformación del sistema local al global 
R = [ cos(theta_rad), -sin(theta_rad);
      sin(theta_rad),  cos(theta_rad) ];   % matriz de rotación 2×2

pts_local  = [x_local'; y_local'];         % 2×N
pts_global = R * pts_local;                % 2×N
puntos_globales = pts_global' + sensorPose(1:2);  % N×2, sumo traslación

% 6. Graficar puntos + sensor + dirección
figure;
plot(puntos_globales(:,1), puntos_globales(:,2), 'b.', 'MarkerSize', 6);
hold on;

% Sensor en rojo
plot(sensorPose(1), sensorPose(2), 'ro', 'MarkerSize', 10, 'LineWidth', 2);

% Flecha de dirección
flecha_len = 0.05;  % longitud de la flecha en metros
dx = flecha_len * cos(theta_rad);
dy = flecha_len * sin(theta_rad);
quiver(sensorPose(1), sensorPose(2), dx, dy, 0, 'r', ...
       'LineWidth', 2, 'MaxHeadSize', 2);

% Mejoras visuales
title('Mapa de paredes detectadas por el RPLidar pose 1');
legend('Puntos detectados', 'Sensor', 'Dirección del sensor', ...
       'Location', 'best');
axis equal;
grid on;

% Dejar límites y ejes automáticos
xlabel('X (m)');
ylabel('Y (m)');

```
Utilizando este código y cambiando la base de datos correspondiente a cada prueba y la pose podemos obtener los siguientes gráficos que representan los resultados de cada prueba:

##### 4.2.1.1 Mapa de detección del sensor RPLidar para la pose 1
<div align="center">
    
![image](https://github.com/user-attachments/assets/57ebf3b7-ab3c-4f95-8439-1ad95d44381c)
</div>
##### 4.2.1.2 Mapa de detección del sensor RPLidar para la pose 2
<div align="center">
    
![image](https://github.com/user-attachments/assets/170718fc-2143-428d-89f7-a13354894e17)
</div>
##### 4.2.1.3 Mapa de detección del sensor RPLidar para la pose 3
<div align="center">
    
![image](https://github.com/user-attachments/assets/94f10ef3-de11-491a-a0fd-d589cde4eb12)
</div>
#### 4.2.2 Mapas de ocupación del sensor

Utilizando los mismos datos obtenidos por el sensor y utilizando matlab para generar un nuevo código obtenemos el siguiente código cambiando la base de datos para cada prueba:

```matlab
%% Script: Mapa de ocupación con RPLidar

% Parámetros del entorno y mapa
mapWidth   = 0.65;     % 80 cm → 0.8 m
mapHeight  = 0.65;     % 70 cm → 0.7 m
resolution = 350;     % 1 mm por celda

% Crear occupancyMap vacío
map1 = occupancyMap(mapWidth, mapHeight, resolution);

% Posición y orientación del sensor
x_cm      = colocar valor;     % posición X del sensor en cm
y_cm      = colocar valor;     % posición Y del sensor en cm
theta_deg = colocar valor;       % orientación del sensor en grados

% Convertir a metros y radianes
sensorPose = [x_cm + 10, y_cm + 10] / 100;  % desplazamiento artificial
sensorPose(3) = deg2rad(theta_deg);

% Cargar datos del RPLidar (formato: [ángulo_rad, distancia_mm])
T = readtable('RPLidar1.csv');  % Cargar datos RPLidar1, RPLidar2, RPLidar3
angles_rad = str2double(string(T{:,1}));
distances_mm = str2double(string(T{:,2}));

% Filtrar datos válidos
valid = distances_mm > 0 & ~isnan(distances_mm) & ~isnan(angles_rad);
angles_rad = angles_rad(valid);
distances_m = distances_mm(valid) / 1000;  % mm → m

% Invertir ángulos: de antihorario a horario
angles_rad = -angles_rad;

% Crear el objeto lidarScan
scan = lidarScan(distances_m, angles_rad);

% Rango máximo estimado
maxRange = 6.0;  % metros

% Insertar escaneo en el mapa
insertRay(map1, sensorPose, scan, maxRange);

% Mostrar el mapa
figure('Color','w');
show(map1);
axis equal

% Ajustar límites
xlim([0, mapWidth]);
ylim([0, mapHeight]);

% Ticks cada 0.05 m
xTicks = 0:0.05:mapWidth;
yTicks = 0:0.05:mapHeight;
set(gca, 'XTick', xTicks, 'YTick', yTicks);

% Etiquetas corregidas
xLabels = arrayfun(@(v) sprintf('%.2f', v - 0.10), xTicks, 'UniformOutput', false);
yLabels = arrayfun(@(v) sprintf('%.2f', v - 0.10), yTicks, 'UniformOutput', false);
set(gca, 'XTickLabel', xLabels, 'YTickLabel', yLabels);

xlabel('X [m]')
ylabel('Y [m]')
title('Mapa de ocupación - RPLidar (360° corregido)')
grid on
box on
```
Utilizando este código y cambiando la base de datos correspondiente a cada prueba y la pose podemos obtener los siguientes gráficos que representan los resultados de cada prueba:

##### 4.2.2.1 Mapa de ocupación del sensor RPLidar para la pose 1
<div align="center">
    
![image](https://github.com/user-attachments/assets/a8ad6c5c-b287-477d-a2a4-071b16a5c8f5)
</div>
También podemos observar lo que registra el sensor en el software:
<div align="center">
    
![Gráfica 1](https://github.com/user-attachments/assets/90488501-645c-411e-ad43-33401c4c37d8)
</div>
##### 4.2.2.2 Mapa de ocupación del sensor RPLidar para la pose 2
<div align="center">
    
![image](https://github.com/user-attachments/assets/af2eb519-cc03-44be-8e19-204ab199f30b)
</div>
También podemos observar lo que registra el sensor en el software:
<div align="center">
    
![Gráfica 2](https://github.com/user-attachments/assets/8170ef50-d405-46fd-abb0-adec45129c76)
</div>
##### 4.2.2.3 Mapa de ocupación del sensor RPLidar para la pose 3
<div align="center">
    
![image](https://github.com/user-attachments/assets/d373e719-4dfd-4b4c-93b0-d499cc9e065c)
</div>
También podemos observar lo que registra el sensor en el software:
<div align="center">
    
![Gráfica 3](https://github.com/user-attachments/assets/8f9431fd-144b-436f-8330-6c6ddf0e2e1b)
</div>
#### 4.2.3 Mapa de ocupación total del sensor

Mediante un código en Matlab que combine todos los datos y tome las 3 poses al mismo tiempo podemos obtener el siguiente mapa de ocupación para las 3 pruiebas:

```matlab
%% Script Mapa de ocupación combinado RPLidar

% Parámetros del entorno y mapa
mapWidth   = 0.7;      % metros
mapHeight  = 0.7;      % metros
resolution = 350;      % celdas por metro (≈1 mm por celda)

% Crear un occupancyMap vacío
map1 = occupancyMap(mapWidth, mapHeight, resolution);

% Definición de los escaneos y poses del sensor
scans = {
    struct('file','RPLidar1.csv', 'x_cm',15.9, 'y_cm',23.6, 'theta_deg',45,  'offset90', false),...
    struct('file','RPLidar2.csv', 'x_cm',13.8, 'y_cm',31.9, 'theta_deg',210,'offset90', true),...
    struct('file','RPLidar3.csv', 'x_cm',23.4, 'y_cm',36.6, 'theta_deg',204,'offset90', true)  ...
};

maxRange = 6.0;  % rango máximo para insertRay (m)

% Procesar cada escaneo e insertar en el mapa
for i = 1:numel(scans)
    s = scans{i};
    % Construir la pose del sensor [X(m), Y(m), θ(rad)]
    sensor_x = (s.x_cm + 10) / 100;  % desplazamiento artificial de +10 cm
    sensor_y = (s.y_cm + 10) / 100;
    if s.offset90
        theta_rad = deg2rad(s.theta_deg - 90);
    else
        theta_rad = deg2rad(s.theta_deg);
    end
    sensorPose = [sensor_x, sensor_y, theta_rad];

    % Leer datos del CSV (ángulo en rad, distancia en mm)
    T = readtable(s.file, 'ReadVariableNames', false);
    angles_rad    = T.Var1;
    distances_mm  = T.Var2;

    % Filtrar datos válidos
    valid = distances_mm > 0 & ~isnan(distances_mm) & ~isnan(angles_rad);
    angles_rad   = angles_rad(valid);
    distances_m  = distances_mm(valid) / 1000;

    % Invertir ángulos para sentido horario
    angles_rad = -angles_rad;

    % Crear el objeto lidarScan e insertar en el mapa
    scanObj = lidarScan(distances_m, angles_rad);
    insertRay(map1, sensorPose, scanObj, maxRange);
end

% Mostrar mapa combinado
figure('Color','w');
show(map1);
axis equal;

% Ajuste de ejes y ticks
xlim([0, mapWidth]);
ylim([0, mapHeight]);
xt = 0:0.05:mapWidth;
yt = 0:0.05:mapHeight;
set(gca, 'XTick', xt, 'YTick', yt);
% Etiquetas compensadas por el offset de 0.10 m
xlab = arrayfun(@(v) sprintf('%.2f', v - 0.10), xt, 'UniformOutput', false);
ylab = arrayfun(@(v) sprintf('%.2f', v - 0.10), yt, 'UniformOutput', false);
set(gca, 'XTickLabel', xlab, 'YTickLabel', ylab);

xlabel('X [m]');
ylabel('Y [m]');
title('Mapa de ocupación combinado - 3 escaneos RPLidar');
grid on; box on;

```
<div align="center">
    
![image](https://github.com/user-attachments/assets/fa9bd2c6-e161-4bbc-a12d-ea13fe1e7ec4)

</div>
De la misma forma podemos utilizar el siguiente código para evidenciar las poses de cada prueba:

```matlab
%% Script unificado: Mapa de ocupación combinado con 3 escaneos RPLidar y poses del sensor numeradas

% Parámetros del entorno y mapa
mapWidth   = 0.7;      % metros
mapHeight  = 0.7;      % metros
resolution = 350;      % celdas por metro (≈1 mm por celda)

% Crear un occupancyMap vacío
map1 = occupancyMap(mapWidth, mapHeight, resolution);

% Definición de los escaneos y poses del sensor
scans = {
    struct('file','RPLidar1.csv', 'x_cm',15.9, 'y_cm',23.6, 'theta_deg',45,  'offset90', false),...
    struct('file','RPLidar2.csv', 'x_cm',13.8, 'y_cm',31.9, 'theta_deg',210,'offset90', true),...
    struct('file','RPLidar3.csv', 'x_cm',23.4, 'y_cm',36.6, 'theta_deg',204,'offset90', true)  ...
};

maxRange = 6.0;  % rango máximo para insertRay (m)

% Procesar cada escaneo e insertar en el mapa
for i = 1:numel(scans)
    s = scans{i};
    % Construir la pose del sensor [X(m), Y(m), θ(rad)]
    sensor_x = (s.x_cm + 10) / 100;  % desplazamiento artificial de +10 cm
    sensor_y = (s.y_cm + 10) / 100;
    if s.offset90
        theta_rad = deg2rad(s.theta_deg - 90);
    else
        theta_rad = deg2rad(s.theta_deg);
    end
    sensorPose = [sensor_x, sensor_y, theta_rad];

    % Leer datos del CSV (ángulo en rad, distancia en mm)
    T = readtable(s.file, 'ReadVariableNames', false);
    angles_rad    = T.Var1;
    distances_mm  = T.Var2;

    % Filtrar datos válidos
    valid = distances_mm > 0 & ~isnan(distances_mm) & ~isnan(angles_rad);
    angles_rad   = angles_rad(valid);
    distances_m  = distances_mm(valid) / 1000;

    % Invertir ángulos para sentido horario
    angles_rad = -angles_rad;

    % Crear el objeto lidarScan e insertar en el mapa
    scanObj = lidarScan(distances_m, angles_rad);
    insertRay(map1, sensorPose, scanObj, maxRange);
end

% Mostrar mapa combinado
titleStr = 'Mapa de ocupación combinado RPLidar con poses';
figure('Color','w');
show(map1);
axis equal;
hold on;

% Mostrar las poses del sensor (punto rojo, flecha y título)
flecha_len = 0.05;  % longitud de la flecha en metros
for i = 1:numel(scans)
    s = scans{i};
    sensor_x = (s.x_cm + 10) / 100;
    sensor_y = (s.y_cm + 10) / 100;
    if s.offset90
        theta_rad = deg2rad(s.theta_deg - 90);
    else
        theta_rad = deg2rad(s.theta_deg);
    end
    % Punto del sensor
    plot(sensor_x, sensor_y, 'ro', 'MarkerSize',8, 'LineWidth',2);
    % Flecha de orientación
    dx = flecha_len * cos(theta_rad);
    dy = flecha_len * sin(theta_rad);
    quiver(sensor_x, sensor_y, dx, dy, 0, 'r', 'LineWidth',2, 'MaxHeadSize',2);
    % Añadir texto con el número de pose
    text(sensor_x + 0.02, sensor_y - 0.02, sprintf('Pose %d', i), ...
         'Color', 'k', 'FontSize', 10, 'FontWeight', 'bold');
end

% Ajuste de ejes y ticks
xlim([0, mapWidth]);
ylim([0, mapHeight]);
xt = 0:0.05:mapWidth;
yt = 0:0.05:mapHeight;
set(gca, 'XTick', xt, 'YTick', yt);
% Etiquetas compensadas por el offset de 0.10 m
xlab = arrayfun(@(v) sprintf('%.2f', v - 0.10), xt, 'UniformOutput', false);
ylab = arrayfun(@(v) sprintf('%.2f', v - 0.10), yt, 'UniformOutput', false);
set(gca, 'XTickLabel', xlab, 'YTickLabel', ylab);

xlabel('X [m]');
ylabel('Y [m]');
title(titleStr);
grid on;
box on;
```
<div align="center">
    
![image](https://github.com/user-attachments/assets/e2130a3d-5a39-43d3-ab1a-4d83503314ce)
</div>
#### 4.2.4 Error en la medición del sensor

Para tomar el error total en la medición del sensor notamos el sector donde mayor diferencia se encuentre frente a las mediciones realizadas en el laboratorio, sin embargo se nota una medición muy uniforme y exacta respecto a las medidas realizadas en el laboratorio, pero se evidencia una falta de toma de datos que en el laboratorio no se percibió pero al analizar los datos se evidencia y es una falta de datos al otro lado de la pared, si bien el sensor logró capturar el espesor no logro capturar la longitud de la pared de ese costado, y aunque esta no es una medida crítica la tomaremos para calcular el error en ese punto, pues es donde mayor error se ve, claro tomando tambien el espesor para no inducir un error extra como sucedio con el sensor Hokuyo. 
<div align="center">
    
![image](https://github.com/user-attachments/assets/c44cb56d-0818-4d2d-bcda-0c64350af271)
</div>
tomando los datos los puntos más alejados de esta zona los cuales corresponden a x = 0.36 donde y1 = 0.362995, y2 = 0.528526, así podemos conocer esta distancia haciendo la diferencia:

d =  0.528526 - 0.362995 = 0.165531 m = 16.5531 cm

Conociendo que la distancia en esa zona es de 16.5 cm podemos encontrar el error de la siguiente manera:

$Err = \frac{16.5531 - 16.5}{16.5}*100 \approx 0.31$%

Este error es muy bajo, dando en evidencia la calidad que tienen los datos y al buen funcionamiento del sensor en este caso para medir las paredes de esta distribuvión de paredes, comparandolo con el Hokuyo se nota que sus mediciones son mas correctas y reflejan de mejor forma la realidad.
### 4.3 Sensor Ultrasónico
Se realizaron pruebas utilizando un Arduino UNO y un sensor HC-SR04. Utilizando las medidas de 100 cm, 110 cm, 120 cm y 140 cm, que fue la distancia máxima que permitía la mesa donde se estaba realizando la prueba.

Los resultados de las mediciones, como Distancia vs Muestra son:
* Prueba a 100 cm:
<div align="center">
    
![100 1](https://github.com/user-attachments/assets/4a12a0e1-3033-4b55-8e3d-72b4e167945d)
</div>

* Prueba a 110 cm:
<div align="center">
    
  ![1102 1](https://github.com/user-attachments/assets/6a34b0c3-9b2c-47b8-8ce8-668e500ce5ce)
</div>

* Prueba a 120 cm:
<div align="center">
    
![120 1](https://github.com/user-attachments/assets/5bdf3f68-2ac9-42d7-9f8c-fc22f1d001f1)
</div>

* Prueba a 140 cm:
<div align="center">
    
![140 1](https://github.com/user-attachments/assets/1b2e0177-86d8-4504-84e9-13d82209368f)
</div>
Estas gráficas se obtuvieron a partir de la toma de medidas con el software MatLab. Posteriormente con los datos obtenidos se calcularon las variables estadísticas de distancia media (promedio), desviación estándar, error absoluto y error relativo con respecto a la media y se presenta también el histograma de la distribución de los datos.

#### 4.3.1 Prueba a 100 cm: Realizado con la cinta métrica, se tomó un valor de 100 centímetros, un metro, y se registraron los resultados. Con estos se tiene que:

* Distancia media: 97.98 cm
* Desviación estándar: 0.576 cm
* Error absoluto: -2.02 cm
* Error relativo: -2.02%

El histograma de resultados es:

<div align="center">
    
![Histograma a 100 cm 1](https://github.com/user-attachments/assets/a73a45a7-b9e5-44ab-87bf-87a96175d9e2)
</div>

#### 4.3.2 Prueba a 110 cm: Realizado con la cinta métrica, se tomó un valor de 110 centímetros, un metro con diez centímetros, y se registraron los resultados. Con estos se tiene que:

* Distancia media: 110.52 cm
* Desviación estándar: 0.899 cm
* Error absoluto: 0.52 cm
* Error relativo: 0.47%

El histograma de resultados es:

<div align="center">
    
![Histograma a 110 cm 1](https://github.com/user-attachments/assets/68cf7e33-1282-41c2-9e2d-815d95db97ce)
</div>

#### 4.3.3 Prueba a 120 cm: Realizado con la cinta métrica, se tomó un valor de 120 centímetros, un metro con 20 centímetros, y se registraron los resultados. Con estos se tiene que:

* Distancia media: 118.17 cm
* Desviación estándar: 0.851 cm
* Error absoluto: -1.84 cm
* Error relativo: -1.53%

El histograma de resultados es:

<div align="center">
    
![Histograma a 120 cm 1](https://github.com/user-attachments/assets/5d6d2cba-c84a-4179-8a16-1430a9ec6b8d)
</div>

#### 4.3.4 Prueba a 140 cm: Realizado con la cinta métrica, se tomó un valor de 140 centímetros, un metro con cuarenta centímetros, y se registraron los resultados. Con estos se tiene que:

* Distancia media: 136.94 cm
* Desviación Estándar: 0.778 cm
* Error absoluto: -3.06 cm
* Error relativo: -2.19%

El histograma de resultados es:

<div align="center">
    
![Histograma a 140 cm 1](https://github.com/user-attachments/assets/c0f9bcec-8f85-44d0-9675-dcf31d4b9d74)
</div>

#### 4.3.5 Análisis de los resultados
Se observa que el error relativo de las pruebas realizadas no supera el 2.2%, pero puede deberse a que no se utilizó una distancia mayor para realizar las medidas. En la guía se explica que debía hacerse hasta 2.5 metros, por lo que se espera el error en esa condición máxima aumentara ligeramente. En promedio se tuvo un error absoluto de 1.86% y un error de exactitud de 1.20%

Es notable que la mayor parte del error en los sensores resulta ser aleatorio, pues no hay un patrón observable que sugiera una inclinación del sensor por entregar resultados menores o mayores al resultado real, siendo impredecible y sin ningún factor, apreciable, que sea repetitivo.

### 4.4 Sensor EV3

#### 4.4.1 Caso a 30%

Se platea un código que permita realizar el desplazamiento solicitado de 100 cm a una velocidad del 30%, eso se puede realizar al platear cuanto desplazamiento angular debe tener para llegar a esa distancia, puesto que conocemos el diámetro de las ruedas de 0.056 m podemos calcular que las ruedas deben girar 5.68 veces para recorrer la distancia de un metro.

![0f3dc085-25a0-4f9f-9bd4-4290bbf546f5](https://github.com/user-attachments/assets/522f86dd-4734-45a7-951b-864e6bddfc3e)

En este codigo solo seria necesario cambiar la velocidad necesaria para cada caso. Las mediciones del desplazamiento real se realizaron partiendo de un punto de referencia midiendo el desplazamiento del robot.

![a7848762-62a3-4744-97c7-48b82d5681d7](https://github.com/user-attachments/assets/e9bc7b7e-d14c-40bd-9c28-cf94e4314e7c)

Con lo cual luego de 5 mediciones los datos dieron 

| Promedio | Desviación  |
|----------|-------------|
| 97,5     | 0,158113883 |

Y con respecto a los encoder de las ruedas se evidencio que no había se evidencio un grandes variaciones ni desviaciones del desplazamiento solicitado.

#### 4.4.2 Caso a 100%

Se realizo el mismo procedimeinto con el 100% de la velocidad de los motores del robot dando como resultados
| Promedio | Desviación  |
|----------|-------------|
| 97,38    | 0,130384048 |
Con un comportamiento similar en los encoder.

#### 4.4.3 Medicion de rotacion de las ruedas
De la medición de los desplazamientos angulares de 30 grados y 45 grados, se realizaron las tomas de media por medio de una serie de fotos en donde por medio de ayuda digital se tomaron los datos de la posición angular para cada desplazamiento dando como resultados para 30 grados
| Promedio | Desviación  |
|----------|-------------|
| 28,6     | 1,140175425 |

Y 45 grados

| Promedio | Desviación  |
|----------|-------------|
| 43,6     | 1,140175425 |

En 

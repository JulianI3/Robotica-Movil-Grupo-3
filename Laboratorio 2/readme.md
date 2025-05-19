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
NOTA 2 El error sistemático y sus causas pueden ser conocidas o no. Para compensar un error  sistemático conocido puede aplicarse una corrección. 
NOTA 3 El error sistemático es igual a la diferencia entre el error de medida y el error aleatorio.

- 2.19 "Error Aleatorio de medida: componente del error de medida que, en mediciones repetidas, varía de manera impredecible."
NOTA 1 El valor de referencia para un error aleatorio es la media que se obtendría de un número  infinito de mediciones repetidas del mismo mensurando. 
NOTA 2 Los errores aleatorios de un conjunto de mediciones repetidas forman una distribución que  puede representarse por su esperanza matemática, generalmente nula, y por su varianza.
NOTA 3 El error aleatorio es igual a la diferencia entre el error de medida y el error sistemático

Aquí toca poner algo, que luego lo hago

### 3.4 De acuerdo con la teoría estadística: ¿qué es el valor medio? ¿Qué magnitudes se utilizan para medir la dispersión de los datos?
### 3.5 Busque una definición de que es ROS y sus principales ventajas
### 3.6 Investigue sobre qué comandos se pueden usar con rosnode, rostopic, rosparam, rosservice, rosmsg y rospack.
### 3.7 Investigue acerca del robot TurtleBot2 y su relación con la base Kobuki.
### 3.8 ¿Para que sirve los sensores cliff en el Kobuki?
### 3.9 ¿Como leer un evento de dicho sensor?
### 3.10 ¿Qué protocolo de comunicación usa el Lego Ev3 con sus sensores y actuadores?
### 3.11 ¿Qué opciones de conexión permiten integrar sensores no nativos al sistema LEGO EV3?

## 4. Sensores
Para realizar la medición con el sensor Hokuyo y el RPLidar se utilizó la misma estructura optando por tomas en diferentes puntos para cada sensor, el cuarto hecho para la pueba se muestra a continuación con las dimensiones dadas en cm y tomando su eje cordenado en una esquina a partir de la cual se midieron todas las poses para ambos sensores.

![image](https://github.com/user-attachments/assets/689ea871-2846-4261-b796-056be9ed40bc)

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

![image](https://github.com/user-attachments/assets/c7de72e1-8646-4b3a-8d74-2586090bda78)

##### 4.1.1.2 Mapa de detección del sensor Hokuyo para la pose 2

![image](https://github.com/user-attachments/assets/2fe0b660-f058-4c9c-9ac7-66b62b455adb)

##### 4.1.1.3 Mapa de detección del sensor Hokuyo para la pose 3

![image](https://github.com/user-attachments/assets/01090f24-ec1c-4aa7-9cca-ee474d0aad50)

#### 4.1.2 Mapas de ocupación del sensor

Utilizando los mismos datos obtenidos por el sensor y utilizando |    


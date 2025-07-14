#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
import numpy as np

DISTANCIA_OBJETIVO = 0.4  # metros
TOLERANCIA = 0.05         # margen de error aceptable
VELOCIDAD_MAX = 0.2       # m/s
GIRO_MAX = 0.5            # rad/s
DISTANCIA_LIMITE = 1.0    # metros: si no hay nada en este rango, se detiene

class Seguidor:
    def __init__(self):
        rospy.init_node('kobuki_follow_target_lidar')
        self.pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, queue_size=10)
        rospy.Subscriber('/scan', LaserScan, self.procesar_scan)
        rospy.loginfo("Nodo seguidor activado. Manteniendo distancia con objetivo...")

    def procesar_scan(self, msg):
        rangos = np.array(msg.ranges)
        angulos = np.linspace(msg.angle_min, msg.angle_max, len(rangos))

        # Filtrar ángulos entre -45° y +45°
        angulo_min = -np.pi/4
        angulo_max = np.pi/4
        indices_validos = np.where((angulos >= angulo_min) & (angulos <= angulo_max))[0]

        rangos_validos = rangos[indices_validos]
        angulos_validos = angulos[indices_validos]

        # Filtrar distancias válidas y menores al límite
        rangos_filtrados = np.where(np.isfinite(rangos_validos), rangos_validos, np.inf)
        rangos_filtrados = np.where(rangos_filtrados <= DISTANCIA_LIMITE, rangos_filtrados, np.inf)

        if np.all(rangos_filtrados == np.inf):
            rospy.loginfo("Ningún objeto detectado dentro de 1 metro. Detenido.")
            self.publicar_velocidad(0, 0)
            return

        idx_objetivo = np.argmin(rangos_filtrados)
        distancia = rangos_filtrados[idx_objetivo]
        angulo_objetivo = angulos_validos[idx_objetivo]

        # Control de distancia
        error = distancia - DISTANCIA_OBJETIVO

        if abs(error) < TOLERANCIA:
            velocidad = 0.0
        else:
            velocidad = np.clip(-error, -VELOCIDAD_MAX, VELOCIDAD_MAX)

        # Control de giro
        giro = np.clip(-angulo_objetivo, -GIRO_MAX, GIRO_MAX)

        rospy.loginfo(f"Distancia: {distancia:.2f} m | Ángulo: {np.degrees(angulo_objetivo):.1f}° | Vel: {velocidad:.2f} | Giro: {giro:.2f}")
        self.publicar_velocidad(velocidad, giro)

    def publicar_velocidad(self, linear, angular):
        cmd = Twist()
        cmd.linear.x = linear
        cmd.angular.z = angular
        self.pub.publish(cmd)

if __name__ == '__main__':
    try:
        Seguidor()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass


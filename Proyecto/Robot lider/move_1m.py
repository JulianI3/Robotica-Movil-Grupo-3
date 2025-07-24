#!/usr/bin/env python3
'''
import rospy
from geometry_msgs.msg import Twist

def move(pub, duration, linear=0.0, angular=0.0):
    rate = rospy.Rate(10)
    twist = Twist()
    twist.linear.x = linear
    twist.angular.z = angular
    start = rospy.Time.now()

    while rospy.Time.now() - start < rospy.Duration(duration) and not rospy.is_shutdown():
        pub.publish(twist)
        rate.sleep()

    twist.linear.x = 0.0
    twist.angular.z = 0.0
    pub.publish(twist)
    rospy.sleep(1)

def main():
    rospy.init_node('kobuki_complex_path')
    pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, queue_size=10)
    rospy.sleep(2)  # Conexión

    # Parámetros
    vel_lineal = 0.2      # m/s
    vel_angular = 0.5     # rad/s

    # Duraciones
    t_1m = 1.0 / vel_lineal         # 1 metro
    t_0_7m = 0.7 / vel_lineal       # 0.7 metros
    t_0_5m = 0.5 / vel_lineal       # 0.5 metros
    t_giro_45 = 0.785 / vel_angular # 45 grados
    t_giro_90 = 1.57 / vel_angular  # 90 grados
    t_giro_30 = 0.524 / vel_angular # 30 grados

    rospy.loginfo("Iniciando trayectoria compleja...")

    move(pub, t_1m, linear=vel_lineal)          # 1 metro
    move(pub, t_giro_45, angular=vel_angular)   # Gira 45° izq
    move(pub, t_0_7m, linear=vel_lineal)        # 0.7 metros
    move(pub, t_giro_90, angular=-vel_angular)  # Gira 90° der
    move(pub, t_1m, linear=vel_lineal)          # 1 metro
    move(pub, t_giro_30, angular=vel_angular)   # Gira 30° izq
    move(pub, t_0_5m, linear=vel_lineal)        # 0.5 metros

    rospy.loginfo("Trayectoria completada.")

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
'''
import rospy
from geometry_msgs.msg import Twist

def move(pub, duration, linear=0.0, angular=0.0):
    rate = rospy.Rate(10)
    twist = Twist()
    twist.linear.x = linear
    twist.angular.z = angular
    start = rospy.Time.now()

    while rospy.Time.now() - start < rospy.Duration(duration) and not rospy.is_shutdown():
        pub.publish(twist)
        rate.sleep()

    twist.linear.x = 0.0
    twist.angular.z = 0.0
    pub.publish(twist)
    rospy.sleep(1)

def main():
    rospy.init_node('kobuki_complex_path')
    pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, queue_size=10)
    rospy.sleep(2)  # Da tiempo para establecer la conexión

    # Parámetros generales
    vel_lineal = 0.2      # m/s
    vel_angular = 0.5     # rad/s

    rospy.loginfo("Iniciando trayectoria compleja...")

    # 1. Avanza recto (1 metro)
    move(pub, 1.0 / vel_lineal, linear=vel_lineal)

    # 2. Gira ligeramente a la izquierda (30°), luego avanza (1 metro)
    move(pub, 0.7 / vel_angular, angular=vel_angular)  # 30°
    move(pub, 0.8 / vel_lineal, linear=vel_lineal)

    # 3. Gira un poco más (30°), luego hace un movimiento semicircular amplio a la derecha
    move(pub, 1.5 / vel_angular, angular=vel_angular)  # 30°

    # Movimiento semicircular a la derecha con menor velocidad angular (mayor radio)
    vel_angular_suave = 0.15  # más bajo para giro amplio
    move(pub, 16.0, linear=vel_lineal, angular=-vel_angular_suave)

    # 4. Gira a la izquierda 90°
    move(pub, 1.8 / vel_angular, angular=vel_angular)

    # 5. Avanza recto (0.5 metros)
    move(pub, 0.8 / vel_lineal, linear=vel_lineal)

    # 6. Retrocede (0.5 metros)
    vel_lineal = 0.10
    move(pub, 1.2 / vel_lineal, linear=-vel_lineal)

    rospy.loginfo("Trayectoria completada.")

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass


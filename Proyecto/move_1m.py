#!/usr/bin/env python3
'''
import rospy
from geometry_msgs.msg import Twist

def move_straight():
    rospy.init_node('kobuki_move_1m')

    pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, queue_size=10)

    # Parámetros
    velocidad = 0.2  # m/s
    distancia = 5.0  # metros
    tiempo = distancia / velocidad  # segundos

    rate = rospy.Rate(10)  # Hz
    duracion = rospy.Duration(tiempo)

    start_time = rospy.Time.now()

    move = Twist()
    move.linear.x = velocidad
    move.angular.z = 0.0

    rospy.loginfo("Avanzando 1 metro en línea recta...")

    while rospy.Time.now() - start_time < duracion and not rospy.is_shutdown():
        pub.publish(move)
        rate.sleep()

    # Detener el robot
    move.linear.x = 0.0
    pub.publish(move)
    rospy.loginfo("Movimiento completado.")

if __name__ == '__main__':
    try:
        move_straight()
    except rospy.ROSInterruptException:
        pass
'''
#!/usr/bin/env python3
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

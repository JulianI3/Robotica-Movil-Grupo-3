#!/usr/bin/env python3
import rospy
from std_msgs.msg import Bool
import subprocess

def callback(msg):
    if msg.data:
        rospy.loginfo("Señal recibida. Ejecutando move_1m.launch...")
        subprocess.Popen(["roslaunch", "kobuki_follow", "move_1m.launch"])

def main():
    rospy.init_node('start_move1_listener')
    rospy.Subscriber('/send_trigger', Bool, callback)
    rospy.loginfo("Esperando señal para iniciar move_1m.launch...")
    rospy.spin()

if __name__ == '__main__':
    main()


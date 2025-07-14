#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import Twist

def main():
    rospy.init_node('kobuki_follow')
    pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
    rate = rospy.Rate(10)

    move = Twist()
    move.linear.x = 0.1
    move.angular.z = 0.0

    while not rospy.is_shutdown():
        pub.publish(move)
        rate.sleep()

if __name__ == '__main__':
    main()


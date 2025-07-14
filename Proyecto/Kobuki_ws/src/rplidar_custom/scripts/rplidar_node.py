#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import LaserScan

import sys
import os
sys.path.append(os.path.dirname(__file__))

from rplidar_driver import RPLidar


from rplidar_driver import RPLidar
import math
import time

PORT_NAME = '/dev/ttyUSB1'
MAX_DISTANCE = 1000  # mm
ANGLE_MIN = -math.radians(45)
ANGLE_MAX = math.radians(45)

lidar = None

def publish_lidar():
    global lidar
    pub = rospy.Publisher('/scan', LaserScan, queue_size=10)
    rospy.init_node('rplidar_node', anonymous=True)
    rate = rospy.Rate(10)  # 10 Hz

    scan_msg = LaserScan()
    scan_msg.header.frame_id = 'laser'
    scan_msg.angle_min = ANGLE_MIN
    scan_msg.angle_max = ANGLE_MAX
    scan_msg.angle_increment = math.radians(1)
    scan_msg.range_min = 0.05
    scan_msg.range_max = 1.0
    scan_msg.scan_time = 0.1
    scan_msg.time_increment = 0.0

    try:
        for scan in lidar.iter_scans():
            ranges = [float('inf')] * 90  # -45° to +45°
            for (_, angle, distance) in scan:
                if distance == 0:
                    continue
                if angle >= 315 or angle <= 45:
                    a = angle if angle <= 45 else angle - 360  # convierte a [-45, 45]
                    index = int(a + 45)  # convierte a 0–90
                    if index >= 0 and index < len(ranges):
                        ranges[index] = distance / 1000.0  # mm → m

            scan_msg.header.stamp = rospy.Time.now()
            scan_msg.ranges = ranges
            pub.publish(scan_msg)
            rate.sleep()

    except rospy.ROSInterruptException:
        pass
    finally:
        rospy.loginfo("Desconectando RPLidar")
        lidar.stop()
        lidar.disconnect()

if __name__ == '__main__':
    try:
        lidar = RPLidar(PORT_NAME)
        publish_lidar()
    except Exception as e:
        print("Error:", e)

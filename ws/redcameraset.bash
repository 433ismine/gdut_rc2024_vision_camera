#!/bin/bash
source /home/robocon/ws/devel/setup.bash

v4l2-ctl -d /dev/video14 --set-ctrl=auto_exposure=1&
sleep 2

v4l2-ctl -d /dev/video14 --set-ctrl=exposure_time_absolute=55&
sleep 2

roslaunch yolov5_ros red_yolo_v5.launch
# rosrun yolov5_ros camera.py

sleep 2
wait
exit 

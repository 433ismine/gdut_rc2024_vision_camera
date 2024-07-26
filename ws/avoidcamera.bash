#!/bin/bash
source /home/robocon/ws/devel/setup.bash

v4l2-ctl -d /dev/video10 --set-ctrl=auto_exposure=1&
sleep 2

v4l2-ctl -d /dev/video10 --set-ctrl=exposure_time_absolute=25&
sleep 2


roslaunch yolov5_findball judge.launch
sleep 2
wait
exit 


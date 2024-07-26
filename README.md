# gdut_rc2024_vision_camera
# 文件说明
## 决策
红方：redcameraset.bash
蓝方：bluecameraset.bash
**内含强制关闭自动曝光**
### 若不需要调整曝光

红方：roslaunch yolov5_ros red_yolo_v5.launch
蓝方：roslaunch yolov5_ros blue_yolo_v5.launch

## 寻球
红方：roslauch yolov5_findball red_yolo_find.launch
蓝方：roslauch yolov5_findball blue_yolo_find.launch

## 避障
avoidcamera.bash

# 代码说明
+ 需要看识别图像的话，将imshow的注释放开
+ 相机端口号记得按照实际使用情况进行修改 即videocapture()
+ 更换相机后需重新调参 yolov5_ros 和 yolov5_findball里面的camera.py

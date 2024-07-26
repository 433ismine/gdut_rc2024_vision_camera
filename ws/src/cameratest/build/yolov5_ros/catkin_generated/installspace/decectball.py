#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import cv2
import torch
import rospy
import numpy as np

from std_msgs.msg import Header
from sensor_msgs.msg import Image
from yolov5_ros_msgs.msg import BoundingBox
from yolov5_ros_msgs.msg import BoundingBoxes
from geometry_msgs.msg import Point
import torch
model = torch.hub.load(r'/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_ros/yolov5', 'custom', path=r'/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_ros/weights/yolov5s.pt', source='local')

# model = torch.hub.load('ultralytics/yolov5', 'yolov5s', pretrained=True, force_reload=True)
# model = torch.hub.load("..", "yolov5s", "../weights/yolov5s.pt", source="local")

# model = attempt_load("yolov5s", map_location=torch.device('cpu')) 
# model.load_state_dict(torch.load("../weights/yolov5s.pt", map_location=torch.device('cpu')))
# model.eval()


class Yolo_Dect:

    balls = []

    def __init__(self):

        # load parameters
        yolov5_path = rospy.get_param('/yolov5_path', '')

        weight_path = rospy.get_param('~weight_path', '')
        image_topic = rospy.get_param(
            '~image_topic', '/camera/color/image_raw')
        pub_topic = rospy.get_param('~pub_topic', '/camera1/ball_position')
       
        self.camera_frame = rospy.get_param('~camera_frame', '')
        conf = rospy.get_param('~conf', '0.5')

        # load local repository(YoloV5:v6.0)
        self.model = torch.hub.load(yolov5_path, 'custom',
                                    path=weight_path, source='local')

        # which device will be used
        if (rospy.get_param('/use_cpu', 'false')):
            self.model.cpu()
        else:
            self.model.cuda()

        self.model.conf = conf
        self.color_image = Image()
        self.img = Image()
        self.depth_image = Image()
        self.getImageStatus = False

        # Load class color
        self.classes_colors = {}
        # output publishers
        self.position_pub = rospy.Publisher(
            pub_topic,Point, queue_size=1)
        


        self.image_pub = rospy.Publisher(
            '/yolov5/detection_image',  Image, queue_size=1)

        # image subscribe
        self.color_sub = rospy.Subscriber(image_topic, Image, self.image_callback,
                                          queue_size=1, buff_size=52428800)


        # if no image messages
        while (not self.getImageStatus) :
            rospy.loginfo("waiting for image.")
            rospy.sleep(2)

    def image_callback(self, image):
        self.boundingBoxes = BoundingBoxes()
        self.boundingBoxes.header = image.header
        self.boundingBoxes.image_header = image.header
        self.getImageStatus = True
        self.color_image = np.frombuffer(image.data, dtype=np.uint8).reshape(
            image.height, image.width, -1)
        self.color_image = cv2.cvtColor(self.color_image, cv2.COLOR_BGR2RGB)

        results = self.model(self.color_image)
        # xmin    ymin    xmax   ymax  confidence  class    name

        boxs = results.pandas().xyxy[0].values
        self.dectshow(self.color_image, boxs, image.height, image.width)
        cv2.waitKey(3)

    def judge_distance(self, x ,middle):
        if(x>middle):    return x-middle
        if(x<middle):    return middle-x


    def dectshow(self, org_img, boxs, height, width):

        img = org_img.copy()

        count = 0
        for i in boxs:
            count += 1

        for box in boxs:
            if(box[-1]=="blue"):
               if(self.judge_distance(box[0],320)<100):
                  if(self.judge_distance(box[2],320)<100):
                     self.balls.append(box)
    

            # print(self.balls)
            
            boundingBox = BoundingBox()
            boundingBox.probability =np.float64(box[4])
            boundingBox.xmin = np.int64(box[0])
            boundingBox.ymin = np.int64(box[1])
            boundingBox.xmax = np.int64(box[2])
            boundingBox.ymax = np.int64(box[3])
            boundingBox.num = np.int16(count)
            boundingBox.Class = box[-1]
     
            if box[-1] in self.classes_colors.keys():
                color = self.classes_colors[box[-1]]
            else:
                color = np.random.randint(0, 183, 3)
                self.classes_colors[box[-1]] = color

            cv2.rectangle(img, (int(box[0]), int(box[1])),
                          (int(box[2]), int(box[3])), (int(color[0]),int(color[1]), int(color[2])), 2)

            if box[1] < 20:
                text_pos_y = box[1] + 30
            else:
                text_pos_y = box[1] - 10
                
            cv2.putText(img, box[-1],
                        (int(box[0]), int(text_pos_y)-10), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 2, cv2.LINE_AA)




            self.boundingBoxes.bounding_boxes.append(boundingBox)
            # self.position_pub.publish(self.boundingBoxes)
        #--------------------------------------------------#
        l = len(self.balls)
        if (l):
            bigest_ball = self.balls[0]
            bigest_area = self.get_area(bigest_ball[0],bigest_ball[1],bigest_ball[2],bigest_ball[3])
            for ball in self.balls:
                area = self.get_area(ball[0],ball[1],ball[2],ball[3])
                if(area > bigest_area): 
                    bigest_area = area
                    bigest_ball = ball

            cv2.rectangle(img, (int(bigest_ball[0]), int(bigest_ball[1])),
                          (int(bigest_ball[2]), int(bigest_ball[3])), (255, 255, 255), 2)
            centershow = (int(bigest_ball[0] + bigest_ball[2]) // 2, (int(bigest_ball[1] + bigest_ball[3]) // 2))
            center = ((bigest_ball[0] + bigest_ball[2]) // 2, (bigest_ball[1] + bigest_ball[3]) // 2)
            ballx=(bigest_ball[0] + bigest_ball[2]) // 2
            bally=(bigest_ball[1] + bigest_ball[3]) // 2

            cv2.circle(img, centershow, 2, (255,255,255), -1)
            
            msg=Point()
            msg.x=ballx
            msg.y=bally
            msg.z=0
            self.position_pub.publish(msg)

        self.balls = []
        
        #--------------------------------------------------#
        self.publish_image(img, height, width)
        cv2.imshow('YOLOv5', img)
        # print(ball_data)

    def get_area(self,xmin,ymin,xmax,ymax):
        area = (xmax-xmin)*(ymax-ymin)
        return area
        
    def publish_image(self, imgdata, height, width):
        image_temp = Image()
        header = Header(stamp=rospy.Time.now())
        header.frame_id = self.camera_frame
        image_temp.height = height
        image_temp.width = width
        image_temp.encoding = 'bgr8'
        image_temp.data = np.array(imgdata).tobytes()
        image_temp.header = header
        image_temp.step = width * 3
        self.image_pub.publish(image_temp)

    


def main():
    rospy.init_node('yolov5_ros', anonymous=True)
    yolo_dect = Yolo_Dect()
    rospy.spin()


if __name__ == "__main__":

    main()

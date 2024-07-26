#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import cv2
import torch
import rospy
import numpy as np
from cv_bridge import CvBridge
from std_msgs.msg import Header
from sensor_msgs.msg import Image
from yolov5_ros_msgs.msg import BoundingBox
from yolov5_ros_msgs.msg import BoundingBoxes
from yolov5_ros_msgs.msg import Silos
from yolov5_ros_msgs.msg import Judge
import torch

# 移植的话 改绝对路径
model = torch.hub.load(r'/home/robocon/ws/src/cameratest/src/yolov5_ros/yolov5', 'custom', path=r'/home/robocon/ws/src/cameratest/src/yolov5_ros/weights/yolov5s.pt', source='local')



class Yolo_Dect:

    silos = ["null","null","null","null","null"]
   
    def __init__(self):

        # load parameters
        yolov5_path = rospy.get_param('/yolov5_path', '')

        weight_path = rospy.get_param('~weight_path', '')
        image_topic = rospy.get_param('~image_topic', '/camera/color/image_raw')
        pub_topic = rospy.get_param('~pub_topic', '/yolov5/BoundingBoxes')
        pub_topic1 = rospy.get_param('~pub_topic', '/yolov5/silos')
        pub_topic2 = rospy.get_param('~pub_topic', '/yolov5/judge')

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
        self.depth_image = Image()
        self.getImageStatus = False

        # Load class color
        self.classes_colors = {}

        # output publishers
        self.position_pub = rospy.Publisher(
            pub_topic,  BoundingBoxes, queue_size=1)

        self.image_pub = rospy.Publisher(
            '/yolov5/detection_image',  Image, queue_size=1)

        self.silo_pub = rospy.Publisher(
            pub_topic1,  Silos, queue_size=1)
            
        self.judge_pub = rospy.Publisher(
            pub_topic2,  Judge, queue_size=1)

        # image subscribe
        self.color_sub = rospy.Subscriber(image_topic, Image, self.image_callback,
                                          queue_size=1, buff_size=52428800)

        # if no image messages
        while (not self.getImageStatus) :
            rospy.loginfo("waiting for image.")
            rospy.sleep(2)

    def publish_image(self, imgdata, height, width):
        image_temp = Image()
        header = Header(stamp=rospy.Time.now())
        header.frame_id = self.camera_frame
        image_temp.header=header

    def equare(self, x, y):
        if x == y:
            return 1
        else:
            return 0

    def image_callback(self, image):
        # self.boundingBoxes = BoundingBoxes()
        # self.boundingBoxes.header = image.header
        # self.boundingBoxes.image_header = image.header
        # self.getImageStatus = True
        self.color_image = np.frombuffer(image.data, dtype=np.uint8).reshape(
            image.height, image.width, -1)

        ###非常重要 红方转蓝方
        self.color_image = cv2.cvtColor(self.color_image, cv2.COLOR_BGR2RGB)
     

        results = self.model(self.color_image)
        # xmin    ymin    xmax   ymax  confidence  class    name

        boxs = results.pandas().xyxy[0].values

        ##图像换回去
        self.color_image = cv2.cvtColor(self.color_image, cv2.COLOR_RGB2BGR)
        # self.color_image = cv2.cvtColor(self.color_image, cv2.COLOR_BGR2RGB)
        
        self.dectshow(self.color_image, boxs, image.height, image.width)
        # cv2.waitKey(3)

    def dectshow(self, org_img, boxs, height, width):
        img = org_img.copy()
        silos_data1 = []
        silos_data2 = []

        # silodata = Silos()


        count = 0
        for i in boxs:
            count += 1

        for box in boxs:

            x=[box[0],box[-1]]

            boundingBox = BoundingBox()
            boundingBox.probability =np.float64(box[4])
            boundingBox.xmin = np.int64(box[0])
            boundingBox.ymin = np.int64(box[1])
            boundingBox.xmax = np.int64(box[2])
            boundingBox.ymax = np.int64(box[3])
            boundingBox.num = np.int16(count)
            boundingBox.Class = box[-1]

            # judge
            middlepoint=((box[2]-box[0])/2+box[0])
            x_d=(box[2]-box[0])
           
            msg2=Judge()
            msg2.name=box[-1]
            msg2.p=middlepoint
            msg2.d=x_d
            msg2.header.seq = rospy.Time.now().to_sec() * 1000.0
            self.judge_pub.publish(msg2)

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
            # self.boundingBoxes.bounding_boxes.append(boundingBox)
            # self.position_pub.publish(self.boundingBoxes)
            silos_data1.append(x)

        for num in silos_data1 :
            x = 1000.0
            index = 0
            for i,silo_data in enumerate(silos_data1):
                if(x > silo_data[0]):
                    x=silo_data[0]
                    index = i
            silos_data2.append(silos_data1[index][1])
            silos_data1[index][0] = 1000.1
        # self.silos_data = sorted(self.silos_data, key=lambda x: x[0])
        self.judge(silos_data2)
        # self.silodata.Silos_data.append(self.silos)
        msg=Silos()
        msg.a = self.silos[0]
        msg.b = self.silos[1]
        msg.c = self.silos[2]
        msg.d = self.silos[3]
        msg.e = self.silos[4]
        self.silo_pub.publish(msg)

        
        print(self.silos)
        # self.publish_image(img, height, width)
        # cv2.imshow('YOLOv5', img)

    def judge(self,silos_data):
        l = len(silos_data)
        if l == 5:
            for i in range(l):  
                self.silos[i]=silos_data[i]

        elif l == 4:
            n1 = 0
            n2 = 0

            for i in range(l): 
                n1 = n1 + self.equare(self.silos[i], silos_data[i])
        
            for i in range(l): 
                n2 = n2 + self.equare(self.silos[i], silos_data[i])

            if n1 >= 3 and n2 < 3:
                for i in range(l):  
                   self.silos=silos_data[i]

            elif n1 < 3 and n2 >= 3:
                for i in range(l):  
                    self.silos=silos_data[i]



def main():
    rospy.init_node('yolov5_ros', anonymous=True)
    yolo_dect = Yolo_Dect()
    rospy.spin()

if __name__ == "__main__":

    main()
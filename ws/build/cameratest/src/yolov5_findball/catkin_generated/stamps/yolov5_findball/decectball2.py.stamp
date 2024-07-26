#!/usr/bin/env python
# -*- coding: utf-8 -*-

import cv2
import torch
import rospy
import numpy as np
import math
from std_msgs.msg import Header
from sensor_msgs.msg import Image
from yolov5_ros_msgs.msg import BoundingBox
from yolov5_ros_msgs.msg import BoundingBoxes
from geometry_msgs.msg import Point
from scipy.optimize import fsolve
import torch
model = torch.hub.load(r'/home/robocon/ws/src/cameratest/src/yolov5_ros/yolov5', 'custom', path=r'/home/robocon/ws/src/cameratest/src/yolov5_ros/weights/yolov5s.pt', source='local')
#model = torch.hub.load(r'/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_ros/yolov5', 'custom', path=r'/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_ros/weights/yolov5s.pt', source='local')

class Yolo_Dect:

    balls = []
   # balls_normal=[]
    count = 0

    def __init__(self):

        # load parameters
        yolov5_path = rospy.get_param('/yolov5_path', '')

        weight_path = rospy.get_param('~weight_path', '')
        image_topic = rospy.get_param(
            '~image_topic', '/camera/image_raw')

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

        ##图像换回去
        self.color_image = cv2.cvtColor(self.color_image, cv2.COLOR_RGB2BGR)

        self.dectshow(self.color_image, boxs, image.height, image.width)
        cv2.waitKey(3)

    def dectshow(self, org_img, boxs, height, width):
        imagesetwidth=width/10
        imagesetheight=height/10
        imagewidthmin=imagesetwidth
        imagewidthmax=width-imagewidthmin
        imageheightmin=imagesetheight
        imageheightmax=height-imageheightmin
        img = org_img.copy()
        count = 0
        for i in boxs:
            count += 1

        for box in boxs:
            if(box[-1]!='purple'):
                # if(box[2]<=imagewidthmin or box[3]<=imageheightmin or box[0]>=imagewidthmax or box[1]>=imageheightmax):
                # 在边缘使用pr判断
                # if(box[2]<=imagewidthmin  or box[0]>=imagewidthmax or box[1]>=imageheightmax):
                self.balls.append(self.calculate(box,width)) # [ball_point,r,xmin,ymin]
                    
                #在非边缘使用四角判断
                # else:
                #     xc = (box[0]+box[2])/2
                #     yc = (box[1]+box[3])/2
                #     r = self.get_radius(box)
                #     weight = yc-abs(xc-(width/2))
                #     ball = [xc,yc,r,weight]
                #     self.balls_normal.append(ball)

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
        #--------------------------------------------------#
        l = len(self.balls)
        if (l): # [ball_point,r,xmin,ymin]
            bigest_ball = self.balls[0]
            for box in boxs:
                for ball in self.balls:

                    if self.get_distance(bigest_ball[0].x,bigest_ball[0].y) > self.get_distance(ball[0].x,ball[0].y): 
                        bigest_ball = ball

            # ballcenter = (int(bigest_ball[1]+bigest_ball[2]),int(bigest_ball[1]+bigest_ball[3]))
            ballcenter = (int(bigest_ball[0].x),int(bigest_ball[0].y))
            msg=Point()
            msg.x=bigest_ball[0].x
            msg.y=bigest_ball[0].y
            msg.z=0

            if msg.x <4000 and msg.y<5000:
                self.position_pub.publish(msg)
                print("balls",'%.3f' % msg.x,'%.3f' % msg.y)
            
            self.count = 0
            cv2.circle(img,ballcenter,int(bigest_ball[1]),(255,255,255),2)
        else:
            self.count = self.count+1
            if self.count >= 2:
                msg=Point()
                msg.x=0
                msg.y=0
                msg.z=0
                self.position_pub.publish(msg)
                print("balls",'%.3f' % msg.x,'%.3f' % msg.y)

        self.balls = []

        # l1 = len(self.balls_normal)
        # if (l1):
        #     bigest_ball = self.balls_normal[0]
        #     for box in boxs:
        #         for ball in self.balls_normal:
        #             if bigest_ball[3] < ball[3]: 
        #                 bigest_ball = ball

        #     ballcenter = (int(bigest_ball[0]),int(bigest_ball[1]))

        #     r = bigest_ball[2]
        #     degrees=35
        #     radians=math.radians(degrees)
 
        #     cv2.circle(img,ballcenter,int(r),(255,255,255),2)
        #     # cv2.rectangle(img, (int(bigest_ball[0]), int(bigest_ball[1])),
        #     #               (int(bigest_ball[2]), int(bigest_ball[3])), (255, 255, 255), 2)

        #     msg=Point()
        #     msg.z=0
        #     msg.y=(5880.133*math.exp(-0.0859*r)+1460.877*math.exp(-0.0108*r))*math.cos(radians)
        #     msg.x=1.0*(95.0/r)*(bigest_ball[0]-(width/2))
            
        #     if msg.x <4000 and msg.y<5000:
        #         self.position_pub.publish(msg)
        #         print("balls_normal",msg.x,msg.y)
            
        #     cv2.circle(img,ballcenter,int(bigest_ball[1]),(255,255,255),2)
        # else:
        #     msg=Point()
        #     msg.x=0
        #     msg.y=0
        #     msg.z=0
        #     self.position_pub.publish(msg)


        # self.balls_normal = []
        
        #--------------------------------------------------#
        # cv2.imshow('YOLOv5', img)
    
    def calculate(self,ball,width):
        degrees=35 #安装角度
        # # #弧度制转换
        radians_degrees=math.radians(degrees)
        ##求R
        # ViewingAngle=36 #视场角/2
        if ball[1] >600:
            a1 = 18800
            b1 = -0.0145
            c1= 2045.1
            d1= -0.0029
            d=a1*math.exp(b1*ball[1]) + c1*math.exp(d1*ball[1])
        
            ball_point=Point()# d = list(map(lambda x: a1 * x**b1, d1))
            ball_point.z=0
            ball_point.y=d
            #求解函数
            def equation_to_solve(r):
                return (5880.133 * math.exp(-0.0859 * r) + 1460.877 * math.exp(-0.0108 * r)) * math.cos(radians_degrees) - d/2

            initial_guess = 1.0 
            solution = fsolve(equation_to_solve, initial_guess)

            r=solution[0]/2
            print(r)    
            ball_point.x=1.0*(95.0/r)*(ball[0]+r-(width/2))
            return [ball_point,r,ball[0],ball[1]]
        
        else:
            r = self.get_radius(ball)
            d = (5880.133 * math.exp(-0.0859 * r) + 1460.877 * math.exp(-0.0108 * r)) * math.cos(radians_degrees) 
            ball_point=Point()# d = list(map(lambda x: a1 * x**b1, d1))
            ball_point.z=0
            ball_point.y=d
            ball_point.x=1.0*(95.0/r)*(ball[0]+r-(width/2))
            return [ball_point,r,ball[0],ball[1]]

    def get_distance(self,x,y):
        return x*x+y*y

    def get_radius(self,ball):
        a = ball[2]-ball[0]
        b = ball[3]-ball[1]
        if a/b < 2.0 and b/a <2.0: return (a+b)/4
        elif a/b >2.0: return a/2
        elif b/a >2.0: return b/2

def main():
    rospy.init_node('yolov5_ros', anonymous=True)
    yolo_dect = Yolo_Dect()
    rospy.spin()


if __name__ == "__main__":

    main()

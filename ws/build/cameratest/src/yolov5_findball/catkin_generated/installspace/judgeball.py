import rospy
from sensor_msgs.msg import Image
from std_msgs.msg import Bool
from cv_bridge import CvBridge, CvBridgeError
import cv2
import numpy as np


class Avoid:
    def __init__(self):

        self.bridge = CvBridge()
        image_topic = rospy.get_param(
            '~image_topic', '/camera/image_raw3')

        pub_topic = rospy.get_param('~pub_topic', '/camera1/judge')
        self.color_sub = rospy.Subscriber(image_topic, Image, self.image_callback)
        self.judge_pub = rospy.Publisher(pub_topic,Bool, queue_size=1)
        self.blue_lower = (100, 153, 0)
        self.blue_upper = (112, 255, 255)
        self.red_lower = (25, 0, 0)
        self.red_upper = (118, 255, 255)
        self.weight = 0

    def apply_trapezoid_transform(self,frame):
        height, width = frame.shape[:2]

        bottom_width = width * 0.7  # 底部宽度
        top_width = width * 0.8     # 顶部宽度
        height_pct = 0.9            # 梯形的高度占总高度的比例

        pts = np.array([[top_width, height * height_pct],
                    [width - top_width, height * height_pct],
                    [bottom_width, height],
                    [width - bottom_width, height]], np.float32)

    # 定义输出图像中梯形的四个顶点
        out_bottom_width = width
        out_top_width = width
        out_height = height

        out_pts = np.array([[0, 0],
                        [out_bottom_width, 0],
                        [0, out_height],
                        [out_bottom_width, out_height]], np.float32)

    # 计算透视变换矩阵
        M = cv2.getPerspectiveTransform(pts, out_pts)

    # 应用透视变换
        trapezoid_frame = cv2.warpPerspective(frame, M, (width, height))

        return trapezoid_frame

    def transform(self,frame):
        
        # 定义目标区域的四个角点
        src_points = np.float32([[310,0], [720,0], [0,720], [1030,720]])
        
        # 定义目标区域矫正后的四个角点
        dst_points = np.float32([[0, 0], [1030, 0], [1030, 720], [0, 720]])
        
        # 计算透视变换矩阵
        M = cv2.getPerspectiveTransform(src_points, dst_points)
        
        # 应用透视变换
        trapezoid_frame = cv2.warpPerspective(frame, M, (1030, 720))

        return trapezoid_frame


    def image_callback(self, data):
        try:
            img_ord = self.bridge.imgmsg_to_cv2(data, "bgr8")
            # img = self.apply_trapezoid_transform(img_ord)
            img1=img_ord[500:700,0:1030]
            img2=img_ord[250:500,200:910]
            # img3=img_ord[0:250,300:910]
            img1 = self.do_img(img1, self.blue_lower, self.blue_upper)
            img1 = self.do_img(img1, self.red_lower, self.red_upper)
            img2 = self.do_img(img2, self.blue_lower, self.blue_upper)
            img2 = self.do_img(img2, self.red_lower, self.red_upper)
            # img3 = self.do_img(img3, self.blue_lower, self.blue_upper)
            # img3 = self.do_img(img3, self.red_lower, self.red_upper)
            # cv2.imshow("img1", img1)
            # cv2.imshow("img2", img2) 
            # cv2.imshow("img3", img3)
            result = Bool()
            result = False
            print(self.weight)
            result =  self.weight > 0
            self.judge_pub.publish(result)
            self.weight = 0
            cv2.waitKey(1)

        except CvBridgeError as e:
            print(e)

    def do_img(self,img, lower, upper):
        # points = np.array([[(0,720),(310,0),(790,0),(1034,1280)]])
        # mask = np.ones(img.shape[0:3],np.uint8)
        # cv2.fillPoly(mask,points,(255,255,255))
        # img = cv2.bitwise_and(img,mask)
        # cv2.imshow("mask",img)
        img_hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
        img_mask = cv2.inRange(img_hsv, lower, upper)
        img_mask = img_mask = cv2.medianBlur(img_mask, 5)
        if lower == self.red_lower:
            img_mask = cv2.bitwise_not(img_mask)
        contours, hierarchy = cv2.findContours(img_mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        for contour in contours:
            if len(contour) > 150:
                rect = cv2.minAreaRect(contour)
                box = cv2.boxPoints(rect)
                box = np.int0(box)
                cv2.drawContours(img, [box], 0, (255), 2)
                self.weight = self.weight + 1
        return img

def main():
    rospy.init_node('judge', anonymous=True)
    avoid = Avoid()
    rospy.spin()


if __name__ == "__main__":

    main()

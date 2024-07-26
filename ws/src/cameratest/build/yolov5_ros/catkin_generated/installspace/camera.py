import cv2
import math
import numpy as np
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

# 鱼眼相机画面矫正
#     arg：mat frame
#     return：mat frame
def undistort(frame):

	# k=np.array( [[478.3854 ,  0.3169   ,331.9190],
    #              [  0.     ,  478.5842 ,226.7371],
    #              [  0.     ,  0.       ,1.      ]])

	# d=np.array([-0.4085 , 0.1536 ,6.157666674460974e-04 ,-0.0017 ,0  ])

	k=np.array( [[727.8492 ,  0.      ,665.1421],
                 [  0.     ,  733.4792 ,335.2692],
                 [  0.     ,  0.       ,1.      ]])

	d=np.array([-0.3539 , 0.090 ,0.0018 ,-0.0014 ,0  ])

    # k=np.array( [[727.8492 ,  0.   ,665.1421],
    #              [  0.     ,  733.4792 ,335.2692],
    #              [  0.     ,  0.       ,1.      ]])

	# d=np.array([-0.3539 , 0.090 ,0.0018 ,-0.0014 ,0  ])
	h,w=frame.shape[:2]
	mapx,mapy=cv2.initUndistortRectifyMap(k,d,None,k,(w,h),5)
	return cv2.remap(frame,mapx,mapy,cv2.INTER_LINEAR)

def main():
    rospy.init_node("camera_publisher")
    pub = rospy.Publisher("/camera/image_raw", Image, queue_size=10)

    cap = cv2.VideoCapture(2)
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)

    # cap.set(cv2.CV_CAP_PROP_BRIGHTNESS, 1.5)
    # cap.set(cv2.CAP_PROP_HUE, 50).
    # cap.set(cv2.CAP_PROP_AUTO_EXPOSURE, 0)
    cap.set(cv2.CAP_PROP_FOURCC, cv2.VideoWriter.fourcc(*"MJPG"))
    cap.set(cv2.CAP_PROP_BRIGHTNESS,-29)
    cap.set(cv2.CAP_PROP_SATURATION,116)
    cap.set(cv2.CAP_PROP_CONTRAST,36)
    cap.set(cv2.CAP_PROP_SHARPNESS,6)
    
    if not cap.isOpened():
        rospy.logerr("Cannot open camera")
        return
    bridge = CvBridge()

    rate = rospy.Rate(30)  
    while not rospy.is_shutdown():
        ret, frame = cap.read()
        frame=undistort(frame)
        if ret:
            # cv2.imshow("image",frame)
            # cv2.waitKey(25)
            image_msg = bridge.cv2_to_imgmsg(frame, "bgr8")
            pub.publish(image_msg)
        rate.sleep()

    # 释放摄像头
    cap.release()

if __name__ == '__main__':
    try:
        main()    # 释放摄像头

    except rospy.ROSInterruptException:
        pass

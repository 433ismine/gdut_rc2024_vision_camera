import cv2
import math
import numpy as np
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from std_msgs.msg import Bool
flag1 = 0

def bool_callback1(msg):
    global flag1
    flag1 = msg.data

# 鱼眼相机画面矫正
#     arg：mat frame
#     return：mat frame

# def undistort(frame):

# 	k=np.array( [[478.3854 ,  0.3169   ,331.9190],
#                  [  0.     ,  478.5842 ,226.7371],
#                  [  0.     ,  0.       ,1.      ]])

# 	d=np.array([-0.4085 , 0.1536 ,6.157666674460974e-04 ,-0.0017 ,0  ])
# 	h,w=frame.shape[:2]
# 	mapx,mapy=cv2.initUndistortRectifyMap(k,d,None,k,(w,h),5)
# 	return cv2.remap(frame,mapx,mapy,cv2.INTER_LINEAR)
# import cv2
# import queue
# import threading
# import time

# 自定义无缓存读视频类
# class VideoCapture:
#     """Customized VideoCapture, always read latest frame """
    
#     def __init__(self, camera_id):
#         # "camera_id" is a int type id or string name
#         self.cap = cv2.VideoCapture(camera_id)
#         self.q = queue.Queue(maxsize=3)
#         self.stop_threads = False    # to gracefully close sub-thread
#         th = threading.Thread(target=self._reader)
#         th.daemon = True             # 设置工作线程为后台运行
#         th.start()

#     # 实时读帧，只保存最后一帧
#     def _reader(self):
#         while not self.stop_threads:
#             ret, frame = self.cap.read()
#             if not ret:
#                 break
#             if not self.q.empty():
#                 try:
#                     self.q.get_nowait() 
#                 except queue.Empty:
#                     pass
#             self.q.put(frame)

#     def read(self):
#         return self.q.get()
    
#     def terminate(self):
#         self.stop_threads = True
#         self.cap.release()





def main():
    rospy.init_node("camera_publisher2")
    judge_topic1 = rospy.get_param('~judge_topic1', '/cam_cov')
    rospy.Subscriber(judge_topic1, Bool, bool_callback1)
    pub = rospy.Publisher("/camera/image_raw2", Image, queue_size=1)
 

    cap = cv2.VideoCapture(12)
    cap.set(cv2.CAP_PROP_FOURCC, cv2.VideoWriter.fourcc(*"MJPG"))
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)
    if not cap.isOpened():
        rospy.logerr("Cannot open camera")
        return
    bridge = CvBridge()

    rate = rospy.Rate(30)  
    count = 0
    n = 0
    while not rospy.is_shutdown():
        ret, frame = cap.read()
        allcount = cap.get(cv2.CAP_PROP_FRAME_COUNT)
        cap.set(cv2.CAP_PROP_POS_FRAMES,allcount)
        # frame=undistort(frame)
        if ret:
            image_msg = bridge.cv2_to_imgmsg(frame, "bgr8")
            # count = count +1
            # if count >= 50:
            #   count= 0
            #   n = n+1
            #   cv2.imwrite("/home/robocon/ws/picture1/"+str(n)+".jpg",frame)
            if flag1==0:
               pub.publish(image_msg)
            # pub.publish(image_msg)
        
        rate.sleep()

    # 释放摄像头
    cap.release()

if __name__ == '__main__':
    try:
        main()    

    except rospy.ROSInterruptException:
        pass


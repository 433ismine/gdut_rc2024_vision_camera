# Author: moon
# CreaTime: 2024/3/14
# FileName: save.py
import cv2
import os
import numpy as np

# path="/home/yuyu/workspace/robocon/camera/orddata"

def undistort(frame):

	k=np.array( [[727.8492 ,  0.      ,665.1421],
                 [  0.     ,  733.4792 ,335.2692],
                 [  0.     ,  0.       ,1.      ]])

	d=np.array([-0.3539 , 0.090 ,0.0018 ,-0.0014 ,0  ])
	h,w=frame.shape[:2]
	mapx,mapy=cv2.initUndistortRectifyMap(k,d,None,k,(w,h),5)
	return cv2.remap(frame,mapx,mapy,cv2.INTER_LINEAR)

if __name__ == '__main__':
    # listFiles = os.listdir(path)
    # list = str(listFiles)
    # lis = int(listFiles)
    # print(lis)

    n=233
    cap = cv2.VideoCapture(12)
    cap.set(cv2.CAP_PROP_FOURCC, cv2.VideoWriter.fourcc(*"MJPG"))
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)

    # cap.set(cv2.CAP_PROP_BRIGHTNESS,-29)
    # cap.set(cv2.CAP_PROP_SATURATION,116)
    # cap.set(cv2.CAP_PROP_CONTRAST,36)
    # cap.set(cv2.CAP_PROP_SHARPNESS,6a

    if not cap.isOpened():
        print("Cannot open camera")
        exit()
    while True:
        retval,img=cap.read()
        # img = undistort(img)
        cv2.imshow("img", img)
        if cv2.waitKey(25) == ord('q'):
            cv2.imwrite("/home/robocon/ws/src/cameratest/data/"+str(n)+".jpg",img)
            n=n+1
    cap.release()
    cv2.destroyAllWindows()

# if __name__ == '__main__':
#     cap = cv2.VideoCapture(0)
#     width = int(cap.get(propId=cv2.CAP_PROP_FRAME_WIDTH) / 2)
#     height = int(cap.get(propId=cv2.CAP_PROP_FRAME_HEIGHT) / 2)
#     fourcc=cv2.VideoWriter.fourcc(*"mp4v")
#     output = cv2.VideoWriter("output.mp4",fourcc,20,(640,480))
#     if not cap.isOpened():
#             print("Cannot open camera")
#             exit()
#     while True:
#             retval, img = cap.read()
#             img = undistort(img)
#             output.write(img)
#             cv2.imshow("img", img)
#             if cv2.waitKey(20) == ord('q'):
#                 break
#     cap.release()
#     output.release()
#     cv2.destroyAllWindows()
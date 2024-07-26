import cv2

if __name__ == '__main__':
    # # findball
    cap0 = cv2.VideoCapture("/dev/cam0")
    # jugdeball
    # cap1 = cv2.VideoCapture(2)

    while (1):
    #     ret1,img1 = cap1.read()
        ret0,img0 = cap0.read()
        # cv2.imshow("img1",img1)
        cv2.imshow("img0",img0)
        key = cv2.waitKey(20)
        if key == 27:
            break
    cap0.release()
    # cap1.release()
    cv2.destroyAllWindows()
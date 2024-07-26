;; Auto-generated. Do not edit!


(when (boundp 'yolov5_ros_msgs::Silos)
  (if (not (find-package "YOLOV5_ROS_MSGS"))
    (make-package "YOLOV5_ROS_MSGS"))
  (shadow 'Silos (find-package "YOLOV5_ROS_MSGS")))
(unless (find-package "YOLOV5_ROS_MSGS::SILOS")
  (make-package "YOLOV5_ROS_MSGS::SILOS"))

(in-package "ROS")
;;//! \htmlinclude Silos.msg.html


(defclass yolov5_ros_msgs::Silos
  :super ros::object
  :slots (_a _b _c _d _e ))

(defmethod yolov5_ros_msgs::Silos
  (:init
   (&key
    ((:a __a) "")
    ((:b __b) "")
    ((:c __c) "")
    ((:d __d) "")
    ((:e __e) "")
    )
   (send-super :init)
   (setq _a (string __a))
   (setq _b (string __b))
   (setq _c (string __c))
   (setq _d (string __d))
   (setq _e (string __e))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:c
   (&optional __c)
   (if __c (setq _c __c)) _c)
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:e
   (&optional __e)
   (if __e (setq _e __e)) _e)
  (:serialization-length
   ()
   (+
    ;; string _a
    4 (length _a)
    ;; string _b
    4 (length _b)
    ;; string _c
    4 (length _c)
    ;; string _d
    4 (length _d)
    ;; string _e
    4 (length _e)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _a
       (write-long (length _a) s) (princ _a s)
     ;; string _b
       (write-long (length _b) s) (princ _b s)
     ;; string _c
       (write-long (length _c) s) (princ _c s)
     ;; string _d
       (write-long (length _d) s) (princ _d s)
     ;; string _e
       (write-long (length _e) s) (princ _e s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _a
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _a (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _b
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _b (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _c
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _c (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _d
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _d (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _e
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _e (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get yolov5_ros_msgs::Silos :md5sum-) "e0d20c93acc3618dfe0f15b8b4227da9")
(setf (get yolov5_ros_msgs::Silos :datatype-) "yolov5_ros_msgs/Silos")
(setf (get yolov5_ros_msgs::Silos :definition-)
      "string a
string b
string c
string d
string e
")



(provide :yolov5_ros_msgs/Silos "e0d20c93acc3618dfe0f15b8b4227da9")



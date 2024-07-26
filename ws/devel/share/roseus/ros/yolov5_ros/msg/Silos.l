;; Auto-generated. Do not edit!


(when (boundp 'yolov5_ros::Silos)
  (if (not (find-package "YOLOV5_ROS"))
    (make-package "YOLOV5_ROS"))
  (shadow 'Silos (find-package "YOLOV5_ROS")))
(unless (find-package "YOLOV5_ROS::SILOS")
  (make-package "YOLOV5_ROS::SILOS"))

(in-package "ROS")
;;//! \htmlinclude Silos.msg.html


(defclass yolov5_ros::Silos
  :super ros::object
  :slots (_Silos_data ))

(defmethod yolov5_ros::Silos
  (:init
   (&key
    ((:Silos_data __Silos_data) "")
    )
   (send-super :init)
   (setq _Silos_data (string __Silos_data))
   self)
  (:Silos_data
   (&optional __Silos_data)
   (if __Silos_data (setq _Silos_data __Silos_data)) _Silos_data)
  (:serialization-length
   ()
   (+
    ;; string _Silos_data
    4 (length _Silos_data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _Silos_data
       (write-long (length _Silos_data) s) (princ _Silos_data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _Silos_data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _Silos_data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get yolov5_ros::Silos :md5sum-) "5bb2bb79514f42a3bb9afaa460ea3556")
(setf (get yolov5_ros::Silos :datatype-) "yolov5_ros/Silos")
(setf (get yolov5_ros::Silos :definition-)
      "string Silos_data

")



(provide :yolov5_ros/Silos "5bb2bb79514f42a3bb9afaa460ea3556")



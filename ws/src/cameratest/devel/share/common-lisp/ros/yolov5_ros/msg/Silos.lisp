; Auto-generated. Do not edit!


(cl:in-package yolov5_ros-msg)


;//! \htmlinclude Silos.msg.html

(cl:defclass <Silos> (roslisp-msg-protocol:ros-message)
  ((Silos_data
    :reader Silos_data
    :initarg :Silos_data
    :type cl:string
    :initform ""))
)

(cl:defclass Silos (<Silos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Silos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Silos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yolov5_ros-msg:<Silos> is deprecated: use yolov5_ros-msg:Silos instead.")))

(cl:ensure-generic-function 'Silos_data-val :lambda-list '(m))
(cl:defmethod Silos_data-val ((m <Silos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5_ros-msg:Silos_data-val is deprecated.  Use yolov5_ros-msg:Silos_data instead.")
  (Silos_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Silos>) ostream)
  "Serializes a message object of type '<Silos>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'Silos_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'Silos_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Silos>) istream)
  "Deserializes a message object of type '<Silos>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Silos_data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'Silos_data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Silos>)))
  "Returns string type for a message object of type '<Silos>"
  "yolov5_ros/Silos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Silos)))
  "Returns string type for a message object of type 'Silos"
  "yolov5_ros/Silos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Silos>)))
  "Returns md5sum for a message object of type '<Silos>"
  "5bb2bb79514f42a3bb9afaa460ea3556")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Silos)))
  "Returns md5sum for a message object of type 'Silos"
  "5bb2bb79514f42a3bb9afaa460ea3556")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Silos>)))
  "Returns full string definition for message of type '<Silos>"
  (cl:format cl:nil "string Silos_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Silos)))
  "Returns full string definition for message of type 'Silos"
  (cl:format cl:nil "string Silos_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Silos>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'Silos_data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Silos>))
  "Converts a ROS message object to a list"
  (cl:list 'Silos
    (cl:cons ':Silos_data (Silos_data msg))
))

; Auto-generated. Do not edit!


(cl:in-package yolov5_findball_msgs-msg)


;//! \htmlinclude Silos.msg.html

(cl:defclass <Silos> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass Silos (<Silos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Silos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Silos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yolov5_findball_msgs-msg:<Silos> is deprecated: use yolov5_findball_msgs-msg:Silos instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Silos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5_findball_msgs-msg:x-val is deprecated.  Use yolov5_findball_msgs-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Silos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5_findball_msgs-msg:y-val is deprecated.  Use yolov5_findball_msgs-msg:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Silos>) ostream)
  "Serializes a message object of type '<Silos>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Silos>) istream)
  "Deserializes a message object of type '<Silos>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Silos>)))
  "Returns string type for a message object of type '<Silos>"
  "yolov5_findball_msgs/Silos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Silos)))
  "Returns string type for a message object of type 'Silos"
  "yolov5_findball_msgs/Silos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Silos>)))
  "Returns md5sum for a message object of type '<Silos>"
  "ff8d7d66dd3e4b731ef14a45d38888b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Silos)))
  "Returns md5sum for a message object of type 'Silos"
  "ff8d7d66dd3e4b731ef14a45d38888b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Silos>)))
  "Returns full string definition for message of type '<Silos>"
  (cl:format cl:nil "float32 x~%float32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Silos)))
  "Returns full string definition for message of type 'Silos"
  (cl:format cl:nil "float32 x~%float32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Silos>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Silos>))
  "Converts a ROS message object to a list"
  (cl:list 'Silos
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))

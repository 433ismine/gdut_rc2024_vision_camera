; Auto-generated. Do not edit!


(cl:in-package yolov5_ros_msgs-msg)


;//! \htmlinclude Silos.msg.html

(cl:defclass <Silos> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:string
    :initform "")
   (b
    :reader b
    :initarg :b
    :type cl:string
    :initform "")
   (c
    :reader c
    :initarg :c
    :type cl:string
    :initform "")
   (d
    :reader d
    :initarg :d
    :type cl:string
    :initform "")
   (e
    :reader e
    :initarg :e
    :type cl:string
    :initform ""))
)

(cl:defclass Silos (<Silos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Silos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Silos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yolov5_ros_msgs-msg:<Silos> is deprecated: use yolov5_ros_msgs-msg:Silos instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <Silos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5_ros_msgs-msg:a-val is deprecated.  Use yolov5_ros_msgs-msg:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <Silos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5_ros_msgs-msg:b-val is deprecated.  Use yolov5_ros_msgs-msg:b instead.")
  (b m))

(cl:ensure-generic-function 'c-val :lambda-list '(m))
(cl:defmethod c-val ((m <Silos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5_ros_msgs-msg:c-val is deprecated.  Use yolov5_ros_msgs-msg:c instead.")
  (c m))

(cl:ensure-generic-function 'd-val :lambda-list '(m))
(cl:defmethod d-val ((m <Silos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5_ros_msgs-msg:d-val is deprecated.  Use yolov5_ros_msgs-msg:d instead.")
  (d m))

(cl:ensure-generic-function 'e-val :lambda-list '(m))
(cl:defmethod e-val ((m <Silos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5_ros_msgs-msg:e-val is deprecated.  Use yolov5_ros_msgs-msg:e instead.")
  (e m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Silos>) ostream)
  "Serializes a message object of type '<Silos>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'a))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'a))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'b))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'b))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'c))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'c))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'd))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'e))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'e))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Silos>) istream)
  "Deserializes a message object of type '<Silos>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'a) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'b) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'b) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'c) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'c) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'd) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'd) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'e) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'e) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Silos>)))
  "Returns string type for a message object of type '<Silos>"
  "yolov5_ros_msgs/Silos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Silos)))
  "Returns string type for a message object of type 'Silos"
  "yolov5_ros_msgs/Silos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Silos>)))
  "Returns md5sum for a message object of type '<Silos>"
  "e0d20c93acc3618dfe0f15b8b4227da9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Silos)))
  "Returns md5sum for a message object of type 'Silos"
  "e0d20c93acc3618dfe0f15b8b4227da9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Silos>)))
  "Returns full string definition for message of type '<Silos>"
  (cl:format cl:nil "string a~%string b~%string c~%string d~%string e~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Silos)))
  "Returns full string definition for message of type 'Silos"
  (cl:format cl:nil "string a~%string b~%string c~%string d~%string e~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Silos>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'a))
     4 (cl:length (cl:slot-value msg 'b))
     4 (cl:length (cl:slot-value msg 'c))
     4 (cl:length (cl:slot-value msg 'd))
     4 (cl:length (cl:slot-value msg 'e))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Silos>))
  "Converts a ROS message object to a list"
  (cl:list 'Silos
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
    (cl:cons ':c (c msg))
    (cl:cons ':d (d msg))
    (cl:cons ':e (e msg))
))

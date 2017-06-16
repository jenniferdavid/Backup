; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude Path.msg.html

(cl:defclass <Path> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (container
    :reader container
    :initarg :container
    :type cl:string
    :initform "")
   (goals
    :reader goals
    :initarg :goals
    :type (cl:vector cargo_ants_msgs-msg:Goal)
   :initform (cl:make-array 0 :element-type 'cargo_ants_msgs-msg:Goal :initial-element (cl:make-instance 'cargo_ants_msgs-msg:Goal))))
)

(cl:defclass Path (<Path>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Path>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Path)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<Path> is deprecated: use cargo_ants_msgs-msg:Path instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <Path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:mode-val is deprecated.  Use cargo_ants_msgs-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'container-val :lambda-list '(m))
(cl:defmethod container-val ((m <Path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:container-val is deprecated.  Use cargo_ants_msgs-msg:container instead.")
  (container m))

(cl:ensure-generic-function 'goals-val :lambda-list '(m))
(cl:defmethod goals-val ((m <Path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:goals-val is deprecated.  Use cargo_ants_msgs-msg:goals instead.")
  (goals m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Path>)))
    "Constants for message type '<Path>"
  '((:PICKUP . 0)
    (:PLACEDOWN . 1)
    (:ABORT . 2)
    (:IDLE . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Path)))
    "Constants for message type 'Path"
  '((:PICKUP . 0)
    (:PLACEDOWN . 1)
    (:ABORT . 2)
    (:IDLE . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Path>) ostream)
  "Serializes a message object of type '<Path>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'container))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'container))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'goals))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'goals))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Path>) istream)
  "Deserializes a message object of type '<Path>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'container) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'container) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'goals) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'goals)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cargo_ants_msgs-msg:Goal))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Path>)))
  "Returns string type for a message object of type '<Path>"
  "cargo_ants_msgs/Path")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Path)))
  "Returns string type for a message object of type 'Path"
  "cargo_ants_msgs/Path")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Path>)))
  "Returns md5sum for a message object of type '<Path>"
  "6e7b6f79c7cbe4de3041322b72f3a98b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Path)))
  "Returns md5sum for a message object of type 'Path"
  "6e7b6f79c7cbe4de3041322b72f3a98b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Path>)))
  "Returns full string definition for message of type '<Path>"
  (cl:format cl:nil "uint8 PICKUP=0~%uint8 PLACEDOWN=1~%uint8 ABORT=2~%uint8 IDLE=3~%uint8 mode~%~%string container~%~%Goal[] goals~%~%================================================================================~%MSG: cargo_ants_msgs/Goal~%# A goal is specified as its (gx,gy) coordinate and heading gth (for~%# \"goal theta\"). Additionally, dr is the radial tolerance, and dth the~%# angular tolerance to be achieved. Specifying a negative number for~%# either dr or dth disabled that particular tolerance. Thus, if you do~%# no care about the heading with which you arrive at a goal, specify~%# dth = -1 for example.  The goal message type is intended to be used~%# as part of other messages such as Path.msg, thus we do not include~%# the frame here as that should be the same for an entire array of~%# goals.~%~%float64 gx~%float64 gy~%float64 gth~%~%# Radial accuracy of the goal. Specifying dr <= 0.0 means that you do~%# not care about the goal position at all.~%#~%float64 dr~%~%# Angular accuracy of the goal. Specifying dth <= 0.0 or >= M_PI means~%# that orientation does not matter.~%#~%float64 dth~%~%~%#later? bool go_forward~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Path)))
  "Returns full string definition for message of type 'Path"
  (cl:format cl:nil "uint8 PICKUP=0~%uint8 PLACEDOWN=1~%uint8 ABORT=2~%uint8 IDLE=3~%uint8 mode~%~%string container~%~%Goal[] goals~%~%================================================================================~%MSG: cargo_ants_msgs/Goal~%# A goal is specified as its (gx,gy) coordinate and heading gth (for~%# \"goal theta\"). Additionally, dr is the radial tolerance, and dth the~%# angular tolerance to be achieved. Specifying a negative number for~%# either dr or dth disabled that particular tolerance. Thus, if you do~%# no care about the heading with which you arrive at a goal, specify~%# dth = -1 for example.  The goal message type is intended to be used~%# as part of other messages such as Path.msg, thus we do not include~%# the frame here as that should be the same for an entire array of~%# goals.~%~%float64 gx~%float64 gy~%float64 gth~%~%# Radial accuracy of the goal. Specifying dr <= 0.0 means that you do~%# not care about the goal position at all.~%#~%float64 dr~%~%# Angular accuracy of the goal. Specifying dth <= 0.0 or >= M_PI means~%# that orientation does not matter.~%#~%float64 dth~%~%~%#later? bool go_forward~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Path>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'container))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'goals) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Path>))
  "Converts a ROS message object to a list"
  (cl:list 'Path
    (cl:cons ':mode (mode msg))
    (cl:cons ':container (container msg))
    (cl:cons ':goals (goals msg))
))

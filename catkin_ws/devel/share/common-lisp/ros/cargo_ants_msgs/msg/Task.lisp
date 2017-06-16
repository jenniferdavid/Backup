; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude Task.msg.html

(cl:defclass <Task> (roslisp-msg-protocol:ros-message)
  ((vehicle
    :reader vehicle
    :initarg :vehicle
    :type cl:string
    :initform "")
   (container
    :reader container
    :initarg :container
    :type cl:string
    :initform "")
   (pickup
    :reader pickup
    :initarg :pickup
    :type cargo_ants_msgs-msg:Goal
    :initform (cl:make-instance 'cargo_ants_msgs-msg:Goal))
   (placedown
    :reader placedown
    :initarg :placedown
    :type cargo_ants_msgs-msg:Goal
    :initform (cl:make-instance 'cargo_ants_msgs-msg:Goal)))
)

(cl:defclass Task (<Task>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Task>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Task)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<Task> is deprecated: use cargo_ants_msgs-msg:Task instead.")))

(cl:ensure-generic-function 'vehicle-val :lambda-list '(m))
(cl:defmethod vehicle-val ((m <Task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:vehicle-val is deprecated.  Use cargo_ants_msgs-msg:vehicle instead.")
  (vehicle m))

(cl:ensure-generic-function 'container-val :lambda-list '(m))
(cl:defmethod container-val ((m <Task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:container-val is deprecated.  Use cargo_ants_msgs-msg:container instead.")
  (container m))

(cl:ensure-generic-function 'pickup-val :lambda-list '(m))
(cl:defmethod pickup-val ((m <Task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:pickup-val is deprecated.  Use cargo_ants_msgs-msg:pickup instead.")
  (pickup m))

(cl:ensure-generic-function 'placedown-val :lambda-list '(m))
(cl:defmethod placedown-val ((m <Task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:placedown-val is deprecated.  Use cargo_ants_msgs-msg:placedown instead.")
  (placedown m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Task>) ostream)
  "Serializes a message object of type '<Task>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'vehicle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'vehicle))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'container))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'container))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pickup) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'placedown) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Task>) istream)
  "Deserializes a message object of type '<Task>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vehicle) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'vehicle) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'container) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'container) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pickup) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'placedown) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Task>)))
  "Returns string type for a message object of type '<Task>"
  "cargo_ants_msgs/Task")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Task)))
  "Returns string type for a message object of type 'Task"
  "cargo_ants_msgs/Task")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Task>)))
  "Returns md5sum for a message object of type '<Task>"
  "4de459da6edc0969edecda788239a02b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Task)))
  "Returns md5sum for a message object of type 'Task"
  "4de459da6edc0969edecda788239a02b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Task>)))
  "Returns full string definition for message of type '<Task>"
  (cl:format cl:nil "string vehicle~%string container~%Goal pickup~%Goal placedown~%~%================================================================================~%MSG: cargo_ants_msgs/Goal~%# A goal is specified as its (gx,gy) coordinate and heading gth (for~%# \"goal theta\"). Additionally, dr is the radial tolerance, and dth the~%# angular tolerance to be achieved. Specifying a negative number for~%# either dr or dth disabled that particular tolerance. Thus, if you do~%# no care about the heading with which you arrive at a goal, specify~%# dth = -1 for example.  The goal message type is intended to be used~%# as part of other messages such as Path.msg, thus we do not include~%# the frame here as that should be the same for an entire array of~%# goals.~%~%float64 gx~%float64 gy~%float64 gth~%~%# Radial accuracy of the goal. Specifying dr <= 0.0 means that you do~%# not care about the goal position at all.~%#~%float64 dr~%~%# Angular accuracy of the goal. Specifying dth <= 0.0 or >= M_PI means~%# that orientation does not matter.~%#~%float64 dth~%~%~%#later? bool go_forward~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Task)))
  "Returns full string definition for message of type 'Task"
  (cl:format cl:nil "string vehicle~%string container~%Goal pickup~%Goal placedown~%~%================================================================================~%MSG: cargo_ants_msgs/Goal~%# A goal is specified as its (gx,gy) coordinate and heading gth (for~%# \"goal theta\"). Additionally, dr is the radial tolerance, and dth the~%# angular tolerance to be achieved. Specifying a negative number for~%# either dr or dth disabled that particular tolerance. Thus, if you do~%# no care about the heading with which you arrive at a goal, specify~%# dth = -1 for example.  The goal message type is intended to be used~%# as part of other messages such as Path.msg, thus we do not include~%# the frame here as that should be the same for an entire array of~%# goals.~%~%float64 gx~%float64 gy~%float64 gth~%~%# Radial accuracy of the goal. Specifying dr <= 0.0 means that you do~%# not care about the goal position at all.~%#~%float64 dr~%~%# Angular accuracy of the goal. Specifying dth <= 0.0 or >= M_PI means~%# that orientation does not matter.~%#~%float64 dth~%~%~%#later? bool go_forward~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Task>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'vehicle))
     4 (cl:length (cl:slot-value msg 'container))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pickup))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'placedown))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Task>))
  "Converts a ROS message object to a list"
  (cl:list 'Task
    (cl:cons ':vehicle (vehicle msg))
    (cl:cons ':container (container msg))
    (cl:cons ':pickup (pickup msg))
    (cl:cons ':placedown (placedown msg))
))

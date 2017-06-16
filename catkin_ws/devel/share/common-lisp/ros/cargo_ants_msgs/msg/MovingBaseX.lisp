; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude MovingBaseX.msg.html

(cl:defclass <MovingBaseX> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (sensorId
    :reader sensorId
    :initarg :sensorId
    :type cl:fixnum
    :initform 0)
   (movingBaseId
    :reader movingBaseId
    :initarg :movingBaseId
    :type cl:fixnum
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0))
)

(cl:defclass MovingBaseX (<MovingBaseX>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovingBaseX>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovingBaseX)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<MovingBaseX> is deprecated: use cargo_ants_msgs-msg:MovingBaseX instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MovingBaseX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensorId-val :lambda-list '(m))
(cl:defmethod sensorId-val ((m <MovingBaseX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:sensorId-val is deprecated.  Use cargo_ants_msgs-msg:sensorId instead.")
  (sensorId m))

(cl:ensure-generic-function 'movingBaseId-val :lambda-list '(m))
(cl:defmethod movingBaseId-val ((m <MovingBaseX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:movingBaseId-val is deprecated.  Use cargo_ants_msgs-msg:movingBaseId instead.")
  (movingBaseId m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <MovingBaseX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:x-val is deprecated.  Use cargo_ants_msgs-msg:x instead.")
  (x m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovingBaseX>) ostream)
  "Serializes a message object of type '<MovingBaseX>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'movingBaseId)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovingBaseX>) istream)
  "Deserializes a message object of type '<MovingBaseX>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'movingBaseId)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovingBaseX>)))
  "Returns string type for a message object of type '<MovingBaseX>"
  "cargo_ants_msgs/MovingBaseX")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovingBaseX)))
  "Returns string type for a message object of type 'MovingBaseX"
  "cargo_ants_msgs/MovingBaseX")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovingBaseX>)))
  "Returns md5sum for a message object of type '<MovingBaseX>"
  "2f53e999158461cb2eb8da1fb87a0343")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovingBaseX)))
  "Returns md5sum for a message object of type 'MovingBaseX"
  "2f53e999158461cb2eb8da1fb87a0343")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovingBaseX>)))
  "Returns full string definition for message of type '<MovingBaseX>"
  (cl:format cl:nil "Header header~%~%uint8 sensorId~%~%uint8 movingBaseId~%float32 x~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovingBaseX)))
  "Returns full string definition for message of type 'MovingBaseX"
  (cl:format cl:nil "Header header~%~%uint8 sensorId~%~%uint8 movingBaseId~%float32 x~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovingBaseX>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovingBaseX>))
  "Converts a ROS message object to a list"
  (cl:list 'MovingBaseX
    (cl:cons ':header (header msg))
    (cl:cons ':sensorId (sensorId msg))
    (cl:cons ':movingBaseId (movingBaseId msg))
    (cl:cons ':x (x msg))
))

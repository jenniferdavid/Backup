; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude MovingBasePSIdot.msg.html

(cl:defclass <MovingBasePSIdot> (roslisp-msg-protocol:ros-message)
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
   (psidot
    :reader psidot
    :initarg :psidot
    :type cl:float
    :initform 0.0))
)

(cl:defclass MovingBasePSIdot (<MovingBasePSIdot>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovingBasePSIdot>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovingBasePSIdot)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<MovingBasePSIdot> is deprecated: use cargo_ants_msgs-msg:MovingBasePSIdot instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MovingBasePSIdot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensorId-val :lambda-list '(m))
(cl:defmethod sensorId-val ((m <MovingBasePSIdot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:sensorId-val is deprecated.  Use cargo_ants_msgs-msg:sensorId instead.")
  (sensorId m))

(cl:ensure-generic-function 'movingBaseId-val :lambda-list '(m))
(cl:defmethod movingBaseId-val ((m <MovingBasePSIdot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:movingBaseId-val is deprecated.  Use cargo_ants_msgs-msg:movingBaseId instead.")
  (movingBaseId m))

(cl:ensure-generic-function 'psidot-val :lambda-list '(m))
(cl:defmethod psidot-val ((m <MovingBasePSIdot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:psidot-val is deprecated.  Use cargo_ants_msgs-msg:psidot instead.")
  (psidot m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovingBasePSIdot>) ostream)
  "Serializes a message object of type '<MovingBasePSIdot>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'movingBaseId)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'psidot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovingBasePSIdot>) istream)
  "Deserializes a message object of type '<MovingBasePSIdot>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'movingBaseId)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'psidot) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovingBasePSIdot>)))
  "Returns string type for a message object of type '<MovingBasePSIdot>"
  "cargo_ants_msgs/MovingBasePSIdot")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovingBasePSIdot)))
  "Returns string type for a message object of type 'MovingBasePSIdot"
  "cargo_ants_msgs/MovingBasePSIdot")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovingBasePSIdot>)))
  "Returns md5sum for a message object of type '<MovingBasePSIdot>"
  "a963fdde93e925b0b7c35bb709926f45")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovingBasePSIdot)))
  "Returns md5sum for a message object of type 'MovingBasePSIdot"
  "a963fdde93e925b0b7c35bb709926f45")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovingBasePSIdot>)))
  "Returns full string definition for message of type '<MovingBasePSIdot>"
  (cl:format cl:nil "Header header~%~%uint8 sensorId~%~%uint8 movingBaseId~%float32 psidot~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovingBasePSIdot)))
  "Returns full string definition for message of type 'MovingBasePSIdot"
  (cl:format cl:nil "Header header~%~%uint8 sensorId~%~%uint8 movingBaseId~%float32 psidot~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovingBasePSIdot>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovingBasePSIdot>))
  "Converts a ROS message object to a list"
  (cl:list 'MovingBasePSIdot
    (cl:cons ':header (header msg))
    (cl:cons ':sensorId (sensorId msg))
    (cl:cons ':movingBaseId (movingBaseId msg))
    (cl:cons ':psidot (psidot msg))
))

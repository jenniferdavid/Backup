; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude OxtsVelocity.msg.html

(cl:defclass <OxtsVelocity> (roslisp-msg-protocol:ros-message)
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
   (vnorth
    :reader vnorth
    :initarg :vnorth
    :type cl:float
    :initform 0.0)
   (veast
    :reader veast
    :initarg :veast
    :type cl:float
    :initform 0.0)
   (vdown
    :reader vdown
    :initarg :vdown
    :type cl:float
    :initform 0.0)
   (speed2d
    :reader speed2d
    :initarg :speed2d
    :type cl:float
    :initform 0.0))
)

(cl:defclass OxtsVelocity (<OxtsVelocity>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OxtsVelocity>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OxtsVelocity)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<OxtsVelocity> is deprecated: use cargo_ants_msgs-msg:OxtsVelocity instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <OxtsVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensorId-val :lambda-list '(m))
(cl:defmethod sensorId-val ((m <OxtsVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:sensorId-val is deprecated.  Use cargo_ants_msgs-msg:sensorId instead.")
  (sensorId m))

(cl:ensure-generic-function 'vnorth-val :lambda-list '(m))
(cl:defmethod vnorth-val ((m <OxtsVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:vnorth-val is deprecated.  Use cargo_ants_msgs-msg:vnorth instead.")
  (vnorth m))

(cl:ensure-generic-function 'veast-val :lambda-list '(m))
(cl:defmethod veast-val ((m <OxtsVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:veast-val is deprecated.  Use cargo_ants_msgs-msg:veast instead.")
  (veast m))

(cl:ensure-generic-function 'vdown-val :lambda-list '(m))
(cl:defmethod vdown-val ((m <OxtsVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:vdown-val is deprecated.  Use cargo_ants_msgs-msg:vdown instead.")
  (vdown m))

(cl:ensure-generic-function 'speed2d-val :lambda-list '(m))
(cl:defmethod speed2d-val ((m <OxtsVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:speed2d-val is deprecated.  Use cargo_ants_msgs-msg:speed2d instead.")
  (speed2d m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OxtsVelocity>) ostream)
  "Serializes a message object of type '<OxtsVelocity>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vnorth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'veast))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vdown))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed2d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OxtsVelocity>) istream)
  "Deserializes a message object of type '<OxtsVelocity>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vnorth) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'veast) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vdown) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed2d) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OxtsVelocity>)))
  "Returns string type for a message object of type '<OxtsVelocity>"
  "cargo_ants_msgs/OxtsVelocity")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OxtsVelocity)))
  "Returns string type for a message object of type 'OxtsVelocity"
  "cargo_ants_msgs/OxtsVelocity")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OxtsVelocity>)))
  "Returns md5sum for a message object of type '<OxtsVelocity>"
  "5446c11a8e6f6eeb85446be813a6f904")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OxtsVelocity)))
  "Returns md5sum for a message object of type 'OxtsVelocity"
  "5446c11a8e6f6eeb85446be813a6f904")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OxtsVelocity>)))
  "Returns full string definition for message of type '<OxtsVelocity>"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%~%uint8 sensorId    # id of sensor~%~%float32 vnorth~%float32 veast~%float32 vdown~%float32 speed2d~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OxtsVelocity)))
  "Returns full string definition for message of type 'OxtsVelocity"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%~%uint8 sensorId    # id of sensor~%~%float32 vnorth~%float32 veast~%float32 vdown~%float32 speed2d~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OxtsVelocity>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OxtsVelocity>))
  "Converts a ROS message object to a list"
  (cl:list 'OxtsVelocity
    (cl:cons ':header (header msg))
    (cl:cons ':sensorId (sensorId msg))
    (cl:cons ':vnorth (vnorth msg))
    (cl:cons ':veast (veast msg))
    (cl:cons ':vdown (vdown msg))
    (cl:cons ':speed2d (speed2d msg))
))

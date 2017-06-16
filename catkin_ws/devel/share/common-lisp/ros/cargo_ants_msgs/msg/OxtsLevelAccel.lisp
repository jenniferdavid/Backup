; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude OxtsLevelAccel.msg.html

(cl:defclass <OxtsLevelAccel> (roslisp-msg-protocol:ros-message)
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
   (accelforw
    :reader accelforw
    :initarg :accelforw
    :type cl:float
    :initform 0.0)
   (accellat
    :reader accellat
    :initarg :accellat
    :type cl:float
    :initform 0.0)
   (acceldown
    :reader acceldown
    :initarg :acceldown
    :type cl:float
    :initform 0.0)
   (accelslip
    :reader accelslip
    :initarg :accelslip
    :type cl:float
    :initform 0.0))
)

(cl:defclass OxtsLevelAccel (<OxtsLevelAccel>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OxtsLevelAccel>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OxtsLevelAccel)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<OxtsLevelAccel> is deprecated: use cargo_ants_msgs-msg:OxtsLevelAccel instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <OxtsLevelAccel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensorId-val :lambda-list '(m))
(cl:defmethod sensorId-val ((m <OxtsLevelAccel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:sensorId-val is deprecated.  Use cargo_ants_msgs-msg:sensorId instead.")
  (sensorId m))

(cl:ensure-generic-function 'accelforw-val :lambda-list '(m))
(cl:defmethod accelforw-val ((m <OxtsLevelAccel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:accelforw-val is deprecated.  Use cargo_ants_msgs-msg:accelforw instead.")
  (accelforw m))

(cl:ensure-generic-function 'accellat-val :lambda-list '(m))
(cl:defmethod accellat-val ((m <OxtsLevelAccel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:accellat-val is deprecated.  Use cargo_ants_msgs-msg:accellat instead.")
  (accellat m))

(cl:ensure-generic-function 'acceldown-val :lambda-list '(m))
(cl:defmethod acceldown-val ((m <OxtsLevelAccel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:acceldown-val is deprecated.  Use cargo_ants_msgs-msg:acceldown instead.")
  (acceldown m))

(cl:ensure-generic-function 'accelslip-val :lambda-list '(m))
(cl:defmethod accelslip-val ((m <OxtsLevelAccel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:accelslip-val is deprecated.  Use cargo_ants_msgs-msg:accelslip instead.")
  (accelslip m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OxtsLevelAccel>) ostream)
  "Serializes a message object of type '<OxtsLevelAccel>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accelforw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accellat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acceldown))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accelslip))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OxtsLevelAccel>) istream)
  "Deserializes a message object of type '<OxtsLevelAccel>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accelforw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accellat) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acceldown) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accelslip) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OxtsLevelAccel>)))
  "Returns string type for a message object of type '<OxtsLevelAccel>"
  "cargo_ants_msgs/OxtsLevelAccel")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OxtsLevelAccel)))
  "Returns string type for a message object of type 'OxtsLevelAccel"
  "cargo_ants_msgs/OxtsLevelAccel")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OxtsLevelAccel>)))
  "Returns md5sum for a message object of type '<OxtsLevelAccel>"
  "9f181871f848b178c4469db537c7b5e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OxtsLevelAccel)))
  "Returns md5sum for a message object of type 'OxtsLevelAccel"
  "9f181871f848b178c4469db537c7b5e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OxtsLevelAccel>)))
  "Returns full string definition for message of type '<OxtsLevelAccel>"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%~%uint8 sensorId    # id of sensor~%~%float32 accelforw~%float32 accellat~%float32 acceldown~%float32 accelslip~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OxtsLevelAccel)))
  "Returns full string definition for message of type 'OxtsLevelAccel"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%~%uint8 sensorId    # id of sensor~%~%float32 accelforw~%float32 accellat~%float32 acceldown~%float32 accelslip~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OxtsLevelAccel>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OxtsLevelAccel>))
  "Converts a ROS message object to a list"
  (cl:list 'OxtsLevelAccel
    (cl:cons ':header (header msg))
    (cl:cons ':sensorId (sensorId msg))
    (cl:cons ':accelforw (accelforw msg))
    (cl:cons ':accellat (accellat msg))
    (cl:cons ':acceldown (acceldown msg))
    (cl:cons ':accelslip (accelslip msg))
))

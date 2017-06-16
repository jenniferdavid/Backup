; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude OxtsBodyAcceleration.msg.html

(cl:defclass <OxtsBodyAcceleration> (roslisp-msg-protocol:ros-message)
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
   (accelx
    :reader accelx
    :initarg :accelx
    :type cl:float
    :initform 0.0)
   (accely
    :reader accely
    :initarg :accely
    :type cl:float
    :initform 0.0)
   (accelz
    :reader accelz
    :initarg :accelz
    :type cl:float
    :initform 0.0))
)

(cl:defclass OxtsBodyAcceleration (<OxtsBodyAcceleration>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OxtsBodyAcceleration>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OxtsBodyAcceleration)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<OxtsBodyAcceleration> is deprecated: use cargo_ants_msgs-msg:OxtsBodyAcceleration instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <OxtsBodyAcceleration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensorId-val :lambda-list '(m))
(cl:defmethod sensorId-val ((m <OxtsBodyAcceleration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:sensorId-val is deprecated.  Use cargo_ants_msgs-msg:sensorId instead.")
  (sensorId m))

(cl:ensure-generic-function 'accelx-val :lambda-list '(m))
(cl:defmethod accelx-val ((m <OxtsBodyAcceleration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:accelx-val is deprecated.  Use cargo_ants_msgs-msg:accelx instead.")
  (accelx m))

(cl:ensure-generic-function 'accely-val :lambda-list '(m))
(cl:defmethod accely-val ((m <OxtsBodyAcceleration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:accely-val is deprecated.  Use cargo_ants_msgs-msg:accely instead.")
  (accely m))

(cl:ensure-generic-function 'accelz-val :lambda-list '(m))
(cl:defmethod accelz-val ((m <OxtsBodyAcceleration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:accelz-val is deprecated.  Use cargo_ants_msgs-msg:accelz instead.")
  (accelz m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OxtsBodyAcceleration>) ostream)
  "Serializes a message object of type '<OxtsBodyAcceleration>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accelx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accely))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accelz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OxtsBodyAcceleration>) istream)
  "Deserializes a message object of type '<OxtsBodyAcceleration>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accelx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accely) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accelz) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OxtsBodyAcceleration>)))
  "Returns string type for a message object of type '<OxtsBodyAcceleration>"
  "cargo_ants_msgs/OxtsBodyAcceleration")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OxtsBodyAcceleration)))
  "Returns string type for a message object of type 'OxtsBodyAcceleration"
  "cargo_ants_msgs/OxtsBodyAcceleration")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OxtsBodyAcceleration>)))
  "Returns md5sum for a message object of type '<OxtsBodyAcceleration>"
  "fa4cc50be36e886fccdf6629b44af978")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OxtsBodyAcceleration)))
  "Returns md5sum for a message object of type 'OxtsBodyAcceleration"
  "fa4cc50be36e886fccdf6629b44af978")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OxtsBodyAcceleration>)))
  "Returns full string definition for message of type '<OxtsBodyAcceleration>"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%~%uint8 sensorId    # id of sensor~%~%float32 accelx~%float32 accely~%float32 accelz~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OxtsBodyAcceleration)))
  "Returns full string definition for message of type 'OxtsBodyAcceleration"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%~%uint8 sensorId    # id of sensor~%~%float32 accelx~%float32 accely~%float32 accelz~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OxtsBodyAcceleration>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OxtsBodyAcceleration>))
  "Converts a ROS message object to a list"
  (cl:list 'OxtsBodyAcceleration
    (cl:cons ':header (header msg))
    (cl:cons ':sensorId (sensorId msg))
    (cl:cons ':accelx (accelx msg))
    (cl:cons ':accely (accely msg))
    (cl:cons ':accelz (accelz msg))
))

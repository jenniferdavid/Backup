; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude RadarCluster209.msg.html

(cl:defclass <RadarCluster209> (roslisp-msg-protocol:ros-message)
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
   (azimut
    :reader azimut
    :initarg :azimut
    :type cl:float
    :initform 0.0)
   (index
    :reader index
    :initarg :index
    :type cl:fixnum
    :initform 0)
   (rollcount
    :reader rollcount
    :initarg :rollcount
    :type cl:fixnum
    :initform 0)
   (range
    :reader range
    :initarg :range
    :type cl:float
    :initform 0.0)
   (rcs
    :reader rcs
    :initarg :rcs
    :type cl:float
    :initform 0.0)
   (vrel
    :reader vrel
    :initarg :vrel
    :type cl:float
    :initform 0.0))
)

(cl:defclass RadarCluster209 (<RadarCluster209>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarCluster209>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarCluster209)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<RadarCluster209> is deprecated: use cargo_ants_msgs-msg:RadarCluster209 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RadarCluster209>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensorId-val :lambda-list '(m))
(cl:defmethod sensorId-val ((m <RadarCluster209>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:sensorId-val is deprecated.  Use cargo_ants_msgs-msg:sensorId instead.")
  (sensorId m))

(cl:ensure-generic-function 'azimut-val :lambda-list '(m))
(cl:defmethod azimut-val ((m <RadarCluster209>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:azimut-val is deprecated.  Use cargo_ants_msgs-msg:azimut instead.")
  (azimut m))

(cl:ensure-generic-function 'index-val :lambda-list '(m))
(cl:defmethod index-val ((m <RadarCluster209>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:index-val is deprecated.  Use cargo_ants_msgs-msg:index instead.")
  (index m))

(cl:ensure-generic-function 'rollcount-val :lambda-list '(m))
(cl:defmethod rollcount-val ((m <RadarCluster209>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:rollcount-val is deprecated.  Use cargo_ants_msgs-msg:rollcount instead.")
  (rollcount m))

(cl:ensure-generic-function 'range-val :lambda-list '(m))
(cl:defmethod range-val ((m <RadarCluster209>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:range-val is deprecated.  Use cargo_ants_msgs-msg:range instead.")
  (range m))

(cl:ensure-generic-function 'rcs-val :lambda-list '(m))
(cl:defmethod rcs-val ((m <RadarCluster209>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:rcs-val is deprecated.  Use cargo_ants_msgs-msg:rcs instead.")
  (rcs m))

(cl:ensure-generic-function 'vrel-val :lambda-list '(m))
(cl:defmethod vrel-val ((m <RadarCluster209>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:vrel-val is deprecated.  Use cargo_ants_msgs-msg:vrel instead.")
  (vrel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarCluster209>) ostream)
  "Serializes a message object of type '<RadarCluster209>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sensorId)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'azimut))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rollcount)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rcs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vrel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarCluster209>) istream)
  "Deserializes a message object of type '<RadarCluster209>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sensorId)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'azimut) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rollcount)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rcs) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vrel) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarCluster209>)))
  "Returns string type for a message object of type '<RadarCluster209>"
  "cargo_ants_msgs/RadarCluster209")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarCluster209)))
  "Returns string type for a message object of type 'RadarCluster209"
  "cargo_ants_msgs/RadarCluster209")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarCluster209>)))
  "Returns md5sum for a message object of type '<RadarCluster209>"
  "b05b5bcee056cb422fac5d2f0c7fc3a2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarCluster209)))
  "Returns md5sum for a message object of type 'RadarCluster209"
  "b05b5bcee056cb422fac5d2f0c7fc3a2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarCluster209>)))
  "Returns full string definition for message of type '<RadarCluster209>"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%uint16 sensorId                         ~%float32 azimut     # azimut [rad]~%uint8 index         # track index~%uint8 rollcount     # sequence index~%float32 range      # range [m]~%float32 rcs        # radar cross-section [dBm^2]~%float32 vrel       # relative velocity [m/s]~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarCluster209)))
  "Returns full string definition for message of type 'RadarCluster209"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%uint16 sensorId                         ~%float32 azimut     # azimut [rad]~%uint8 index         # track index~%uint8 rollcount     # sequence index~%float32 range      # range [m]~%float32 rcs        # radar cross-section [dBm^2]~%float32 vrel       # relative velocity [m/s]~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarCluster209>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     4
     1
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarCluster209>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarCluster209
    (cl:cons ':header (header msg))
    (cl:cons ':sensorId (sensorId msg))
    (cl:cons ':azimut (azimut msg))
    (cl:cons ':index (index msg))
    (cl:cons ':rollcount (rollcount msg))
    (cl:cons ':range (range msg))
    (cl:cons ':rcs (rcs msg))
    (cl:cons ':vrel (vrel msg))
))

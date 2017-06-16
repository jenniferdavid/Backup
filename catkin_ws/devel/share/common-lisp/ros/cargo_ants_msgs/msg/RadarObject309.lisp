; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude RadarObject309.msg.html

(cl:defclass <RadarObject309> (roslisp-msg-protocol:ros-message)
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
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (length
    :reader length
    :initarg :length
    :type cl:fixnum
    :initform 0)
   (width
    :reader width
    :initarg :width
    :type cl:fixnum
    :initform 0)
   (measstat
    :reader measstat
    :initarg :measstat
    :type cl:fixnum
    :initform 0)
   (existprob
    :reader existprob
    :initarg :existprob
    :type cl:fixnum
    :initform 0)
   (dynprop
    :reader dynprop
    :initarg :dynprop
    :type cl:fixnum
    :initform 0)
   (latdisp
    :reader latdisp
    :initarg :latdisp
    :type cl:float
    :initform 0.0)
   (longdisp
    :reader longdisp
    :initarg :longdisp
    :type cl:float
    :initform 0.0)
   (relxdot
    :reader relxdot
    :initarg :relxdot
    :type cl:float
    :initform 0.0)
   (relxddot
    :reader relxddot
    :initarg :relxddot
    :type cl:float
    :initform 0.0)
   (latspeed
    :reader latspeed
    :initarg :latspeed
    :type cl:float
    :initform 0.0)
   (obsprob
    :reader obsprob
    :initarg :obsprob
    :type cl:fixnum
    :initform 0)
   (rollcount
    :reader rollcount
    :initarg :rollcount
    :type cl:fixnum
    :initform 0)
   (rcs
    :reader rcs
    :initarg :rcs
    :type cl:float
    :initform 0.0))
)

(cl:defclass RadarObject309 (<RadarObject309>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarObject309>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarObject309)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<RadarObject309> is deprecated: use cargo_ants_msgs-msg:RadarObject309 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensorId-val :lambda-list '(m))
(cl:defmethod sensorId-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:sensorId-val is deprecated.  Use cargo_ants_msgs-msg:sensorId instead.")
  (sensorId m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:id-val is deprecated.  Use cargo_ants_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:length-val is deprecated.  Use cargo_ants_msgs-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:width-val is deprecated.  Use cargo_ants_msgs-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'measstat-val :lambda-list '(m))
(cl:defmethod measstat-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:measstat-val is deprecated.  Use cargo_ants_msgs-msg:measstat instead.")
  (measstat m))

(cl:ensure-generic-function 'existprob-val :lambda-list '(m))
(cl:defmethod existprob-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:existprob-val is deprecated.  Use cargo_ants_msgs-msg:existprob instead.")
  (existprob m))

(cl:ensure-generic-function 'dynprop-val :lambda-list '(m))
(cl:defmethod dynprop-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:dynprop-val is deprecated.  Use cargo_ants_msgs-msg:dynprop instead.")
  (dynprop m))

(cl:ensure-generic-function 'latdisp-val :lambda-list '(m))
(cl:defmethod latdisp-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:latdisp-val is deprecated.  Use cargo_ants_msgs-msg:latdisp instead.")
  (latdisp m))

(cl:ensure-generic-function 'longdisp-val :lambda-list '(m))
(cl:defmethod longdisp-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:longdisp-val is deprecated.  Use cargo_ants_msgs-msg:longdisp instead.")
  (longdisp m))

(cl:ensure-generic-function 'relxdot-val :lambda-list '(m))
(cl:defmethod relxdot-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:relxdot-val is deprecated.  Use cargo_ants_msgs-msg:relxdot instead.")
  (relxdot m))

(cl:ensure-generic-function 'relxddot-val :lambda-list '(m))
(cl:defmethod relxddot-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:relxddot-val is deprecated.  Use cargo_ants_msgs-msg:relxddot instead.")
  (relxddot m))

(cl:ensure-generic-function 'latspeed-val :lambda-list '(m))
(cl:defmethod latspeed-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:latspeed-val is deprecated.  Use cargo_ants_msgs-msg:latspeed instead.")
  (latspeed m))

(cl:ensure-generic-function 'obsprob-val :lambda-list '(m))
(cl:defmethod obsprob-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:obsprob-val is deprecated.  Use cargo_ants_msgs-msg:obsprob instead.")
  (obsprob m))

(cl:ensure-generic-function 'rollcount-val :lambda-list '(m))
(cl:defmethod rollcount-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:rollcount-val is deprecated.  Use cargo_ants_msgs-msg:rollcount instead.")
  (rollcount m))

(cl:ensure-generic-function 'rcs-val :lambda-list '(m))
(cl:defmethod rcs-val ((m <RadarObject309>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:rcs-val is deprecated.  Use cargo_ants_msgs-msg:rcs instead.")
  (rcs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarObject309>) ostream)
  "Serializes a message object of type '<RadarObject309>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sensorId)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'measstat)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'existprob)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dynprop)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'latdisp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'longdisp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'relxdot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'relxddot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'latspeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'obsprob)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rollcount)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rcs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarObject309>) istream)
  "Deserializes a message object of type '<RadarObject309>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sensorId)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'measstat)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'existprob)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dynprop)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latdisp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longdisp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'relxdot) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'relxddot) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latspeed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'obsprob)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rollcount)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rcs) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarObject309>)))
  "Returns string type for a message object of type '<RadarObject309>"
  "cargo_ants_msgs/RadarObject309")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarObject309)))
  "Returns string type for a message object of type 'RadarObject309"
  "cargo_ants_msgs/RadarObject309")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarObject309>)))
  "Returns md5sum for a message object of type '<RadarObject309>"
  "76fed16b7785e460fd093bca4f70098c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarObject309)))
  "Returns md5sum for a message object of type 'RadarObject309"
  "76fed16b7785e460fd093bca4f70098c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarObject309>)))
  "Returns full string definition for message of type '<RadarObject309>"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%~%uint16 sensorId ~%uint8 id				# object id~%uint8 length			# object length: 0-unknown, 1-<0.5m, 2-<2m, 3-<4m, 4-<6m, 5-<10m, 6-<20m, 7-exceeds 20m~%uint8 width				# object width: 0-unknown, 1-<0.5m (pedestrian), 2-<1m (bike), 3-<2m (car), ~%					 	#			4-<3m (truck), 5-<4m, 6-<6m, 7-exceeds 6m~%uint8 measstat			# measurement status: 0-no object, 1-new object, 2-object not measured, 3-object measured~%uint8 existprob			# probability of existance: 0-invalid, 1-<25%, 2-<50%, 3-<75%, ~%						#			4-<90%, 5-<99%, 6-<99.9%, 7-<99.99%~%uint8 dynprop			# dynamic property: 0-unclassified, 1-standing, 2-stopped, 3-moving, 4-oncoming~%float32 latdisp			# lateral displacement [m]~%float32 longdisp		# longitudinal displacement	[m]~%float32 relxdot			# relative longitudinal speed [m/s]~%float32 relxddot		# relative longitudinal acceleration [m/s^2]~%float32 latspeed		# lateral velocity [m/s], value negative->object moves left to right~%uint8 obsprob			# probabilty that the object is an obstacle [%]~%uint8 rollcount			# sequence index~%float32 rcs				# radar cross-section [dBm^2]~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarObject309)))
  "Returns full string definition for message of type 'RadarObject309"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%~%uint16 sensorId ~%uint8 id				# object id~%uint8 length			# object length: 0-unknown, 1-<0.5m, 2-<2m, 3-<4m, 4-<6m, 5-<10m, 6-<20m, 7-exceeds 20m~%uint8 width				# object width: 0-unknown, 1-<0.5m (pedestrian), 2-<1m (bike), 3-<2m (car), ~%					 	#			4-<3m (truck), 5-<4m, 6-<6m, 7-exceeds 6m~%uint8 measstat			# measurement status: 0-no object, 1-new object, 2-object not measured, 3-object measured~%uint8 existprob			# probability of existance: 0-invalid, 1-<25%, 2-<50%, 3-<75%, ~%						#			4-<90%, 5-<99%, 6-<99.9%, 7-<99.99%~%uint8 dynprop			# dynamic property: 0-unclassified, 1-standing, 2-stopped, 3-moving, 4-oncoming~%float32 latdisp			# lateral displacement [m]~%float32 longdisp		# longitudinal displacement	[m]~%float32 relxdot			# relative longitudinal speed [m/s]~%float32 relxddot		# relative longitudinal acceleration [m/s^2]~%float32 latspeed		# lateral velocity [m/s], value negative->object moves left to right~%uint8 obsprob			# probabilty that the object is an obstacle [%]~%uint8 rollcount			# sequence index~%float32 rcs				# radar cross-section [dBm^2]~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarObject309>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     1
     1
     1
     1
     1
     1
     4
     4
     4
     4
     4
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarObject309>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarObject309
    (cl:cons ':header (header msg))
    (cl:cons ':sensorId (sensorId msg))
    (cl:cons ':id (id msg))
    (cl:cons ':length (length msg))
    (cl:cons ':width (width msg))
    (cl:cons ':measstat (measstat msg))
    (cl:cons ':existprob (existprob msg))
    (cl:cons ':dynprop (dynprop msg))
    (cl:cons ':latdisp (latdisp msg))
    (cl:cons ':longdisp (longdisp msg))
    (cl:cons ':relxdot (relxdot msg))
    (cl:cons ':relxddot (relxddot msg))
    (cl:cons ':latspeed (latspeed msg))
    (cl:cons ':obsprob (obsprob msg))
    (cl:cons ':rollcount (rollcount msg))
    (cl:cons ':rcs (rcs msg))
))

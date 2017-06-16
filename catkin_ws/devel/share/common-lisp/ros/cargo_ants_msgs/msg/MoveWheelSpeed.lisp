; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude MoveWheelSpeed.msg.html

(cl:defclass <MoveWheelSpeed> (roslisp-msg-protocol:ros-message)
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
   (vx_wheel_fl
    :reader vx_wheel_fl
    :initarg :vx_wheel_fl
    :type cl:float
    :initform 0.0)
   (vx_wheel_fr
    :reader vx_wheel_fr
    :initarg :vx_wheel_fr
    :type cl:float
    :initform 0.0)
   (vx_wheel_rl
    :reader vx_wheel_rl
    :initarg :vx_wheel_rl
    :type cl:float
    :initform 0.0)
   (vx_wheel_rr
    :reader vx_wheel_rr
    :initarg :vx_wheel_rr
    :type cl:float
    :initform 0.0))
)

(cl:defclass MoveWheelSpeed (<MoveWheelSpeed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveWheelSpeed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveWheelSpeed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<MoveWheelSpeed> is deprecated: use cargo_ants_msgs-msg:MoveWheelSpeed instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MoveWheelSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensorId-val :lambda-list '(m))
(cl:defmethod sensorId-val ((m <MoveWheelSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:sensorId-val is deprecated.  Use cargo_ants_msgs-msg:sensorId instead.")
  (sensorId m))

(cl:ensure-generic-function 'vx_wheel_fl-val :lambda-list '(m))
(cl:defmethod vx_wheel_fl-val ((m <MoveWheelSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:vx_wheel_fl-val is deprecated.  Use cargo_ants_msgs-msg:vx_wheel_fl instead.")
  (vx_wheel_fl m))

(cl:ensure-generic-function 'vx_wheel_fr-val :lambda-list '(m))
(cl:defmethod vx_wheel_fr-val ((m <MoveWheelSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:vx_wheel_fr-val is deprecated.  Use cargo_ants_msgs-msg:vx_wheel_fr instead.")
  (vx_wheel_fr m))

(cl:ensure-generic-function 'vx_wheel_rl-val :lambda-list '(m))
(cl:defmethod vx_wheel_rl-val ((m <MoveWheelSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:vx_wheel_rl-val is deprecated.  Use cargo_ants_msgs-msg:vx_wheel_rl instead.")
  (vx_wheel_rl m))

(cl:ensure-generic-function 'vx_wheel_rr-val :lambda-list '(m))
(cl:defmethod vx_wheel_rr-val ((m <MoveWheelSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:vx_wheel_rr-val is deprecated.  Use cargo_ants_msgs-msg:vx_wheel_rr instead.")
  (vx_wheel_rr m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveWheelSpeed>) ostream)
  "Serializes a message object of type '<MoveWheelSpeed>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vx_wheel_fl))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vx_wheel_fr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vx_wheel_rl))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vx_wheel_rr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveWheelSpeed>) istream)
  "Deserializes a message object of type '<MoveWheelSpeed>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vx_wheel_fl) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vx_wheel_fr) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vx_wheel_rl) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vx_wheel_rr) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveWheelSpeed>)))
  "Returns string type for a message object of type '<MoveWheelSpeed>"
  "cargo_ants_msgs/MoveWheelSpeed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveWheelSpeed)))
  "Returns string type for a message object of type 'MoveWheelSpeed"
  "cargo_ants_msgs/MoveWheelSpeed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveWheelSpeed>)))
  "Returns md5sum for a message object of type '<MoveWheelSpeed>"
  "13ea57566de07b26f1bbb1cc7d236b65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveWheelSpeed)))
  "Returns md5sum for a message object of type 'MoveWheelSpeed"
  "13ea57566de07b26f1bbb1cc7d236b65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveWheelSpeed>)))
  "Returns full string definition for message of type '<MoveWheelSpeed>"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%~%uint8 sensorId    # id of sensor~%~%float32 vx_wheel_fl     # vehicle speed - front left wheel~%float32 vx_wheel_fr     # vehicle speed - front right wheel~%float32 vx_wheel_rl     # vehicle speed - rear left wheel~%float32 vx_wheel_rr     # vehicle speed - rear right wheel~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveWheelSpeed)))
  "Returns full string definition for message of type 'MoveWheelSpeed"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%~%uint8 sensorId    # id of sensor~%~%float32 vx_wheel_fl     # vehicle speed - front left wheel~%float32 vx_wheel_fr     # vehicle speed - front right wheel~%float32 vx_wheel_rl     # vehicle speed - rear left wheel~%float32 vx_wheel_rr     # vehicle speed - rear right wheel~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveWheelSpeed>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveWheelSpeed>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveWheelSpeed
    (cl:cons ':header (header msg))
    (cl:cons ':sensorId (sensorId msg))
    (cl:cons ':vx_wheel_fl (vx_wheel_fl msg))
    (cl:cons ':vx_wheel_fr (vx_wheel_fr msg))
    (cl:cons ':vx_wheel_rl (vx_wheel_rl msg))
    (cl:cons ':vx_wheel_rr (vx_wheel_rr msg))
))

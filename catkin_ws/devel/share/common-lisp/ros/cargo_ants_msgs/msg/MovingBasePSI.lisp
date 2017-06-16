; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude MovingBasePSI.msg.html

(cl:defclass <MovingBasePSI> (roslisp-msg-protocol:ros-message)
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
   (psi
    :reader psi
    :initarg :psi
    :type cl:float
    :initform 0.0))
)

(cl:defclass MovingBasePSI (<MovingBasePSI>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovingBasePSI>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovingBasePSI)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<MovingBasePSI> is deprecated: use cargo_ants_msgs-msg:MovingBasePSI instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MovingBasePSI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensorId-val :lambda-list '(m))
(cl:defmethod sensorId-val ((m <MovingBasePSI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:sensorId-val is deprecated.  Use cargo_ants_msgs-msg:sensorId instead.")
  (sensorId m))

(cl:ensure-generic-function 'movingBaseId-val :lambda-list '(m))
(cl:defmethod movingBaseId-val ((m <MovingBasePSI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:movingBaseId-val is deprecated.  Use cargo_ants_msgs-msg:movingBaseId instead.")
  (movingBaseId m))

(cl:ensure-generic-function 'psi-val :lambda-list '(m))
(cl:defmethod psi-val ((m <MovingBasePSI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:psi-val is deprecated.  Use cargo_ants_msgs-msg:psi instead.")
  (psi m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovingBasePSI>) ostream)
  "Serializes a message object of type '<MovingBasePSI>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'movingBaseId)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'psi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovingBasePSI>) istream)
  "Deserializes a message object of type '<MovingBasePSI>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'movingBaseId)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'psi) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovingBasePSI>)))
  "Returns string type for a message object of type '<MovingBasePSI>"
  "cargo_ants_msgs/MovingBasePSI")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovingBasePSI)))
  "Returns string type for a message object of type 'MovingBasePSI"
  "cargo_ants_msgs/MovingBasePSI")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovingBasePSI>)))
  "Returns md5sum for a message object of type '<MovingBasePSI>"
  "8ffb922c0038cb0e6aa579822f097e71")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovingBasePSI)))
  "Returns md5sum for a message object of type 'MovingBasePSI"
  "8ffb922c0038cb0e6aa579822f097e71")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovingBasePSI>)))
  "Returns full string definition for message of type '<MovingBasePSI>"
  (cl:format cl:nil "Header header~%~%uint8 sensorId~%~%uint8 movingBaseId~%float32 psi~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovingBasePSI)))
  "Returns full string definition for message of type 'MovingBasePSI"
  (cl:format cl:nil "Header header~%~%uint8 sensorId~%~%uint8 movingBaseId~%float32 psi~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovingBasePSI>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovingBasePSI>))
  "Converts a ROS message object to a list"
  (cl:list 'MovingBasePSI
    (cl:cons ':header (header msg))
    (cl:cons ':sensorId (sensorId msg))
    (cl:cons ':movingBaseId (movingBaseId msg))
    (cl:cons ':psi (psi msg))
))

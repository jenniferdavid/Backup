; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude ArtsMeasurement.msg.html

(cl:defclass <ArtsMeasurement> (roslisp-msg-protocol:ros-message)
  ((remote_id
    :reader remote_id
    :initarg :remote_id
    :type cl:fixnum
    :initform 0)
   (range
    :reader range
    :initarg :range
    :type cl:float
    :initform 0.0)
   (snr
    :reader snr
    :initarg :snr
    :type cl:float
    :initform 0.0))
)

(cl:defclass ArtsMeasurement (<ArtsMeasurement>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArtsMeasurement>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArtsMeasurement)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<ArtsMeasurement> is deprecated: use cargo_ants_msgs-msg:ArtsMeasurement instead.")))

(cl:ensure-generic-function 'remote_id-val :lambda-list '(m))
(cl:defmethod remote_id-val ((m <ArtsMeasurement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:remote_id-val is deprecated.  Use cargo_ants_msgs-msg:remote_id instead.")
  (remote_id m))

(cl:ensure-generic-function 'range-val :lambda-list '(m))
(cl:defmethod range-val ((m <ArtsMeasurement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:range-val is deprecated.  Use cargo_ants_msgs-msg:range instead.")
  (range m))

(cl:ensure-generic-function 'snr-val :lambda-list '(m))
(cl:defmethod snr-val ((m <ArtsMeasurement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:snr-val is deprecated.  Use cargo_ants_msgs-msg:snr instead.")
  (snr m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArtsMeasurement>) ostream)
  "Serializes a message object of type '<ArtsMeasurement>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'remote_id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'snr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArtsMeasurement>) istream)
  "Deserializes a message object of type '<ArtsMeasurement>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'remote_id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'snr) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArtsMeasurement>)))
  "Returns string type for a message object of type '<ArtsMeasurement>"
  "cargo_ants_msgs/ArtsMeasurement")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArtsMeasurement)))
  "Returns string type for a message object of type 'ArtsMeasurement"
  "cargo_ants_msgs/ArtsMeasurement")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArtsMeasurement>)))
  "Returns md5sum for a message object of type '<ArtsMeasurement>"
  "ff748bd5ccbe7fdca1e7e91bcc0165c8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArtsMeasurement)))
  "Returns md5sum for a message object of type 'ArtsMeasurement"
  "ff748bd5ccbe7fdca1e7e91bcc0165c8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArtsMeasurement>)))
  "Returns full string definition for message of type '<ArtsMeasurement>"
  (cl:format cl:nil "#id of the remote node~%uint8 remote_id~%~%#raw measurement~%float64 range~%~%#signal to noise ratio~%float64 snr~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArtsMeasurement)))
  "Returns full string definition for message of type 'ArtsMeasurement"
  (cl:format cl:nil "#id of the remote node~%uint8 remote_id~%~%#raw measurement~%float64 range~%~%#signal to noise ratio~%float64 snr~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArtsMeasurement>))
  (cl:+ 0
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArtsMeasurement>))
  "Converts a ROS message object to a list"
  (cl:list 'ArtsMeasurement
    (cl:cons ':remote_id (remote_id msg))
    (cl:cons ':range (range msg))
    (cl:cons ':snr (snr msg))
))

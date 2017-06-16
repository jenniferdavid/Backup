; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude BNRLogging.msg.html

(cl:defclass <BNRLogging> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (bnr_timestamp
    :reader bnr_timestamp
    :initarg :bnr_timestamp
    :type cl:float
    :initform 0.0)
   (localization
    :reader localization
    :initarg :localization
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass BNRLogging (<BNRLogging>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BNRLogging>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BNRLogging)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<BNRLogging> is deprecated: use cargo_ants_msgs-msg:BNRLogging instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BNRLogging>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'bnr_timestamp-val :lambda-list '(m))
(cl:defmethod bnr_timestamp-val ((m <BNRLogging>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:bnr_timestamp-val is deprecated.  Use cargo_ants_msgs-msg:bnr_timestamp instead.")
  (bnr_timestamp m))

(cl:ensure-generic-function 'localization-val :lambda-list '(m))
(cl:defmethod localization-val ((m <BNRLogging>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:localization-val is deprecated.  Use cargo_ants_msgs-msg:localization instead.")
  (localization m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BNRLogging>) ostream)
  "Serializes a message object of type '<BNRLogging>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bnr_timestamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'localization) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BNRLogging>) istream)
  "Deserializes a message object of type '<BNRLogging>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bnr_timestamp) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'localization) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BNRLogging>)))
  "Returns string type for a message object of type '<BNRLogging>"
  "cargo_ants_msgs/BNRLogging")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BNRLogging)))
  "Returns string type for a message object of type 'BNRLogging"
  "cargo_ants_msgs/BNRLogging")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BNRLogging>)))
  "Returns md5sum for a message object of type '<BNRLogging>"
  "86f3ccc37bf0d4beb9583297ea9de8c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BNRLogging)))
  "Returns md5sum for a message object of type 'BNRLogging"
  "86f3ccc37bf0d4beb9583297ea9de8c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BNRLogging>)))
  "Returns full string definition for message of type '<BNRLogging>"
  (cl:format cl:nil "Header header~%~%float32 bnr_timestamp~%geometry_msgs/Pose2D localization~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BNRLogging)))
  "Returns full string definition for message of type 'BNRLogging"
  (cl:format cl:nil "Header header~%~%float32 bnr_timestamp~%geometry_msgs/Pose2D localization~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BNRLogging>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'localization))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BNRLogging>))
  "Converts a ROS message object to a list"
  (cl:list 'BNRLogging
    (cl:cons ':header (header msg))
    (cl:cons ':bnr_timestamp (bnr_timestamp msg))
    (cl:cons ':localization (localization msg))
))

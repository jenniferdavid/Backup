; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude ReferenceTrajectoryPoint.msg.html

(cl:defclass <ReferenceTrajectoryPoint> (roslisp-msg-protocol:ros-message)
  ((xx
    :reader xx
    :initarg :xx
    :type cl:float
    :initform 0.0)
   (yy
    :reader yy
    :initarg :yy
    :type cl:float
    :initform 0.0)
   (th
    :reader th
    :initarg :th
    :type cl:float
    :initform 0.0)
   (xd
    :reader xd
    :initarg :xd
    :type cl:float
    :initform 0.0)
   (yd
    :reader yd
    :initarg :yd
    :type cl:float
    :initform 0.0)
   (thd
    :reader thd
    :initarg :thd
    :type cl:float
    :initform 0.0)
   (xdd
    :reader xdd
    :initarg :xdd
    :type cl:float
    :initform 0.0)
   (ydd
    :reader ydd
    :initarg :ydd
    :type cl:float
    :initform 0.0)
   (thdd
    :reader thdd
    :initarg :thdd
    :type cl:float
    :initform 0.0))
)

(cl:defclass ReferenceTrajectoryPoint (<ReferenceTrajectoryPoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReferenceTrajectoryPoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReferenceTrajectoryPoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<ReferenceTrajectoryPoint> is deprecated: use cargo_ants_msgs-msg:ReferenceTrajectoryPoint instead.")))

(cl:ensure-generic-function 'xx-val :lambda-list '(m))
(cl:defmethod xx-val ((m <ReferenceTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:xx-val is deprecated.  Use cargo_ants_msgs-msg:xx instead.")
  (xx m))

(cl:ensure-generic-function 'yy-val :lambda-list '(m))
(cl:defmethod yy-val ((m <ReferenceTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:yy-val is deprecated.  Use cargo_ants_msgs-msg:yy instead.")
  (yy m))

(cl:ensure-generic-function 'th-val :lambda-list '(m))
(cl:defmethod th-val ((m <ReferenceTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:th-val is deprecated.  Use cargo_ants_msgs-msg:th instead.")
  (th m))

(cl:ensure-generic-function 'xd-val :lambda-list '(m))
(cl:defmethod xd-val ((m <ReferenceTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:xd-val is deprecated.  Use cargo_ants_msgs-msg:xd instead.")
  (xd m))

(cl:ensure-generic-function 'yd-val :lambda-list '(m))
(cl:defmethod yd-val ((m <ReferenceTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:yd-val is deprecated.  Use cargo_ants_msgs-msg:yd instead.")
  (yd m))

(cl:ensure-generic-function 'thd-val :lambda-list '(m))
(cl:defmethod thd-val ((m <ReferenceTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:thd-val is deprecated.  Use cargo_ants_msgs-msg:thd instead.")
  (thd m))

(cl:ensure-generic-function 'xdd-val :lambda-list '(m))
(cl:defmethod xdd-val ((m <ReferenceTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:xdd-val is deprecated.  Use cargo_ants_msgs-msg:xdd instead.")
  (xdd m))

(cl:ensure-generic-function 'ydd-val :lambda-list '(m))
(cl:defmethod ydd-val ((m <ReferenceTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:ydd-val is deprecated.  Use cargo_ants_msgs-msg:ydd instead.")
  (ydd m))

(cl:ensure-generic-function 'thdd-val :lambda-list '(m))
(cl:defmethod thdd-val ((m <ReferenceTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:thdd-val is deprecated.  Use cargo_ants_msgs-msg:thdd instead.")
  (thdd m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReferenceTrajectoryPoint>) ostream)
  "Serializes a message object of type '<ReferenceTrajectoryPoint>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'th))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'thd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xdd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ydd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'thdd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReferenceTrajectoryPoint>) istream)
  "Deserializes a message object of type '<ReferenceTrajectoryPoint>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'th) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'thd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xdd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ydd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'thdd) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReferenceTrajectoryPoint>)))
  "Returns string type for a message object of type '<ReferenceTrajectoryPoint>"
  "cargo_ants_msgs/ReferenceTrajectoryPoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReferenceTrajectoryPoint)))
  "Returns string type for a message object of type 'ReferenceTrajectoryPoint"
  "cargo_ants_msgs/ReferenceTrajectoryPoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReferenceTrajectoryPoint>)))
  "Returns md5sum for a message object of type '<ReferenceTrajectoryPoint>"
  "60014944571a3abc70dee1ab6a3c83b0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReferenceTrajectoryPoint)))
  "Returns md5sum for a message object of type 'ReferenceTrajectoryPoint"
  "60014944571a3abc70dee1ab6a3c83b0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReferenceTrajectoryPoint>)))
  "Returns full string definition for message of type '<ReferenceTrajectoryPoint>"
  (cl:format cl:nil "float32 xx~%float32 yy~%float32 th~%float32 xd~%float32 yd~%float32 thd~%float32 xdd~%float32 ydd~%float32 thdd~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReferenceTrajectoryPoint)))
  "Returns full string definition for message of type 'ReferenceTrajectoryPoint"
  (cl:format cl:nil "float32 xx~%float32 yy~%float32 th~%float32 xd~%float32 yd~%float32 thd~%float32 xdd~%float32 ydd~%float32 thdd~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReferenceTrajectoryPoint>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReferenceTrajectoryPoint>))
  "Converts a ROS message object to a list"
  (cl:list 'ReferenceTrajectoryPoint
    (cl:cons ':xx (xx msg))
    (cl:cons ':yy (yy msg))
    (cl:cons ':th (th msg))
    (cl:cons ':xd (xd msg))
    (cl:cons ':yd (yd msg))
    (cl:cons ':thd (thd msg))
    (cl:cons ':xdd (xdd msg))
    (cl:cons ':ydd (ydd msg))
    (cl:cons ':thdd (thdd msg))
))

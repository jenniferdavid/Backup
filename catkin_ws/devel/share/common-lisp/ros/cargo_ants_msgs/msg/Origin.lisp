; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude Origin.msg.html

(cl:defclass <Origin> (roslisp-msg-protocol:ros-message)
  ((ox
    :reader ox
    :initarg :ox
    :type cl:float
    :initform 0.0)
   (oy
    :reader oy
    :initarg :oy
    :type cl:float
    :initform 0.0)
   (oth
    :reader oth
    :initarg :oth
    :type cl:float
    :initform 0.0))
)

(cl:defclass Origin (<Origin>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Origin>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Origin)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<Origin> is deprecated: use cargo_ants_msgs-msg:Origin instead.")))

(cl:ensure-generic-function 'ox-val :lambda-list '(m))
(cl:defmethod ox-val ((m <Origin>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:ox-val is deprecated.  Use cargo_ants_msgs-msg:ox instead.")
  (ox m))

(cl:ensure-generic-function 'oy-val :lambda-list '(m))
(cl:defmethod oy-val ((m <Origin>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:oy-val is deprecated.  Use cargo_ants_msgs-msg:oy instead.")
  (oy m))

(cl:ensure-generic-function 'oth-val :lambda-list '(m))
(cl:defmethod oth-val ((m <Origin>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:oth-val is deprecated.  Use cargo_ants_msgs-msg:oth instead.")
  (oth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Origin>) ostream)
  "Serializes a message object of type '<Origin>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ox))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'oy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'oth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Origin>) istream)
  "Deserializes a message object of type '<Origin>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ox) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'oy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'oth) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Origin>)))
  "Returns string type for a message object of type '<Origin>"
  "cargo_ants_msgs/Origin")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Origin)))
  "Returns string type for a message object of type 'Origin"
  "cargo_ants_msgs/Origin")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Origin>)))
  "Returns md5sum for a message object of type '<Origin>"
  "a100ff13ed4649c823796e4aea68b299")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Origin)))
  "Returns md5sum for a message object of type 'Origin"
  "a100ff13ed4649c823796e4aea68b299")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Origin>)))
  "Returns full string definition for message of type '<Origin>"
  (cl:format cl:nil "float32 ox~%float32 oy~%float32 oth~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Origin)))
  "Returns full string definition for message of type 'Origin"
  (cl:format cl:nil "float32 ox~%float32 oy~%float32 oth~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Origin>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Origin>))
  "Converts a ROS message object to a list"
  (cl:list 'Origin
    (cl:cons ':ox (ox msg))
    (cl:cons ':oy (oy msg))
    (cl:cons ':oth (oth msg))
))

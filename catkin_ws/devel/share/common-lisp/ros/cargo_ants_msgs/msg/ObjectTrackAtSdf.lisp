; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude ObjectTrackAtSdf.msg.html

(cl:defclass <ObjectTrackAtSdf> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (class_id
    :reader class_id
    :initarg :class_id
    :type cl:integer
    :initform 0)
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (velocity
    :reader velocity
    :initarg :velocity
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (heading
    :reader heading
    :initarg :heading
    :type cl:float
    :initform 0.0)
   (covariance
    :reader covariance
    :initarg :covariance
    :type (cl:vector cl:float)
   :initform (cl:make-array 4 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ObjectTrackAtSdf (<ObjectTrackAtSdf>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObjectTrackAtSdf>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObjectTrackAtSdf)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<ObjectTrackAtSdf> is deprecated: use cargo_ants_msgs-msg:ObjectTrackAtSdf instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <ObjectTrackAtSdf>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:id-val is deprecated.  Use cargo_ants_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'class_id-val :lambda-list '(m))
(cl:defmethod class_id-val ((m <ObjectTrackAtSdf>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:class_id-val is deprecated.  Use cargo_ants_msgs-msg:class_id instead.")
  (class_id m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <ObjectTrackAtSdf>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:position-val is deprecated.  Use cargo_ants_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <ObjectTrackAtSdf>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:velocity-val is deprecated.  Use cargo_ants_msgs-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <ObjectTrackAtSdf>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:heading-val is deprecated.  Use cargo_ants_msgs-msg:heading instead.")
  (heading m))

(cl:ensure-generic-function 'covariance-val :lambda-list '(m))
(cl:defmethod covariance-val ((m <ObjectTrackAtSdf>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:covariance-val is deprecated.  Use cargo_ants_msgs-msg:covariance instead.")
  (covariance m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ObjectTrackAtSdf>)))
    "Constants for message type '<ObjectTrackAtSdf>"
  '((:UNDETERMINED . 0)
    (:CAR . 1)
    (:MOTORCYCLE . 2)
    (:TRUCK . 3)
    (:PEDESTRIAN . 4)
    (:POLE . 5)
    (:TREE . 6)
    (:ANIMAL . 7)
    (:GOD . 8)
    (:BICYLCE . 9)
    (:OTHERS . 10))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ObjectTrackAtSdf)))
    "Constants for message type 'ObjectTrackAtSdf"
  '((:UNDETERMINED . 0)
    (:CAR . 1)
    (:MOTORCYCLE . 2)
    (:TRUCK . 3)
    (:PEDESTRIAN . 4)
    (:POLE . 5)
    (:TREE . 6)
    (:ANIMAL . 7)
    (:GOD . 8)
    (:BICYLCE . 9)
    (:OTHERS . 10))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObjectTrackAtSdf>) ostream)
  "Serializes a message object of type '<ObjectTrackAtSdf>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'class_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'covariance))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObjectTrackAtSdf>) istream)
  "Deserializes a message object of type '<ObjectTrackAtSdf>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'class_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading) (roslisp-utils:decode-double-float-bits bits)))
  (cl:setf (cl:slot-value msg 'covariance) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'covariance)))
    (cl:dotimes (i 4)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObjectTrackAtSdf>)))
  "Returns string type for a message object of type '<ObjectTrackAtSdf>"
  "cargo_ants_msgs/ObjectTrackAtSdf")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObjectTrackAtSdf)))
  "Returns string type for a message object of type 'ObjectTrackAtSdf"
  "cargo_ants_msgs/ObjectTrackAtSdf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObjectTrackAtSdf>)))
  "Returns md5sum for a message object of type '<ObjectTrackAtSdf>"
  "f293dd0b67983516c3df559784fc1d67")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObjectTrackAtSdf)))
  "Returns md5sum for a message object of type 'ObjectTrackAtSdf"
  "f293dd0b67983516c3df559784fc1d67")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObjectTrackAtSdf>)))
  "Returns full string definition for message of type '<ObjectTrackAtSdf>"
  (cl:format cl:nil "# Single object track from SDF UDP message (Volvo, AT)~%# Result of internal datafusion made by Volvo AutoBox SW, which uses ibeo and radars~%~%~%int32 id 			#track id~%int32 class_id		#class id of the track:~%int32 UNDETERMINED 		= 0~%int32 CAR 				= 1~%int32 MOTORCYCLE		= 2~%int32 TRUCK 			= 3~%int32 PEDESTRIAN 		= 4~%int32 POLE				= 5~%int32 TREE 				= 6~%int32 ANIMAL			= 7~%int32 GOD				= 8~%int32 BICYLCE			= 9~%int32 OTHERS			= 10  #unidentified vehicle, piano, speed limit sign, x-sign, ... ~%~%geometry_msgs/Point position 	#Track position (x,y) [m]~%geometry_msgs/Point velocity 	#Track velocity (vx,vy) [m/s]~%float64 heading 				#Track heading [rad] ~%float64[4] covariance			#XY covariance matrix [m2/s2]~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObjectTrackAtSdf)))
  "Returns full string definition for message of type 'ObjectTrackAtSdf"
  (cl:format cl:nil "# Single object track from SDF UDP message (Volvo, AT)~%# Result of internal datafusion made by Volvo AutoBox SW, which uses ibeo and radars~%~%~%int32 id 			#track id~%int32 class_id		#class id of the track:~%int32 UNDETERMINED 		= 0~%int32 CAR 				= 1~%int32 MOTORCYCLE		= 2~%int32 TRUCK 			= 3~%int32 PEDESTRIAN 		= 4~%int32 POLE				= 5~%int32 TREE 				= 6~%int32 ANIMAL			= 7~%int32 GOD				= 8~%int32 BICYLCE			= 9~%int32 OTHERS			= 10  #unidentified vehicle, piano, speed limit sign, x-sign, ... ~%~%geometry_msgs/Point position 	#Track position (x,y) [m]~%geometry_msgs/Point velocity 	#Track velocity (vx,vy) [m/s]~%float64 heading 				#Track heading [rad] ~%float64[4] covariance			#XY covariance matrix [m2/s2]~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObjectTrackAtSdf>))
  (cl:+ 0
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'covariance) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObjectTrackAtSdf>))
  "Converts a ROS message object to a list"
  (cl:list 'ObjectTrackAtSdf
    (cl:cons ':id (id msg))
    (cl:cons ':class_id (class_id msg))
    (cl:cons ':position (position msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':heading (heading msg))
    (cl:cons ':covariance (covariance msg))
))

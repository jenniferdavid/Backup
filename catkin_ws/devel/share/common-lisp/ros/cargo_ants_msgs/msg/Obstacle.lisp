; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude Obstacle.msg.html

(cl:defclass <Obstacle> (roslisp-msg-protocol:ros-message)
  ((type_tag
    :reader type_tag
    :initarg :type_tag
    :type cl:integer
    :initform 0)
   (origin
    :reader origin
    :initarg :origin
    :type cargo_ants_msgs-msg:Origin
    :initform (cl:make-instance 'cargo_ants_msgs-msg:Origin))
   (polylines
    :reader polylines
    :initarg :polylines
    :type (cl:vector cargo_ants_msgs-msg:Polyline)
   :initform (cl:make-array 0 :element-type 'cargo_ants_msgs-msg:Polyline :initial-element (cl:make-instance 'cargo_ants_msgs-msg:Polyline))))
)

(cl:defclass Obstacle (<Obstacle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Obstacle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Obstacle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<Obstacle> is deprecated: use cargo_ants_msgs-msg:Obstacle instead.")))

(cl:ensure-generic-function 'type_tag-val :lambda-list '(m))
(cl:defmethod type_tag-val ((m <Obstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:type_tag-val is deprecated.  Use cargo_ants_msgs-msg:type_tag instead.")
  (type_tag m))

(cl:ensure-generic-function 'origin-val :lambda-list '(m))
(cl:defmethod origin-val ((m <Obstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:origin-val is deprecated.  Use cargo_ants_msgs-msg:origin instead.")
  (origin m))

(cl:ensure-generic-function 'polylines-val :lambda-list '(m))
(cl:defmethod polylines-val ((m <Obstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:polylines-val is deprecated.  Use cargo_ants_msgs-msg:polylines instead.")
  (polylines m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Obstacle>)))
    "Constants for message type '<Obstacle>"
  '((:UNKNOWN . 0)
    (:CONTAINER . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Obstacle)))
    "Constants for message type 'Obstacle"
  '((:UNKNOWN . 0)
    (:CONTAINER . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Obstacle>) ostream)
  "Serializes a message object of type '<Obstacle>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type_tag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'type_tag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'type_tag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'type_tag)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'origin) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'polylines))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'polylines))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Obstacle>) istream)
  "Deserializes a message object of type '<Obstacle>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type_tag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'type_tag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'type_tag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'type_tag)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'origin) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'polylines) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'polylines)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cargo_ants_msgs-msg:Polyline))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Obstacle>)))
  "Returns string type for a message object of type '<Obstacle>"
  "cargo_ants_msgs/Obstacle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Obstacle)))
  "Returns string type for a message object of type 'Obstacle"
  "cargo_ants_msgs/Obstacle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Obstacle>)))
  "Returns md5sum for a message object of type '<Obstacle>"
  "adf07ee58e74a1fe6d8135061989c6e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Obstacle)))
  "Returns md5sum for a message object of type 'Obstacle"
  "adf07ee58e74a1fe6d8135061989c6e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Obstacle>)))
  "Returns full string definition for message of type '<Obstacle>"
  (cl:format cl:nil "uint32 UNKNOWN=0~%uint32 CONTAINER=1~%uint32 type_tag~%~%Origin origin~%Polyline[] polylines~%~%================================================================================~%MSG: cargo_ants_msgs/Origin~%float32 ox~%float32 oy~%float32 oth~%~%================================================================================~%MSG: cargo_ants_msgs/Polyline~%# The polyline is walked in a clockwise direction, occupied space is~%# to the right of each line segment between two consecutive points.~%# In case the polyline is a polygon, the first point is repeated as~%# the last point.~%~%Point[] points~%~%================================================================================~%MSG: cargo_ants_msgs/Point~%float32 px~%float32 py~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Obstacle)))
  "Returns full string definition for message of type 'Obstacle"
  (cl:format cl:nil "uint32 UNKNOWN=0~%uint32 CONTAINER=1~%uint32 type_tag~%~%Origin origin~%Polyline[] polylines~%~%================================================================================~%MSG: cargo_ants_msgs/Origin~%float32 ox~%float32 oy~%float32 oth~%~%================================================================================~%MSG: cargo_ants_msgs/Polyline~%# The polyline is walked in a clockwise direction, occupied space is~%# to the right of each line segment between two consecutive points.~%# In case the polyline is a polygon, the first point is repeated as~%# the last point.~%~%Point[] points~%~%================================================================================~%MSG: cargo_ants_msgs/Point~%float32 px~%float32 py~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Obstacle>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'origin))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'polylines) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Obstacle>))
  "Converts a ROS message object to a list"
  (cl:list 'Obstacle
    (cl:cons ':type_tag (type_tag msg))
    (cl:cons ':origin (origin msg))
    (cl:cons ':polylines (polylines msg))
))

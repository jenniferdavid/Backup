; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude ObstacleMap.msg.html

(cl:defclass <ObstacleMap> (roslisp-msg-protocol:ros-message)
  ((obstacles
    :reader obstacles
    :initarg :obstacles
    :type (cl:vector cargo_ants_msgs-msg:Obstacle)
   :initform (cl:make-array 0 :element-type 'cargo_ants_msgs-msg:Obstacle :initial-element (cl:make-instance 'cargo_ants_msgs-msg:Obstacle))))
)

(cl:defclass ObstacleMap (<ObstacleMap>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleMap>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleMap)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<ObstacleMap> is deprecated: use cargo_ants_msgs-msg:ObstacleMap instead.")))

(cl:ensure-generic-function 'obstacles-val :lambda-list '(m))
(cl:defmethod obstacles-val ((m <ObstacleMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:obstacles-val is deprecated.  Use cargo_ants_msgs-msg:obstacles instead.")
  (obstacles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleMap>) ostream)
  "Serializes a message object of type '<ObstacleMap>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obstacles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obstacles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleMap>) istream)
  "Deserializes a message object of type '<ObstacleMap>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obstacles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obstacles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cargo_ants_msgs-msg:Obstacle))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleMap>)))
  "Returns string type for a message object of type '<ObstacleMap>"
  "cargo_ants_msgs/ObstacleMap")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleMap)))
  "Returns string type for a message object of type 'ObstacleMap"
  "cargo_ants_msgs/ObstacleMap")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleMap>)))
  "Returns md5sum for a message object of type '<ObstacleMap>"
  "e166b16de200e7fdba8d6a003a53be73")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleMap)))
  "Returns md5sum for a message object of type 'ObstacleMap"
  "e166b16de200e7fdba8d6a003a53be73")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleMap>)))
  "Returns full string definition for message of type '<ObstacleMap>"
  (cl:format cl:nil "Obstacle[] obstacles~%~%================================================================================~%MSG: cargo_ants_msgs/Obstacle~%uint32 UNKNOWN=0~%uint32 CONTAINER=1~%uint32 type_tag~%~%Origin origin~%Polyline[] polylines~%~%================================================================================~%MSG: cargo_ants_msgs/Origin~%float32 ox~%float32 oy~%float32 oth~%~%================================================================================~%MSG: cargo_ants_msgs/Polyline~%# The polyline is walked in a clockwise direction, occupied space is~%# to the right of each line segment between two consecutive points.~%# In case the polyline is a polygon, the first point is repeated as~%# the last point.~%~%Point[] points~%~%================================================================================~%MSG: cargo_ants_msgs/Point~%float32 px~%float32 py~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleMap)))
  "Returns full string definition for message of type 'ObstacleMap"
  (cl:format cl:nil "Obstacle[] obstacles~%~%================================================================================~%MSG: cargo_ants_msgs/Obstacle~%uint32 UNKNOWN=0~%uint32 CONTAINER=1~%uint32 type_tag~%~%Origin origin~%Polyline[] polylines~%~%================================================================================~%MSG: cargo_ants_msgs/Origin~%float32 ox~%float32 oy~%float32 oth~%~%================================================================================~%MSG: cargo_ants_msgs/Polyline~%# The polyline is walked in a clockwise direction, occupied space is~%# to the right of each line segment between two consecutive points.~%# In case the polyline is a polygon, the first point is repeated as~%# the last point.~%~%Point[] points~%~%================================================================================~%MSG: cargo_ants_msgs/Point~%float32 px~%float32 py~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleMap>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obstacles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleMap>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleMap
    (cl:cons ':obstacles (obstacles msg))
))

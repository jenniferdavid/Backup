; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude Polyline.msg.html

(cl:defclass <Polyline> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type (cl:vector cargo_ants_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'cargo_ants_msgs-msg:Point :initial-element (cl:make-instance 'cargo_ants_msgs-msg:Point))))
)

(cl:defclass Polyline (<Polyline>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Polyline>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Polyline)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<Polyline> is deprecated: use cargo_ants_msgs-msg:Polyline instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <Polyline>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:points-val is deprecated.  Use cargo_ants_msgs-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Polyline>) ostream)
  "Serializes a message object of type '<Polyline>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Polyline>) istream)
  "Deserializes a message object of type '<Polyline>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cargo_ants_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Polyline>)))
  "Returns string type for a message object of type '<Polyline>"
  "cargo_ants_msgs/Polyline")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Polyline)))
  "Returns string type for a message object of type 'Polyline"
  "cargo_ants_msgs/Polyline")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Polyline>)))
  "Returns md5sum for a message object of type '<Polyline>"
  "230d67fa90b40ade9edb974c76047152")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Polyline)))
  "Returns md5sum for a message object of type 'Polyline"
  "230d67fa90b40ade9edb974c76047152")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Polyline>)))
  "Returns full string definition for message of type '<Polyline>"
  (cl:format cl:nil "# The polyline is walked in a clockwise direction, occupied space is~%# to the right of each line segment between two consecutive points.~%# In case the polyline is a polygon, the first point is repeated as~%# the last point.~%~%Point[] points~%~%================================================================================~%MSG: cargo_ants_msgs/Point~%float32 px~%float32 py~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Polyline)))
  "Returns full string definition for message of type 'Polyline"
  (cl:format cl:nil "# The polyline is walked in a clockwise direction, occupied space is~%# to the right of each line segment between two consecutive points.~%# In case the polyline is a polygon, the first point is repeated as~%# the last point.~%~%Point[] points~%~%================================================================================~%MSG: cargo_ants_msgs/Point~%float32 px~%float32 py~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Polyline>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Polyline>))
  "Converts a ROS message object to a list"
  (cl:list 'Polyline
    (cl:cons ':points (points msg))
))

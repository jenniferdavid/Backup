; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude ObjectTrackAtSdfArray.msg.html

(cl:defclass <ObjectTrackAtSdfArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (tracks
    :reader tracks
    :initarg :tracks
    :type (cl:vector cargo_ants_msgs-msg:ObjectTrackAtSdf)
   :initform (cl:make-array 0 :element-type 'cargo_ants_msgs-msg:ObjectTrackAtSdf :initial-element (cl:make-instance 'cargo_ants_msgs-msg:ObjectTrackAtSdf))))
)

(cl:defclass ObjectTrackAtSdfArray (<ObjectTrackAtSdfArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObjectTrackAtSdfArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObjectTrackAtSdfArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<ObjectTrackAtSdfArray> is deprecated: use cargo_ants_msgs-msg:ObjectTrackAtSdfArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ObjectTrackAtSdfArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'tracks-val :lambda-list '(m))
(cl:defmethod tracks-val ((m <ObjectTrackAtSdfArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:tracks-val is deprecated.  Use cargo_ants_msgs-msg:tracks instead.")
  (tracks m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObjectTrackAtSdfArray>) ostream)
  "Serializes a message object of type '<ObjectTrackAtSdfArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'tracks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'tracks))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObjectTrackAtSdfArray>) istream)
  "Deserializes a message object of type '<ObjectTrackAtSdfArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'tracks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'tracks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cargo_ants_msgs-msg:ObjectTrackAtSdf))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObjectTrackAtSdfArray>)))
  "Returns string type for a message object of type '<ObjectTrackAtSdfArray>"
  "cargo_ants_msgs/ObjectTrackAtSdfArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObjectTrackAtSdfArray)))
  "Returns string type for a message object of type 'ObjectTrackAtSdfArray"
  "cargo_ants_msgs/ObjectTrackAtSdfArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObjectTrackAtSdfArray>)))
  "Returns md5sum for a message object of type '<ObjectTrackAtSdfArray>"
  "9a8ebfdff3bc40a1f2d61b0a4d39d6cc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObjectTrackAtSdfArray)))
  "Returns md5sum for a message object of type 'ObjectTrackAtSdfArray"
  "9a8ebfdff3bc40a1f2d61b0a4d39d6cc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObjectTrackAtSdfArray>)))
  "Returns full string definition for message of type '<ObjectTrackAtSdfArray>"
  (cl:format cl:nil "# timestamp, frame id~%Header header~%~%#set of targets being tracked~%ObjectTrackAtSdf[] tracks~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: cargo_ants_msgs/ObjectTrackAtSdf~%# Single object track from SDF UDP message (Volvo, AT)~%# Result of internal datafusion made by Volvo AutoBox SW, which uses ibeo and radars~%~%~%int32 id 			#track id~%int32 class_id		#class id of the track:~%int32 UNDETERMINED 		= 0~%int32 CAR 				= 1~%int32 MOTORCYCLE		= 2~%int32 TRUCK 			= 3~%int32 PEDESTRIAN 		= 4~%int32 POLE				= 5~%int32 TREE 				= 6~%int32 ANIMAL			= 7~%int32 GOD				= 8~%int32 BICYLCE			= 9~%int32 OTHERS			= 10  #unidentified vehicle, piano, speed limit sign, x-sign, ... ~%~%geometry_msgs/Point position 	#Track position (x,y) [m]~%geometry_msgs/Point velocity 	#Track velocity (vx,vy) [m/s]~%float64 heading 				#Track heading [rad] ~%float64[4] covariance			#XY covariance matrix [m2/s2]~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObjectTrackAtSdfArray)))
  "Returns full string definition for message of type 'ObjectTrackAtSdfArray"
  (cl:format cl:nil "# timestamp, frame id~%Header header~%~%#set of targets being tracked~%ObjectTrackAtSdf[] tracks~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: cargo_ants_msgs/ObjectTrackAtSdf~%# Single object track from SDF UDP message (Volvo, AT)~%# Result of internal datafusion made by Volvo AutoBox SW, which uses ibeo and radars~%~%~%int32 id 			#track id~%int32 class_id		#class id of the track:~%int32 UNDETERMINED 		= 0~%int32 CAR 				= 1~%int32 MOTORCYCLE		= 2~%int32 TRUCK 			= 3~%int32 PEDESTRIAN 		= 4~%int32 POLE				= 5~%int32 TREE 				= 6~%int32 ANIMAL			= 7~%int32 GOD				= 8~%int32 BICYLCE			= 9~%int32 OTHERS			= 10  #unidentified vehicle, piano, speed limit sign, x-sign, ... ~%~%geometry_msgs/Point position 	#Track position (x,y) [m]~%geometry_msgs/Point velocity 	#Track velocity (vx,vy) [m/s]~%float64 heading 				#Track heading [rad] ~%float64[4] covariance			#XY covariance matrix [m2/s2]~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObjectTrackAtSdfArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'tracks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObjectTrackAtSdfArray>))
  "Converts a ROS message object to a list"
  (cl:list 'ObjectTrackAtSdfArray
    (cl:cons ':header (header msg))
    (cl:cons ':tracks (tracks msg))
))

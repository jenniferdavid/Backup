; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude ArtsArray.msg.html

(cl:defclass <ArtsArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (home_id
    :reader home_id
    :initarg :home_id
    :type cl:fixnum
    :initform 0)
   (measurements
    :reader measurements
    :initarg :measurements
    :type (cl:vector cargo_ants_msgs-msg:ArtsMeasurement)
   :initform (cl:make-array 0 :element-type 'cargo_ants_msgs-msg:ArtsMeasurement :initial-element (cl:make-instance 'cargo_ants_msgs-msg:ArtsMeasurement))))
)

(cl:defclass ArtsArray (<ArtsArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArtsArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArtsArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<ArtsArray> is deprecated: use cargo_ants_msgs-msg:ArtsArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ArtsArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'home_id-val :lambda-list '(m))
(cl:defmethod home_id-val ((m <ArtsArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:home_id-val is deprecated.  Use cargo_ants_msgs-msg:home_id instead.")
  (home_id m))

(cl:ensure-generic-function 'measurements-val :lambda-list '(m))
(cl:defmethod measurements-val ((m <ArtsArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:measurements-val is deprecated.  Use cargo_ants_msgs-msg:measurements instead.")
  (measurements m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArtsArray>) ostream)
  "Serializes a message object of type '<ArtsArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'home_id)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'measurements))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'measurements))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArtsArray>) istream)
  "Deserializes a message object of type '<ArtsArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'home_id)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'measurements) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'measurements)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cargo_ants_msgs-msg:ArtsMeasurement))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArtsArray>)))
  "Returns string type for a message object of type '<ArtsArray>"
  "cargo_ants_msgs/ArtsArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArtsArray)))
  "Returns string type for a message object of type 'ArtsArray"
  "cargo_ants_msgs/ArtsArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArtsArray>)))
  "Returns md5sum for a message object of type '<ArtsArray>"
  "5bb8ca34159c18e2755b00bb6c11a33b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArtsArray)))
  "Returns md5sum for a message object of type 'ArtsArray"
  "5bb8ca34159c18e2755b00bb6c11a33b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArtsArray>)))
  "Returns full string definition for message of type '<ArtsArray>"
  (cl:format cl:nil "#time stamp and frame id~%Header header~%~%#id of the node making measurements~%uint8 home_id~%~%#array of the measurements~%ArtsMeasurement[] measurements~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: cargo_ants_msgs/ArtsMeasurement~%#id of the remote node~%uint8 remote_id~%~%#raw measurement~%float64 range~%~%#signal to noise ratio~%float64 snr~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArtsArray)))
  "Returns full string definition for message of type 'ArtsArray"
  (cl:format cl:nil "#time stamp and frame id~%Header header~%~%#id of the node making measurements~%uint8 home_id~%~%#array of the measurements~%ArtsMeasurement[] measurements~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: cargo_ants_msgs/ArtsMeasurement~%#id of the remote node~%uint8 remote_id~%~%#raw measurement~%float64 range~%~%#signal to noise ratio~%float64 snr~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArtsArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'measurements) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArtsArray>))
  "Converts a ROS message object to a list"
  (cl:list 'ArtsArray
    (cl:cons ':header (header msg))
    (cl:cons ':home_id (home_id msg))
    (cl:cons ':measurements (measurements msg))
))

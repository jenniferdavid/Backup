; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude LaserDetectionsArray.msg.html

(cl:defclass <LaserDetectionsArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (laser_detections
    :reader laser_detections
    :initarg :laser_detections
    :type (cl:vector cargo_ants_msgs-msg:LaserDetection)
   :initform (cl:make-array 0 :element-type 'cargo_ants_msgs-msg:LaserDetection :initial-element (cl:make-instance 'cargo_ants_msgs-msg:LaserDetection)))
   (num_detections
    :reader num_detections
    :initarg :num_detections
    :type cl:integer
    :initform 0))
)

(cl:defclass LaserDetectionsArray (<LaserDetectionsArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LaserDetectionsArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LaserDetectionsArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<LaserDetectionsArray> is deprecated: use cargo_ants_msgs-msg:LaserDetectionsArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LaserDetectionsArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'laser_detections-val :lambda-list '(m))
(cl:defmethod laser_detections-val ((m <LaserDetectionsArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:laser_detections-val is deprecated.  Use cargo_ants_msgs-msg:laser_detections instead.")
  (laser_detections m))

(cl:ensure-generic-function 'num_detections-val :lambda-list '(m))
(cl:defmethod num_detections-val ((m <LaserDetectionsArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:num_detections-val is deprecated.  Use cargo_ants_msgs-msg:num_detections instead.")
  (num_detections m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LaserDetectionsArray>) ostream)
  "Serializes a message object of type '<LaserDetectionsArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'laser_detections))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'laser_detections))
  (cl:let* ((signed (cl:slot-value msg 'num_detections)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LaserDetectionsArray>) istream)
  "Deserializes a message object of type '<LaserDetectionsArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'laser_detections) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'laser_detections)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cargo_ants_msgs-msg:LaserDetection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_detections) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LaserDetectionsArray>)))
  "Returns string type for a message object of type '<LaserDetectionsArray>"
  "cargo_ants_msgs/LaserDetectionsArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LaserDetectionsArray)))
  "Returns string type for a message object of type 'LaserDetectionsArray"
  "cargo_ants_msgs/LaserDetectionsArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LaserDetectionsArray>)))
  "Returns md5sum for a message object of type '<LaserDetectionsArray>"
  "ce02bdd5be7bd901a891185084e00010")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LaserDetectionsArray)))
  "Returns md5sum for a message object of type 'LaserDetectionsArray"
  "ce02bdd5be7bd901a891185084e00010")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LaserDetectionsArray>)))
  "Returns full string definition for message of type '<LaserDetectionsArray>"
  (cl:format cl:nil "# Array of all the objects detected from a single layer laser sensor.~%# UNDER CONSTRUCTION~%~%Header header 			# Timestamp, frame id~%LaserDetection[] laser_detections   # Set of targets being tracked~%int32 num_detections~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: cargo_ants_msgs/LaserDetection~%# To be use as OBSTACLE detected in a laser.~%~%bool single_layer_sensor       # True = single layer sensor (i.e: SICK) - False = multiple layer (i.e: IBEO)~%~%int32 id                        # number of detection in scan (-1 if unknown)~%string detection_frame_id       # frame ID of the sensor from which the detection comes.~%~%bool dynamic                    # 1 = dynamic object; 0 = not (means that has been associated)~%int32 num_points                # number of laser points contained~%int32 index_first               # index of the range vector of the first point used? or filteredVector?~%int32 index_last                # index of the range vector of the first point used? or filteredVector?~%~%Point point_first               # first point of the cluster~%Point point_last                # first point of the cluster~%~%Origin obj_center               # Center point of the object bounding box and orientation~%Point obj_size                  # X and Y (width and Height) of the object bounding box~%Polyline[] polylines            # Set of points defining the Rectangle of the Bounding Box~%~%Point ref_actual                # point of reference at the moment~%Point ref_previous              # previous point of reference (in previous detection)~%Point ref_centroid              # reference point to the centroid of the cluster~%int32 ref_type                  # reference type in the pre-asso: 8 = corner; 4/2 = line; 1 = centroid;~%~%~%# Line[] lines                    # Vector of Lines in the cluster~%# Corners[] corners               # Vector of Corners in the cluster~%~%================================================================================~%MSG: cargo_ants_msgs/Point~%float32 px~%float32 py~%~%================================================================================~%MSG: cargo_ants_msgs/Origin~%float32 ox~%float32 oy~%float32 oth~%~%================================================================================~%MSG: cargo_ants_msgs/Polyline~%# The polyline is walked in a clockwise direction, occupied space is~%# to the right of each line segment between two consecutive points.~%# In case the polyline is a polygon, the first point is repeated as~%# the last point.~%~%Point[] points~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LaserDetectionsArray)))
  "Returns full string definition for message of type 'LaserDetectionsArray"
  (cl:format cl:nil "# Array of all the objects detected from a single layer laser sensor.~%# UNDER CONSTRUCTION~%~%Header header 			# Timestamp, frame id~%LaserDetection[] laser_detections   # Set of targets being tracked~%int32 num_detections~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: cargo_ants_msgs/LaserDetection~%# To be use as OBSTACLE detected in a laser.~%~%bool single_layer_sensor       # True = single layer sensor (i.e: SICK) - False = multiple layer (i.e: IBEO)~%~%int32 id                        # number of detection in scan (-1 if unknown)~%string detection_frame_id       # frame ID of the sensor from which the detection comes.~%~%bool dynamic                    # 1 = dynamic object; 0 = not (means that has been associated)~%int32 num_points                # number of laser points contained~%int32 index_first               # index of the range vector of the first point used? or filteredVector?~%int32 index_last                # index of the range vector of the first point used? or filteredVector?~%~%Point point_first               # first point of the cluster~%Point point_last                # first point of the cluster~%~%Origin obj_center               # Center point of the object bounding box and orientation~%Point obj_size                  # X and Y (width and Height) of the object bounding box~%Polyline[] polylines            # Set of points defining the Rectangle of the Bounding Box~%~%Point ref_actual                # point of reference at the moment~%Point ref_previous              # previous point of reference (in previous detection)~%Point ref_centroid              # reference point to the centroid of the cluster~%int32 ref_type                  # reference type in the pre-asso: 8 = corner; 4/2 = line; 1 = centroid;~%~%~%# Line[] lines                    # Vector of Lines in the cluster~%# Corners[] corners               # Vector of Corners in the cluster~%~%================================================================================~%MSG: cargo_ants_msgs/Point~%float32 px~%float32 py~%~%================================================================================~%MSG: cargo_ants_msgs/Origin~%float32 ox~%float32 oy~%float32 oth~%~%================================================================================~%MSG: cargo_ants_msgs/Polyline~%# The polyline is walked in a clockwise direction, occupied space is~%# to the right of each line segment between two consecutive points.~%# In case the polyline is a polygon, the first point is repeated as~%# the last point.~%~%Point[] points~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LaserDetectionsArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'laser_detections) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LaserDetectionsArray>))
  "Converts a ROS message object to a list"
  (cl:list 'LaserDetectionsArray
    (cl:cons ':header (header msg))
    (cl:cons ':laser_detections (laser_detections msg))
    (cl:cons ':num_detections (num_detections msg))
))

; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude LaserDetection.msg.html

(cl:defclass <LaserDetection> (roslisp-msg-protocol:ros-message)
  ((single_layer_sensor
    :reader single_layer_sensor
    :initarg :single_layer_sensor
    :type cl:boolean
    :initform cl:nil)
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (detection_frame_id
    :reader detection_frame_id
    :initarg :detection_frame_id
    :type cl:string
    :initform "")
   (dynamic
    :reader dynamic
    :initarg :dynamic
    :type cl:boolean
    :initform cl:nil)
   (num_points
    :reader num_points
    :initarg :num_points
    :type cl:integer
    :initform 0)
   (index_first
    :reader index_first
    :initarg :index_first
    :type cl:integer
    :initform 0)
   (index_last
    :reader index_last
    :initarg :index_last
    :type cl:integer
    :initform 0)
   (point_first
    :reader point_first
    :initarg :point_first
    :type cargo_ants_msgs-msg:Point
    :initform (cl:make-instance 'cargo_ants_msgs-msg:Point))
   (point_last
    :reader point_last
    :initarg :point_last
    :type cargo_ants_msgs-msg:Point
    :initform (cl:make-instance 'cargo_ants_msgs-msg:Point))
   (obj_center
    :reader obj_center
    :initarg :obj_center
    :type cargo_ants_msgs-msg:Origin
    :initform (cl:make-instance 'cargo_ants_msgs-msg:Origin))
   (obj_size
    :reader obj_size
    :initarg :obj_size
    :type cargo_ants_msgs-msg:Point
    :initform (cl:make-instance 'cargo_ants_msgs-msg:Point))
   (polylines
    :reader polylines
    :initarg :polylines
    :type (cl:vector cargo_ants_msgs-msg:Polyline)
   :initform (cl:make-array 0 :element-type 'cargo_ants_msgs-msg:Polyline :initial-element (cl:make-instance 'cargo_ants_msgs-msg:Polyline)))
   (ref_actual
    :reader ref_actual
    :initarg :ref_actual
    :type cargo_ants_msgs-msg:Point
    :initform (cl:make-instance 'cargo_ants_msgs-msg:Point))
   (ref_previous
    :reader ref_previous
    :initarg :ref_previous
    :type cargo_ants_msgs-msg:Point
    :initform (cl:make-instance 'cargo_ants_msgs-msg:Point))
   (ref_centroid
    :reader ref_centroid
    :initarg :ref_centroid
    :type cargo_ants_msgs-msg:Point
    :initform (cl:make-instance 'cargo_ants_msgs-msg:Point))
   (ref_type
    :reader ref_type
    :initarg :ref_type
    :type cl:integer
    :initform 0))
)

(cl:defclass LaserDetection (<LaserDetection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LaserDetection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LaserDetection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<LaserDetection> is deprecated: use cargo_ants_msgs-msg:LaserDetection instead.")))

(cl:ensure-generic-function 'single_layer_sensor-val :lambda-list '(m))
(cl:defmethod single_layer_sensor-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:single_layer_sensor-val is deprecated.  Use cargo_ants_msgs-msg:single_layer_sensor instead.")
  (single_layer_sensor m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:id-val is deprecated.  Use cargo_ants_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'detection_frame_id-val :lambda-list '(m))
(cl:defmethod detection_frame_id-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:detection_frame_id-val is deprecated.  Use cargo_ants_msgs-msg:detection_frame_id instead.")
  (detection_frame_id m))

(cl:ensure-generic-function 'dynamic-val :lambda-list '(m))
(cl:defmethod dynamic-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:dynamic-val is deprecated.  Use cargo_ants_msgs-msg:dynamic instead.")
  (dynamic m))

(cl:ensure-generic-function 'num_points-val :lambda-list '(m))
(cl:defmethod num_points-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:num_points-val is deprecated.  Use cargo_ants_msgs-msg:num_points instead.")
  (num_points m))

(cl:ensure-generic-function 'index_first-val :lambda-list '(m))
(cl:defmethod index_first-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:index_first-val is deprecated.  Use cargo_ants_msgs-msg:index_first instead.")
  (index_first m))

(cl:ensure-generic-function 'index_last-val :lambda-list '(m))
(cl:defmethod index_last-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:index_last-val is deprecated.  Use cargo_ants_msgs-msg:index_last instead.")
  (index_last m))

(cl:ensure-generic-function 'point_first-val :lambda-list '(m))
(cl:defmethod point_first-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:point_first-val is deprecated.  Use cargo_ants_msgs-msg:point_first instead.")
  (point_first m))

(cl:ensure-generic-function 'point_last-val :lambda-list '(m))
(cl:defmethod point_last-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:point_last-val is deprecated.  Use cargo_ants_msgs-msg:point_last instead.")
  (point_last m))

(cl:ensure-generic-function 'obj_center-val :lambda-list '(m))
(cl:defmethod obj_center-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:obj_center-val is deprecated.  Use cargo_ants_msgs-msg:obj_center instead.")
  (obj_center m))

(cl:ensure-generic-function 'obj_size-val :lambda-list '(m))
(cl:defmethod obj_size-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:obj_size-val is deprecated.  Use cargo_ants_msgs-msg:obj_size instead.")
  (obj_size m))

(cl:ensure-generic-function 'polylines-val :lambda-list '(m))
(cl:defmethod polylines-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:polylines-val is deprecated.  Use cargo_ants_msgs-msg:polylines instead.")
  (polylines m))

(cl:ensure-generic-function 'ref_actual-val :lambda-list '(m))
(cl:defmethod ref_actual-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:ref_actual-val is deprecated.  Use cargo_ants_msgs-msg:ref_actual instead.")
  (ref_actual m))

(cl:ensure-generic-function 'ref_previous-val :lambda-list '(m))
(cl:defmethod ref_previous-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:ref_previous-val is deprecated.  Use cargo_ants_msgs-msg:ref_previous instead.")
  (ref_previous m))

(cl:ensure-generic-function 'ref_centroid-val :lambda-list '(m))
(cl:defmethod ref_centroid-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:ref_centroid-val is deprecated.  Use cargo_ants_msgs-msg:ref_centroid instead.")
  (ref_centroid m))

(cl:ensure-generic-function 'ref_type-val :lambda-list '(m))
(cl:defmethod ref_type-val ((m <LaserDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:ref_type-val is deprecated.  Use cargo_ants_msgs-msg:ref_type instead.")
  (ref_type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LaserDetection>) ostream)
  "Serializes a message object of type '<LaserDetection>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'single_layer_sensor) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'detection_frame_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'detection_frame_id))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'dynamic) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'num_points)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'index_first)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'index_last)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'point_first) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'point_last) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'obj_center) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'obj_size) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'polylines))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'polylines))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ref_actual) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ref_previous) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ref_centroid) ostream)
  (cl:let* ((signed (cl:slot-value msg 'ref_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LaserDetection>) istream)
  "Deserializes a message object of type '<LaserDetection>"
    (cl:setf (cl:slot-value msg 'single_layer_sensor) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'detection_frame_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'detection_frame_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'dynamic) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_points) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index_first) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index_last) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'point_first) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'point_last) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'obj_center) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'obj_size) istream)
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ref_actual) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ref_previous) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ref_centroid) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ref_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LaserDetection>)))
  "Returns string type for a message object of type '<LaserDetection>"
  "cargo_ants_msgs/LaserDetection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LaserDetection)))
  "Returns string type for a message object of type 'LaserDetection"
  "cargo_ants_msgs/LaserDetection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LaserDetection>)))
  "Returns md5sum for a message object of type '<LaserDetection>"
  "dd2f68d89f76969b5c97cbbecaa26d12")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LaserDetection)))
  "Returns md5sum for a message object of type 'LaserDetection"
  "dd2f68d89f76969b5c97cbbecaa26d12")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LaserDetection>)))
  "Returns full string definition for message of type '<LaserDetection>"
  (cl:format cl:nil "# To be use as OBSTACLE detected in a laser.~%~%bool single_layer_sensor       # True = single layer sensor (i.e: SICK) - False = multiple layer (i.e: IBEO)~%~%int32 id                        # number of detection in scan (-1 if unknown)~%string detection_frame_id       # frame ID of the sensor from which the detection comes.~%~%bool dynamic                    # 1 = dynamic object; 0 = not (means that has been associated)~%int32 num_points                # number of laser points contained~%int32 index_first               # index of the range vector of the first point used? or filteredVector?~%int32 index_last                # index of the range vector of the first point used? or filteredVector?~%~%Point point_first               # first point of the cluster~%Point point_last                # first point of the cluster~%~%Origin obj_center               # Center point of the object bounding box and orientation~%Point obj_size                  # X and Y (width and Height) of the object bounding box~%Polyline[] polylines            # Set of points defining the Rectangle of the Bounding Box~%~%Point ref_actual                # point of reference at the moment~%Point ref_previous              # previous point of reference (in previous detection)~%Point ref_centroid              # reference point to the centroid of the cluster~%int32 ref_type                  # reference type in the pre-asso: 8 = corner; 4/2 = line; 1 = centroid;~%~%~%# Line[] lines                    # Vector of Lines in the cluster~%# Corners[] corners               # Vector of Corners in the cluster~%~%================================================================================~%MSG: cargo_ants_msgs/Point~%float32 px~%float32 py~%~%================================================================================~%MSG: cargo_ants_msgs/Origin~%float32 ox~%float32 oy~%float32 oth~%~%================================================================================~%MSG: cargo_ants_msgs/Polyline~%# The polyline is walked in a clockwise direction, occupied space is~%# to the right of each line segment between two consecutive points.~%# In case the polyline is a polygon, the first point is repeated as~%# the last point.~%~%Point[] points~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LaserDetection)))
  "Returns full string definition for message of type 'LaserDetection"
  (cl:format cl:nil "# To be use as OBSTACLE detected in a laser.~%~%bool single_layer_sensor       # True = single layer sensor (i.e: SICK) - False = multiple layer (i.e: IBEO)~%~%int32 id                        # number of detection in scan (-1 if unknown)~%string detection_frame_id       # frame ID of the sensor from which the detection comes.~%~%bool dynamic                    # 1 = dynamic object; 0 = not (means that has been associated)~%int32 num_points                # number of laser points contained~%int32 index_first               # index of the range vector of the first point used? or filteredVector?~%int32 index_last                # index of the range vector of the first point used? or filteredVector?~%~%Point point_first               # first point of the cluster~%Point point_last                # first point of the cluster~%~%Origin obj_center               # Center point of the object bounding box and orientation~%Point obj_size                  # X and Y (width and Height) of the object bounding box~%Polyline[] polylines            # Set of points defining the Rectangle of the Bounding Box~%~%Point ref_actual                # point of reference at the moment~%Point ref_previous              # previous point of reference (in previous detection)~%Point ref_centroid              # reference point to the centroid of the cluster~%int32 ref_type                  # reference type in the pre-asso: 8 = corner; 4/2 = line; 1 = centroid;~%~%~%# Line[] lines                    # Vector of Lines in the cluster~%# Corners[] corners               # Vector of Corners in the cluster~%~%================================================================================~%MSG: cargo_ants_msgs/Point~%float32 px~%float32 py~%~%================================================================================~%MSG: cargo_ants_msgs/Origin~%float32 ox~%float32 oy~%float32 oth~%~%================================================================================~%MSG: cargo_ants_msgs/Polyline~%# The polyline is walked in a clockwise direction, occupied space is~%# to the right of each line segment between two consecutive points.~%# In case the polyline is a polygon, the first point is repeated as~%# the last point.~%~%Point[] points~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LaserDetection>))
  (cl:+ 0
     1
     4
     4 (cl:length (cl:slot-value msg 'detection_frame_id))
     1
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'point_first))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'point_last))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'obj_center))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'obj_size))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'polylines) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ref_actual))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ref_previous))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ref_centroid))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LaserDetection>))
  "Converts a ROS message object to a list"
  (cl:list 'LaserDetection
    (cl:cons ':single_layer_sensor (single_layer_sensor msg))
    (cl:cons ':id (id msg))
    (cl:cons ':detection_frame_id (detection_frame_id msg))
    (cl:cons ':dynamic (dynamic msg))
    (cl:cons ':num_points (num_points msg))
    (cl:cons ':index_first (index_first msg))
    (cl:cons ':index_last (index_last msg))
    (cl:cons ':point_first (point_first msg))
    (cl:cons ':point_last (point_last msg))
    (cl:cons ':obj_center (obj_center msg))
    (cl:cons ':obj_size (obj_size msg))
    (cl:cons ':polylines (polylines msg))
    (cl:cons ':ref_actual (ref_actual msg))
    (cl:cons ':ref_previous (ref_previous msg))
    (cl:cons ':ref_centroid (ref_centroid msg))
    (cl:cons ':ref_type (ref_type msg))
))

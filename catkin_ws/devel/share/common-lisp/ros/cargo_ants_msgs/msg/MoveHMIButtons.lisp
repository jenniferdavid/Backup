; Auto-generated. Do not edit!


(cl:in-package cargo_ants_msgs-msg)


;//! \htmlinclude MoveHMIButtons.msg.html

(cl:defclass <MoveHMIButtons> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (sensorId
    :reader sensorId
    :initarg :sensorId
    :type cl:fixnum
    :initform 0)
   (ModeBtn
    :reader ModeBtn
    :initarg :ModeBtn
    :type cl:fixnum
    :initform 0)
   (HwModeBtn
    :reader HwModeBtn
    :initarg :HwModeBtn
    :type cl:fixnum
    :initform 0)
   (SetMinBtn
    :reader SetMinBtn
    :initarg :SetMinBtn
    :type cl:fixnum
    :initform 0)
   (ResPlusBtn
    :reader ResPlusBtn
    :initarg :ResPlusBtn
    :type cl:fixnum
    :initform 0)
   (CancelBtn
    :reader CancelBtn
    :initarg :CancelBtn
    :type cl:fixnum
    :initform 0)
   (OnOffBtn
    :reader OnOffBtn
    :initarg :OnOffBtn
    :type cl:fixnum
    :initform 0)
   (EmergencyBtn
    :reader EmergencyBtn
    :initarg :EmergencyBtn
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MoveHMIButtons (<MoveHMIButtons>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveHMIButtons>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveHMIButtons)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cargo_ants_msgs-msg:<MoveHMIButtons> is deprecated: use cargo_ants_msgs-msg:MoveHMIButtons instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MoveHMIButtons>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:header-val is deprecated.  Use cargo_ants_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensorId-val :lambda-list '(m))
(cl:defmethod sensorId-val ((m <MoveHMIButtons>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:sensorId-val is deprecated.  Use cargo_ants_msgs-msg:sensorId instead.")
  (sensorId m))

(cl:ensure-generic-function 'ModeBtn-val :lambda-list '(m))
(cl:defmethod ModeBtn-val ((m <MoveHMIButtons>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:ModeBtn-val is deprecated.  Use cargo_ants_msgs-msg:ModeBtn instead.")
  (ModeBtn m))

(cl:ensure-generic-function 'HwModeBtn-val :lambda-list '(m))
(cl:defmethod HwModeBtn-val ((m <MoveHMIButtons>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:HwModeBtn-val is deprecated.  Use cargo_ants_msgs-msg:HwModeBtn instead.")
  (HwModeBtn m))

(cl:ensure-generic-function 'SetMinBtn-val :lambda-list '(m))
(cl:defmethod SetMinBtn-val ((m <MoveHMIButtons>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:SetMinBtn-val is deprecated.  Use cargo_ants_msgs-msg:SetMinBtn instead.")
  (SetMinBtn m))

(cl:ensure-generic-function 'ResPlusBtn-val :lambda-list '(m))
(cl:defmethod ResPlusBtn-val ((m <MoveHMIButtons>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:ResPlusBtn-val is deprecated.  Use cargo_ants_msgs-msg:ResPlusBtn instead.")
  (ResPlusBtn m))

(cl:ensure-generic-function 'CancelBtn-val :lambda-list '(m))
(cl:defmethod CancelBtn-val ((m <MoveHMIButtons>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:CancelBtn-val is deprecated.  Use cargo_ants_msgs-msg:CancelBtn instead.")
  (CancelBtn m))

(cl:ensure-generic-function 'OnOffBtn-val :lambda-list '(m))
(cl:defmethod OnOffBtn-val ((m <MoveHMIButtons>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:OnOffBtn-val is deprecated.  Use cargo_ants_msgs-msg:OnOffBtn instead.")
  (OnOffBtn m))

(cl:ensure-generic-function 'EmergencyBtn-val :lambda-list '(m))
(cl:defmethod EmergencyBtn-val ((m <MoveHMIButtons>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cargo_ants_msgs-msg:EmergencyBtn-val is deprecated.  Use cargo_ants_msgs-msg:EmergencyBtn instead.")
  (EmergencyBtn m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveHMIButtons>) ostream)
  "Serializes a message object of type '<MoveHMIButtons>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ModeBtn)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'HwModeBtn)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'SetMinBtn)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ResPlusBtn)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CancelBtn)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'OnOffBtn)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'EmergencyBtn)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveHMIButtons>) istream)
  "Deserializes a message object of type '<MoveHMIButtons>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensorId)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ModeBtn)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'HwModeBtn)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'SetMinBtn)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ResPlusBtn)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CancelBtn)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'OnOffBtn)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'EmergencyBtn)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveHMIButtons>)))
  "Returns string type for a message object of type '<MoveHMIButtons>"
  "cargo_ants_msgs/MoveHMIButtons")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveHMIButtons)))
  "Returns string type for a message object of type 'MoveHMIButtons"
  "cargo_ants_msgs/MoveHMIButtons")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveHMIButtons>)))
  "Returns md5sum for a message object of type '<MoveHMIButtons>"
  "008488abd9a1388f7012b53ca1022614")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveHMIButtons)))
  "Returns md5sum for a message object of type 'MoveHMIButtons"
  "008488abd9a1388f7012b53ca1022614")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveHMIButtons>)))
  "Returns full string definition for message of type '<MoveHMIButtons>"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%~%uint8 sensorId    # id of sensor~%~%~%uint8 ModeBtn~%uint8 HwModeBtn~%uint8 SetMinBtn~%uint8 ResPlusBtn~%uint8 CancelBtn~%uint8 OnOffBtn~%uint8 EmergencyBtn~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveHMIButtons)))
  "Returns full string definition for message of type 'MoveHMIButtons"
  (cl:format cl:nil "Header header            # timestamp in the header is the acquisition time of~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%~%uint8 sensorId    # id of sensor~%~%~%uint8 ModeBtn~%uint8 HwModeBtn~%uint8 SetMinBtn~%uint8 ResPlusBtn~%uint8 CancelBtn~%uint8 OnOffBtn~%uint8 EmergencyBtn~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveHMIButtons>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveHMIButtons>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveHMIButtons
    (cl:cons ':header (header msg))
    (cl:cons ':sensorId (sensorId msg))
    (cl:cons ':ModeBtn (ModeBtn msg))
    (cl:cons ':HwModeBtn (HwModeBtn msg))
    (cl:cons ':SetMinBtn (SetMinBtn msg))
    (cl:cons ':ResPlusBtn (ResPlusBtn msg))
    (cl:cons ':CancelBtn (CancelBtn msg))
    (cl:cons ':OnOffBtn (OnOffBtn msg))
    (cl:cons ':EmergencyBtn (EmergencyBtn msg))
))

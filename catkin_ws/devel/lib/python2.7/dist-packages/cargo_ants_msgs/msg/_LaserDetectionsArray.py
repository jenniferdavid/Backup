# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from cargo_ants_msgs/LaserDetectionsArray.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import cargo_ants_msgs.msg
import std_msgs.msg

class LaserDetectionsArray(genpy.Message):
  _md5sum = "ce02bdd5be7bd901a891185084e00010"
  _type = "cargo_ants_msgs/LaserDetectionsArray"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """# Array of all the objects detected from a single layer laser sensor.
# UNDER CONSTRUCTION

Header header 			# Timestamp, frame id
LaserDetection[] laser_detections   # Set of targets being tracked
int32 num_detections

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: cargo_ants_msgs/LaserDetection
# To be use as OBSTACLE detected in a laser.

bool single_layer_sensor       # True = single layer sensor (i.e: SICK) - False = multiple layer (i.e: IBEO)

int32 id                        # number of detection in scan (-1 if unknown)
string detection_frame_id       # frame ID of the sensor from which the detection comes.

bool dynamic                    # 1 = dynamic object; 0 = not (means that has been associated)
int32 num_points                # number of laser points contained
int32 index_first               # index of the range vector of the first point used? or filteredVector?
int32 index_last                # index of the range vector of the first point used? or filteredVector?

Point point_first               # first point of the cluster
Point point_last                # first point of the cluster

Origin obj_center               # Center point of the object bounding box and orientation
Point obj_size                  # X and Y (width and Height) of the object bounding box
Polyline[] polylines            # Set of points defining the Rectangle of the Bounding Box

Point ref_actual                # point of reference at the moment
Point ref_previous              # previous point of reference (in previous detection)
Point ref_centroid              # reference point to the centroid of the cluster
int32 ref_type                  # reference type in the pre-asso: 8 = corner; 4/2 = line; 1 = centroid;


# Line[] lines                    # Vector of Lines in the cluster
# Corners[] corners               # Vector of Corners in the cluster

================================================================================
MSG: cargo_ants_msgs/Point
float32 px
float32 py

================================================================================
MSG: cargo_ants_msgs/Origin
float32 ox
float32 oy
float32 oth

================================================================================
MSG: cargo_ants_msgs/Polyline
# The polyline is walked in a clockwise direction, occupied space is
# to the right of each line segment between two consecutive points.
# In case the polyline is a polygon, the first point is repeated as
# the last point.

Point[] points
"""
  __slots__ = ['header','laser_detections','num_detections']
  _slot_types = ['std_msgs/Header','cargo_ants_msgs/LaserDetection[]','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,laser_detections,num_detections

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(LaserDetectionsArray, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.laser_detections is None:
        self.laser_detections = []
      if self.num_detections is None:
        self.num_detections = 0
    else:
      self.header = std_msgs.msg.Header()
      self.laser_detections = []
      self.num_detections = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.laser_detections)
      buff.write(_struct_I.pack(length))
      for val1 in self.laser_detections:
        _x = val1
        buff.write(_struct_Bi.pack(_x.single_layer_sensor, _x.id))
        _x = val1.detection_frame_id
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        if python3:
          buff.write(struct.pack('<I%sB'%length, length, *_x))
        else:
          buff.write(struct.pack('<I%ss'%length, length, _x))
        _x = val1
        buff.write(_struct_B3i.pack(_x.dynamic, _x.num_points, _x.index_first, _x.index_last))
        _v1 = val1.point_first
        _x = _v1
        buff.write(_struct_2f.pack(_x.px, _x.py))
        _v2 = val1.point_last
        _x = _v2
        buff.write(_struct_2f.pack(_x.px, _x.py))
        _v3 = val1.obj_center
        _x = _v3
        buff.write(_struct_3f.pack(_x.ox, _x.oy, _x.oth))
        _v4 = val1.obj_size
        _x = _v4
        buff.write(_struct_2f.pack(_x.px, _x.py))
        length = len(val1.polylines)
        buff.write(_struct_I.pack(length))
        for val2 in val1.polylines:
          length = len(val2.points)
          buff.write(_struct_I.pack(length))
          for val3 in val2.points:
            _x = val3
            buff.write(_struct_2f.pack(_x.px, _x.py))
        _v5 = val1.ref_actual
        _x = _v5
        buff.write(_struct_2f.pack(_x.px, _x.py))
        _v6 = val1.ref_previous
        _x = _v6
        buff.write(_struct_2f.pack(_x.px, _x.py))
        _v7 = val1.ref_centroid
        _x = _v7
        buff.write(_struct_2f.pack(_x.px, _x.py))
        buff.write(_struct_i.pack(val1.ref_type))
      buff.write(_struct_i.pack(self.num_detections))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.laser_detections is None:
        self.laser_detections = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.laser_detections = []
      for i in range(0, length):
        val1 = cargo_ants_msgs.msg.LaserDetection()
        _x = val1
        start = end
        end += 5
        (_x.single_layer_sensor, _x.id,) = _struct_Bi.unpack(str[start:end])
        val1.single_layer_sensor = bool(val1.single_layer_sensor)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.detection_frame_id = str[start:end].decode('utf-8')
        else:
          val1.detection_frame_id = str[start:end]
        _x = val1
        start = end
        end += 13
        (_x.dynamic, _x.num_points, _x.index_first, _x.index_last,) = _struct_B3i.unpack(str[start:end])
        val1.dynamic = bool(val1.dynamic)
        _v8 = val1.point_first
        _x = _v8
        start = end
        end += 8
        (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
        _v9 = val1.point_last
        _x = _v9
        start = end
        end += 8
        (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
        _v10 = val1.obj_center
        _x = _v10
        start = end
        end += 12
        (_x.ox, _x.oy, _x.oth,) = _struct_3f.unpack(str[start:end])
        _v11 = val1.obj_size
        _x = _v11
        start = end
        end += 8
        (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.polylines = []
        for i in range(0, length):
          val2 = cargo_ants_msgs.msg.Polyline()
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          val2.points = []
          for i in range(0, length):
            val3 = cargo_ants_msgs.msg.Point()
            _x = val3
            start = end
            end += 8
            (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
            val2.points.append(val3)
          val1.polylines.append(val2)
        _v12 = val1.ref_actual
        _x = _v12
        start = end
        end += 8
        (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
        _v13 = val1.ref_previous
        _x = _v13
        start = end
        end += 8
        (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
        _v14 = val1.ref_centroid
        _x = _v14
        start = end
        end += 8
        (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
        start = end
        end += 4
        (val1.ref_type,) = _struct_i.unpack(str[start:end])
        self.laser_detections.append(val1)
      start = end
      end += 4
      (self.num_detections,) = _struct_i.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.laser_detections)
      buff.write(_struct_I.pack(length))
      for val1 in self.laser_detections:
        _x = val1
        buff.write(_struct_Bi.pack(_x.single_layer_sensor, _x.id))
        _x = val1.detection_frame_id
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        if python3:
          buff.write(struct.pack('<I%sB'%length, length, *_x))
        else:
          buff.write(struct.pack('<I%ss'%length, length, _x))
        _x = val1
        buff.write(_struct_B3i.pack(_x.dynamic, _x.num_points, _x.index_first, _x.index_last))
        _v15 = val1.point_first
        _x = _v15
        buff.write(_struct_2f.pack(_x.px, _x.py))
        _v16 = val1.point_last
        _x = _v16
        buff.write(_struct_2f.pack(_x.px, _x.py))
        _v17 = val1.obj_center
        _x = _v17
        buff.write(_struct_3f.pack(_x.ox, _x.oy, _x.oth))
        _v18 = val1.obj_size
        _x = _v18
        buff.write(_struct_2f.pack(_x.px, _x.py))
        length = len(val1.polylines)
        buff.write(_struct_I.pack(length))
        for val2 in val1.polylines:
          length = len(val2.points)
          buff.write(_struct_I.pack(length))
          for val3 in val2.points:
            _x = val3
            buff.write(_struct_2f.pack(_x.px, _x.py))
        _v19 = val1.ref_actual
        _x = _v19
        buff.write(_struct_2f.pack(_x.px, _x.py))
        _v20 = val1.ref_previous
        _x = _v20
        buff.write(_struct_2f.pack(_x.px, _x.py))
        _v21 = val1.ref_centroid
        _x = _v21
        buff.write(_struct_2f.pack(_x.px, _x.py))
        buff.write(_struct_i.pack(val1.ref_type))
      buff.write(_struct_i.pack(self.num_detections))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.laser_detections is None:
        self.laser_detections = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.laser_detections = []
      for i in range(0, length):
        val1 = cargo_ants_msgs.msg.LaserDetection()
        _x = val1
        start = end
        end += 5
        (_x.single_layer_sensor, _x.id,) = _struct_Bi.unpack(str[start:end])
        val1.single_layer_sensor = bool(val1.single_layer_sensor)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.detection_frame_id = str[start:end].decode('utf-8')
        else:
          val1.detection_frame_id = str[start:end]
        _x = val1
        start = end
        end += 13
        (_x.dynamic, _x.num_points, _x.index_first, _x.index_last,) = _struct_B3i.unpack(str[start:end])
        val1.dynamic = bool(val1.dynamic)
        _v22 = val1.point_first
        _x = _v22
        start = end
        end += 8
        (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
        _v23 = val1.point_last
        _x = _v23
        start = end
        end += 8
        (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
        _v24 = val1.obj_center
        _x = _v24
        start = end
        end += 12
        (_x.ox, _x.oy, _x.oth,) = _struct_3f.unpack(str[start:end])
        _v25 = val1.obj_size
        _x = _v25
        start = end
        end += 8
        (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.polylines = []
        for i in range(0, length):
          val2 = cargo_ants_msgs.msg.Polyline()
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          val2.points = []
          for i in range(0, length):
            val3 = cargo_ants_msgs.msg.Point()
            _x = val3
            start = end
            end += 8
            (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
            val2.points.append(val3)
          val1.polylines.append(val2)
        _v26 = val1.ref_actual
        _x = _v26
        start = end
        end += 8
        (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
        _v27 = val1.ref_previous
        _x = _v27
        start = end
        end += 8
        (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
        _v28 = val1.ref_centroid
        _x = _v28
        start = end
        end += 8
        (_x.px, _x.py,) = _struct_2f.unpack(str[start:end])
        start = end
        end += 4
        (val1.ref_type,) = _struct_i.unpack(str[start:end])
        self.laser_detections.append(val1)
      start = end
      end += 4
      (self.num_detections,) = _struct_i.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_i = struct.Struct("<i")
_struct_Bi = struct.Struct("<Bi")
_struct_3I = struct.Struct("<3I")
_struct_2f = struct.Struct("<2f")
_struct_3f = struct.Struct("<3f")
_struct_B3i = struct.Struct("<B3i")
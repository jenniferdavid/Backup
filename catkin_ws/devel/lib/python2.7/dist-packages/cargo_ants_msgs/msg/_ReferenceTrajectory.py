# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from cargo_ants_msgs/ReferenceTrajectory.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import cargo_ants_msgs.msg
import std_msgs.msg

class ReferenceTrajectory(genpy.Message):
  _md5sum = "8702cc44b741fe0d2e1e25180e01c279"
  _type = "cargo_ants_msgs/ReferenceTrajectory"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """#time start
float32 dt

Header header

string child_frame_id

float32 NEW=1
float32 OLD=0
float32 ID

ReferenceTrajectoryPoint[] points

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
MSG: cargo_ants_msgs/ReferenceTrajectoryPoint
float32 xx
float32 yy
float32 th
float32 xd
float32 yd
float32 thd
float32 xdd
float32 ydd
float32 thdd
"""
  # Pseudo-constants
  NEW = 1.0
  OLD = 0.0

  __slots__ = ['dt','header','child_frame_id','ID','points']
  _slot_types = ['float32','std_msgs/Header','string','float32','cargo_ants_msgs/ReferenceTrajectoryPoint[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       dt,header,child_frame_id,ID,points

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ReferenceTrajectory, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.dt is None:
        self.dt = 0.
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.child_frame_id is None:
        self.child_frame_id = ''
      if self.ID is None:
        self.ID = 0.
      if self.points is None:
        self.points = []
    else:
      self.dt = 0.
      self.header = std_msgs.msg.Header()
      self.child_frame_id = ''
      self.ID = 0.
      self.points = []

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
      buff.write(_struct_f3I.pack(_x.dt, _x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.child_frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_struct_f.pack(self.ID))
      length = len(self.points)
      buff.write(_struct_I.pack(length))
      for val1 in self.points:
        _x = val1
        buff.write(_struct_9f.pack(_x.xx, _x.yy, _x.th, _x.xd, _x.yd, _x.thd, _x.xdd, _x.ydd, _x.thdd))
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
      if self.points is None:
        self.points = None
      end = 0
      _x = self
      start = end
      end += 16
      (_x.dt, _x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_f3I.unpack(str[start:end])
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
      start = end
      end += length
      if python3:
        self.child_frame_id = str[start:end].decode('utf-8')
      else:
        self.child_frame_id = str[start:end]
      start = end
      end += 4
      (self.ID,) = _struct_f.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.points = []
      for i in range(0, length):
        val1 = cargo_ants_msgs.msg.ReferenceTrajectoryPoint()
        _x = val1
        start = end
        end += 36
        (_x.xx, _x.yy, _x.th, _x.xd, _x.yd, _x.thd, _x.xdd, _x.ydd, _x.thdd,) = _struct_9f.unpack(str[start:end])
        self.points.append(val1)
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
      buff.write(_struct_f3I.pack(_x.dt, _x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.child_frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_struct_f.pack(self.ID))
      length = len(self.points)
      buff.write(_struct_I.pack(length))
      for val1 in self.points:
        _x = val1
        buff.write(_struct_9f.pack(_x.xx, _x.yy, _x.th, _x.xd, _x.yd, _x.thd, _x.xdd, _x.ydd, _x.thdd))
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
      if self.points is None:
        self.points = None
      end = 0
      _x = self
      start = end
      end += 16
      (_x.dt, _x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_f3I.unpack(str[start:end])
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
      start = end
      end += length
      if python3:
        self.child_frame_id = str[start:end].decode('utf-8')
      else:
        self.child_frame_id = str[start:end]
      start = end
      end += 4
      (self.ID,) = _struct_f.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.points = []
      for i in range(0, length):
        val1 = cargo_ants_msgs.msg.ReferenceTrajectoryPoint()
        _x = val1
        start = end
        end += 36
        (_x.xx, _x.yy, _x.th, _x.xd, _x.yd, _x.thd, _x.xdd, _x.ydd, _x.thdd,) = _struct_9f.unpack(str[start:end])
        self.points.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_f3I = struct.Struct("<f3I")
_struct_9f = struct.Struct("<9f")
_struct_f = struct.Struct("<f")

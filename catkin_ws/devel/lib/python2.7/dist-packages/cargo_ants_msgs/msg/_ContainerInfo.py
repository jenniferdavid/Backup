# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from cargo_ants_msgs/ContainerInfo.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class ContainerInfo(genpy.Message):
  _md5sum = "f53848ce479bdf99fcf881223d62e144"
  _type = "cargo_ants_msgs/ContainerInfo"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """uint8 LIFTED=0
uint8 ATTACHED=1
uint8 PLACED=2
uint8 OFFSITE=3
uint8 state

string container
string vehicle

float64 pickup_x
float64 pickup_y
float64 pickup_th

float64 placedown_x
float64 placedown_y
float64 placedown_th
"""
  # Pseudo-constants
  LIFTED = 0
  ATTACHED = 1
  PLACED = 2
  OFFSITE = 3

  __slots__ = ['state','container','vehicle','pickup_x','pickup_y','pickup_th','placedown_x','placedown_y','placedown_th']
  _slot_types = ['uint8','string','string','float64','float64','float64','float64','float64','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       state,container,vehicle,pickup_x,pickup_y,pickup_th,placedown_x,placedown_y,placedown_th

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ContainerInfo, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.state is None:
        self.state = 0
      if self.container is None:
        self.container = ''
      if self.vehicle is None:
        self.vehicle = ''
      if self.pickup_x is None:
        self.pickup_x = 0.
      if self.pickup_y is None:
        self.pickup_y = 0.
      if self.pickup_th is None:
        self.pickup_th = 0.
      if self.placedown_x is None:
        self.placedown_x = 0.
      if self.placedown_y is None:
        self.placedown_y = 0.
      if self.placedown_th is None:
        self.placedown_th = 0.
    else:
      self.state = 0
      self.container = ''
      self.vehicle = ''
      self.pickup_x = 0.
      self.pickup_y = 0.
      self.pickup_th = 0.
      self.placedown_x = 0.
      self.placedown_y = 0.
      self.placedown_th = 0.

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
      buff.write(_struct_B.pack(self.state))
      _x = self.container
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.vehicle
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_6d.pack(_x.pickup_x, _x.pickup_y, _x.pickup_th, _x.placedown_x, _x.placedown_y, _x.placedown_th))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      start = end
      end += 1
      (self.state,) = _struct_B.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.container = str[start:end].decode('utf-8')
      else:
        self.container = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.vehicle = str[start:end].decode('utf-8')
      else:
        self.vehicle = str[start:end]
      _x = self
      start = end
      end += 48
      (_x.pickup_x, _x.pickup_y, _x.pickup_th, _x.placedown_x, _x.placedown_y, _x.placedown_th,) = _struct_6d.unpack(str[start:end])
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
      buff.write(_struct_B.pack(self.state))
      _x = self.container
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.vehicle
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_6d.pack(_x.pickup_x, _x.pickup_y, _x.pickup_th, _x.placedown_x, _x.placedown_y, _x.placedown_th))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      start = end
      end += 1
      (self.state,) = _struct_B.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.container = str[start:end].decode('utf-8')
      else:
        self.container = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.vehicle = str[start:end].decode('utf-8')
      else:
        self.vehicle = str[start:end]
      _x = self
      start = end
      end += 48
      (_x.pickup_x, _x.pickup_y, _x.pickup_th, _x.placedown_x, _x.placedown_y, _x.placedown_th,) = _struct_6d.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_B = struct.Struct("<B")
_struct_6d = struct.Struct("<6d")

// Generated by gencpp from file cargo_ants_msgs/OxtsVelocity.msg
// DO NOT EDIT!


#ifndef CARGO_ANTS_MSGS_MESSAGE_OXTSVELOCITY_H
#define CARGO_ANTS_MSGS_MESSAGE_OXTSVELOCITY_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace cargo_ants_msgs
{
template <class ContainerAllocator>
struct OxtsVelocity_
{
  typedef OxtsVelocity_<ContainerAllocator> Type;

  OxtsVelocity_()
    : header()
    , sensorId(0)
    , vnorth(0.0)
    , veast(0.0)
    , vdown(0.0)
    , speed2d(0.0)  {
    }
  OxtsVelocity_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , sensorId(0)
    , vnorth(0.0)
    , veast(0.0)
    , vdown(0.0)
    , speed2d(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint8_t _sensorId_type;
  _sensorId_type sensorId;

   typedef float _vnorth_type;
  _vnorth_type vnorth;

   typedef float _veast_type;
  _veast_type veast;

   typedef float _vdown_type;
  _vdown_type vdown;

   typedef float _speed2d_type;
  _speed2d_type speed2d;




  typedef boost::shared_ptr< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> const> ConstPtr;

}; // struct OxtsVelocity_

typedef ::cargo_ants_msgs::OxtsVelocity_<std::allocator<void> > OxtsVelocity;

typedef boost::shared_ptr< ::cargo_ants_msgs::OxtsVelocity > OxtsVelocityPtr;
typedef boost::shared_ptr< ::cargo_ants_msgs::OxtsVelocity const> OxtsVelocityConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace cargo_ants_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'sensor_msgs': ['/opt/ros/indigo/share/sensor_msgs/cmake/../msg'], 'cargo_ants_msgs': ['/home/jendav/catkin_ws/src/code/cargo-ants-ros-pkgs/cargo_ants_msgs/msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5446c11a8e6f6eeb85446be813a6f904";
  }

  static const char* value(const ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5446c11a8e6f6eebULL;
  static const uint64_t static_value2 = 0x85446be813a6f904ULL;
};

template<class ContainerAllocator>
struct DataType< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cargo_ants_msgs/OxtsVelocity";
  }

  static const char* value(const ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header            # timestamp in the header is the acquisition time of\n\
                         # the first ray in the scan.\n\
                         #\n\
                         # in frame frame_id, angles are measured around\n\
                         # the positive Z axis (counterclockwise, if Z is up)\n\
                         # with zero angle being forward along the x axis\n\
\n\
uint8 sensorId    # id of sensor\n\
\n\
float32 vnorth\n\
float32 veast\n\
float32 vdown\n\
float32 speed2d\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.sensorId);
      stream.next(m.vnorth);
      stream.next(m.veast);
      stream.next(m.vdown);
      stream.next(m.speed2d);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct OxtsVelocity_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cargo_ants_msgs::OxtsVelocity_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "sensorId: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.sensorId);
    s << indent << "vnorth: ";
    Printer<float>::stream(s, indent + "  ", v.vnorth);
    s << indent << "veast: ";
    Printer<float>::stream(s, indent + "  ", v.veast);
    s << indent << "vdown: ";
    Printer<float>::stream(s, indent + "  ", v.vdown);
    s << indent << "speed2d: ";
    Printer<float>::stream(s, indent + "  ", v.speed2d);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CARGO_ANTS_MSGS_MESSAGE_OXTSVELOCITY_H

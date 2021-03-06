// Generated by gencpp from file cargo_ants_msgs/BNRLogging.msg
// DO NOT EDIT!


#ifndef CARGO_ANTS_MSGS_MESSAGE_BNRLOGGING_H
#define CARGO_ANTS_MSGS_MESSAGE_BNRLOGGING_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Pose2D.h>

namespace cargo_ants_msgs
{
template <class ContainerAllocator>
struct BNRLogging_
{
  typedef BNRLogging_<ContainerAllocator> Type;

  BNRLogging_()
    : header()
    , bnr_timestamp(0.0)
    , localization()  {
    }
  BNRLogging_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , bnr_timestamp(0.0)
    , localization(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef float _bnr_timestamp_type;
  _bnr_timestamp_type bnr_timestamp;

   typedef  ::geometry_msgs::Pose2D_<ContainerAllocator>  _localization_type;
  _localization_type localization;




  typedef boost::shared_ptr< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> const> ConstPtr;

}; // struct BNRLogging_

typedef ::cargo_ants_msgs::BNRLogging_<std::allocator<void> > BNRLogging;

typedef boost::shared_ptr< ::cargo_ants_msgs::BNRLogging > BNRLoggingPtr;
typedef boost::shared_ptr< ::cargo_ants_msgs::BNRLogging const> BNRLoggingConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> >
{
  static const char* value()
  {
    return "86f3ccc37bf0d4beb9583297ea9de8c1";
  }

  static const char* value(const ::cargo_ants_msgs::BNRLogging_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x86f3ccc37bf0d4beULL;
  static const uint64_t static_value2 = 0xb9583297ea9de8c1ULL;
};

template<class ContainerAllocator>
struct DataType< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cargo_ants_msgs/BNRLogging";
  }

  static const char* value(const ::cargo_ants_msgs::BNRLogging_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
\n\
float32 bnr_timestamp\n\
geometry_msgs/Pose2D localization\n\
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
\n\
================================================================================\n\
MSG: geometry_msgs/Pose2D\n\
# This expresses a position and orientation on a 2D manifold.\n\
\n\
float64 x\n\
float64 y\n\
float64 theta\n\
";
  }

  static const char* value(const ::cargo_ants_msgs::BNRLogging_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.bnr_timestamp);
      stream.next(m.localization);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct BNRLogging_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cargo_ants_msgs::BNRLogging_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cargo_ants_msgs::BNRLogging_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "bnr_timestamp: ";
    Printer<float>::stream(s, indent + "  ", v.bnr_timestamp);
    s << indent << "localization: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose2D_<ContainerAllocator> >::stream(s, indent + "  ", v.localization);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CARGO_ANTS_MSGS_MESSAGE_BNRLOGGING_H

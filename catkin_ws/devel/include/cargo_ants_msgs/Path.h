// Generated by gencpp from file cargo_ants_msgs/Path.msg
// DO NOT EDIT!


#ifndef CARGO_ANTS_MSGS_MESSAGE_PATH_H
#define CARGO_ANTS_MSGS_MESSAGE_PATH_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <cargo_ants_msgs/Goal.h>

namespace cargo_ants_msgs
{
template <class ContainerAllocator>
struct Path_
{
  typedef Path_<ContainerAllocator> Type;

  Path_()
    : mode(0)
    , container()
    , goals()  {
    }
  Path_(const ContainerAllocator& _alloc)
    : mode(0)
    , container(_alloc)
    , goals(_alloc)  {
  (void)_alloc;
    }



   typedef uint8_t _mode_type;
  _mode_type mode;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _container_type;
  _container_type container;

   typedef std::vector< ::cargo_ants_msgs::Goal_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::cargo_ants_msgs::Goal_<ContainerAllocator> >::other >  _goals_type;
  _goals_type goals;


    enum { PICKUP = 0u };
     enum { PLACEDOWN = 1u };
     enum { ABORT = 2u };
     enum { IDLE = 3u };
 

  typedef boost::shared_ptr< ::cargo_ants_msgs::Path_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cargo_ants_msgs::Path_<ContainerAllocator> const> ConstPtr;

}; // struct Path_

typedef ::cargo_ants_msgs::Path_<std::allocator<void> > Path;

typedef boost::shared_ptr< ::cargo_ants_msgs::Path > PathPtr;
typedef boost::shared_ptr< ::cargo_ants_msgs::Path const> PathConstPtr;

// constants requiring out of line definition

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cargo_ants_msgs::Path_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cargo_ants_msgs::Path_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace cargo_ants_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/indigo/share/sensor_msgs/cmake/../msg'], 'cargo_ants_msgs': ['/home/jendav/catkin_ws/src/code/cargo-ants-ros-pkgs/cargo_ants_msgs/msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::cargo_ants_msgs::Path_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cargo_ants_msgs::Path_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::Path_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::Path_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::Path_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::Path_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cargo_ants_msgs::Path_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6e7b6f79c7cbe4de3041322b72f3a98b";
  }

  static const char* value(const ::cargo_ants_msgs::Path_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6e7b6f79c7cbe4deULL;
  static const uint64_t static_value2 = 0x3041322b72f3a98bULL;
};

template<class ContainerAllocator>
struct DataType< ::cargo_ants_msgs::Path_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cargo_ants_msgs/Path";
  }

  static const char* value(const ::cargo_ants_msgs::Path_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cargo_ants_msgs::Path_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 PICKUP=0\n\
uint8 PLACEDOWN=1\n\
uint8 ABORT=2\n\
uint8 IDLE=3\n\
uint8 mode\n\
\n\
string container\n\
\n\
Goal[] goals\n\
\n\
================================================================================\n\
MSG: cargo_ants_msgs/Goal\n\
# A goal is specified as its (gx,gy) coordinate and heading gth (for\n\
# \"goal theta\"). Additionally, dr is the radial tolerance, and dth the\n\
# angular tolerance to be achieved. Specifying a negative number for\n\
# either dr or dth disabled that particular tolerance. Thus, if you do\n\
# no care about the heading with which you arrive at a goal, specify\n\
# dth = -1 for example.  The goal message type is intended to be used\n\
# as part of other messages such as Path.msg, thus we do not include\n\
# the frame here as that should be the same for an entire array of\n\
# goals.\n\
\n\
float64 gx\n\
float64 gy\n\
float64 gth\n\
\n\
# Radial accuracy of the goal. Specifying dr <= 0.0 means that you do\n\
# not care about the goal position at all.\n\
#\n\
float64 dr\n\
\n\
# Angular accuracy of the goal. Specifying dth <= 0.0 or >= M_PI means\n\
# that orientation does not matter.\n\
#\n\
float64 dth\n\
\n\
\n\
#later? bool go_forward\n\
";
  }

  static const char* value(const ::cargo_ants_msgs::Path_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cargo_ants_msgs::Path_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.mode);
      stream.next(m.container);
      stream.next(m.goals);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Path_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cargo_ants_msgs::Path_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cargo_ants_msgs::Path_<ContainerAllocator>& v)
  {
    s << indent << "mode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.mode);
    s << indent << "container: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.container);
    s << indent << "goals[]" << std::endl;
    for (size_t i = 0; i < v.goals.size(); ++i)
    {
      s << indent << "  goals[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::cargo_ants_msgs::Goal_<ContainerAllocator> >::stream(s, indent + "    ", v.goals[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CARGO_ANTS_MSGS_MESSAGE_PATH_H

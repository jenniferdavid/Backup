// Generated by gencpp from file cargo_ants_msgs/Goal.msg
// DO NOT EDIT!


#ifndef CARGO_ANTS_MSGS_MESSAGE_GOAL_H
#define CARGO_ANTS_MSGS_MESSAGE_GOAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace cargo_ants_msgs
{
template <class ContainerAllocator>
struct Goal_
{
  typedef Goal_<ContainerAllocator> Type;

  Goal_()
    : gx(0.0)
    , gy(0.0)
    , gth(0.0)
    , dr(0.0)
    , dth(0.0)  {
    }
  Goal_(const ContainerAllocator& _alloc)
    : gx(0.0)
    , gy(0.0)
    , gth(0.0)
    , dr(0.0)
    , dth(0.0)  {
  (void)_alloc;
    }



   typedef double _gx_type;
  _gx_type gx;

   typedef double _gy_type;
  _gy_type gy;

   typedef double _gth_type;
  _gth_type gth;

   typedef double _dr_type;
  _dr_type dr;

   typedef double _dth_type;
  _dth_type dth;




  typedef boost::shared_ptr< ::cargo_ants_msgs::Goal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cargo_ants_msgs::Goal_<ContainerAllocator> const> ConstPtr;

}; // struct Goal_

typedef ::cargo_ants_msgs::Goal_<std::allocator<void> > Goal;

typedef boost::shared_ptr< ::cargo_ants_msgs::Goal > GoalPtr;
typedef boost::shared_ptr< ::cargo_ants_msgs::Goal const> GoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cargo_ants_msgs::Goal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cargo_ants_msgs::Goal_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace cargo_ants_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/indigo/share/sensor_msgs/cmake/../msg'], 'cargo_ants_msgs': ['/home/jendav/catkin_ws/src/code/cargo-ants-ros-pkgs/cargo_ants_msgs/msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::cargo_ants_msgs::Goal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cargo_ants_msgs::Goal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::Goal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::Goal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::Goal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::Goal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cargo_ants_msgs::Goal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7d179dcde16d513612781bb1500d9250";
  }

  static const char* value(const ::cargo_ants_msgs::Goal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7d179dcde16d5136ULL;
  static const uint64_t static_value2 = 0x12781bb1500d9250ULL;
};

template<class ContainerAllocator>
struct DataType< ::cargo_ants_msgs::Goal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cargo_ants_msgs/Goal";
  }

  static const char* value(const ::cargo_ants_msgs::Goal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cargo_ants_msgs::Goal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# A goal is specified as its (gx,gy) coordinate and heading gth (for\n\
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

  static const char* value(const ::cargo_ants_msgs::Goal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cargo_ants_msgs::Goal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.gx);
      stream.next(m.gy);
      stream.next(m.gth);
      stream.next(m.dr);
      stream.next(m.dth);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Goal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cargo_ants_msgs::Goal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cargo_ants_msgs::Goal_<ContainerAllocator>& v)
  {
    s << indent << "gx: ";
    Printer<double>::stream(s, indent + "  ", v.gx);
    s << indent << "gy: ";
    Printer<double>::stream(s, indent + "  ", v.gy);
    s << indent << "gth: ";
    Printer<double>::stream(s, indent + "  ", v.gth);
    s << indent << "dr: ";
    Printer<double>::stream(s, indent + "  ", v.dr);
    s << indent << "dth: ";
    Printer<double>::stream(s, indent + "  ", v.dth);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CARGO_ANTS_MSGS_MESSAGE_GOAL_H

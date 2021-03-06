// Generated by gencpp from file cargo_ants_msgs/Polyline.msg
// DO NOT EDIT!


#ifndef CARGO_ANTS_MSGS_MESSAGE_POLYLINE_H
#define CARGO_ANTS_MSGS_MESSAGE_POLYLINE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <cargo_ants_msgs/Point.h>

namespace cargo_ants_msgs
{
template <class ContainerAllocator>
struct Polyline_
{
  typedef Polyline_<ContainerAllocator> Type;

  Polyline_()
    : points()  {
    }
  Polyline_(const ContainerAllocator& _alloc)
    : points(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::cargo_ants_msgs::Point_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::cargo_ants_msgs::Point_<ContainerAllocator> >::other >  _points_type;
  _points_type points;




  typedef boost::shared_ptr< ::cargo_ants_msgs::Polyline_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cargo_ants_msgs::Polyline_<ContainerAllocator> const> ConstPtr;

}; // struct Polyline_

typedef ::cargo_ants_msgs::Polyline_<std::allocator<void> > Polyline;

typedef boost::shared_ptr< ::cargo_ants_msgs::Polyline > PolylinePtr;
typedef boost::shared_ptr< ::cargo_ants_msgs::Polyline const> PolylineConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cargo_ants_msgs::Polyline_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cargo_ants_msgs::Polyline_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::cargo_ants_msgs::Polyline_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cargo_ants_msgs::Polyline_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::Polyline_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::Polyline_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::Polyline_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::Polyline_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cargo_ants_msgs::Polyline_<ContainerAllocator> >
{
  static const char* value()
  {
    return "230d67fa90b40ade9edb974c76047152";
  }

  static const char* value(const ::cargo_ants_msgs::Polyline_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x230d67fa90b40adeULL;
  static const uint64_t static_value2 = 0x9edb974c76047152ULL;
};

template<class ContainerAllocator>
struct DataType< ::cargo_ants_msgs::Polyline_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cargo_ants_msgs/Polyline";
  }

  static const char* value(const ::cargo_ants_msgs::Polyline_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cargo_ants_msgs::Polyline_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# The polyline is walked in a clockwise direction, occupied space is\n\
# to the right of each line segment between two consecutive points.\n\
# In case the polyline is a polygon, the first point is repeated as\n\
# the last point.\n\
\n\
Point[] points\n\
\n\
================================================================================\n\
MSG: cargo_ants_msgs/Point\n\
float32 px\n\
float32 py\n\
";
  }

  static const char* value(const ::cargo_ants_msgs::Polyline_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cargo_ants_msgs::Polyline_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.points);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Polyline_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cargo_ants_msgs::Polyline_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cargo_ants_msgs::Polyline_<ContainerAllocator>& v)
  {
    s << indent << "points[]" << std::endl;
    for (size_t i = 0; i < v.points.size(); ++i)
    {
      s << indent << "  points[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::cargo_ants_msgs::Point_<ContainerAllocator> >::stream(s, indent + "    ", v.points[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CARGO_ANTS_MSGS_MESSAGE_POLYLINE_H

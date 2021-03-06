// Generated by gencpp from file cargo_ants_msgs/ObstacleMap.msg
// DO NOT EDIT!


#ifndef CARGO_ANTS_MSGS_MESSAGE_OBSTACLEMAP_H
#define CARGO_ANTS_MSGS_MESSAGE_OBSTACLEMAP_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <cargo_ants_msgs/Obstacle.h>

namespace cargo_ants_msgs
{
template <class ContainerAllocator>
struct ObstacleMap_
{
  typedef ObstacleMap_<ContainerAllocator> Type;

  ObstacleMap_()
    : obstacles()  {
    }
  ObstacleMap_(const ContainerAllocator& _alloc)
    : obstacles(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::cargo_ants_msgs::Obstacle_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::cargo_ants_msgs::Obstacle_<ContainerAllocator> >::other >  _obstacles_type;
  _obstacles_type obstacles;




  typedef boost::shared_ptr< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> const> ConstPtr;

}; // struct ObstacleMap_

typedef ::cargo_ants_msgs::ObstacleMap_<std::allocator<void> > ObstacleMap;

typedef boost::shared_ptr< ::cargo_ants_msgs::ObstacleMap > ObstacleMapPtr;
typedef boost::shared_ptr< ::cargo_ants_msgs::ObstacleMap const> ObstacleMapConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e166b16de200e7fdba8d6a003a53be73";
  }

  static const char* value(const ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe166b16de200e7fdULL;
  static const uint64_t static_value2 = 0xba8d6a003a53be73ULL;
};

template<class ContainerAllocator>
struct DataType< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cargo_ants_msgs/ObstacleMap";
  }

  static const char* value(const ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Obstacle[] obstacles\n\
\n\
================================================================================\n\
MSG: cargo_ants_msgs/Obstacle\n\
uint32 UNKNOWN=0\n\
uint32 CONTAINER=1\n\
uint32 type_tag\n\
\n\
Origin origin\n\
Polyline[] polylines\n\
\n\
================================================================================\n\
MSG: cargo_ants_msgs/Origin\n\
float32 ox\n\
float32 oy\n\
float32 oth\n\
\n\
================================================================================\n\
MSG: cargo_ants_msgs/Polyline\n\
# The polyline is walked in a clockwise direction, occupied space is\n\
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

  static const char* value(const ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.obstacles);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ObstacleMap_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cargo_ants_msgs::ObstacleMap_<ContainerAllocator>& v)
  {
    s << indent << "obstacles[]" << std::endl;
    for (size_t i = 0; i < v.obstacles.size(); ++i)
    {
      s << indent << "  obstacles[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::cargo_ants_msgs::Obstacle_<ContainerAllocator> >::stream(s, indent + "    ", v.obstacles[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CARGO_ANTS_MSGS_MESSAGE_OBSTACLEMAP_H

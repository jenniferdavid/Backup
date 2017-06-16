// Generated by gencpp from file cargo_ants_msgs/RadarObject309.msg
// DO NOT EDIT!


#ifndef CARGO_ANTS_MSGS_MESSAGE_RADAROBJECT309_H
#define CARGO_ANTS_MSGS_MESSAGE_RADAROBJECT309_H


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
struct RadarObject309_
{
  typedef RadarObject309_<ContainerAllocator> Type;

  RadarObject309_()
    : header()
    , sensorId(0)
    , id(0)
    , length(0)
    , width(0)
    , measstat(0)
    , existprob(0)
    , dynprop(0)
    , latdisp(0.0)
    , longdisp(0.0)
    , relxdot(0.0)
    , relxddot(0.0)
    , latspeed(0.0)
    , obsprob(0)
    , rollcount(0)
    , rcs(0.0)  {
    }
  RadarObject309_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , sensorId(0)
    , id(0)
    , length(0)
    , width(0)
    , measstat(0)
    , existprob(0)
    , dynprop(0)
    , latdisp(0.0)
    , longdisp(0.0)
    , relxdot(0.0)
    , relxddot(0.0)
    , latspeed(0.0)
    , obsprob(0)
    , rollcount(0)
    , rcs(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint16_t _sensorId_type;
  _sensorId_type sensorId;

   typedef uint8_t _id_type;
  _id_type id;

   typedef uint8_t _length_type;
  _length_type length;

   typedef uint8_t _width_type;
  _width_type width;

   typedef uint8_t _measstat_type;
  _measstat_type measstat;

   typedef uint8_t _existprob_type;
  _existprob_type existprob;

   typedef uint8_t _dynprop_type;
  _dynprop_type dynprop;

   typedef float _latdisp_type;
  _latdisp_type latdisp;

   typedef float _longdisp_type;
  _longdisp_type longdisp;

   typedef float _relxdot_type;
  _relxdot_type relxdot;

   typedef float _relxddot_type;
  _relxddot_type relxddot;

   typedef float _latspeed_type;
  _latspeed_type latspeed;

   typedef uint8_t _obsprob_type;
  _obsprob_type obsprob;

   typedef uint8_t _rollcount_type;
  _rollcount_type rollcount;

   typedef float _rcs_type;
  _rcs_type rcs;




  typedef boost::shared_ptr< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> const> ConstPtr;

}; // struct RadarObject309_

typedef ::cargo_ants_msgs::RadarObject309_<std::allocator<void> > RadarObject309;

typedef boost::shared_ptr< ::cargo_ants_msgs::RadarObject309 > RadarObject309Ptr;
typedef boost::shared_ptr< ::cargo_ants_msgs::RadarObject309 const> RadarObject309ConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> >
{
  static const char* value()
  {
    return "76fed16b7785e460fd093bca4f70098c";
  }

  static const char* value(const ::cargo_ants_msgs::RadarObject309_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x76fed16b7785e460ULL;
  static const uint64_t static_value2 = 0xfd093bca4f70098cULL;
};

template<class ContainerAllocator>
struct DataType< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cargo_ants_msgs/RadarObject309";
  }

  static const char* value(const ::cargo_ants_msgs::RadarObject309_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header            # timestamp in the header is the acquisition time of \n\
                         # the first ray in the scan.\n\
                         #\n\
                         # in frame frame_id, angles are measured around \n\
                         # the positive Z axis (counterclockwise, if Z is up)\n\
                         # with zero angle being forward along the x axis\n\
\n\
uint16 sensorId \n\
uint8 id				# object id\n\
uint8 length			# object length: 0-unknown, 1-<0.5m, 2-<2m, 3-<4m, 4-<6m, 5-<10m, 6-<20m, 7-exceeds 20m\n\
uint8 width				# object width: 0-unknown, 1-<0.5m (pedestrian), 2-<1m (bike), 3-<2m (car), \n\
					 	#			4-<3m (truck), 5-<4m, 6-<6m, 7-exceeds 6m\n\
uint8 measstat			# measurement status: 0-no object, 1-new object, 2-object not measured, 3-object measured\n\
uint8 existprob			# probability of existance: 0-invalid, 1-<25%, 2-<50%, 3-<75%, \n\
						#			4-<90%, 5-<99%, 6-<99.9%, 7-<99.99%\n\
uint8 dynprop			# dynamic property: 0-unclassified, 1-standing, 2-stopped, 3-moving, 4-oncoming\n\
float32 latdisp			# lateral displacement [m]\n\
float32 longdisp		# longitudinal displacement	[m]\n\
float32 relxdot			# relative longitudinal speed [m/s]\n\
float32 relxddot		# relative longitudinal acceleration [m/s^2]\n\
float32 latspeed		# lateral velocity [m/s], value negative->object moves left to right\n\
uint8 obsprob			# probabilty that the object is an obstacle [%]\n\
uint8 rollcount			# sequence index\n\
float32 rcs				# radar cross-section [dBm^2]\n\
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

  static const char* value(const ::cargo_ants_msgs::RadarObject309_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.sensorId);
      stream.next(m.id);
      stream.next(m.length);
      stream.next(m.width);
      stream.next(m.measstat);
      stream.next(m.existprob);
      stream.next(m.dynprop);
      stream.next(m.latdisp);
      stream.next(m.longdisp);
      stream.next(m.relxdot);
      stream.next(m.relxddot);
      stream.next(m.latspeed);
      stream.next(m.obsprob);
      stream.next(m.rollcount);
      stream.next(m.rcs);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RadarObject309_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cargo_ants_msgs::RadarObject309_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cargo_ants_msgs::RadarObject309_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "sensorId: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.sensorId);
    s << indent << "id: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.id);
    s << indent << "length: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.length);
    s << indent << "width: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.width);
    s << indent << "measstat: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.measstat);
    s << indent << "existprob: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.existprob);
    s << indent << "dynprop: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.dynprop);
    s << indent << "latdisp: ";
    Printer<float>::stream(s, indent + "  ", v.latdisp);
    s << indent << "longdisp: ";
    Printer<float>::stream(s, indent + "  ", v.longdisp);
    s << indent << "relxdot: ";
    Printer<float>::stream(s, indent + "  ", v.relxdot);
    s << indent << "relxddot: ";
    Printer<float>::stream(s, indent + "  ", v.relxddot);
    s << indent << "latspeed: ";
    Printer<float>::stream(s, indent + "  ", v.latspeed);
    s << indent << "obsprob: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.obsprob);
    s << indent << "rollcount: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.rollcount);
    s << indent << "rcs: ";
    Printer<float>::stream(s, indent + "  ", v.rcs);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CARGO_ANTS_MSGS_MESSAGE_RADAROBJECT309_H
// Generated by gencpp from file yolov5_ros_msgs/Silos.msg
// DO NOT EDIT!


#ifndef YOLOV5_ROS_MSGS_MESSAGE_SILOS_H
#define YOLOV5_ROS_MSGS_MESSAGE_SILOS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace yolov5_ros_msgs
{
template <class ContainerAllocator>
struct Silos_
{
  typedef Silos_<ContainerAllocator> Type;

  Silos_()
    : a()
    , b()
    , c()
    , d()
    , e()  {
    }
  Silos_(const ContainerAllocator& _alloc)
    : a(_alloc)
    , b(_alloc)
    , c(_alloc)
    , d(_alloc)
    , e(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _a_type;
  _a_type a;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _b_type;
  _b_type b;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _c_type;
  _c_type c;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _d_type;
  _d_type d;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _e_type;
  _e_type e;





  typedef boost::shared_ptr< ::yolov5_ros_msgs::Silos_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::yolov5_ros_msgs::Silos_<ContainerAllocator> const> ConstPtr;

}; // struct Silos_

typedef ::yolov5_ros_msgs::Silos_<std::allocator<void> > Silos;

typedef boost::shared_ptr< ::yolov5_ros_msgs::Silos > SilosPtr;
typedef boost::shared_ptr< ::yolov5_ros_msgs::Silos const> SilosConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::yolov5_ros_msgs::Silos_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::yolov5_ros_msgs::Silos_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::yolov5_ros_msgs::Silos_<ContainerAllocator1> & lhs, const ::yolov5_ros_msgs::Silos_<ContainerAllocator2> & rhs)
{
  return lhs.a == rhs.a &&
    lhs.b == rhs.b &&
    lhs.c == rhs.c &&
    lhs.d == rhs.d &&
    lhs.e == rhs.e;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::yolov5_ros_msgs::Silos_<ContainerAllocator1> & lhs, const ::yolov5_ros_msgs::Silos_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace yolov5_ros_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::yolov5_ros_msgs::Silos_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::yolov5_ros_msgs::Silos_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::yolov5_ros_msgs::Silos_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::yolov5_ros_msgs::Silos_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::yolov5_ros_msgs::Silos_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::yolov5_ros_msgs::Silos_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::yolov5_ros_msgs::Silos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e0d20c93acc3618dfe0f15b8b4227da9";
  }

  static const char* value(const ::yolov5_ros_msgs::Silos_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe0d20c93acc3618dULL;
  static const uint64_t static_value2 = 0xfe0f15b8b4227da9ULL;
};

template<class ContainerAllocator>
struct DataType< ::yolov5_ros_msgs::Silos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "yolov5_ros_msgs/Silos";
  }

  static const char* value(const ::yolov5_ros_msgs::Silos_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::yolov5_ros_msgs::Silos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string a\n"
"string b\n"
"string c\n"
"string d\n"
"string e\n"
;
  }

  static const char* value(const ::yolov5_ros_msgs::Silos_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::yolov5_ros_msgs::Silos_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.a);
      stream.next(m.b);
      stream.next(m.c);
      stream.next(m.d);
      stream.next(m.e);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Silos_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::yolov5_ros_msgs::Silos_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::yolov5_ros_msgs::Silos_<ContainerAllocator>& v)
  {
    s << indent << "a: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.a);
    s << indent << "b: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.b);
    s << indent << "c: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.c);
    s << indent << "d: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.d);
    s << indent << "e: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.e);
  }
};

} // namespace message_operations
} // namespace ros

#endif // YOLOV5_ROS_MSGS_MESSAGE_SILOS_H

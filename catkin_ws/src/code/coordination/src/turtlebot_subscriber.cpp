#include "ros/ros.h"
#include "std_msgs/String.h"
#include "nav_msgs/Odometry.h"

/**
 * This tutorial demonstrates simple receipt of messages over the ROS system.
 */
void odomCallback(const nav_msgs::Odometry::ConstPtr& odom)

{
ROS_INFO("I received odom: [%f,%f,%f]", odom->twist.twist.linear.x,
odom->pose.pose.position.y,odom->pose.pose.position.z); //store x,y,z position values
}

int main(int argc, char **argv)
{
  
  ros::init(argc, argv, "sub_turtlebot");
  ros::NodeHandle n;
  ros::Subscriber odom_subscriber = n.subscribe("odom", 1000, odomCallback);
  ros::spin();

  return 0;
}
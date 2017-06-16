
#include "ros/ros.h" 
#include "turtlesim/Color.h" 
#include "turtlesim/Pose.h"

// Topic messages callback
void color_callback(const turtlesim::Color::ConstPtr& col)
{
ROS_INFO("red: %d, green: %d, blue: %d", col->r, col->g, col->b);
}

//pose_callback
void pose_callback(const turtlesim::Pose& msgIn){

ROS_INFO_STREAM(std::setprecision(2) << std::fixed
<< "position=(" << msgIn.x << "," << msgIn.y << ")"
<< "direction=" << msgIn.theta); 
  
}

int main(int argc, char **argv)
{
    // Initiate a new ROS node named "subTsim"
 ros::init(argc, argv, "subTsim");
 //create a node handle: it is reference assigned to a new node
 ros::NodeHandle node;

    // Subscribe to a given topic, in this case "chatter".
 //color_callback: is the name of the callback function that will be executed each time a message is received.
    ros::Subscriber subscriber_color = node.subscribe("/turtle1/color_sensor", 1000, color_callback);

    
    ros::Subscriber subscriber_pose=node.subscribe("turtle1/pose", 1000, pose_callback);
    // Enter a loop, pumping callbacks
    ros::spin();

    return 0;
}

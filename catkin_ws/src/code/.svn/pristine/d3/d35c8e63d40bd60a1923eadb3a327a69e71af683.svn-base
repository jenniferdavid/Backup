#include <ros/ros.h>
#include <nav_msgs/Path.h>
#include <nav_msgs/GetPlan.h>
#include <geometry_msgs/PoseStamped.h>
#include <string>
#include <iostream>
#include <Eigen/Dense>
#include "std_msgs/String.h"
#include <cargo_ants_msgs/Path.h>       //received from path_planner
#include <cargo_ants_msgs/Goal.h>       // member of Path msg
#include <cargo_ants_msgs/ReferenceTrajectory.h>
#include <cargo_ants_msgs/ReferenceTrajectoryPoint.h>
#include <cargo_ants_msgs/Path.h>
#include <cargo_ants_msgs/Goal.h>
#include <cargo_ants_msgs/ObstacleMap.h>
#include <cargo_ants_msgs/Obstacle.h>
#include <cargo_ants_msgs/Polyline.h>
#include <visualization_msgs/MarkerArray.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <boost/foreach.hpp>
#define forEach BOOST_FOREACH

using std::string;
using namespace std;
typedef Eigen::VectorXd Vector;
typedef Eigen::MatrixXd Matrix;
typedef cargo_ants_msgs::Path Path;
typedef cargo_ants_msgs::Goal PathPoint;
Path GlobalPath;
bool PathIsPublished = false;
bool PATH_RECEIVED = false;
ros::Publisher path_pub;

//to display trajectory in rviz
visualization_msgs::MarkerArray marker_array_msg;
ros::Publisher pub_marker;

  

visualization_msgs::MarkerArray generateMarkers(vector <PathPoint> goals){
    //display trajectory in rviz
    visualization_msgs::MarkerArray marker_array_msg;
	marker_array_msg.markers.resize(goals.size());//final->width * final->height);
	for ( int i = 0; i < goals.size(); i++) {
	    marker_array_msg.markers[i].header.frame_id = "map";
	    marker_array_msg.markers[i].header.stamp = ros::Time();
	    marker_array_msg.markers[i].ns = "my_namespace";
	    marker_array_msg.markers[i].id = i;
	    marker_array_msg.markers[i].type = visualization_msgs::Marker::SPHERE;
	    marker_array_msg.markers[i].action = visualization_msgs::Marker::ADD;
	    marker_array_msg.markers[i].pose.position.x = goals[i].gx;
	    marker_array_msg.markers[i].pose.position.y = goals[i].gy;
	    marker_array_msg.markers[i].pose.position.z = 0;
	    tf::Quaternion qt = tf::createQuaternionFromYaw(goals[i].gth);  	    
	    marker_array_msg.markers[i].pose.orientation.x = qt.getX();
	    marker_array_msg.markers[i].pose.orientation.y = qt.getY();
	    marker_array_msg.markers[i].pose.orientation.z = qt.getZ();
	    marker_array_msg.markers[i].pose.orientation.w = qt.getW();
	    marker_array_msg.markers[i].scale.x = 0.1;
	    marker_array_msg.markers[i].scale.y = 0.1;
	    marker_array_msg.markers[i].scale.z = 0.1;
	    marker_array_msg.markers[i].color.a = 1.0;
	    marker_array_msg.markers[i].color.g = 0.0;
	    marker_array_msg.markers[i].color.b = 0.0; 
	    if (i == 0)
	    {
	        marker_array_msg.markers[i].color.r = 0.1;
	    }
	    else
	    {
	        marker_array_msg.markers[i].color.r = i * 0.15;
	    }
	    
	}
	return marker_array_msg;
}

void pathPlannerCallback(const nav_msgs::Path& plan)
{
	/* TODO: reads the global plan and processs it:
	 * 		- It should filter it (take some poses separated by a given path length)
	 * 		- Dive path, i.e. take 20 poses depending on where the vehicle is ( read TF between base_link and odom ).
	 * 		- sends the selected part from the global path using CargoANTs msgs
	 * 
	 * */
	
	unsigned int numPathPoints =  plan.poses.size();
	vector <PathPoint> goals(numPathPoints);
	unsigned int ii=0;
	forEach(const geometry_msgs::PoseStamped &p, plan.poses) {
		//ROS_INFO("x = %f, y = %f ",  p.pose.position.x, p.pose.position.y);
		double yaw_angle = tf::getYaw(p.pose.orientation);
		/*ROS_INFO("x = %f, y = %f, qx = %f, qy = %f, qz = %f, qw = %f", 
		 p.pose.position.x, p.pose.position.y, p.pose.orientation.y, 
		 p.pose.orientation.x, p.pose.orientation.y, p.pose.orientation.z, p.pose.orientation.w);
		double yaw_angle = tf::getYaw(p.pose.orientation);*/
		goals[ii].gx = p.pose.position.x;
		goals[ii].gy = p.pose.position.y;
		goals[ii].gth = yaw_angle;				
		ii++;
	}
	///
	// Reduce number of points
	float percentPts = 0.05; //TODO: Filter them out by path length
	unsigned int numPPts = floor(numPathPoints * percentPts);
	vector <PathPoint> goalsToSend(numPPts);
	int incPts = floor(numPathPoints / numPPts);
	unsigned int j=0;
	for(size_t i = 0; i < numPathPoints; i+=incPts) {
		if(j<numPPts) goalsToSend[j] = goals[i];
		j++;
    }
    goalsToSend[numPPts-1] = goals[numPathPoints-1];
	
	///
	GlobalPath.goals.insert(GlobalPath.goals.end(), goalsToSend.begin(), goalsToSend.end());
	marker_array_msg = generateMarkers(goals);
	//if (!PathIsPublished){ //publish path once
		PathIsPublished = true;
	    path_pub.publish(GlobalPath);  //publish Global Path Planner's path with our custom defined msg
	    ROS_INFO("....................... publishing path! .....................................");
	    //for(size_t i = 0; i < numPathPoints; i++) 
	    // ROS_INFO("x = %f, y = %f, th= %f ",   GlobalPath.goals[i].gx, GlobalPath.goals[i].gy, GlobalPath.goals[i].gth);
	     
	    
	//}
	pub_marker.publish(marker_array_msg); //publish array of poses for visualizing Global Path Planner's path in Rviz
	PATH_RECEIVED = true;
}

int main(int argc, char** argv)
{
	ros::init(argc, argv, "process_plan_node");
	ros::NodeHandle node; 
	
	//Subscribe to global path (NOTE that the name of the topic might change when using a different plugin)
	ros::Subscriber path_sub = node.subscribe("/move_base/NavfnROS/plan", 1000, pathPlannerCallback);
	
	//publish Global Path Planner's path with Cargo-ANTs custom defined msg
	path_pub = node.advertise<Path> ( "/path_planner", 10);
	
	//display trajectory in rviz
    pub_marker = node.advertise<visualization_msgs::MarkerArray>("GlobalPath", 100);

	ros::Rate loop_rate (10);	
	ROS_INFO("Process_plan_node Started!");
	while ( ros::ok() ){
		ros::spinOnce();
		loop_rate.sleep();		
		if(PATH_RECEIVED)
		{
			path_pub.publish(GlobalPath);  //publish Global Path Planner's path with our custom defined msg
			pub_marker.publish(marker_array_msg); //publish array of poses for visualizing Global Path Planner's path in Rviz
		}
    }
	return 0; 
}

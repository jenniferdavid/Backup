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
typedef cargo_ants_msgs::ReferenceTrajectory Trajectory;
typedef cargo_ants_msgs::ReferenceTrajectoryPoint TrajectoryPoint;


Trajectory t;

Path GlobalPath;

bool PathIsPublished = false;
bool PATH_RECEIVED = false;
ros::Publisher traj_pub;
Vector xi;

//to display trajectory in rviz
visualization_msgs::MarkerArray marker_array_msg;
ros::Publisher trj_marker;
ros::Publisher trj_pub;
Eigen::Matrix4d _Tnew_base;
tf::TransformListener tfl_;
tf::StampedTransform Tstmp;
tf::Matrix3x3 Rmat;
Eigen::Vector4d trVec;
Eigen::Vector4d tqs;
double roll, pitch, yaw;
ros::Time rtime;

 visualization_msgs::MarkerArray generateMarkers(Trajectory t){
     //display trajectory in rviz
     visualization_msgs::MarkerArray marker_array_msg;
 	marker_array_msg.markers.resize(t.points.size());//final->width * final->height);
 	for ( int i = 0; i < t.points.size(); i++) {
 	    marker_array_msg.markers[i].header.frame_id = "odom";
 	    marker_array_msg.markers[i].header.stamp = ros::Time();
 	    marker_array_msg.markers[i].ns = "my_namespace";
 	    marker_array_msg.markers[i].id = i;
 	    marker_array_msg.markers[i].type = visualization_msgs::Marker::ARROW;
 	    marker_array_msg.markers[i].action = visualization_msgs::Marker::ADD;
 	    marker_array_msg.markers[i].pose.position.x = t.points[i].xx;
 	    marker_array_msg.markers[i].pose.position.y = t.points[i].yy;
 	    marker_array_msg.markers[i].pose.position.z = 0;
 	    tf::Quaternion qt = tf::createQuaternionFromYaw(t.points[i].th);   	    
 	    marker_array_msg.markers[i].pose.orientation.x = qt.getX();
 	    marker_array_msg.markers[i].pose.orientation.y = qt.getY();
 	    marker_array_msg.markers[i].pose.orientation.z = qt.getZ();
 	    marker_array_msg.markers[i].pose.orientation.w = qt.getW();
 	    marker_array_msg.markers[i].scale.x = 1;
 	    marker_array_msg.markers[i].scale.y = 0.1;
 	    marker_array_msg.markers[i].scale.z = 0.1;
 	    marker_array_msg.markers[i].color.a = 1.0;
 	   
 	    if (i == 0)
 	    {       
 	        marker_array_msg.markers[i].color.r = 0.1;
 	        marker_array_msg.markers[i].color.g = 0.1;
 	        marker_array_msg.markers[i].color.b = 0.1;
 	    }
 	    else
 	    {
 	        marker_array_msg.markers[i].color.r = i * 0.1;
 	        marker_array_msg.markers[i].color.g = i * 0.1;
 	        marker_array_msg.markers[i].color.b = i * 0.1;
 	    }
 	     
 	}
 	return marker_array_msg;
 }

void pathPlannerCallback(const cargo_ants_msgs::Path::ConstPtr& msg)
{
	t.dt = 1.5;
	vector <PathPoint> goals = msg->goals;
	vector <TrajectoryPoint> points(points.size());
	vector <PathPoint> tgoals(goals.size());

	for (size_t ii = 0; ii < goals.size(); ii++) 
	{
	  
	trVec << goals[ii].gx, goals[ii].gy, 0, 1;
	tqs = _Tnew_base * trVec;  //multiply 4*4 matrix by a 4*1 vector
		
	tgoals[ii].gx = tqs(0);
	tgoals[ii].gy = tqs(1);
	tgoals[ii].gth = yaw + goals[ii].gth; //tranformation between map and base_link
	
	points[ii].xx = tgoals[ii].gx;
	points[ii].yy = tgoals[ii].gy;
	
		if (ii>0){
			points[ii].xd = (points[ii].xx-points[ii-1].xx)/t.dt;
			points[ii].yd = (points[ii].yy-points[ii-1].yy)/t.dt;
			//heading
			points[ii].th = atan2(tgoals[ii].gy-tgoals[ii-1].gy, tgoals[ii].gx-tgoals[ii-1].gx);
			
		}
		if (ii>1){
			points[ii].xdd = (points[ii].xd-points[ii-1].xd)/t.dt;
			points[ii].ydd = (points[ii].yd-points[ii-1].yd)/t.dt;
			points[ii].thd = (points[ii].th-points[ii-1].th)/t.dt;			
		}
		if (ii>2){
			points[ii].thd = (points[ii].thd-points[ii-1].thd)/t.dt;			
		}
	}
	points[0].th =  points[1].th;
	points[0].xd =  points[1].xd;
	points[0].yd =  points[1].yd;
	points[0].thd = points[1].thd;
	
        for (size_t ii = 0; ii < goals.size(); ii++)
	{
		points[ii].thdd = (points[ii].thd-points[ii-1].thd)/t.dt;
	}		
	
	t.points.insert(t.points.end(), points.begin(), points.end());
	trj_pub.publish(t);  //publish Global Path Planner's path with our custom defined msg

}

int main(int argc, char** argv)
{
	ros::init(argc, argv, "global_to_controller");
	ros::NodeHandle node; 
	
	ros::Subscriber path_sub = node.subscribe("/path_planner", 1000, pathPlannerCallback);
	trj_pub = node.advertise<Trajectory> ( "/traj_from_global_plan", 10);
        trj_marker = node.advertise<visualization_msgs::MarkerArray>("/trj_marker", 100);

	ros::Rate loop_rate (10);	
	ROS_INFO("Processing Global plan to trajectory!");
	while ( ros::ok() )
	{
		ros::spinOnce();
		loop_rate.sleep();		
		if(PATH_RECEIVED)
		{
			if (tfl_.waitForTransform("odom","map", rtime, ros::Duration(5.))  )
			{
				tfl_.lookupTransform("odom","map", rtime, Tstmp); 	
				
				//set homogeneous matrix, passing through a rotation matrix
				Rmat.setRotation(Tstmp.getRotation());
				_Tnew_base << Rmat.getRow(0).x(), Rmat.getRow(0).y(), Rmat.getRow(0).z(), Tstmp.getOrigin().x(),
				              Rmat.getRow(1).x(), Rmat.getRow(1).y(), Rmat.getRow(1).z(), Tstmp.getOrigin().y(),
					      Rmat.getRow(2).x(), Rmat.getRow(2).y(), Rmat.getRow(2).z(), Tstmp.getOrigin().z(),
					      0,0,0,1; //4*4 matrix
				Rmat.getRPY(roll, pitch, yaw);
										  
				trj_pub.publish(t);  //publish Global Path Planner's path with our custom defined msg
				trj_marker.publish(marker_array_msg); //publish array of poses for visualizing Global Path Planner's path in Rviz
		
			  
			}
		}
		
	}
	return 0; 
}





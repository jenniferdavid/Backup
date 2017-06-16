 /* AT PATH ADAPTOR WITH ONLY ONE CHOMP INSTANCE
 *
 * Copyright (C) 2016 Rafael Valencia. All rights reserved.
 * License (3-Cluase BSD): https://github.com/rafaelvalencia/path-adaptor
 * 
 * This code uses and is based on code from:
 *   Project: trychomp https://github.com/poftwaresatent/trychomp
 *   Copyright (C) 2014 Roland Philippsen. All rights reserved.
 *   License (3-Clause BSD) : https://github.com/poftwaresatent/trychomp
 * **
 * \file at_path_adaptor.cpp
 *
 * CHOMP for point vehicles (x,y) moving holonomously in the plane. It will
 * plan a trajectory (xi) connecting start point (qs) to end point (qe) while
 * avoiding obstacles (obs)
 */
#include <iostream>
#include <Eigen/Dense>
#include "path_adaptor.hpp"
#include "ros/ros.h"
#include "std_msgs/String.h"
#include <cargo_ants_msgs/Path.h>       //received from path_planner
#include <cargo_ants_msgs/Goal.h>       // member of Path msg
#include <cargo_ants_msgs/ReferenceTrajectory.h>
#include <cargo_ants_msgs/ReferenceTrajectoryPoint.h>
#include <cargo_ants_msgs/ObstacleMap.h>
#include <cargo_ants_msgs/Obstacle.h>
#include <cargo_ants_msgs/Polyline.h>
#include <visualization_msgs/MarkerArray.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>



using namespace std;
typedef Eigen::VectorXd Vector;
typedef Eigen::MatrixXd Matrix;
typedef cargo_ants_msgs::ObstacleMap ObstacleMap;
typedef cargo_ants_msgs::ReferenceTrajectory Trajectory;
typedef cargo_ants_msgs::ReferenceTrajectoryPoint TrajectoryPoint;
Trajectory trajectory;
ObstacleMap obstacleMap;
Vector qs(4), qe(4), xi, tqs(4), tqe(4);
Vector qstart(2), qend(2);
double lambda, costGain, obsInflation; 
int numIt;
bool AT_START = true;

//display trajectory in rviz
visualization_msgs::MarkerArray marker_array_msg;

Trajectory generateTrajectory(Vector const &xi)
{
	Trajectory trajectory;
	trajectory.dt = 1.5;
	Vector xi_copy(xi.size() + 4);
	xi_copy << tqs.head(2), xi, tqe.head(2); //copy xi and add starting point and end point
	
	vector <TrajectoryPoint> points(xi_copy.size() / 2);
	for (size_t ii = 0; ii < xi_copy.size() / 2; ii++){
		points[ii].xx = xi_copy[ii*2];
		points[ii].yy = xi_copy[ii*2+1];
		//finite backward difference,mind the indicies!
		if (ii>0){
			points[ii].xd = (points[ii].xx-points[ii-1].xx)/trajectory.dt;
			points[ii].yd = (points[ii].yy-points[ii-1].yy)/trajectory.dt;
			//heading
			points[ii].th = atan2(points[ii].yy-points[ii-1].yy, points[ii].xx-points[ii-1].xx);
			
		}
		if (ii>1){
			points[ii].xdd = (points[ii].xd-points[ii-1].xd)/trajectory.dt;
			points[ii].ydd = (points[ii].yd-points[ii-1].yd)/trajectory.dt;
			points[ii].thd = (points[ii].th-points[ii-1].th)/trajectory.dt;			
		}		
	}
	
	points[0].xd =  0.5 * points[1].xd;
	points[0].yd =  0.5 * points[1].yd;
	points[0].thd = 0.5 * points[1].thd;

    points[xi_copy.size()/2 - 2].xd =  0.5 * points[xi_copy.size()/2 - 2].xd;
	points[xi_copy.size()/2 - 2].yd =  0.5 * points[xi_copy.size()/2 - 2].yd;
	points[xi_copy.size()/2 - 2].thd =  0.5 * points[xi_copy.size()/2 - 2].thd;
		
    points[xi_copy.size()/2 - 1].xd =  0.;
	points[xi_copy.size()/2 - 1].yd =  0.;
	points[xi_copy.size()/2 - 1].thd =  0.;
		
    for (size_t ii = 0; ii < xi_copy.size() / 2; ii++)
	{
		points[ii].thdd = (points[ii].thd-points[ii-1].thd)/trajectory.dt;
	}
	
	trajectory.points.insert(trajectory.points.end(), points.begin(), points.end());
	return trajectory;
}

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

void pathPlannerCallback(const cargo_ants_msgs::Path::ConstPtr &msg)
{
	vector <cargo_ants_msgs::Goal> goals = msg->goals;
	if (goals.size() < 2) {
		ROS_INFO("At least 2 goal points are required, received %lu", goals.size());
		return;
	}
	for (size_t ii = 0; ii < goals.size() - 1; ii++) {
		qs << goals[ii].gx, goals[ii].gy, 0, 1;
		qe << goals[ii + 1].gx, goals[ii + 1].gy, 0, 1;
	}
}

void obstaclesCallback(const cargo_ants_msgs::ObstacleMap::ConstPtr &msg)
{
	obstacleMap.obstacles = msg->obstacles;
}

int main(int argc, char **argv)
{

	ros::init(argc, argv, "at_path_adaptor");
	ros::NodeHandle node;
	ros::NodeHandle paramHandle ("~");
	
	//Get path adaptor parameters
	paramHandle.param<double>("lambda", lambda, 10.); // weight of smoothness objective
	paramHandle.param<int>("num_Iterations", numIt, 1000); // Number of iterations
	paramHandle.param<double>("obs_cost_gain", costGain, 10.); // Gain inside cost function(default value is 10) 
	paramHandle.param<double>("obs_inflation", obsInflation, 1.); // Obstacle inflation to account for vehicle size and safer margin(default value is 1meter) 
	
	ROS_INFO(" CHOMP Parameters: Lambda = %f Num.Iterations = %d. costGain = %f obsInflation = %f", lambda, numIt, costGain, obsInflation);
	
	ros::Subscriber path_sub = node.subscribe("path_planner", 1000, pathPlannerCallback);
	ros::Subscriber obs_sub = node.subscribe("obstacles", 1000, obstaclesCallback);
	ros::Publisher trajectory_pub = node.advertise<Trajectory> ( "/trajectory", 10);
	//display trajectory in rviz
    ros::Publisher pub_marker = node.advertise<visualization_msgs::MarkerArray>("chompTrajectory", 100);	
	
	ros::Rate loop_rate (10);
	
	// TF 
	tf::TransformListener tfl_;
	tf::StampedTransform Tstmp;
	tf::Matrix3x3 Rmat;
    Eigen::Matrix4d _Tnew_base;
    Eigen::Vector4d _centroids;
    Eigen::Vector4d _tcentroids;
    Eigen::Vector4d _offset;
	Eigen::Vector4d _toffset;
	ros::Time rtime;
	
	 
	//////////////////////////////////////////////////
	// CHOMP
	CHOMP chomp(1.0, 100.0, lambda, 20, 2, numIt, costGain);

	/* Default CHOMP parameters
	dt     = 1.0 	(time step)
	eta    = 100.0 	(regularization factor for gradient descent)
	lambda = 1.0	(weight of smoothness objective)
	nq     = 20		(number of poses q in xi)
	cdim   = 2		(dimension of config space)
	numIt  = 1000	(number of iterations)
	gain   = 10.0	(Gain inside cost function)
	*/	
    
    //points
    Matrix obs;
		
	ROS_INFO("path_adaptor Started!");
	while ( ros::ok() )
	{
		ros::spinOnce();
		rtime = ros::Time::now();
		//std::cout << "Ros time %" << rtime ;
		if (tfl_.waitForTransform("odom","at_base_link", rtime, ros::Duration(5.))  )
		{
			tfl_.lookupTransform("odom","at_base_link", rtime, Tstmp); 	
            
			//set homogeneous matrix, passing through a rotation matrix
			Rmat.setRotation(Tstmp.getRotation());
			_Tnew_base << Rmat.getRow(0).x(), Rmat.getRow(0).y(), Rmat.getRow(0).z(), Tstmp.getOrigin().x(),
                      Rmat.getRow(1).x(), Rmat.getRow(1).y(), Rmat.getRow(1).z(), Tstmp.getOrigin().y(),
                      Rmat.getRow(2).x(), Rmat.getRow(2).y(), Rmat.getRow(2).z(), Tstmp.getOrigin().z(),
                      0,0,0,1;
    		
			Matrix obs(3,obstacleMap.obstacles.size());
			for (size_t ii = 0; ii < obstacleMap.obstacles.size() ; ++ii) 
			{
				_centroids << 	obstacleMap.obstacles[ii].origin.ox, obstacleMap.obstacles[ii].origin.oy, 0, 1;	
				_tcentroids = _Tnew_base * _centroids;
				obs.col(ii) << _tcentroids(0),
			 				   _tcentroids(1),
			 				   obstacleMap.obstacles[ii].origin.oth + obsInflation;
		    }
		    
		    /*
		    _offset << 3.7, 0, 0, 1;
		    tqs = _Tnew_base * _offset;		    
		    tqe = qe;
		    */
		    
		    if(AT_START)
		    {	//Get start and goal 			
				
				AT_START = false; //do it ONLY once (only at the begining)
				
				_offset << 3.7, 0, 0, 1;
				tqs = _Tnew_base * _offset;	//get start position + offset (to place goal in front axle)
				tqe = qe; //end position			
		    }
		    
		    //cout << "start: " << tqs.transpose() << endl;
		    //cout << "end: " << tqe.transpose() << endl;
		    
		    qstart = tqs.head(2);
		    qend   = tqe.head(2);
		    
		    //Initializes path xi as a straight line, with qs and qe, starting and ending point 
		    chomp.initStraightLinePath(qstart, qend);
		    
		    //set obstacles
		    chomp.setObstacles(obs);
		    
		    //TODO: set a path "xi" given by the global planner 
		    //chomp.setPath(qstart, qend, xi); // sets an aribitrary value for xi_, qs_, qe_
		    
			//Start CHOMP optimization
			chomp.generatePath(xi);    		    
			
			//chomp::generatePath(tqs.head(2), tqe.head(2), xi, obs, lambda, numIt, costGain); //old
			
			trajectory = generateTrajectory(xi);
			marker_array_msg = generateMarkers(trajectory);
			
			//publish CHOMP's trajectory with our custom defined msg
			trajectory_pub.publish(trajectory);
			
			//publish array of poses for visualizing CHOMP's trajectory in Rviz
			pub_marker.publish(marker_array_msg); 
		}
		loop_rate.sleep();
    }
	return 0;
}

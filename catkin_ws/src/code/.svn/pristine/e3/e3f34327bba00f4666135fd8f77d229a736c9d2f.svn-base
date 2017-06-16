//
// Created by jvallve on 31/05/16.
//

#ifndef WOLF_ROS_WOLF_POLYLINE_H
#define WOLF_ROS_WOLF_POLYLINE_H

/**************************
 *    laser_scan_utils    *
 **************************/
#include "laser_scan_utils/line_finder_iterative.h"
#include "laser_scan_utils/laser_scan.h"

/**************************
 *      WOLF includes     *
 **************************/
#include "wolf/sensor_laser_2D.h"
#include "wolf/sensor_odom_2D.h"
#include "wolf/wolf.h"
#include "wolf/problem.h"
#include "wolf/capture_motion.h"
#include "wolf/capture_odom_2D.h"
#include "wolf/capture_fix.h"
#include "wolf/processor_tracker_landmark_polyline.h"
#include "wolf/processor_odom_2D.h"
#include "wolf/landmark_polyline_2D.h"
#include "wolf/feature_polyline_2D.h"
#include <cargo_ants_slam/Trajectory.h>
#include <cargo_ants_slam/KeyFrame.h>

/**************************
 *     CERES includes     *
 **************************/
#include "wolf/ceres_wrapper/ceres_manager.h"
#include "glog/logging.h"

/**************************
 *      ROS includes      *
 **************************/
#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>

#include <nav_msgs/Odometry.h>
#include <sensor_msgs/LaserScan.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>

/**************************
 *      STD includes      *
 **************************/
#include <iostream>
#include <iomanip>
#include <queue>

class WolfNodePolyline
{
    public:
        WolfNodePolyline(char *argv0);
        virtual ~WolfNodePolyline();

        void solve();
        const wolf::Problem& getProblem();
        void updateLocalizationTf();
        void broadcastTf();
        void publishMarkers();
        void publishTrajectory();
        void publishProcessorMarkers(const unsigned int _laser_id, const ros::Time& _stamp);

        double loop_rate_;
        double solve_rate_;

    protected:
        //wolf problem
        wolf::Problem problem_;
        bool origin_set_;
        Eigen::Matrix3s origin_cov_;
        ros::Time origin_stamp_;

        //Wolf: laser sensors
        std::vector<wolf::SensorLaser2D*> laser_sensor_ptr_;
        std::vector<wolf::ProcessorTrackerLandmarkPolyline*> laser_processor_ptr_;
        std::vector<bool> laser_intrinsics_set_;
        std::vector<bool> laser_extrinsics_set_;
        std::vector<std::string> laser_frame_name_;
        std::map<std::string,unsigned int> laser_frame_2_idx_;

        //ceres
        wolf::CeresManager ceres_manager_;
        bool compute_covariance_;

        //transforms
        tf::TransformBroadcaster tfb_;
        tf::TransformListener    tfl_;
        tf::Transform T_map2base_; //wolf output
        tf::StampedTransform T_base2odom_; //published by odom source
        tf::StampedTransform T_map2odom_; //to be broadcasted by this node
        std::string base_frame_name_;
        std::string map_frame_name_;
        std::string odom_frame_name_;
        Eigen::VectorXs vehicle_pose_;

        //Odometry
        ros::Time last_odom_stamp_;
        ros::Subscriber odom_sub_; // odometry subscriber
        void odometryCallback(const nav_msgs::Odometry::ConstPtr& msg);
        wolf::CaptureMotion2* odom_capture_ptr_;
        double odometry_translational_cov_factor_, odometry_rotational_cov_factor_;
        unsigned int last_odom_seq_;

        // Lasers
        std::vector<ros::Subscriber> laser_subscribers_;
        void laserCallback(const sensor_msgs::LaserScan::ConstPtr& msg);
        void loadLaserIntrinsics(const unsigned int laser_idx, const sensor_msgs::LaserScan::ConstPtr& msg);
        bool loadSensorExtrinsics(const std::string _sensor_frame, Eigen::VectorXs& _extrinsics);
        bool setOrigin();
        void filterScan(std::vector<float>& _ranges, const float& _min_range_th, const float& _max_range_th);
        bool filter_scans_;
        double min_range_filter_th_, max_range_filter_th_, min_fit_line_error_;
        int min_line_points_;

        // [publisher attributes]
        ros::Publisher constraints_publisher_;
        visualization_msgs::Marker constraints_marker_msg_;
        unsigned int max_hits_;

        ros::Publisher landmarks_publisher_;
        visualization_msgs::MarkerArray landmark_marker_array_msg_;
        visualization_msgs::Marker landmark_line_marker_, landmark_text_marker_, landmark_points_marker_;

        std::vector<ros::Publisher> features_publisher_;
        std::vector<visualization_msgs::MarkerArray> features_marker_array_msg_;
        visualization_msgs::Marker feature_line_marker_, feature_points_marker_;
        bool publish_features_;

        ros::Publisher trajectory_marker_publisher_;
        visualization_msgs::MarkerArray trajectory_marker_array_msg_;
        visualization_msgs::Marker vehicle_marker_;

        bool publish_trajectory_;
        ros::Publisher trajectory_publisher_;
		cargo_ants_slam::Trajectory trajectory_msg_;
		cargo_ants_slam::KeyFrame key_frame_msg_;
		std::map<unsigned int, std_msgs::Header> scan_id_to_header_;

        // ROS node handle
        ros::NodeHandle nh_;
};

#endif //WOLF_ROS_WOLF_GPS_NODE_H

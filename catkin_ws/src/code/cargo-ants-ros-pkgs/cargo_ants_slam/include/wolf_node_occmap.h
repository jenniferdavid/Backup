//
// Created by jvallve on 2/06/16.
//

#ifndef WOLF_ROS_WOLF_OCCMAP_H
#define WOLF_ROS_WOLF_OCCMAP_H

#include <Eigen/Dense>

/**************************
 *      ROS includes      *
 **************************/
#include <ros/ros.h>
#include <tf/transform_listener.h>

#include <nav_msgs/Odometry.h>
#include <sensor_msgs/LaserScan.h>
#include <nav_msgs/OccupancyGrid.h>
#include "cargo_ants_slam/Trajectory.h"
#include "cargo_ants_slam/KeyFrame.h"

/**************************
 *      STD includes      *
 **************************/
#include <iostream>
#include <iomanip>
#include <queue>

class WolfNodeOccmap
{
    public:
        WolfNodeOccmap(char *argv0);
        virtual ~WolfNodeOccmap();
        /**
		* \brief publishes the rendered map
		*/
		void publishMap();

    protected:
        //Wolf: laser sensors
        std::vector<tf::Transform> laser_extrinsics_;
        std::vector<bool> laser_extrinsics_set_;
        std::vector<std::string> laser_frame_name_;
        std::map<std::string,unsigned int> laser_frame_2_idx_;

        //transforms
        tf::TransformListener    tfl_;
        std::string base_frame_name_;
        std::string map_frame_name_;

        // Lasers
        std::vector<ros::Subscriber> laser_subscribers_;
        void laserCallback(const sensor_msgs::LaserScan::ConstPtr& msg);
        bool loadSensorExtrinsics(const unsigned int laser_id);
        void filterScan(std::vector<float>& _ranges, const float& _min_range_th, const float& _max_range_th);
        bool filter_scans_;
        double min_range_filter_th_, max_range_filter_th_, min_fit_line_error_;
        int min_line_points_;
        std::vector<float> _ranges_filtered;

        // Trajectory
        ros::Subscriber trajectory_sub_;
        void trajectoryCallback(const cargo_ants_slam::Trajectory::ConstPtr& msg);

        // [publisher attributes]
        ros::Publisher map_publisher_;
        nav_msgs::OccupancyGrid occupancy_grid_;
        Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic, Eigen::ColMajor> logodds_grid_;
        double Lfree_, Lobst_, Lobst_thres_, Lfree_thres_;
        int max_n_cells_;

        // Other variables
		unsigned int last_step_;
		Eigen::Vector2i n_cells_;
		Eigen::Vector2f map_origin_;
		double grid_size_, laser_ray_incr_;

		//Buffers
		std::vector<std::queue<sensor_msgs::LaserScan>> new_scans_;
		std::vector<sensor_msgs::LaserScan> key_scans_;
        std::map<unsigned int, unsigned int> keyscan_idx_to_keyframe_idx_;

		// ROS node handle
        ros::NodeHandle nh_;


        /**
        * \brief recompute trajectory scans
        *
        * Recompute the trajectory scans buffer after a new trajectory msg received.
        * \param last trajectory message recieved
        */
        void updateTrajectoryScans(const cargo_ants_slam::Trajectory& trajectory);

		/**
		* \brief recompute occupancy grid
		*
		* Recompute the occupancy grid  after a new trajectory msg received.
		* \param last trajectory message recieved
		*/
		void recomputeOccupancyGrid(const cargo_ants_slam::Trajectory& trajectory);

		/**
		* \brief add laser scan to logodds
		*
		* Update with a laser scan message the logodds update in the occupancy log odds array
		* \param LScan The laser scan message to convert
		* \param pose from where the laser scan was taken
		*/
		void addScanToLogodds(const sensor_msgs::LaserScan& LScan, const tf::Transform& T_map_base);

		/**
		* \brief add ray to logodds
		*
		* Adds the log odds of a laser scan ray message
		* \param theta angle of the ray
		* \param range of the ray
		* \param pose from where the laser scan was taken
		*/
		void addRayToLogodds(const double& theta, const double& range, const geometry_msgs::Pose& pose, bool _obstacle);

		/**
		* \brief vector 2 cell
		*
		* Returns the occupancy grid cell index of the position in the given by the vector
		* \param p The position vector
		* \return Vector containing the row and column
		*/
		Eigen::Vector2i vectorToCell(const Eigen::Vector2f& p);

		 /**
		* \brief update occupancy grid
		*
		* Updates the occupancy grid msg.
		*/
		void updateOccupancyGrid(const ros::Time& _stamp);

		/**
		* \brief resize occupancy grid
		*
		* Updates the occupancy grid msg info when a resize have been done.
		*/
		void resizeOccupancyGrid();

		/**
		* \brief resize map
		*
		* Resize in one dimension the occupancy and log_odds map
		* \param dim The dimension
		* \param oversize
		* \param place In front or back of the array
		*/
		void resizeMap(const int& dim, const unsigned int& oversize, const bool& back);

		/**
		* \brief transformation matrix
		*
		* Create a 4x4 eigen matrix of the transformation from the local frame to global
		* \param floats x, y and z of the laser in global coordinates
		* \param float alpha orientation in global coordinates
		* \return Matrix4f
		*/
		Eigen::Matrix4f transformationMatrix(const float x, const float y, const float z, const float alpha) const;
};

#endif

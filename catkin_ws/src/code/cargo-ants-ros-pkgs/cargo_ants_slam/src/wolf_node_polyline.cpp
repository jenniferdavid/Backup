//
// Created by jvallve on 13/05/16.
//

#include "wolf_node_polyline.h"

WolfNodePolyline::WolfNodePolyline(char *argv0) :
    nh_(ros::this_node::getName()),
    problem_(wolf::FRM_PO_2D),
    origin_cov_(Eigen::Matrix3s::Zero()),
    origin_set_(false),
    ceres_manager_(&problem_),
    vehicle_pose_(3),
    last_odom_stamp_(ros::Time(0)),
    last_odom_seq_(0),
    max_hits_(10)
{
    //std::cout << "WolfNodePolyline::WolfNodePolyline(...) -- constructor\n";

    // parameters
    bool use_wolf_auto_diff;
    int max_iterations, n_lasers, new_features_th, loop_frames_th;
    double origin_covs[3], dist_traveled_th, cov_det_th, elapsed_time_th, time_tolerance, range_segment_th, range_defined_th, position_error_th;
    nh_.param<bool>("publish_features", publish_features_, true);
    nh_.param<bool>("publish_trajectory", publish_trajectory_, false);
    nh_.param<bool>("filter_scans", filter_scans_, false);
    nh_.param<double>("min_range_filter_th", min_range_filter_th_, 0);
    nh_.param<double>("max_range_filter_th", max_range_filter_th_, 1e3);
    nh_.param<bool>("compute_covariance", compute_covariance_, false);
    nh_.param<bool>("use_wolf_auto_diff", use_wolf_auto_diff, true);
    nh_.param<double>("loop_rate", loop_rate_, 20);
    nh_.param<double>("solve_rate", solve_rate_, 1);
    nh_.param<int>("max_iterations", max_iterations, 1e3);
    nh_.param<int>("n_lasers", n_lasers, 6);
    nh_.param<int>("new_features_th", new_features_th, 3);
    nh_.param<int>("loop_frames_th", loop_frames_th, 3);
    nh_.param<double>("odometry_translational_cov_factor", odometry_translational_cov_factor_, 0.2);
    nh_.param<double>("odometry_rotational_cov_factor", odometry_rotational_cov_factor_, 0.2);
    nh_.param<std::string>("base_frame_name", base_frame_name_, "agv_base_link");
    nh_.param<std::string>("map_frame_name_", map_frame_name_, "map");
    nh_.param<std::string>("odom_frame_name_", odom_frame_name_, "odom");
    nh_.param<double>("origin_covariance_xx", origin_covs[0], 0.1);
    nh_.param<double>("origin_covariance_yy", origin_covs[1], 0.1);
    nh_.param<double>("origin_covariance_thth", origin_covs[2], 0.1);
    nh_.param<double>("dist_traveled_th", dist_traveled_th, 10);
    nh_.param<double>("cov_det_th", cov_det_th, 1);
    nh_.param<double>("elapsed_time_th", elapsed_time_th, 10);
    nh_.param<double>("time_tolerance", time_tolerance, 0.5);
    nh_.param<double>("min_fit_line_error", min_fit_line_error_, 0.4);
    nh_.param<double>("range_segment_th", range_segment_th, 0.4);
    nh_.param<double>("range_defined_th", range_defined_th, 1);
    nh_.param<double>("position_error_th", position_error_th, 1);
    nh_.param<int>("min_line_points", min_line_points_, 10);

    origin_cov_(0,0) = origin_covs[0];
    origin_cov_(1,1) = origin_covs[1];
    origin_cov_(2,2) = origin_covs[2];

    // [init publishers]
    // Broadcast 0 transform map-odom
    T_map2odom_.frame_id_ = map_frame_name_;
    T_map2odom_.child_frame_id_ = odom_frame_name_;
    T_map2odom_.setData(tf::Transform(tf::Quaternion(0,0,0,1), tf::Vector3(0,0,0)));
    tfb_.sendTransform( T_map2odom_);

    // [init subscribers]
    odom_sub_ = nh_.subscribe("odometry", 10, &WolfNodePolyline::odometryCallback, this);

    // set ceres options
    ceres_manager_.getSolverOptions().max_num_iterations = max_iterations;
    ceres_manager_.setUseWolfAutoDiff(use_wolf_auto_diff);
    google::InitGoogleLogging("cargo_ants_slam");

    // Install sensors and processors
    // odometry
    wolf::IntrinsicsOdom2D odom_intrinsics;
    odom_intrinsics.k_disp_to_disp = odometry_translational_cov_factor_;
    odom_intrinsics.k_rot_to_rot = odometry_rotational_cov_factor_;
    wolf::SensorBase* odom_sensor_ptr = problem_.installSensor("ODOM 2D", "odometer", Eigen::VectorXs::Zero(3), &odom_intrinsics);
    wolf::ProcessorParamsOdom2D odom_params;
    odom_params.dist_traveled_th_ = dist_traveled_th;
    odom_params.cov_det_th_ = cov_det_th;
    odom_params.elapsed_time_th_ = elapsed_time_th;
    problem_.installProcessor("ODOM 2D", "main odometry", odom_sensor_ptr, &odom_params);
    odom_capture_ptr_ = new wolf::CaptureMotion2(wolf::TimeStamp(), odom_sensor_ptr, Eigen::Vector2s::Zero(), 0.1*Eigen::Matrix2s::Identity(), nullptr);

    // lasers
    laser_sensor_ptr_ = std::vector<wolf::SensorLaser2D*>(n_lasers, nullptr);
    laser_processor_ptr_ = std::vector<wolf::ProcessorTrackerLandmarkPolyline*>(n_lasers, nullptr);
    laser_intrinsics_set_= std::vector<bool>(n_lasers, false);
    laser_extrinsics_set_= std::vector<bool>(n_lasers, false);
    laser_subscribers_.resize(n_lasers);
    laser_frame_name_.resize(n_lasers);
    std::stringstream laser_frame_name_ii, laser_processor_name_ii, laser_topic_name_ii;
    for (auto ii = 0; ii<n_lasers; ii++)
    {
        //build names
        laser_frame_name_ii.str("");
        laser_frame_name_ii << "laser_" << ii << "_frame_name";
        laser_processor_name_ii.str("");
        laser_processor_name_ii << "laser_" << ii << "_processor";

        //get laser frame id
        nh_.param<std::string>(laser_frame_name_ii.str(), laser_frame_name_[ii], "laser_i_frame_id");
        //std::cout << "setting laser " << ii << " tf. frame id: " << laser_frame_name_[ii] << std::endl;

        // store id-name map
        laser_frame_2_idx_[laser_frame_name_[ii]] = ii;

        // install sensor
        Eigen::VectorXs laser_extrinsics = Eigen::VectorXs::Zero(3);
        laser_extrinsics_set_[ii] = loadSensorExtrinsics(laser_frame_name_[ii], laser_extrinsics);
        wolf::IntrinsicsLaser2D laser_2_intrinsics;
        laser_sensor_ptr_[ii] = (wolf::SensorLaser2D*)problem_.installSensor("LASER 2D", laser_frame_name_ii.str(), laser_extrinsics, &laser_2_intrinsics);

        // install processor
        wolf::ProcessorParamsPolyline laser_processor_params;
        laser_processor_params.line_finder_params = laserscanutils::LineFinderIterativeParams({min_fit_line_error_, (unsigned int) min_line_points_, range_segment_th, range_defined_th});
        laser_processor_params.new_features_th = new_features_th;
        laser_processor_params.loop_frames_th = loop_frames_th;
        laser_processor_params.time_tolerance = time_tolerance;
        laser_processor_params.position_error_th = position_error_th;
        laser_processor_ptr_[ii] = (wolf::ProcessorTrackerLandmarkPolyline*)problem_.installProcessor("POLYLINE", laser_processor_name_ii.str(), laser_sensor_ptr_[ii], &laser_processor_params);

        //init laser subscribers
        laser_topic_name_ii.str("");
        laser_topic_name_ii << "laser_" << ii;
        laser_subscribers_[ii] = nh_.subscribe(laser_topic_name_ii.str(),20,&WolfNodePolyline::laserCallback,this);
    }

    // [init publishers]
    constraints_publisher_ = nh_.advertise<visualization_msgs::Marker>("constraints", 10);
    landmarks_publisher_ = nh_.advertise<visualization_msgs::MarkerArray>("landmarks", 10);
    trajectory_marker_publisher_ = nh_.advertise<visualization_msgs::MarkerArray>("vehicle", 10);
    trajectory_publisher_ = nh_.advertise<cargo_ants_slam::Trajectory>("trajectory", 1);

    // init MARKERS
    // init constraint markers message
    constraints_marker_msg_.type = visualization_msgs::Marker::LINE_LIST;
    constraints_marker_msg_.header.frame_id = "map";
    constraints_marker_msg_.scale.x = 0.05;
    constraints_marker_msg_.color.r = 1; //yellow
    constraints_marker_msg_.color.g = 0.8; //yellow
    constraints_marker_msg_.color.b = 0; //yellow
    constraints_marker_msg_.color.a = 0.7;
    constraints_marker_msg_.ns = "/constraints";
    constraints_marker_msg_.id = 1;

    // Init vehicle_marker and create the first RED CUBE
    vehicle_marker_.header.frame_id = base_frame_name_;
    vehicle_marker_.type = visualization_msgs::Marker::CUBE;
    vehicle_marker_.scale.x = 10;
    vehicle_marker_.scale.y = 3;
    vehicle_marker_.scale.z = 3;
    vehicle_marker_.color.r = 1; //red
    vehicle_marker_.color.g = 0;
    vehicle_marker_.color.b = 0;
    vehicle_marker_.color.a = 1;
    vehicle_marker_.pose.position.x = 0.0;
    vehicle_marker_.pose.position.y = 0.0;
    vehicle_marker_.pose.position.z = 1.5;
    vehicle_marker_.pose.orientation = tf::createQuaternionMsgFromYaw(0.0);
    vehicle_marker_.id = 0;
    trajectory_marker_array_msg_.markers.push_back(vehicle_marker_);
    vehicle_marker_.color.r = 1; //yellow
    vehicle_marker_.color.g = 0.8;
    vehicle_marker_.color.b = 0;
    vehicle_marker_.color.a = 1;

    // Init landmark markers
    landmark_line_marker_.header.frame_id = map_frame_name_;
    landmark_line_marker_.type = visualization_msgs::Marker::LINE_STRIP;
    landmark_line_marker_.ns = "/landmarks";
    landmark_line_marker_.scale.x = 0.2;
    landmark_line_marker_.pose.position.x = 0;
    landmark_line_marker_.pose.position.y = 0;
    landmark_line_marker_.pose.position.z = 0.5;
    landmark_line_marker_.pose.orientation = tf::createQuaternionMsgFromYaw(0.0);
    landmark_text_marker_ = landmark_line_marker_;
    landmark_text_marker_.ns = "/landmarks_text";
    landmark_text_marker_.type = visualization_msgs::Marker::TEXT_VIEW_FACING;
    landmark_text_marker_.color.r = 1;
    landmark_text_marker_.color.g = 1;
    landmark_text_marker_.color.b = 1;
    landmark_text_marker_.color.a = 1;
    landmark_text_marker_.scale.z = 1;
    landmark_points_marker_ = landmark_line_marker_;
    landmark_points_marker_.ns = "/landmarks_points";
    landmark_points_marker_.type = visualization_msgs::Marker::POINTS;
    landmark_points_marker_.scale.x = 0.6;
    landmark_points_marker_.scale.y = 0.6;

    // Init feature markers
    if (publish_features_)
    {
        features_marker_array_msg_.resize(n_lasers);
        features_publisher_.resize(n_lasers);
        feature_line_marker_.type = visualization_msgs::Marker::LINE_STRIP;
        feature_line_marker_.scale.x = 0.2;
        feature_line_marker_.pose.position.x = 0;
        feature_line_marker_.pose.position.y = 0;
        feature_line_marker_.pose.position.z = 1;
        feature_line_marker_.pose.orientation = tf::createQuaternionMsgFromYaw(0.0);
        feature_line_marker_.color.a = 1;
        feature_line_marker_.ns = "/features";
        feature_points_marker_ = feature_line_marker_;
        feature_points_marker_.ns = "/features_points";
        feature_points_marker_.type = visualization_msgs::Marker::POINTS;
        feature_points_marker_.scale.x = 0.6;
        feature_points_marker_.scale.y = 0.6;
        for (auto ii = 0; ii<n_lasers; ii++)
            features_publisher_[ii] = nh_.advertise<visualization_msgs::MarkerArray>(("features"+ std::to_string(ii)), 2);
    }

    // trajectory
    trajectory_msg_.header.frame_id = map_frame_name_;
    trajectory_msg_.header.stamp = ros::Time::now();
    trajectory_msg_.key_frames.resize(0);
    key_frame_msg_.header.frame_id = map_frame_name_;
    key_frame_msg_.laser_headers.resize(n_lasers);
    for (auto ii = 0; ii<n_lasers; ii++)
    {
        key_frame_msg_.laser_headers[ii].frame_id = laser_frame_name_[ii];
        key_frame_msg_.laser_headers[ii].seq = 0;
        key_frame_msg_.laser_headers[ii].stamp = ros::Time(0);
    }

    // Initial frame
    //unsigned int attempts = 0;
    ROS_INFO("WolfNodePolyline: Waiting for odometry tf...");
    setOrigin(); //this call sets the initial transfom between base frame and odometry
//     while (!setOrigin() && attempts < 1e6)
//     {
//         usleep(1e4);
//         attempts++;
//     }
//     if (attempts == 1e6)
//         ROS_ERROR("WolfNodePolyline: Didn't receive odometry tf after 1.000.000 attempts");
//     else
//         ROS_INFO("WolfNodePolyline: Receive odometry tf after %i attempts", attempts);

    ROS_INFO("STARTING IRI WOLF...");
}

WolfNodePolyline::~WolfNodePolyline()
{
    std::cout << std::endl << " ========= WolfNodePolyline DESTRUCTOR =============" << std::endl;
    odom_capture_ptr_->destruct();
}


void WolfNodePolyline::solve()
{
    // Solving ---------------------------------------------------------------------------
    //ROS_INFO("================ SOLVING ==================");

    ceres::Solver::Summary summary = ceres_manager_.solve();
    //std::cout << "------------------------- SOLVED -------------------------" << std::endl;
    //std::cout << summary.BriefReport() << std::endl; //summary.FullReport()

    if (compute_covariance_)
        ceres_manager_.computeCovariances();

    // Update localization tf ---------------------------------------------------------------------------
    updateLocalizationTf();

    // MARKERS VEHICLE & CONSTRAINTS ---------------------------------------------------------------------------
    publishMarkers();

    if (publish_trajectory_)
    	publishTrajectory();
}
void WolfNodePolyline::updateLocalizationTf()
{
    ROS_DEBUG("================ computeLocCorrectionTf ==================");

    // get current vehicle pose
    ros::Time loc_stamp;
    wolf::TimeStamp loc_ts;
    problem_.getCurrentState(vehicle_pose_, loc_ts);
    loc_stamp.nsec = loc_ts.getNanoSeconds();
    loc_stamp.sec = loc_ts.getSeconds();

    // Broadcast transform ---------------------------------------------------------------------------
    //Get map2base from Wolf result, and builds base2map pose
    T_map2base_.setOrigin( tf::Vector3((double) vehicle_pose_(0), (double) vehicle_pose_(1), 0) );
    T_map2base_.setRotation( tf::createQuaternionFromYaw((double) vehicle_pose_(2)) );

    //std::cout << "Vehicle pose: " << vehicle_pose_.transpose() << std::endl;

    //gets T_map2odom_ (odom wrt map), by using tf listener, and assuming an odometry node is broadcasting odom2base
    if ( tfl_.waitForTransform(base_frame_name_, odom_frame_name_, loc_stamp, ros::Duration(0.1)) )
    {
        tfl_.lookupTransform(base_frame_name_, odom_frame_name_, loc_stamp, T_base2odom_);
        //std::cout << "Odometry: " << T_base2odom_.inverse().getOrigin().getX() << " " << T_base2odom_.inverse().getOrigin().getY() << " " << T_base2odom_.inverse().getRotation().getAngle() << std::endl;
        T_map2odom_.setData(T_map2base_ * T_base2odom_);
        T_map2odom_.stamp_ = loc_stamp;
    }
    else
        ROS_WARN("No odom to base frame received");
}

void WolfNodePolyline::broadcastTf()
{
    ROS_DEBUG("================ broadcastTf ==================");

    //broadcast T_map2odom_
    T_map2odom_.stamp_ = ros::Time::now();
    tfb_.sendTransform( T_map2odom_ );
}

void WolfNodePolyline::publishMarkers()
{
    ROS_DEBUG("================ publishMarkers ==================");

    ros::Time marker_stamp = ros::Time::now();

    // MARKERS VEHICLE & CONSTRAINTS
    //ROS_INFO("Frames & constraints");
    wolf::ConstraintBaseList ctr_list;
    constraints_marker_msg_.points.clear();
    constraints_marker_msg_.action = visualization_msgs::Marker::MODIFY;
    constraints_marker_msg_.header.stamp = marker_stamp;
    unsigned int ii = 1; //start from 1 to keep the vehicle_MarkerArray_msg_.marker[0] for the current vehicle state
    geometry_msgs::Point point1, point2;
    for (auto frm_ptr : (*problem_.getTrajectoryPtr()->getFrameListPtr())) //runs the list of frames
    {
        if (frm_ptr->isKey())
        {
            // KEY FRAMES
            if (ii < trajectory_marker_array_msg_.markers.size())
                trajectory_marker_array_msg_.markers[ii].action = visualization_msgs::Marker::MODIFY;
            else
            {
                trajectory_marker_array_msg_.markers.push_back(vehicle_marker_);
                trajectory_marker_array_msg_.markers[ii].action = visualization_msgs::Marker::ADD;
                trajectory_marker_array_msg_.markers[ii].id = ii;
            }
            trajectory_marker_array_msg_.markers[ii].header.stamp = marker_stamp;
            trajectory_marker_array_msg_.markers[ii].header.frame_id = "map";
            trajectory_marker_array_msg_.markers[ii].pose.position.x = frm_ptr->getPPtr()->getVector()(0);
            trajectory_marker_array_msg_.markers[ii].pose.position.y = frm_ptr->getPPtr()->getVector()(1);
            trajectory_marker_array_msg_.markers[ii].pose.orientation = tf::createQuaternionMsgFromYaw( frm_ptr->getOPtr()->getVector()(0) );
            trajectory_marker_array_msg_.markers[ii].color.a = 0.5; //Show with little transparency

            // CONSTRAINTS
            ctr_list.clear();
            frm_ptr->getConstraintList(ctr_list);
            for (auto c_ptr : ctr_list)
            {
                switch (c_ptr->getCategory())
                {
                    // Odometry
                    case wolf::CTR_FRAME:
                    {
                        // from
                        point1.x = frm_ptr->getPPtr()->getVector()(0);
                        point1.y = frm_ptr->getPPtr()->getVector()(1);
                        point1.z = 0.25;
                        // to
                        point2.x = c_ptr->getFrameOtherPtr()->getPPtr()->getVector()(0);
                        point2.y = c_ptr->getFrameOtherPtr()->getPPtr()->getVector()(1);
                        point2.z = 0.25;
                        break;
                    }
                    // Landmarks
                    case wolf::CTR_LANDMARK:
                    {
                        // from
                        point1.x = frm_ptr->getPPtr()->getVector()(0);
                        point1.y = frm_ptr->getPPtr()->getVector()(1);
                        point1.z = 0.25;
                        // to
                        if (c_ptr->getType() == wolf::CTR_POINT_2D)
                        {
                            point2.x = ((wolf::ConstraintPoint2D*)c_ptr)->getLandmarkPointPtr()->getVector()(0);
                            point2.y = ((wolf::ConstraintPoint2D*)c_ptr)->getLandmarkPointPtr()->getVector()(1);
                            point2.z = 0.5;
                        }
                        else if (c_ptr->getType() == wolf::CTR_POINT_TO_LINE_2D)
                        {
                            point2.x = ((wolf::ConstraintPointToLine2D*)c_ptr)->getLandmarkPointPtr()->getVector()(0);
                            point2.y = ((wolf::ConstraintPointToLine2D*)c_ptr)->getLandmarkPointPtr()->getVector()(1);
                            point2.z = 0.5;
                        }
                        else
                        {
                            point2.x = c_ptr->getLandmarkOtherPtr()->getPPtr()->getVector()(0);
                            point2.y = c_ptr->getLandmarkOtherPtr()->getPPtr()->getVector()(1);
                            point2.z = 0.5;
                        }
                        break;
                    }
                }
                constraints_marker_msg_.header.stamp = marker_stamp;
                constraints_marker_msg_.points.push_back(point1);
                constraints_marker_msg_.points.push_back(point2);
            }

            ii++;
        }
    }
    auto trajectory_current_size = ii;
    for (ii; ii < trajectory_marker_array_msg_.markers.size(); ii++)
        trajectory_marker_array_msg_.markers[ii].action = visualization_msgs::Marker::DELETE;

    // MARKERS LANDMARKS
    ii = 0;
    for (auto l_ptr : *(problem_.getMapPtr()->getLandmarkListPtr()))
    {
        // Polylines
        if (l_ptr->getType() == wolf::LANDMARK_POLYLINE_2D)
        {
            if (3*ii < landmark_marker_array_msg_.markers.size())
            {
                landmark_marker_array_msg_.markers[3*ii].action = visualization_msgs::Marker::MODIFY;
                landmark_marker_array_msg_.markers[3*ii+1].action = visualization_msgs::Marker::MODIFY;
                landmark_marker_array_msg_.markers[3*ii+2].action = visualization_msgs::Marker::MODIFY;
            }
            else
            {
                landmark_marker_array_msg_.markers.push_back(landmark_line_marker_);
                landmark_marker_array_msg_.markers.push_back(landmark_text_marker_);
                landmark_marker_array_msg_.markers.push_back(landmark_points_marker_);
                landmark_marker_array_msg_.markers[3*ii].action = visualization_msgs::Marker::ADD;
                landmark_marker_array_msg_.markers[3*ii+1].action = visualization_msgs::Marker::ADD;
                landmark_marker_array_msg_.markers[3*ii+2].action = visualization_msgs::Marker::ADD;
                landmark_marker_array_msg_.markers[3*ii].id = 3*ii;
                landmark_marker_array_msg_.markers[3*ii+1].id = 3*ii+1;
                landmark_marker_array_msg_.markers[3*ii+2].id = 3*ii+2;
            }

            if (l_ptr->getHits() > max_hits_)
                max_hits_ = l_ptr->getHits();

            // lines
            landmark_marker_array_msg_.markers[3*ii].header.stamp = ros::Time();
            landmark_marker_array_msg_.markers[3*ii].color.r = (double)l_ptr->getHits()/max_hits_;
            landmark_marker_array_msg_.markers[3*ii].color.g = 0;
            landmark_marker_array_msg_.markers[3*ii].color.b = 1 - (double)l_ptr->getHits()/max_hits_;
            landmark_marker_array_msg_.markers[3*ii].color.a = 0.5;

            // points
            landmark_marker_array_msg_.markers[3*ii+2].header.stamp = ros::Time();
            landmark_marker_array_msg_.markers[3*ii+2].color = landmark_marker_array_msg_.markers[3*ii].color;

            // fill points
            wolf::LandmarkPolyline2D* polyline_l_ptr = (wolf::LandmarkPolyline2D*)l_ptr;
            geometry_msgs::Point point;
            landmark_marker_array_msg_.markers[3*ii].points.clear();
            landmark_marker_array_msg_.markers[3*ii+2].points.clear();
            for (auto i = polyline_l_ptr->getFirstId(); i < polyline_l_ptr->getNPoints()+polyline_l_ptr->getFirstId(); i++)
            {
                point.x = polyline_l_ptr->getPointVector(i)(0);
                point.y = polyline_l_ptr->getPointVector(i)(1);
                landmark_marker_array_msg_.markers[3*ii].points.push_back(point);

                if (i == 0 && !polyline_l_ptr->isFirstDefined())
                    continue;
                if (i == polyline_l_ptr->getNPoints()-1 && !polyline_l_ptr->isLastDefined())
                    continue;

                landmark_marker_array_msg_.markers[3*ii+2].points.push_back(point);
            }

            // text
            landmark_marker_array_msg_.markers[3*ii+1].header.stamp = ros::Time();
            landmark_marker_array_msg_.markers[3*ii+1].pose.position = landmark_marker_array_msg_.markers[3*ii].points[0];
            landmark_marker_array_msg_.markers[3*ii+1].pose.position.z = 2;
            landmark_marker_array_msg_.markers[3*ii+1].text = std::to_string(l_ptr->id());

            ii++;
        }
    }
    auto landmark_current_size = 3*ii;
    for (ii; 3*ii < landmark_marker_array_msg_.markers.size(); ii++)
    {
        landmark_marker_array_msg_.markers[3*ii].action = visualization_msgs::Marker::DELETE;
        landmark_marker_array_msg_.markers[3*ii+1].action = visualization_msgs::Marker::DELETE;
        landmark_marker_array_msg_.markers[3*ii+2].action = visualization_msgs::Marker::DELETE;
    }
    assert(landmark_marker_array_msg_.markers.size() == 3*problem_.getMapPtr()->getLandmarkListPtr()->size());

    trajectory_marker_publisher_.publish(trajectory_marker_array_msg_);
    landmarks_publisher_.publish(landmark_marker_array_msg_);
    constraints_publisher_.publish(constraints_marker_msg_);

    trajectory_marker_array_msg_.markers.resize(trajectory_current_size);
    landmark_marker_array_msg_.markers.resize(landmark_current_size);

    //std::cout << "publishMarkers: end " << std::endl;
}

void WolfNodePolyline::publishTrajectory()
{
	auto prev_size = trajectory_msg_.key_frames.size();
	auto i = 0;
	for (auto frm_ptr : (*problem_.getTrajectoryPtr()->getFrameListPtr())) //runs the list of frames
		// KEY FRAME
		if (frm_ptr->isKey())
		{
			// new key frames: add & set laser_seq
			if (i >= prev_size)
			{
				// add a new key frame
				trajectory_msg_.key_frames.push_back(key_frame_msg_);

				// set all laser scans captures
				for (auto j = 0; j < laser_sensor_ptr_.size(); j++)
				{
					wolf::CaptureBase* capture = frm_ptr->hasCaptureOf(laser_sensor_ptr_[j]);
					if (capture != nullptr)
						trajectory_msg_.key_frames.back().laser_headers[j] = scan_id_to_header_[capture->id()];
				}

			}
			// change key frame pose
			trajectory_msg_.key_frames[i].frame_pose.pose.position.x = frm_ptr->getPPtr()->getVector()(0);
			trajectory_msg_.key_frames[i].frame_pose.pose.position.y = frm_ptr->getPPtr()->getVector()(1);
			trajectory_msg_.key_frames[i].frame_pose.pose.orientation = tf::createQuaternionMsgFromYaw(frm_ptr->getOPtr()->getVector()(0));

			i++;
	    }
	trajectory_publisher_.publish(trajectory_msg_);
}

void WolfNodePolyline::publishProcessorMarkers(const unsigned int _laser_id, const ros::Time& _stamp)
{
    ROS_DEBUG("================ publishProcessorMarkers ==================");
    //std::cout << "Last polylines: " << laser_processor_ptr_[_laser_id]->getLastPolylines().size() << std::endl;

    // MARKERS FEATURES
    unsigned int ii = 0;
    for (auto feat_ptr : laser_processor_ptr_[_laser_id]->getLastPolylines())
        if (feat_ptr->getType() == wolf::FEATURE_POLYLINE_2D)
        {
            if (2*ii < features_marker_array_msg_[_laser_id].markers.size() )
            {
                features_marker_array_msg_[_laser_id].markers[2*ii].action = visualization_msgs::Marker::MODIFY;
                features_marker_array_msg_[_laser_id].markers[2*ii+1].action = visualization_msgs::Marker::MODIFY;
            }
            else
            {
                features_marker_array_msg_[_laser_id].markers.push_back(feature_line_marker_);
                features_marker_array_msg_[_laser_id].markers.push_back(feature_points_marker_);
                features_marker_array_msg_[_laser_id].markers[2*ii].action = visualization_msgs::Marker::ADD;
                features_marker_array_msg_[_laser_id].markers[2*ii+1].action = visualization_msgs::Marker::ADD;
                features_marker_array_msg_[_laser_id].markers[2*ii].id = 2*ii;
                features_marker_array_msg_[_laser_id].markers[2*ii+1].id = 2*ii+1;
            }
            wolf::FeaturePolyline2D* polyline_feat_ptr = (wolf::FeaturePolyline2D*)feat_ptr;
            features_marker_array_msg_[_laser_id].markers[2*ii].header.frame_id = laser_frame_name_[_laser_id];
            features_marker_array_msg_[_laser_id].markers[2*ii].header.stamp = ros::Time();
            features_marker_array_msg_[_laser_id].markers[2*ii].color.r = 1;
            features_marker_array_msg_[_laser_id].markers[2*ii].color.g = 1;
            features_marker_array_msg_[_laser_id].markers[2*ii].color.b = 1;
            features_marker_array_msg_[_laser_id].markers[2*ii].points.clear();
            features_marker_array_msg_[_laser_id].markers[2*ii+1].header = features_marker_array_msg_[_laser_id].markers[2*ii].header;
            features_marker_array_msg_[_laser_id].markers[2*ii+1].color = features_marker_array_msg_[_laser_id].markers[2*ii].color;
            features_marker_array_msg_[_laser_id].markers[2*ii+1].points.clear();

            geometry_msgs::Point point;
            for (auto i = 0; i < polyline_feat_ptr->getNPoints(); i++)
            {
                point.x = polyline_feat_ptr->getPoints()(0,i);
                point.y = polyline_feat_ptr->getPoints()(1,i);
                features_marker_array_msg_[_laser_id].markers[2*ii].points.push_back(point);

                if (i == 0 && !polyline_feat_ptr->isFirstDefined())
                    continue;
                if (i == polyline_feat_ptr->getNPoints()-1 && !polyline_feat_ptr->isLastDefined())
                    continue;

                features_marker_array_msg_[_laser_id].markers[2*ii+1].points.push_back(point);
            }

            ii++;
        }
    for (auto feat_ptr : *(laser_processor_ptr_[_laser_id]->getLastPtr()->getFeatureListPtr()))
        if (feat_ptr->getType() == wolf::FEATURE_POLYLINE_2D)
        {

            if (2*ii < features_marker_array_msg_[_laser_id].markers.size() )
            {
                features_marker_array_msg_[_laser_id].markers[2*ii].action = visualization_msgs::Marker::MODIFY;
                features_marker_array_msg_[_laser_id].markers[2*ii+1].action = visualization_msgs::Marker::MODIFY;
            }
            else
            {
                features_marker_array_msg_[_laser_id].markers.push_back(feature_line_marker_);
                features_marker_array_msg_[_laser_id].markers.push_back(feature_points_marker_);
                features_marker_array_msg_[_laser_id].markers[2*ii].action = visualization_msgs::Marker::ADD;
                features_marker_array_msg_[_laser_id].markers[2*ii+1].action = visualization_msgs::Marker::ADD;
                features_marker_array_msg_[_laser_id].markers[2*ii].id = 2*ii;
                features_marker_array_msg_[_laser_id].markers[2*ii+1].id = 2*ii+1;
            }
            wolf::FeaturePolyline2D* polyline_feat_ptr = (wolf::FeaturePolyline2D*)feat_ptr;
            features_marker_array_msg_[_laser_id].markers[2*ii].header.frame_id = laser_frame_name_[_laser_id];
            features_marker_array_msg_[_laser_id].markers[2*ii].header.stamp = ros::Time();
            features_marker_array_msg_[_laser_id].markers[2*ii].pose.position.z = 1.5;
            features_marker_array_msg_[_laser_id].markers[2*ii].color.r = 0;
            features_marker_array_msg_[_laser_id].markers[2*ii].color.g = 1;
            features_marker_array_msg_[_laser_id].markers[2*ii].color.b = 0;
            features_marker_array_msg_[_laser_id].markers[2*ii].points.clear();
            features_marker_array_msg_[_laser_id].markers[2*ii+1].header = features_marker_array_msg_[_laser_id].markers[2*ii].header;
            features_marker_array_msg_[_laser_id].markers[2*ii+1].pose.position.z = 1.5;
            features_marker_array_msg_[_laser_id].markers[2*ii+1].color = features_marker_array_msg_[_laser_id].markers[2*ii].color;
            features_marker_array_msg_[_laser_id].markers[2*ii+1].points.clear();

            geometry_msgs::Point point;
            for (auto i = 0; i < polyline_feat_ptr->getNPoints(); i++)
            {
                point.x = polyline_feat_ptr->getPoints()(0,i);
                point.y = polyline_feat_ptr->getPoints()(1,i);
                features_marker_array_msg_[_laser_id].markers[2*ii].points.push_back(point);

                if (i == 0 && !polyline_feat_ptr->isFirstDefined())
                    continue;
                if (i == polyline_feat_ptr->getNPoints()-1 && !polyline_feat_ptr->isLastDefined())
                    continue;

                features_marker_array_msg_[_laser_id].markers[2*ii+1].points.push_back(point);
            }

            ii++;
        }
    auto current_size = 2*ii;
    for (ii; 2*ii < features_marker_array_msg_[_laser_id].markers.size(); ii++)
    {
        features_marker_array_msg_[_laser_id].markers[2*ii].action = visualization_msgs::Marker::DELETE;
        features_marker_array_msg_[_laser_id].markers[2*ii+1].action = visualization_msgs::Marker::DELETE;
    }
    features_publisher_[_laser_id].publish(features_marker_array_msg_[_laser_id]);
    features_marker_array_msg_[_laser_id].markers.resize(current_size);
    //std::cout << "publishProcessorMarkers: end" << std::endl;
}

void WolfNodePolyline::odometryCallback(const nav_msgs::Odometry::ConstPtr& msg)
{
    ROS_DEBUG("WolfNodePolyline::odometry_callback: New Message Received");

    if (msg->header.seq - last_odom_seq_ > 1)
        ROS_ERROR("WolfNodePolyline::odometryCallback: LOST ODOMETRY MESSAGE!");

    if (last_odom_stamp_ != ros::Time(0))
    {
        wolf::Scalar dt = (msg->header.stamp - last_odom_stamp_).toSec();
        odom_capture_ptr_->setTimeStamp(wolf::TimeStamp(msg->header.stamp.sec, msg->header.stamp.nsec));
        odom_capture_ptr_->setData(Eigen::Vector2s(msg->twist.twist.linear.x*dt, msg->twist.twist.angular.z*dt));
        odom_capture_ptr_->setDataCovariance(Eigen::DiagonalMatrix<wolf::Scalar,2>(msg->twist.twist.linear.x*dt*(wolf::Scalar)odometry_translational_cov_factor_, msg->twist.twist.angular.z*dt*(wolf::Scalar)odometry_rotational_cov_factor_));
        odom_capture_ptr_->process();
    }
    last_odom_stamp_ = msg->header.stamp;
    last_odom_seq_ = msg->header.seq;

    ROS_DEBUG("WolfNodePolyline::odomCallback: end");
}

const wolf::Problem& WolfNodePolyline::getProblem()
{
    return problem_;
}

void WolfNodePolyline::laserCallback(const sensor_msgs::LaserScan::ConstPtr& msg)
{
    ROS_DEBUG("WolfNodePolyline::laserCallback: New Message Received");

    //get the id from the message header
    unsigned int laser_id = laser_frame_2_idx_[msg->header.frame_id];
    //std::cout << "laser_callback() starts. laser_id: " << laser_id << std::endl;

    // Check if the sensor exists
    if ( laser_sensor_ptr_[laser_id] != nullptr )
    {
        //sets the extrinsics if they are not set yet
        if (!laser_extrinsics_set_[laser_id] )
        {
            Eigen::VectorXs laser_extrinsics = Eigen::VectorXs::Zero(3);
            if (loadSensorExtrinsics(laser_frame_name_[laser_id], laser_extrinsics))
            {
                laser_sensor_ptr_[laser_id]->getPPtr()->setVector(laser_extrinsics.head(2));
                laser_sensor_ptr_[laser_id]->getOPtr()->setVector(laser_extrinsics.tail(1));
                laser_extrinsics_set_[laser_id] = true;
            }
        }

        // sets laser scan params if they are not set yet
        if (!laser_intrinsics_set_[laser_id])
            loadLaserIntrinsics(laser_id, msg);

        //create a new capture in the Wolf environment (only for messages after origin stamp)
        if ( msg->header.stamp > origin_stamp_ )
        {
            //create new capture
            wolf::CaptureLaser2D* new_capture = new wolf::CaptureLaser2D(wolf::TimeStamp(msg->header.stamp.sec, msg->header.stamp.nsec),
            															 laser_sensor_ptr_[laser_id],
            															 msg->ranges);
            //filter scan
            if (filter_scans_)
                filterScan(new_capture->getScan().ranges_, min_range_filter_th_, max_range_filter_th_);

            //process the capture
            new_capture->process();

            //fill trajectory header and publish processor markers
            if (publish_trajectory_)
            	scan_id_to_header_[new_capture->id()] = msg->header;
            if (publish_features_)
                publishProcessorMarkers(laser_id, msg->header.stamp);
        }
        //std::cout << "capture added" << std::endl;
    }
    ROS_DEBUG("WolfNodePolyline::laserCallback: end");
}

void WolfNodePolyline::loadLaserIntrinsics(const unsigned int _laser_idx, const sensor_msgs::LaserScan::ConstPtr& msg)
{
    // laser intrinsic parameters
    laserscanutils::LaserScanParams params = laser_sensor_ptr_[_laser_idx]->getScanParams();
    params.angle_min_ = msg->angle_min;
    params.angle_max_ = msg->angle_max;
    params.angle_step_ = msg->angle_increment;
    params.scan_time_ = msg->time_increment;
    params.range_min_ = msg->range_min;
    params.range_max_ = msg->range_max;
    params.range_std_dev_ = 0.05; // TODO: get from param
    params.angle_std_dev_ = 0.05; // TODO: get from param
    laser_sensor_ptr_[_laser_idx]->setScanParams(params);
    laser_intrinsics_set_[_laser_idx] = true;
}

bool WolfNodePolyline::loadSensorExtrinsics(const std::string _sensor_frame, Eigen::VectorXs& _extrinsics)
{
    //look up for transform from base to ibeo
    std::cout << "WolfNodePolyline::loadSensorExtrinsics: waiting transform " << _sensor_frame << std::endl;
    if ( tfl_.waitForTransform(base_frame_name_, _sensor_frame, ros::Time(0), ros::Duration(1.)) )
    {
        tf::StampedTransform base_2_sensor;

        //look up for transform at TF
        tfl_.lookupTransform(base_frame_name_, _sensor_frame, ros::Time(0), base_2_sensor);

        //Set mounting frame. Fill translation part
        _extrinsics << base_2_sensor.getOrigin().x(), base_2_sensor.getOrigin().y(), tf::getYaw(base_2_sensor.getRotation());
        //std::cout << _sensor_frame << ": " << _extrinsics.transpose() << std::endl;

        return true;
    }
    ROS_ERROR("WolfNodePolyline::loadSensorExtrinsics: tf not received!");
    return false;
}

bool WolfNodePolyline::setOrigin()
{   
    //wait up to first transform base 2 odom is available. Get the lattest (ros::Time(0)). Block up to 10s
    if ( !tfl_.waitForTransform(base_frame_name_, odom_frame_name_, ros::Time(0), ros::Duration(10.)) )
    {
        std::cout << "WolfNodePolyline::setOrigin(): Transform from " << base_frame_name_ << " to " << odom_frame_name_ << " NOT AVAILABLE" << std::endl; 
        return false; 
    }

    // Get the lattest (ros::Time(0)) base to odometry transform
    tfl_.lookupTransform(base_frame_name_, odom_frame_name_, ros::Time(0), T_base2odom_);
    std::cout << "WolfNodePolyline::setOrigin: " << std::endl; 
    std::cout << "\t First odometry: " << T_base2odom_.inverse().getOrigin().getX() << " " << T_base2odom_.inverse().getOrigin().getY() << " " << tf::getYaw(T_base2odom_.inverse().getRotation()) << std::endl;
    std::cout << "\t Stamp: " << T_base2odom_.stamp_.sec << "." << T_base2odom_.stamp_.nsec << std::endl;

    //set time origin
    origin_stamp_ = T_base2odom_.stamp_; 
    
    // set wolf origin
    Eigen::Vector3s prior = Eigen::Vector3s(T_base2odom_.inverse().getOrigin().getX(), T_base2odom_.inverse().getOrigin().getY(), tf::getYaw(T_base2odom_.inverse().getRotation()));//prior pose of base in map
    problem_.setOrigin(prior, origin_cov_, wolf::TimeStamp(T_base2odom_.stamp_.sec, T_base2odom_.stamp_.nsec));

    // set transformations
    T_map2base_ = T_base2odom_.inverse();
    T_map2odom_.setOrigin( tf::Vector3(0,0,0) );
    T_map2odom_.setRotation( tf::createQuaternionFromYaw(0) );
    T_map2odom_.stamp_ = ros::Time::now();

    //broadcast T_map2odom_
    tfb_.sendTransform( T_map2odom_ );

    return true;
}

void WolfNodePolyline::filterScan(std::vector<float>& _ranges, const float& _min_range_th, const float& _max_range_th)
{
	for (auto i=0; i<_ranges.size(); i++)
		if (_ranges[i] < _min_range_th || _ranges[i] > _max_range_th)
		    _ranges[i] = 0;
}

//
// Created by jvallve on 22/06/16.
//

#include "wolf_node_occmap.h"

WolfNodeOccmap::WolfNodeOccmap(char *argv0) :
    nh_(ros::this_node::getName())
{
    std::cout << "WolfNodeOccmap::WolfNodeOccmap(...) -- constructor\n";

    // parameters
    bool use_wolf_auto_diff;
    int max_iterations, n_lasers, new_features_th, loop_frames_th;
    double origin_covs[3], dist_traveled_th, cov_det_th, elapsed_time_th, time_tolerance, range_segment_th, range_defined_th, position_error_th;
    double p_free, p_obst, p_thres_free, p_thres_obst;
    nh_.param<bool>("filter_scans", filter_scans_, false);
    nh_.param<double>("min_range_filter_th", min_range_filter_th_, 0);
    nh_.param<double>("max_range_filter_th", max_range_filter_th_, 1e3);
    nh_.param<int>("n_lasers", n_lasers, 6);
    nh_.param<std::string>("base_frame_name", base_frame_name_, "agv_base_link");
    nh_.param<std::string>("map_frame_name_", map_frame_name_, "map");

    nh_.param<int>("max_n_cells", max_n_cells_, 1e9);
	nh_.param<double>("grid_size", grid_size_, 0.5);
	nh_.param<double>("laser_ray_incr", laser_ray_incr_, 0.1);
	nh_.param<double>("p_free", p_free, 0.3);
	nh_.param<double>("p_obst", p_obst, 0.8);
	nh_.param<double>("p_thres_free", p_thres_free, 0.2);
	nh_.param<double>("p_thres_obst", p_thres_obst, 0.7);

    // [init subscribers]
    trajectory_sub_ = nh_.subscribe("trajectory", 1, &WolfNodeOccmap::trajectoryCallback, this);

    // lasers
    laser_extrinsics_set_= std::vector<bool>(n_lasers, false);
    laser_subscribers_.resize(n_lasers);
    laser_extrinsics_.resize(n_lasers);
    laser_frame_name_.resize(n_lasers);
    new_scans_.resize(n_lasers);
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
        std::cout << "setting laser " << ii << " tf. frame id: " << laser_frame_name_[ii] << std::endl;

        // store id-name map
        laser_frame_2_idx_[laser_frame_name_[ii]] = ii;

        // install sensor
        laser_extrinsics_set_[ii] = loadSensorExtrinsics(ii);

        //init laser subscribers
        laser_topic_name_ii.str("");
        laser_topic_name_ii << "laser_" << ii;
        laser_subscribers_[ii] = nh_.subscribe(laser_topic_name_ii.str(),20,&WolfNodeOccmap::laserCallback,this);
    }

    // [init publishers]
    Lfree_ = log(p_free / (1 - p_free));
    Lobst_ = log(p_obst / (1 - p_obst));
    Lfree_thres_ = log(p_thres_free / (1 - p_thres_free));
    Lobst_thres_ = log(p_thres_obst / (1 - p_thres_obst));

    n_cells_(0) = 10;
    n_cells_(1) = 10;
    map_origin_(0) = -n_cells_(0) * grid_size_ / 2;
    map_origin_(1) = -n_cells_(1) * grid_size_ / 2;
    resizeOccupancyGrid();
    std::vector<int8_t> init_occ_grid(n_cells_(0) * n_cells_(1), 50);
    occupancy_grid_.data = init_occ_grid;
    logodds_grid_ = Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic, Eigen::ColMajor>::Zero(n_cells_(0),n_cells_(1));
    occupancy_grid_.header.frame_id = map_frame_name_;
    map_publisher_ = nh_.advertise<nav_msgs::OccupancyGrid>("map", 1);

    // init MARKERS
    ROS_INFO("STARTING WOLF OCCMAP...");
}

WolfNodeOccmap::~WolfNodeOccmap()
{
    //
}

void WolfNodeOccmap::publishMap()
{
    // publish map
    map_publisher_.publish(occupancy_grid_);
}

void WolfNodeOccmap::trajectoryCallback(const cargo_ants_slam::Trajectory::ConstPtr& msg)
{
    //ROS_INFO("WolfNodeOccmap::trajectoryCallback: New Message Received");
    //std::cout << "WolfNodeOccmap::trajectoryCallback: new trajectory: " << msg->key_frames.size() << " key frames" << std::endl;

    // Update the trajecory scans buffer
	updateTrajectoryScans(*msg);

	// Recompute occupancy grid
	recomputeOccupancyGrid(*msg);
}

void WolfNodeOccmap::laserCallback(const sensor_msgs::LaserScan::ConstPtr& msg)
{
    //ROS_INFO("WolfNodeOccmap::laserCallback: New Message Received");
    //std::cout << "stamp: " << msg->header.stamp.sec << "." << msg->header.stamp.nsec << std::endl;

    //get the id from the message header
    unsigned int laser_id = laser_frame_2_idx_[msg->header.frame_id];
    //std::cout << "laser_callback() laser_id: " << laser_id << std::endl;
    assert(laser_id < laser_subscribers_.size() && "wrong laser_id");

    sensor_msgs::LaserScan new_scan(*msg);

	if (filter_scans_)
		filterScan(new_scan.ranges, min_range_filter_th_, max_range_filter_th_);

	//sets the extrinsics if they are not set yet
	if (!laser_extrinsics_set_[laser_id] )
        laser_extrinsics_set_[laser_id] = loadSensorExtrinsics(laser_id);

	// store new scan
	new_scans_[laser_id].push(new_scan);

    //ROS_INFO("WolfNodeOccmap::laserCallback: end");
}

bool WolfNodeOccmap::loadSensorExtrinsics(const unsigned int _laser_id)
{
    //look up for transform from base to ibeo
    //std::cout << "WolfNodeOccmap::loadSensorExtrinsics: waiting transform " << laser_frame_name_[_laser_id] << std::endl;
    if ( tfl_.waitForTransform(base_frame_name_, laser_frame_name_[_laser_id], ros::Time(0), ros::Duration(1.)) )
    {
        tf::StampedTransform base_2_sensor;

        //look up for transform at TF
        tfl_.lookupTransform(base_frame_name_, laser_frame_name_[_laser_id], ros::Time(0), base_2_sensor);
        laser_extrinsics_[_laser_id] = base_2_sensor;

        return true;
    }
    ROS_ERROR("WolfNodeOccmap::loadSensorExtrinsics: tf not received!");
    return false;
}

void WolfNodeOccmap::filterScan(std::vector<float>& _ranges, const float& _min_range_th, const float& _max_range_th)
{
	for (auto i=0; i<_ranges.size(); i++)
		if (_ranges[i] < _min_range_th || _ranges[i] > _max_range_th)
            _ranges[i] = 0;
}

void WolfNodeOccmap::updateTrajectoryScans(const cargo_ants_slam::Trajectory& trajectory)
{
    //std::cout << "WolfNodeOccmap::updateTrajectoryScans: " << std::endl;
    // Reserve space in buffer
    if (key_scans_.size() == key_scans_.capacity())
        key_scans_.reserve(key_scans_.size() + 100);

    // Add the new scans to new trajectory keyframes
    auto first_new_keyframe = key_scans_.empty() ? 0 : keyscan_idx_to_keyframe_idx_[key_scans_.size()-1]+1;

    for (auto i = first_new_keyframe; i < trajectory.key_frames.size(); i++)
        for (auto laser_id = 0; laser_id < laser_frame_name_.size(); laser_id++)
            if (!new_scans_[laser_id].empty() && trajectory.key_frames[i].laser_headers[laser_id].seq != 0)
            {
                while (!new_scans_[laser_id].empty() && new_scans_[laser_id].front().header.seq < trajectory.key_frames[i].laser_headers[laser_id].seq)
                    new_scans_[laser_id].pop();

                if (!new_scans_[laser_id].empty() && new_scans_[laser_id].front().header.seq == trajectory.key_frames[i].laser_headers[laser_id].seq)
                {
                    key_scans_.push_back(new_scans_[laser_id].front());
                    keyscan_idx_to_keyframe_idx_[key_scans_.size()-1] = i;
                    new_scans_[laser_id].pop();
                }
            }
    //std::cout << "WolfNodeOccmap::updateTrajectoryScans: done" << std::endl;
}

void WolfNodeOccmap::recomputeOccupancyGrid(const cargo_ants_slam::Trajectory& trajectory)
{
    tf::Transform T_map_base;
    unsigned int keyframe_idx;

	// Reset logodds_grid_
	logodds_grid_ = Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic, Eigen::ColMajor>::Zero(n_cells_(0),n_cells_(1));

	// Update the logodds_grid_
	for (auto i = 0; i < key_scans_.size(); i++)
	{
	    keyframe_idx = keyscan_idx_to_keyframe_idx_[i];

	    assert(keyframe_idx < trajectory.key_frames.size());

	    ROS_DEBUG("TR 2 OCCGRID: Adding scan %u from pose: %u - %f, %f, %f", i, keyframe_idx,
	                               trajectory.key_frames.at(keyframe_idx).frame_pose.pose.position.x,
	                               trajectory.key_frames.at(keyframe_idx).frame_pose.pose.position.y,
	                               tf::getYaw(trajectory.key_frames.at(keyframe_idx).frame_pose.pose.orientation));

	    if (i==0 || keyscan_idx_to_keyframe_idx_[i-1] != keyframe_idx)
	        tf::poseMsgToTF(trajectory.key_frames.at(keyframe_idx).frame_pose.pose, T_map_base);

	    addScanToLogodds(key_scans_.at(i), T_map_base);
	}

	updateOccupancyGrid(trajectory.header.stamp);
}

void WolfNodeOccmap::addScanToLogodds(const sensor_msgs::LaserScan& scan, const tf::Transform& T_map_base)
{
    unsigned int laser_id = laser_frame_2_idx_[scan.header.frame_id];

    // laser pose
    geometry_msgs::Pose laser_pose;
    tf::Transform T_map_laser;
    T_map_laser = T_map_base * laser_extrinsics_[laser_id];
    tf::poseTFToMsg(T_map_laser, laser_pose);

    // Compute the log odds update
    double theta = scan.angle_min;
    for (unsigned int i=0; i < scan.ranges.size(); i++, theta+=scan.angle_increment)
    {
        assert(theta <= scan.angle_max + 1e-3 && "TR 2 OCCGRID: Ray orientation higher than angle_max ");
        if (scan.ranges[i] > scan.range_min)
            // Add the logodds ray
            addRayToLogodds(theta, scan.ranges[i], laser_pose, scan.ranges[i] < scan.range_max-0.2);
    }
}

void WolfNodeOccmap::addRayToLogodds(const double& theta, const double& range, const geometry_msgs::Pose& laser_pose, bool _obstacle)
{
    double d = 0;
    Eigen::Vector2f origin, point, displ;

    double orientation = theta + tf::getYaw(laser_pose.orientation);
    origin(0) = laser_pose.position.x;
    origin(1) = laser_pose.position.y;

    displ(0) = cos(orientation) * laser_ray_incr_;
    displ(1) = sin(orientation) * laser_ray_incr_;
    point = origin;// + displ;

    assert(std::isfinite(point(0)) && std::isfinite(point(1)) && "TR 2 OCCGRID: Not finite point");

    // free cells log odds
    Eigen::Vector2i cell_prev(-1,-1);

    while (d < range)
    {
        Eigen::Vector2i cell = vectorToCell(point);

        if (cell != cell_prev)
            logodds_grid_(cell(0), cell(1)) += Lfree_;

        cell_prev = cell;

        // next point
        point += displ;
        d += laser_ray_incr_;
    }

    // obstacle cell log odd
    if (_obstacle)
    {
        point(0) = origin(0) + cos(orientation) * range;
        point(1) = origin(1) + sin(orientation) * range;

        Eigen::Vector2i cell = vectorToCell(point);
        logodds_grid_(cell(0), cell(1))  += Lobst_;
    }
}

Eigen::Vector2i WolfNodeOccmap::vectorToCell(const Eigen::Vector2f& p)
{
	Eigen::Vector2i cell;
    cell(0) = int( std::floor((p(0) - map_origin_(0)) / grid_size_ ));
    cell(1) = int( std::floor((p(1) - map_origin_(1)) / grid_size_ ));

    for (unsigned int i = 0; i<2; i++)
    {
        int oversize = std::max( 0 - cell(i), cell(i) - n_cells_(i) + 1 );
        while ( oversize > 0 && n_cells_(i) < max_n_cells_ )
        {
            bool back = !(cell(i) < 0);
            ROS_DEBUG("TR 2 OCCGRID: Point out of the map in dimension %i: \n\tpoint = %f, %f\n\tlower = %f, %f\n\tupper = %f, %f\n\tcell = %i, %i\n\tn cells = %i, %i", i,
                     p(0), p(1), map_origin_(0), map_origin_(1), map_origin_(0) + grid_size_ * n_cells_(1), map_origin_(1) + grid_size_ * n_cells_(0),
                     cell(1), cell(0), n_cells_(1), n_cells_(0));
            resizeMap(i, oversize, back);
            ROS_DEBUG("TR 2 OCCGRID: Map resized in dimension %i: new limits:\n\tlower = %f, %f\n\tupper = %f, %f\n\tn cells = %i, %i", i,
                     map_origin_(0), map_origin_(1), map_origin_(0) + grid_size_ * n_cells_(1), map_origin_(1) + grid_size_ * n_cells_(0), n_cells_(1), n_cells_(0));

            // Recompute current cell and oversize
            cell(i) = int( (p(i) - map_origin_(i)) / grid_size_ );
            oversize = std::max( 0 - cell(i), cell(i) - n_cells_(i) + 1 );
        }
    }
    assert(cell(0) >= 0 && cell(1) >= 0 && cell(0) < n_cells_(0) && cell(1) < n_cells_(1)  && "Resultinc cell out of the map. Resizing whent wrong somehow...");

    return cell;
}

void WolfNodeOccmap::updateOccupancyGrid(const ros::Time& _stamp)
{
    Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic, Eigen::ColMajor> occupancy_probability(n_cells_(0), n_cells_(1));

    occupancy_probability = (logodds_grid_ >= Lobst_thres_).select(100,occupancy_probability);
    occupancy_probability = (logodds_grid_ <= Lfree_thres_).select(0,occupancy_probability);
    occupancy_probability = (logodds_grid_ < Lobst_thres_ && logodds_grid_ > Lfree_thres_).select(-1,occupancy_probability);

    std::copy(occupancy_probability.data(), occupancy_probability.data() + occupancy_probability.size(), occupancy_grid_.data.begin());
    //ROS_INFO("TR 2 OCCGRID: OccupancyGrid updated! occupancy_probability.size() = %i - occupancy_grid_.data.size() = %i",occupancy_probability.size(),occupancy_grid_.data.size());

    occupancy_grid_.header.stamp = _stamp;
    occupancy_grid_.info.map_load_time = _stamp;
}

void WolfNodeOccmap::resizeOccupancyGrid()
{
    // initial pose in the middle of the map
    geometry_msgs::Pose origin_pose;
    origin_pose.position.x = map_origin_(0);
    origin_pose.position.y = map_origin_(1);
    origin_pose.position.z = 0.0;

    // Occupancy grid meta data Initializiation
    occupancy_grid_.info.resolution = grid_size_;
    occupancy_grid_.info.width = n_cells_(0);
    occupancy_grid_.info.height = n_cells_(1);
    occupancy_grid_.info.origin = origin_pose;

    // resize data
    occupancy_grid_.data.resize(logodds_grid_.size());
}

void WolfNodeOccmap::resizeMap(const int& dim, const unsigned int& oversize, const bool& back)
{
	Eigen::Vector2i new_n_cells = n_cells_;
    new_n_cells(dim) = n_cells_(dim) + oversize;

    // at the end of the array
    if (back)
    {
        // Origin doesn't change
        // Array resize
        Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic, Eigen::ColMajor> new_logodds_grid = Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic, Eigen::ColMajor>::Zero(new_n_cells(0), new_n_cells(1));
        new_logodds_grid.block(0, 0, n_cells_(0), n_cells_(1)) = logodds_grid_;
        logodds_grid_ = new_logodds_grid;
    }
    // at the beggining of the array
    else
    {
        // Origin
        map_origin_(dim) -= oversize * grid_size_;

        // Array resize
        Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic, Eigen::ColMajor> new_logodds_grid = Eigen::Array<double, Eigen::Dynamic, Eigen::Dynamic, Eigen::ColMajor>::Zero(new_n_cells(0), new_n_cells(1));
        Eigen::Vector2i place = Eigen::Vector2i::Zero(2);
        place(dim) = oversize;
        new_logodds_grid.block(place(0), place(1), n_cells_(0), n_cells_(1)) = logodds_grid_;
        logodds_grid_ = new_logodds_grid;
    }
    // Change in the occupancy grid msg
    n_cells_ = new_n_cells;
    resizeOccupancyGrid();
}

Eigen::Matrix4f WolfNodeOccmap::transformationMatrix(const float x, const float y, const float z, const float alpha) const
{
	Eigen::Matrix4f T = Eigen::MatrixXf::Identity(4,4);

    // Rotation
    T(0,0) =  cos(alpha);
    T(0,1) = -sin(alpha);
    T(1,0) =  sin(alpha);
    T(1,1) =  cos(alpha);

    // Translation
    T(0,3) = x;
    T(1,3) = y;
    T(2,3) = z;

    return T;
}

#ifndef GRID2D_H
#define GRID2D_H

//Eigen includes
#include <eigen3/Eigen/Dense>
#include <eigen3/Eigen/Geometry>

//std includes
#include <math.h>
#include <iostream>

//local includes
#include "cluster.h"

// /** \brief Cluster struct
//  * 
//  * Cluster struct
//  * 
//  **/
// struct Cluster
// {
//     std::vector<std::pair<unsigned int, unsigned int> > cells_;
//     double cenroid_x_; //x coordinate of the cluster centroid [m]
//     double cenroid_y_; //y coordinate of the cluster centroid [m]
//     double long_side_; //dimension of the longest side of the bounding box [m]
//     double short_side_; //dimension of the shortest side of the bounding box [m]
//     double orientation_; //angle beween X grid axis (forward) and the axis aligned with the longest side of the bounding box [rad]
// }


/** \brief A 2D grid class
 *
 * A 2D grid class (yet another 2d grid class ...)
 * 
 * The x axis points to the vehicle forward, and the y axis points to the vehicle leftwards. 
 * Cell ij=00 is the upper leftmost one (xmax, ymax). 
 * 
 */
class Grid2D
{
    protected:
        //sizes in x and y axis respectively
        double size_x_, size_y_; 

        //cell size in x and y axis respectively        
        double step_x_, step_y_; 

        //number of cells in x and y axis respectively
        unsigned int nx_, ny_; 
        
        //grid position of the upper left corner, (ij=00)
        double xmax_, ymax_; 
        
        //number of consecutive iterations that are taken into account to build the grid.
        unsigned int holding_iters_; 
        
        //The grid array. There is always two allcated grids, which interchange the role of current grid. 
        //In each grid, each cell holds the probability of being occupied. 
        Eigen::MatrixXd grid_[2];
        
        //This matrix masks which cells are already processed in the clustering algorithm
        Eigen::MatrixXi clustering_mask_; 
        
        //index to the current grid in the above array of grids
        unsigned int current_;
        
        //index to the next grid in the above array of grids
        unsigned int next_;

    public: 
        //keeps just current lidar data. 
        //Each component of std::vector is the 2D point data corresponding to one laser device, alreday in vehicle base coordinates
        std::vector<Eigen::MatrixXd> laser_points_; 
		
		//keeps all odomemtry data between last and current interation
		//vector of (vx,vy,w,dT), [m/s m/s rad/s s]
        std::vector<Eigen::Vector4d,Eigen::aligned_allocator<Eigen::Vector4d> > odometry_;
		//std::vector<Eigen::Vector4d> odometry_; 
        
        //Cluster set. Clusters of occupied cells.
        //std::vector<std::vector<std::pair<unsigned int, unsigned int> > > cluster_set_;
		std::vector<Cluster> cluster_set_;
		
    public:
        /** \brief Constructor with arguments
        * 
        * Constructor with arguments
        *   \param _sz_x size of x [m]
        *   \param _sz_y size of y [m]
        *   \param _dx size of the cell in x direction [m]
        *   \param _dy size of the cell in y direction [m]
        *   \param _xmax max x value (upper left corner) [m]
        *   \param _ymax max y value (upper left corner) [m]
        * 
        */
        Grid2D(const double & _sz_x, const double & _sz_y, const double & _dx, const double & _dy, const double & _xmax, const double & _ymax);

        /** \brief Destructor
        * 
        * This destructor frees all necessary dynamic memory allocated within this class.
        */
        ~Grid2D();
        
        /** \brief returns grid resolution in m/cell
         * 
         * returns grid resolution in m/cell
         * 
         **/
        double getGridStep() const;

        /** \brief returns grid height in meters
         * 
         * returns grid height in meters
         * 
         **/
        double getSizeX() const;

        /** \brief returns grid width in meters
         * 
         * returns grid width in meters
         * 
         **/        
        double getSizeY() const;

        /** \brief returns num of vertical cells
         * 
         * returns num of vertical cells
         * 
         **/                
        unsigned int getNx() const;        
        
        /** \brief returns num of horizontal cells
         * 
         * returns num of horizontal cells
         * 
         **/                
        unsigned int getNy() const;
        
        /** \brief returns xmax_
         * 
         * returns xmax_
         * 
         **/
        double getXmax() const;

        /** \brief returns ymax_
         * 
         * returns ymax_
         * 
         **/
        double getYmax() const;

        /** \brief Get grid indexes given a xy position
         * 
         * Get ij grid indexes given a xy position
         * Returns true if xy within grid limits, otherwise returns false 
         * 
         **/
        bool xy2ij(const double & _x, const double & _y, unsigned int & _i, unsigned int & _j) const;
                
        /** \brief Returns x, given index i
         * 
         * Returns x, given index i
         * 
         **/
        double i2x(const unsigned int & _i) const;
        
        /** \brief Returns y, given index j
         * 
         * Returns y, given index j
         * 
         **/
        double j2y(const unsigned int & _j) const;
        
        /** \brief Get xy position given ij grid indexes
         * 
         * Get xy position given ij grid indexes
         * 
         **/
        void ij2xy(const unsigned int & _i, const unsigned int & _j, double & _x, double & _y) const;

        /** \brief Switch between current and past grids
         * 
         * Switch between current and past grids
		 * Update indexes current_ and next_
         * 
         **/
        void switchGrid();
		
		/** \brief Sets Grid to Zero
		 * 
		 * Sets Grid to Zero. 
		 *    _grid_id=0 -> Clears current_ grid
		 *    _grid_id=1 -> Clears next_ grid
		 * 
		 **/
		void clearGrid(unsigned int _grid_id);

        /** \brief Odometry update
         * 
         * Updates all the grid cells given a robot motion, expressed as a 2D twist
		 * Result is set at "grid[next_]"
         *      \param _vx linear forward velocity 
         *      \param _vy linear lateral veolcity 
         *      \param _w rotational velocity around z axis (vertical axis)
         *      \param _dt integration time
         * 
         **/
        //void odometryUpdate(const double & _vx, const double & _vy, const double & _w, const double & _dt);
		void odometryUpdate();

        /** \brief Lidar update
         * 
         * Updates all the grid cells given a new lidar scan
         *      \param _scan_points xy coordinates of the scanned ranges, with respect to the vehicle (grid) frame. Each column is a coordinate pair xy.
         * 
         **/
        //void lidarUpdate(const Eigen::MatrixXd & _scan_points);
        void lidarUpdate();

        /** \brief Radar update
         * 
         * Updates all the grid cells given a new radar set of clusters
         *      \param _radar_clusters xy coordinates of the detected radar clusters, with respect to the vehicle (grid) frame
         * 
         **/
        void radarUpdate(const Eigen::MatrixXd & _radar_clusters);
        
        /** \brief Compute clusters at grid
         * 
         * Compute clusters present in the current grid.
         * Each cluster has a vector of ij pairs, indicating explicitly which cells belong to each cluster.
         * All clusters are stacked in the class member vector cluster_set_. 
         * 
         **/
        void computeClusters();//std::vector<std::vector<std::pair<unsigned int, unsigned int> > > & _cluster_set);
        
        /** \brief Returns grid in ROS friendly fromat
         * 
         * Returns grid in ROS friendly fromat
         * 
         **/
        void getGrid(std::vector<int8_t> & _data) const; 
        
        /** \brief Display in ascii format
         * 
         * Display in ascii format
         * 
         **/
        void display() const;
        
        /** \brief Print grid parameters 
         * 
         * Print grid parameters 
         * 
         **/
        void print() const;
        
        /** \brief Print clusters
         * 
         * Print clusters
         * 
         **/
        void printClusters() const;        

        /** \brief a debug function
         * 
         * a debug function
         * 
         **/
        void debugFill(); 
        
    protected:        
        /** \brief Find connected cells to a given cluster
         * 
         * Find connected cells to a given cluster.
         * Assumes the cells of the grid border are set to 0. Otherwise, recursivity may result in seg fault.
         * 
         **/
        //void clustering(unsigned int _i, unsigned int _j, std::vector<std::pair<unsigned int, unsigned int> > * _new_cluster); 
		void clustering(unsigned int _i, unsigned int _j, Cluster * _new_cluster);         
        
};
#endif

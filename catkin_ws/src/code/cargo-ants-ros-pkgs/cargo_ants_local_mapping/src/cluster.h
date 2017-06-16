#ifndef CLUSTER_H
#define CLUSTER_H

//Eigen includes
#include <eigen3/Eigen/Dense>
#include <eigen3/Eigen/Geometry>
#include <eigen3/Eigen/Eigenvalues> 

//std includes
#include <math.h>
#include <iostream>
#include <vector>
#include <list>

//local includes
// #include "grid_2d.h"

/** \brief Cluster class
 * 
 * Cluster of neighboring occupied cells in a grid
 * 
 **/
class Cluster
{
	public: 
        unsigned int cluster_id_; //Cluster id. 
        static unsigned int cluster_id_count_; //cluster counter (acts as simple ID factory)
		std::vector<std::pair<unsigned int, unsigned int> > cells_; //i,j index of the grid cells of this cluster
        Eigen::MatrixXd points_; //homogeneous coordinates (x,y,1)^T of the points of this cluster
        std::list<std::pair<double,double> > supporters_; //x,y of the points of this cluster
		double centroid_x_; //x coordinate of the cluster centroid [m]
		double centroid_y_; //y coordinate of the cluster centroid [m]
		double radius_; 
		std::pair<double, double> bbox_corners_[4]; //4 corners of the bounding box [m]
		double eval_1_, eval_2_; //eigenvalues. eval_1_ isthe biggest one
// 		double long_side_; //dimension of the longest side of the bounding box [m]
// 		double short_side_; //dimension of the shortest side of the bounding box [m]
// 		double orientation_; //angle beween X grid axis (forward) and the axis aligned with the longest side of the bounding box [rad]
		
	public:	 
		/** \brief Constructor
		 *
		 * Constructor
		 *
		 **/ 
		Cluster(); 

		/** \brief Destructor
		 *
		 * Destructor
		 *
		 **/		
		~Cluster();
        
        /** \brief set points_ from supporters_
         * 
         * set points_ from supporters_
         * 
         **/
        void setPoints();
		
		/** \brief Compute centroid coordinates
		 *
		 * Compute centroid coordinate.
		 * 		
		 **/		
		void computeCentroid(); 

        //compute a radius as the biggest distance to bbox corners from the centroid
//         void computeRadius();

		
        /** \brief Compute the oriented bounding box
         * 
         * Compute the oriented bounding box
         * Clearance is an extra distance added to the bb limits. Typically half od the grid cell size
         * 
         **/
		void computeBoundingBox(const double & _clearance);
        
// 		computeAll(); 
		
		void print() const; 
};
#endif


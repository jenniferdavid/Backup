
#include "grid_2d.h"

Grid2D::Grid2D(const double & _sz_x, const double & _sz_y, 
               const double & _dx, const double & _dy, 
               const double & _xmax, const double & _ymax) : 
    size_x_(_sz_x),
    size_y_(_sz_y),
    step_x_(_dx),
    step_y_(_dy),
    xmax_(_xmax),
    ymax_(_ymax)
{
    //compute the number of cells in each axis
    nx_ = (unsigned int)ceil(size_x_ / step_x_); 
    ny_ = (unsigned int)ceil(size_y_ / step_y_); 
    
    //update cell sizes
    size_x_ = nx_*step_x_;
    size_y_ = ny_*step_y_;

    //init grid array indexes
    current_ = 0; 
    next_ = 1; 
    
    //Resizes and resets the grid, with nx_ rows and ny_ columns
    grid_[current_].setZero(nx_, ny_);
    grid_[next_].setZero(nx_, ny_); 
    
    //Allocates the clustering_mask_
    clustering_mask_.setZero(nx_, ny_);
}

Grid2D::~Grid2D()
{
    
}

double Grid2D::getGridStep() const
{
    return step_x_; 
}

double Grid2D::getSizeX() const
{
    return size_x_;
}

double Grid2D::getSizeY() const
{
    return size_y_;
}

unsigned int Grid2D::getNx() const
{
    return nx_;
}

unsigned int Grid2D::getNy() const
{
    return ny_;
}

double Grid2D::getXmax() const
{
    return xmax_;
}

double Grid2D::getYmax() const
{
    return ymax_;
}

bool Grid2D::xy2ij(const double & _x, const double & _y, unsigned int & _i, unsigned int & _j) const
{
    //check xy inside the grid limits. If no, return false
    if ( ( _x >= xmax_ ) || (_x <= xmax_-size_x_) || ( _y >= ymax_ ) || (_y <= ymax_-size_y_) )
    {
        return false;
    }
    else //if within limits, compute ij and return true
    {
        _i = (unsigned int)ceil( ( (xmax_ - _x) / step_x_ ) -1); //ensures si value in the index range
        _j = (unsigned int)ceil( ( (ymax_ - _y) / step_y_ ) -1); //ensures si value in the index range
        return true;
    }
}

double Grid2D::i2x(const unsigned int & _i) const
{
    return ( xmax_ - _i*step_x_ - step_x_/2. );//returns the center of the cell (-> -step_x_/2.)
}

double Grid2D::j2y(const unsigned int & _j) const
{
    return ( ymax_ - _j*step_y_ - step_y_/2. );//returns the center of the cell (-> -step_y_/2.)
}

void Grid2D::ij2xy(const unsigned int & _i, const unsigned int & _j, double & _x, double & _y) const
{
    _x = i2x(_i);
    _y = j2y(_j);
}

void Grid2D::switchGrid()
{
    next_ = current_;
    current_ = (current_ + 1) % 2; 
}

void Grid2D::clearGrid(unsigned int _grid_id)
{
	switch (_grid_id)
	{
		case 0: 
			grid_[current_].setZero(nx_, ny_);
			break;
		case 1: 
			grid_[next_].setZero(nx_, ny_);
			break;
		default:
			break;
	}
}

void Grid2D::odometryUpdate()
{
    //DEBUGGING
    //std::cout << "odometry_.size(): " << odometry_.size() << std::endl;
    //for (unsigned int kk=0; kk<odometry_.size(); kk++) std::cout << "odometry_[kk]: " << odometry_[kk].transpose() << std::endl;
   
    //Allocate local varibles
    double xx, yy, cell_value, dt;
    unsigned gi,gj; //gridi indexes
    Eigen::Vector3d pt; 
    Eigen::Vector3d vv;
    Eigen::Vector3d ww;

    //run over each cell i,j, but compute only when it is occupied
    for (unsigned int ii = 0; ii < nx_; ii++)
    {
        for (unsigned int jj = 0; jj < ny_; jj++ )
        {
            //get cell value
            cell_value = grid_[current_](ii,jj); 
            
            //check if it is occupied. If yes, do work, otherwise jump to the next cell
            if ( cell_value > 0.1 )
            {
                //get x,y point corresponding to i,j cell
                ij2xy(ii,jj,xx,yy); 
                pt << xx,yy,0;
                
                //update x,y with the array of odometry twists and integration times
				for (unsigned int kk=0; kk<odometry_.size(); kk++)
				{
					//get data
					vv << odometry_.at(kk)(0),odometry_.at(kk)(1),0; //mount the translational speed vector in the xy plane
					ww << 0,0,odometry_.at(kk)(2); //mount the rotational speed vector, heading rate is around z axis
					dt = odometry_.at(kk)(3);//get integration time
						
					//update the point
					pt = pt - ww.cross(pt)*dt/2.; //half rotation
					pt = pt - vv*dt; //translation part
					pt = pt - ww.cross(pt)*dt/2.; //half rotation             
					
				}
				
                //get i,j cell given the updated x,y point
                if ( xy2ij( pt(0), pt(1), gi, gj ) ) //if updated point within the grid limits
                {
					//update cell value in case it is greater than the one alreday there
					if ( cell_value > grid_[next_](gi,gj) )
					{
						//copy the value to the next grid
						grid_[next_](gi,gj) = cell_value*0.8; //decay factor
					}
                }
            }
        }
    }
        
    //clears odometry data
    odometry_.clear(); 
}

void Grid2D::lidarUpdate()
{
    unsigned int ii,jj;
    bool grid_flag; 
    
    //grid_[current_].setZero(nx_, ny_); //required when testing without odometry update
    for ( unsigned int ll = 0; ll < laser_points_.size(); ll++ )
    {
        for ( unsigned int kk = 0; kk < laser_points_.at(ll).cols(); kk++ )
        {
            //converts metric point to grid index
            grid_flag = xy2ij(laser_points_.at(ll)(0,kk), laser_points_.at(ll)(1,kk), ii, jj);
            
            // Check if point falls inside the grid
            if ( grid_flag )
            {
                //Update current grid with this ij hit
                grid_[current_](ii,jj) = grid_[current_](ii,jj) + 0.5; //laser hit contribution
                
                //upper bound of grid values to 1
                if ( grid_[current_](ii,jj) > 1. ) grid_[current_](ii,jj) = 1.;
            }
        }
    }
}

void Grid2D::radarUpdate(const Eigen::MatrixXd & _radar_clusters)
{
    
}

void Grid2D::computeClusters()
{
    //just declare a cluster object
    //std::vector<std::pair<unsigned int, unsigned int> > new_cluster; 
	Cluster new_cluster; 
	
    //reset mask
    clustering_mask_.setZero(nx_, ny_);
    
    //reset the cluster set 
    cluster_set_.clear(); 
    
    //run over all grid
    for(unsigned int ii=1; ii<nx_-1; ii++)
    {
        for(unsigned int jj=1; jj<ny_-1; jj++)
        {
            if ( clustering_mask_(ii,jj) == 0 ) //mask query to check if ii,jj cell has been already processed
            {
                //try to populate the new cluster
                clustering(ii,jj, &new_cluster); 
                //std::cout << "computeClusters(): " << __LINE__ << "; new_cluster.size(): " << new_cluster.size() << std::endl;                                 
                
                //Check if cluster is empty
                if( !new_cluster.cells_.empty() ) //not empty case
                {
                    //Copy the new_cluster to cluster set 
                    cluster_set_.push_back(new_cluster); 
                    
                    //delete contents of new cluster
                    new_cluster.cells_.clear(); 
                    new_cluster.supporters_.clear(); 
                }
            }
        }
    }
    
    //Once clusters are formed, compute their parameters
    for(unsigned int ii=0; ii<cluster_set_.size(); ii++)
    {
        cluster_set_.at(ii).setPoints();
        cluster_set_.at(ii).computeCentroid();
        cluster_set_.at(ii).computeBoundingBox(step_x_/2.);
    }
}

void Grid2D::getGrid(std::vector<int8_t> & _data) const
{
    //an index
    unsigned int kk = 0; 
    
    //resize result vector according grid size
    _data.resize(nx_*ny_);
    
    for ( int jj = ny_-1; jj >= 0; jj-- )
    {
        for ( int ii = nx_-1; ii >= 0 ; ii-- )
        {
            _data.at(kk) = (int8_t)round(grid_[current_](ii,jj)*100);
            kk ++;
        }
    }   
}

void Grid2D::display() const
{
    for ( unsigned int ii = 0; ii < nx_; ii++)
    {
        for ( unsigned int jj = 0; jj < ny_; jj++ )
        {
            if ( grid_[current_](ii,jj) > 0.8 ) std::cout << grid_[current_](ii,jj);
            else std::cout << "--";
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;
}

void Grid2D::print() const
{
    std::cout << "Grid2D: " << std::endl 
            << "\tsize_x_: " << size_x_ << std::endl
            << "\tsize_y_: " << size_y_ << std::endl
            << "\tstep_x_: " << step_x_ << std::endl
            << "\tstep_y_: " << step_y_ << std::endl
            << "\tnx_: " << nx_ << std::endl
            << "\tny_: " << ny_ << std::endl
            << "\txmax_: " << xmax_ << std::endl
            << "\tymax_: " << ymax_ << std::endl;
}

void Grid2D::printClusters() const
{
    for (unsigned int ii = 0; ii < cluster_set_.size(); ii++)
    {
        std::cout << "cluster " << ii << ": " << std::endl;
		cluster_set_.at(ii).print(); 
    }
    std::cout << std::endl; 
}

void Grid2D::debugFill()
{
    double val = 11; 
    for (unsigned int ii = 0; ii < nx_; ii++)
    {
        for (unsigned int jj = 0; jj < ny_; jj++ )
        {
            //apply a pattern 
            if ( ( (ii+jj)%5 == 0 ) && ( jj%3 == 0 ) )
            {
                grid_[current_](ii,jj) = val; 
                val ++; 
            }
        }
    }
}

void Grid2D::clustering(unsigned int _i, unsigned int _j, Cluster * _new_cluster)
{
    if ( clustering_mask_(_i,_j) == 0 )
    {
        //mark the mask
        clustering_mask_(_i,_j) = 1;
        //std::cout << "clustering(): " << __LINE__ << ": " << _i << "," << _j << std::endl;                 
        
        //check if cell i,j is occupied. Otherwise exit
        if ( grid_[current_](_i,_j) > 0.5 )
        {
            //add ij cell to the cluster
            _new_cluster->cells_.push_back( std::pair<unsigned int, unsigned int>(_i,_j) );
            _new_cluster->supporters_.push_back( std::pair<double, double>(i2x(_i),j2y(_j)) );
            
            //check grid limits before carry on recursivity
            if ( (_i > 0) && (_i < nx_-1) && (_j > 0) && (_j < ny_-1) )
            {
                //recursivity over the cell's 8 neighbors
                clustering(_i,_j+1,_new_cluster);
                clustering(_i+1,_j+1,_new_cluster);
                clustering(_i+1,_j,_new_cluster);
                clustering(_i+1,_j-1,_new_cluster);
                clustering(_i,_j-1,_new_cluster);
                clustering(_i-1,_j-1,_new_cluster);
                clustering(_i-1,_j,_new_cluster);
                clustering(_i-1,_j+1,_new_cluster);
            }
        }
    }
}

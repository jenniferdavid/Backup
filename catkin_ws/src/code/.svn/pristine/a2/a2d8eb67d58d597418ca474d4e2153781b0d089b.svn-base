#include "ros/ros.h"
#include <stdlib.h>
#include <fstream>
#include <string>
#include <vector>
#include <stdio.h>
#include <errno.h>
#include <err.h>
#include <iostream>
#include <unistd.h>
#include <cargo_ants_msgs/Path.h>       //received from path_planner
//#include <cargo_ants_msgs/FullPath.h>       //received from path_planner
#include <cargo_ants_msgs/Goal.h>       // member of Path msg
#include <Eigen/Dense>


using namespace std;
using namespace cargo_ants_msgs;
using namespace std;
typedef Eigen::VectorXd Vector;
typedef Eigen::MatrixXd Matrix;
//typedef cargo_ants_msgs::FullPath FullPath;
typedef cargo_ants_msgs::Path Path;

Vector qs(2), qe(2), xi;


void pathPlannerCallback(const cargo_ants_msgs::Path::ConstPtr &msg)
{
    vector <cargo_ants_msgs::Goal> goals = msg->goals;
    if (goals.size() < 2) {
        ROS_INFO("At least 2 goal points are required, received %lu", goals.size());
        return;
    }
    int n = goals.size(); //total length of the path say 0-5000
    std::cout << n << "length of the path \n";
    int nofchunk = goals.size()/200; // divide in to n chunks with each 200 points
    
    //vector <cargo_ants_msgs::Goal> chunk; 
    //vector<int> arr[chunk];   // this is an array of vectors// array size is 20
   // vector<size_t> array [5][20];
//     std::vector<int> array[nofchunk];
//     std::size_t const size = 20;
//     std::vector<int> split_1(array.begin(), array.begin() + size);
//     std::vector<int> split_2(array.begin() + size, array.end());
  //  std::vector<int> split_3(split_2, size);
  //  std::vector<int> split_4(array.begin(), array.begin() + size);
  //  std::vector<int> split_5(array.begin(), array.begin() + size);
  //  std::cout << split_1 << "created chunk 1 \n"
  //  std::cout << split_2 << "created chunk 2 \n"
//      std::vector<std::vector<int> > chunk;
//      for (int ii=0 ; ii < nofchunk; ++ii) {
//          for (int jj=0 ; jj < chunksize; ++jj) {
//              chunk[ii][jj]=msg->goals[jj];
//              std::cout << chunk[ii][jj] << std::endl;
//          }
//          std::cout << "............" <<endl;
//      }
      
            
}

int main (int argc, char ** argv)
{  
  ros::init (argc, argv, "update");
  ros::NodeHandle node;
  ros::Publisher pub = node.advertise<Path> ("/path_chunks", 100);
  ros::Subscriber sub = node.subscribe("Path",1000, pathPlannerCallback);
  
  ros::Rate idle_rate(10);
  while (ros::ok()) {
    ros::spinOnce();
    
  //  FullPath fullpath;
    Path path;
    
    for (int ii=0; ii<10; ii++)
    {
      //  path.goals[ii] = goals[ii];
        pub.publish(path);
    }
  }
  /*  
    for (int ii ; ii < 42; ++ii) {
            double y [42];
            int a = 2;
            double x[42] = {1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20,20,20,20,20,20};
            y[ii] = (x[ii]) * (x[ii]);
           pp.xx   = x [ii];
            pp.yy   = y [ii];
            pp.th   = 0;
            pp.xd   = 0;
            pp.yd   = 0;
            pp.thd  = 0;
            pp.xdd  = 0;
            pp.ydd  = 0;
            pp.thdd = 0;
            trj.points.push_back (pp);
    }
    pub.publish (trj);
    }cout << "published\n";
        
    }*/
}

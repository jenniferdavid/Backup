//
// Created by jvallve on 31/05/16.
//

#include "wolf_node_polyline.h"


int main(int argc, char **argv)
{
    std::cout << "\n=========== WOLF MAIN ===========\n\n";

    // Init ROS
    ros::init(argc, argv, "cargo_ants_slam");

    // Wolf ROS node
    WolfNodePolyline wolf_node(argv[0]);

    ros::Rate loopRate(wolf_node.loop_rate_);

    unsigned int n_iterations_solve = (unsigned int)(wolf_node.loop_rate_ / wolf_node.solve_rate_);
    unsigned int iteration = n_iterations_solve;

    while(ros::ok())
    {
        //execute pending callbacks
        ros::spinOnce();

        // solve every 1 seconds
        if(iteration >= n_iterations_solve)
        {
            wolf_node.solve();
            iteration = 1;
        }
        else
            iteration++;

        // broadcast transformations
        wolf_node.broadcastTf();

        //relax to fit output rate
        loopRate.sleep();
    }

    return 0;
}

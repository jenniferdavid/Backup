//
// Created by jvallve on 22/06/16.
//

#include "wolf_node_occmap.h"


int main(int argc, char **argv)
{
    // Init ROS
    ros::init(argc, argv, "wolf_occmap_node");

    // Wolf ROS node
    WolfNodeOccmap wolf_node(argv[0]);

    ros::Rate loopRate(10);

    while(ros::ok())
    {
        // execute pending callbacks
        ros::spinOnce();

        // publish map
        wolf_node.publishMap();

        // relax to fit output rate
        loopRate.sleep();
    }

    return 0;
}


This file summarizes all the required steps in order to correctly set-up a computer to run Cargo-ANTs WP4 and WP5 software.

(I) SYSTEM 
    (a) Ubuntu 14.04 LTS [ see intructions at www.ubuntu.com ]
    
    (b) C++ compiler with C++11 support, v4.8.2 or + 
    
(II) THIRD-PARTY PACKAGES AND LIBRARIES
    (a) GCC, std lib, ...
            sudo apt-get install build-essential
    (b) Cmake
            sudo apt-get install cmake
    (c) ROS Indigo. Desktop-Full.
            Please see intstructions at wiki.ros.org/indigo/Installation/Ubuntu
    (d) Eigen 3.2 
            Already installed with ROS
    (e) OpenCV 2.4 
            Already installed with ROS
    (f) Boost 
            Already installed with ROS
    (g) Ceres 1.10.
            Detailed 5-step install procedure at http://wiki.iri.upc.edu/index.php/Wolf#Ceres_.285_steps.29
    (h) OpenGL, GLU, GLUT
            sudo apt-get install freeglut3-dev
    (i) GTK+ 
            sudo apt-get install ?? (TODO: Define better which is the required ubuntu package)
            
(III) CARGO-ANTS ROS PACKAGES (at TNO SVN)
    (a) Move to your ros-workspace/src
            1) svn checkout https://e-svn.tno.nl:18080/svn/cargo_ants.repo/code/cargo-ants-ros-pkgs
            2) cd ..
            3) catkin_make  //builds the whole workspace
            4) catkin_make --only-pkg-with-deps [pkg_name]  //builds only a specified package
            
(IV) CSIC-UPC SW
Two main SW compoenents are provided by CSIC-UPC. Each one has dependencies on custom libraries develpoed at IRI. How to install these dependencies and the ROS nodes is detailed below:

    ***** LOCAL MAPPING *****
        (i) laserscanutils (master branch)
            1) git -c http.sslVerify=false clone https://gitlab.iri.upc.edu/mobile_robotics/laser_scan_utils.git
            2) cd laser_scan_utils
            3) mkdir build
            4) cd build
            5) cmake ..
            6) make
            7) sudo make install            
        (ii) cargo-ants-ros-pkgs/cargo_ants_local_mapping
            1) REQUIRES: laserscanutils
            2) DOWNLOAD.
                cargo_ants_local_mapping is part of cargo-ants-ros-pkgs. See section (III) above to find checkout instructions of this repository. Revision 743 is currently the tested one for local mapping: 
                    $ svn checkout -r 743 https://e-svn.tno.nl:18080/svn/cargo_ants.repo/code/cargo-ants-ros-pkgs/cargo_ants_local_mapping
           
                or if the package is already in your local machine, just move to the package folder and update to given revision:
                    $ roscd cargo_ants_local_mapping
                    $ svn update -r 743
            3) BUILD, from ROS workspace: catkin_make --only-pkg-with-deps cargo_ants_local_mapping
            4) TEST. 
                    $ roslaunch agv_tests_sim agv_sim_03_local_mapping.launch rviz:=true
                    To move the robot with ijkl/space keys, execute agv_sim_02_tele_op.launch in another terminal
                    
    ***** SLAM *****
    (b) wolf library "CargoAnts-v2.02" tag
            1) git clone -b CargoAnts-v2.02 https://github.com/IRI-MobileRobotics/wolf.git
            2) cd wolf/build
            3) cmake ..
            4) make
            5) sudo make install
    (d) cargo-ants-ros-pkgs/cargo_ants_slam
            1) REQUIRES: laserscanutils, wolf
            2) DOWNLOAD.
                cargo_ants_local_mapping is part of cargo-ants-ros-pkgs. See section (III) above to find checkout instructions of this repository. Revision 738 is currently the tested one for slam: 
                    $ svn checkout -r 738 https://e-svn.tno.nl:18080/svn/cargo_ants.repo/code/cargo-ants-ros-pkgs/cargo_ants_local_mapping
           
                or if the package is already in your local machine, just move to the package folder and update to given revision:
                    $ roscd cargo_ants_local_mapping
                    $ svn update -r 738
            3) BUILD, from ROS workspace: catkin_make --only-pkg-with-deps cargo_ants_slam
            4) TEST WITH ONLINE SIMULATOR
                Run: cargo-ants-ros-pkgs/agv_tests_sim/launch/agv_sim_05_slam.launch
                To move the robot with ijkl/space keys, execute agv_sim_02_tele_op.launch in another terminal
            5) TEST WITH LOGGED DATA FROM OFFLINE SIMULATOR
                Run: cargo-ants-ros-pkgs/agv_tests_sim/launch/agv_sim_06_slam.launch   
                   
(V) HH SW
    (a) E* 
            1) git clone https://github.com/poftwaresatent/estar2
            2) mkdir build
            3) cd build
            4) cmake ..
            5) make
            6) sudo make install
    (b) Sunflower 
            1) git clone https://github.com/poftwaresatent/sfl2
            2) mkdir build
            3) cd build
            4) cmake ..
            5) make
            6) sudo make install
    (c) Chomp
            1) git clone https://github.com/poftwaresatent/trychomp
            2) mkdir build
            3) cd build
            4) cmake ..
            5) make
            6) sudo make install

(VI) AT_TESTS_REAL
    Package cargo-ants-ros-pkgs/at_tests_real contains a hierarchy of launch files to test all the SW components from a point of view of the final integration (not for individual component testing and debugging).
    Each launch file has a corresponding rviz/*.rviz configuration file for proper visualization.
    AT LAUNCH FILE HIERARCHY:
        1) at_sensors: wake up all AT sensors, from a real truck (truck:=true) or from a rosbag (truck:=false) , and runs rviz
        2) at_local_mapping: launches at_sensors, local_mapping and rviz. Parameters for local_mapping are configured at config/at_local_mapping.yaml
        3) at_actuators: wakes up ros2udp, allowing ros modules to interface with truck hardware
        4) at_local_planning: launches local planning (chomp)
        5) at_rosbag_record.launch: launches at_sensor and rosbag record, so logs all sensor data from the truck
            
(VII) SIMULATED ENVIRONMENT
	1) Assuming ros-indigo-desktop-full is installed. See section (II).
	2) In case it is your first time with Gazebo, execute "gazebo" and go to the "Insert" tab and click to "connecting to model database". The first time you do it usually requires some seconds (even minutes), so it is better to do this step out of ros launch scripts. You may download Ground Plane and Construction Barrel, which are models required in steps below.    
	3) Install required extra packages
 		sudo apt-get install ros-indigo-ros-control ros-indigo-ros-controllers ros-indigo-gazebo-ros-control
    4) Install required extra packages
                $ sudo apt-get install ros-indigo-teleop-twist-keyboard ros-indigo-gazebo-plugins
	5) All sources are at cargo-ants-ros-pkgs. See section (III) above to find checkout instructions of this repository.
	6) Edit your /usr/share/gazebo/setup.sh file (assuming cargo-ants-models checked out at my_dev_path folder): 
		- Add the following line: export GAZEBO_MODEL_PATH=my_dev_path/cargo-ants-models
		- Add the following paths to the GAZEBO_RESOURCE_PATH environment variable, separated by ":"
			 my_path_to_ros_workspace/src/cargo-ants-ros-pkgs/agv_gazebo
			 my_path_to_ros_workspace/src/cargo-ants-ros-pkgs/at_gazebo
	7) Add the following line to your ~/.bashrc file: 
		$ source /usr/share/gazebo/setup.sh
	8) build platform drive_sim packages
		$ catkin_make --only-pkg-with-deps agv_drive_sim
        $ catkin_make --only-pkg-with-deps agv_odom_sim
	9) execute test #1:
		$ roslaunch agv_tests_sim agv_sim_01_drive.launch rviz:=true gazebo_gui:=true

    
(VIII) AT_TESTS_OFFLINE_UDP (WARNING: NOT FULLY WORKING)
    1) Install: p7zip, wireshark, playcap, tcpreplay, bittwist
    2) Convert .pcapng to .pcap: $ editcap -F libcap myfile.pcapng myfile.pcap
    ***3) Replay pcapng file with tcpreplay : $ sudo tcpreplay --intf1=lo myfile.pcapng -> produces a WARNING about lo interface ???
    4) Change IP addresses with bittwiste: 
       $ bittwiste -I myfile_i.pcap -O myfile_o.pcap -T ip -s 169.254.145.80,127.0.0.1 -d 169.254.255.255,192.168.101.74
    5) Replay pcapng file with bittwist : $ sudo bittwist -v -i 5 myfile.pcapng //5 is the interface. Checkthem with: $ sudo bittwist -d
    5) Try to listen (-l) UDP packets (-u) from another terminal, to port 13000: netcat -l -u -v 127.0.0.1 13000
    
    
# Home Service Workspace

[![Video Demo](https://github.com/MohamedNagyMostafa/home-service-robot/assets/20774864/5c2763d4-eb01-47e7-8d22-a4e1d2d323eb)](https://www.youtube.com/watch?v=zrc9EJnEbvA)

This repository contains packages and configurations for a home service task. The task involves robot localization, mapping, path planning, and simulated package delivery using ROS (Robot Operating System). The packages and their functionalities are described below.

## :package: Packages

### av_robot
This package contains a custom maze gazebo world with a custom robot. The robot is equipped with an RGB-D camera and LiDAR sensors. Launch this package with the following command:
```
roslaunch av_robot world.launch
```
This command will open the gazebo world containing the custom robot and the maze environment.

### amcl
The `amcl` package is responsible for robot localization using particle filters (MCL). Launch this package using the following command:
```
roslaunch av_robot amcl.launch
```
This command will initialize the localization algorithm and provide accurate pose estimation for the robot.

### turtlebot, turtlebot_interations, turtlebot_simulator
These packages contain the turtlebot robot model and various valuable packages. In this project, we only use the `turtlebot_rviz_launchers` package for navigation and path planning. Launch this package using the following command:
```
roslaunch turtlebot_rviz_launchers view_navigation.launch
```
This command will launch the planner as well as RViz, allowing you to visualize and interact with the navigation system.

### move_base, slam_gmapping
The `move_base` package is responsible for path planning and navigation, while `slam_gmapping` package is used for world mapping using SLAM (Simultaneous Localization and Mapping). Launch the mapping functionality using the following command:
```
rosrun gmapping slam_gmapping scan:=scan _base_frame:=map
```
Make sure to include the necessary topic remappings as shown in the command line.

### pick_objects
This package contains a node that is responsible for navigating the robot between the pickup location and the dropoff zone. Launch this package using the following command:
```
rosrun pick_objects pick_objects
```
This command will start the robot's navigation to pick up and deliver the package.

### add_markers
This package contains a node that adds a virtual marker to RViz to simulate the delivered package in the world. The node subscribes to a "storage status" topic published by the `pick_objects` node and shows or hides the package in the world based on the robot's storage status. Launch this package using the following command:
```
rosrun add_markers add_markers
```
This command will start the node that adds the virtual marker to RViz.

## :hammer_and_wrench: Installation

To use this workspace, you need to have ROS installed on your system. Follow the official ROS installation instructions for your operating system.

After installing ROS, clone this repository into your catkin workspace:
```
cd ~/catkin_ws/src
git clone https://github.com/<your-username>/home_service_workspace.git
```
Note: Replace `<your-username>` with your actual GitHub username.

Once cloned, build the packages:
```
cd ~/catkin_ws
catkin_make
```

## :rocket: Launching

To launch different functionalities of the home service workspace, there are several shell scripts provided. These scripts automate the launch process and simplify testing. The important scripts are:

- `test_slam.sh`: Launches mapping for the environment using SLAM. It launches the following packages: `av_robot`, `slam_gmapping`, and RViz with the SLAM configuration.

- `test_navigation.sh`: Tests the robot's planner, navigation algorithm, and localization. It launches the following packages: `av_robot`, `amcl`, `turtlebot_rviz_launchers/view_navigation`, and RViz with the

 navigation configuration.

- `pick_objects.sh`: Launches the robot's navigation between two predefined pick-up and drop-off locations. It launches the following packages: `av_robot`, `amcl`, `turtlebot_rviz_launchers/view_navigation`, `pick_objects`, and RViz with the navigation configuration.

- `add_markers.sh`: Tests generating a virtual item in RViz. It launches the following packages: `av_robot`, `amcl`, `turtlebot_rviz_launchers/view_navigation`, `add_markers`, and RViz with the marker configuration.

- `home_service.sh`: The main launcher to run the entire workspace and allow the robot to perform pickup and dropoff tasks. It launches the following packages: `av_robot`, `amcl`, `turtlebot_rviz_launchers/view_navigation`, `pick_objects`, `add_markers`, and RViz with the marker configuration.

To execute any of these scripts, make them executable if they are not already:
```
chmod +x <script-name>.sh
```
Then, run the desired script:
```
./<script-name>.sh
```

## :file_folder: Important Directories

- `rvizConfig`: Contains all RViz configurations used by the shell scripts.
- `av_robot/maps`: Contains the world map file. This folder is added inside the `av_robot` package, allowing it to be accessed using `find av_robot` instead of using a static path.

Feel free to explore and modify the code and configurations to suit your needs. Happy home service automation!

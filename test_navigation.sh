#~/bin/sh
xterm -e "source /devel/setup.bash"
xterm -e "roslaunch av_robot world.launch" &
sleep 5
xterm -e "roslaunch av_robot amcl.launch" &
sleep 5
xterm -e "roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 5
xterm -e "rosnode kill /rviz" &
sleep 5
xterm -e "rosrun rviz rviz -d ./src/rvizConfig/navigation_config.rviz"



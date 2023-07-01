#~/bin/sh
xterm -e "source /devel/setup.bash"
xterm -e "roslaunch av_robot world.launch" &
sleep 5
xterm -e "rosrun gmapping slam_gmapping scan:=\scan _base_frame:=map" &
sleep 5
xterm -e "rosrun rviz rviz -d ./src/rvizConfig/slam_config.rviz" &
sleep 5
xterm -e "rosrun teleop_twist_keyboard teleop_twist_keyboard.py"

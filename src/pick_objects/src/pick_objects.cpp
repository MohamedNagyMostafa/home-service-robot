//
// Created by mohamed on 01/07/23.
//
#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <std_msgs/Int8.h>
typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;
typedef move_base_msgs::MoveBaseGoal MoveGoalMsg;

int main(int argc, char** argv)
{
    ros::init(argc, argv, "pick_objects");

    ros::NodeHandle nodeHandle;
    ros::Publisher storageStatusPub = nodeHandle.advertise<std_msgs::Int8>("/pick_objects/storage_status", 10);

    MoveBaseClient actionClient("move_base", true);

    while(!actionClient.waitForServer(ros::Duration(5.0)))
    {
        ROS_INFO("Waiting for the move_base action server to come up");
    }

    /**
     * Pick up item location
     */
    MoveGoalMsg pickUpGoalMsg;
    pickUpGoalMsg.target_pose.header.frame_id = "map";
    pickUpGoalMsg.target_pose.header.stamp    = ros::Time::now();

    pickUpGoalMsg.target_pose.pose.position.x = -7.765707;
    pickUpGoalMsg.target_pose.pose.position.y = -0.021925;

    pickUpGoalMsg.target_pose.pose.orientation.w = 2.585203;

    ROS_INFO("Sending pickup goal!");

    actionClient.sendGoal(pickUpGoalMsg);
    actionClient.waitForResult();

    if(actionClient.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
    {
        ROS_INFO("The robot reached the pickup location, picked the item");
        std_msgs::Int8 storageStatusMsg;

        storageStatusMsg.data   = 1;

        storageStatusPub.publish(storageStatusMsg);

        ros::Duration(5.0).sleep();

        /**
         * dropitem location
         */
        MoveGoalMsg dropGoalMsg;
        dropGoalMsg.target_pose.header.frame_id = "map";
        dropGoalMsg.target_pose.header.stamp    = ros::Time::now();

        dropGoalMsg.target_pose.pose.position.x = 8.784817;
        dropGoalMsg.target_pose.pose.position.y = 2.135651;

        dropGoalMsg.target_pose.pose.orientation.w = -3.066755;

        ROS_INFO("Sending drop goal!");

        actionClient.sendGoal(dropGoalMsg);
        actionClient.waitForResult();

        if(actionClient.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
        {
            storageStatusMsg.data   = 2;

            storageStatusPub.publish(storageStatusMsg);

            ROS_INFO("The robot reached the drop location and delivered the item");

        }
    }
    else
    {
        ros::Rate(5).sleep();

        ROS_INFO("Robot failed to reach the pickup location.");
    }

    ros::spin();

    return 0;
}
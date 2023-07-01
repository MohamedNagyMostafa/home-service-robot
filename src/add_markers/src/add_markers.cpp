//
// Created by mohamed on 7/1/23.
//
#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <std_msgs/Int8.h>

const std::string MARKER_UNIQUE_NAME    = "item";

visualization_msgs::Marker marker;
ros::Publisher markerPub;

void storageStatusCallback(const std_msgs::Int8::ConstPtr& msg)
{
    switch (msg->data)
    {
        case 1:
            marker.header.stamp     = ros::Time::now();
            marker.color.a              = 0.0;
            markerPub.publish(marker);
            break;

        case 2:
            marker.header.stamp     = ros::Time::now();
            marker.pose.position.x      = 8.784817;
            marker.pose.position.y      = 2.135651;
            marker.pose.position.z      = 0.0;
            marker.pose.orientation.x   = 0.0;
            marker.pose.orientation.y   = 0.0;
            marker.pose.orientation.z   = 0.0;
            marker.pose.orientation.w   = 1.0;
            marker.color.a              = 1.0;
            markerPub.publish(marker);

            break;
    }

}

void publishMarker(const ros::TimerEvent&)
{
    markerPub.publish(marker);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "add_markers");
    ros::NodeHandle nodeHandle;

    markerPub                               = nodeHandle.advertise<visualization_msgs::Marker>("visualization_marker", 1);
    ros::Subscriber robotStorageStatusSub   = nodeHandle.subscribe("/pick_objects/storage_status", 10, storageStatusCallback);

    uint32_t shape  = visualization_msgs::Marker::CUBE;

    marker.header.frame_id  = "map";
    marker.header.stamp     = ros::Time::now();
    marker.ns               = MARKER_UNIQUE_NAME;
    marker.id               = 0;
    marker.type             = shape;
    marker.action           = visualization_msgs::Marker::ADD;

    marker.pose.position.x      = -7.765707;
    marker.pose.position.y      = -0.021925;
    marker.pose.position.z      = 0.0;
    marker.pose.orientation.x   = 0.0;
    marker.pose.orientation.y   = 0.0;
    marker.pose.orientation.z   = 0.0;
    marker.pose.orientation.w   = 1.0;

    marker.color.r              = 0.0f;
    marker.color.g              = 1.0f;
    marker.color.b              = 0.0f;
    marker.color.a              = 1.0;

    marker.scale.x              = 1.0;
    marker.scale.y              = 1.0;
    marker.scale.z              = 1.0;

    marker.lifetime             = ros::Duration();

    markerPub.publish(marker);

    ros::Timer timer = nodeHandle.createTimer(ros::Duration(1.0), publishMarker);

    ros::spin();

    return 0;

}
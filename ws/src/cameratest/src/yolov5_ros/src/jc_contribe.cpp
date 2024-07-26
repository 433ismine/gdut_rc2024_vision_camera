/*
ps：摄像头视场角90度
1.分红蓝半区转换世界坐标（右半场右手系，左下角为原点，左半场左手系，右下角为原点）
    雷达转世界坐标系：
    初始yaw角为向世界坐标y-方向
    坐标x，y相反                                                                          
2.右半场：
雷达初始位置为（5085，320）
世界：wx = 5085+yl
     wy = 320-xl
图像转世界：                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
     1.yawp = |yaw-90|转成三区
     2.d = deltapx / 1280 *k(k = d/deltapx)
       l = 2tan(90-yawp)*d
     3.wdx = abspdx/1280*l
     4.m = tan(yawp)*wdx
     5.wyd = cos(90-yawp)(d-m)
     ps:if yawp < 0 wy+wyd
            else y-wyd
     
左半场：
雷达初始位置为：（5085，320）
世界：wx = 5085+yl
     wy = 320+xl
图像转世界：                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
     1.yawp = |yaw-90|转成三区
     2.d = 

     ps: if yawp < 0 wy-wyd
            else y+wyd




     
*/
#include <math.h>
#include <vector>
#include "ros/ros.h"
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/Imu.h>
#include <yolov5_ros_msgs/Judge.h>
#include <yolov5_ros_msgs/Silos.h>
#include"std_msgs/Float32MultiArray.h"
#include "tf/tf.h"
#include <message_filters/subscriber.h>
#include <message_filters/time_synchronizer.h>
#define PI acos(-1)
// #include <sensor_msgs/CameraInfo.h>

using namespace std;
using namespace message_filters;
using namespace yolov5_ros_msgs;
// using namespace vector;
yolov5_ros_msgs::Silos msg ;

vector<vector<string>> silox_save(5,vector<string>(5)); 

ros::Publisher pub;
void callback(const nav_msgs::OdometryConstPtr &odom_msg, const  yolov5_ros_msgs::JudgeConstPtr &camera)
{   
    nav_msgs::Odometry syn_odom = *odom_msg; 
    yolov5_ros_msgs::Judge syn_camera = *camera;

    ros::Time syn_camera_stamp = syn_camera.header.stamp;
    ros::Time syn_odom_stamp = syn_odom.header.stamp;
    ros::Duration time_diff = syn_camera_stamp - syn_odom_stamp;
    float syn_judge = fabs(time_diff.toSec());
    int count = 0;

    //检测同步是否成功
    if(syn_judge<0.1)
    {   
        ROS_INFO("syn success");
    }
    else
    {
        ROS_WARN("syn fail");
        cout << "syn odom' timestamp : " << syn_odom.header.stamp << endl;
        cout << "syn camera timestamp : " << syn_camera.header.stamp << endl;
    }
    /*2.右半场：
    雷达初始位置为（5085，320）
    世界：wx = 5085+yl
         wy = 320-xl
    图像转世界：                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        1.yawp = |yaw-90|转成三区
        2.d = deltapx / 1280 *k(k = d/deltapx)
        l = 2tan(90-yawp)*d
        3.wdx = abspdx/1280*l
        4.m = tan(yawp)*wdx
        5.wyd = cos(90-yawp)(d-m)
        ps:if yawp < 0 wy+wyd
                else y-wyd
    */
    double xl = odom_msg->pose.pose.position.x;
    double yl = odom_msg->pose.pose.position.y;
    double zl = odom_msg->pose.pose.position.z;
    tf::Quaternion quat;
    tf::quaternionMsgToTF(odom_msg->pose.pose.orientation, quat);
    double roll, pitch, yaw;//定义存储roll,pitch and yaw的容器
    tf::Matrix3x3(quat).getRPY(roll, pitch, yaw); //进行转换

    cout<<yaw<<endl;
    double wx, wy, deltapx , yawp,d,p,l,wdy,m,k,pdx,A,B,C,D,x,wdx,silox;
    //雷达获取世界坐标
    wx = 5085 + yl;
    wy = 320 - xl;
    //摄像头获取筒仓坐标点和筒仓宽度
    p=syn_camera.p;
    pdx=syn_camera.d;
    //像素距中心坐标
    deltapx=abs(640-pdx);
    //筒仓像素宽度拟合深度
    A=1.0514e+03;
    B=-0.0396;
    C=254.3742;
    D=-0.0056;
    k = A*exp(B*x)+C*exp(D*x);
    d = deltapx/1280*k;
    //深度结合中心坐标判断实际偏移
    yawp = yaw+PI/2;
    l = 2*tan(90-yawp)*d;
    wdx = x/1280*l;
    m = tan(yawp)*wdx;
    wdy = cos(90-yawp)*(d-m);
    //右半场
    //获取筒仓数据
    if(syn_odom.pose.pose.position.x<-7.0)
    {
        if (yawp < 0 )
        {silox = wy-wdy;}
        else 
        {silox = wy+wdy;}
        if(-8.825<silox && silox<-8.0)
        {
            msg.a = syn_camera.name;
            silox_save[0].push_back(msg.a);
            msg.a = "null";
            count ++;
        }
        if(-9.575<silox && silox<=-8.25)
        {
            msg.b = syn_camera.name;
            silox_save[1].push_back(msg.b);
            msg.b = "null";
            count ++;
        }
        if(-10.325<silox && silox<=-9.75)
        {
            msg.c = syn_camera.name;
            silox_save[2].push_back(msg.c);
            msg.c = "null";
            count ++;
        }
        if(-11.095<silox && silox<=-10.325)
        {
            msg.d = syn_camera.name;
            silox_save[3].push_back(msg.d);
            msg.d = "null";
            count ++;
        }
        if(-12.100<silox && silox<=-11.095)
        {
            msg.e = syn_camera.name;
            silox_save[4].push_back(msg.e);
            msg.e = "null";
            count ++;
        }
    }   
    //满五个删除一个
    for (int i = 0; i < 5; i++)
    {
        if(silox_save[i].size() == 5)
        {
            silox_save[i].erase(silox_save[i].begin());
        }
    }
    //满五次发送发最后一个
    if(count == 5)
    {
        msg.a = silox_save[0].back();
        msg.b = silox_save[1].back();
        msg.c = silox_save[2].back();
        msg.d = silox_save[3].back();
        msg.e = silox_save[4].back();
        pub.publish(msg);
        ROS_INFO("筒1：%s,筒2：%s,筒3：%s,筒4：%s,筒5：%s",msg.a,msg.b,msg.c,msg.d,msg.e);
        count = 0;
    }

        
    //左半场：
    if(syn_odom.pose.pose.position.x>7.0)
    {
        if (yawp < 0 )
        {silox = wx+wdx;}
        else {silox = wx-wdx;}
    
       if(-8.825<silox && silox<-8.0)
        {
            msg.a = syn_camera.name;
        }
        if(-9.575<silox && silox<=-8.25)
        {
            msg.b = syn_camera.name;
        }
        if(-10.325<silox && silox<=-9.75)
        {
            msg.c = syn_camera.name;
        }
        if(-11.095<silox && silox<=-10.325)
        {
            msg.d = syn_camera.name;
        }
        if(-12.100<silox && silox<=-11.095)
        {
            msg.e = syn_camera.name;
        }
    }
    
}
int main(int argc, char  *argv[])
{
    setlocale(LC_ALL,"");
    //2.初始化 ROS 节点:命名(唯一)
    ros::init(argc,argv,"listener");
    //3.实例化 ROS 句柄
    ros::NodeHandle nh;
    ros::NodeHandle nh1;
    ros::Publisher pub =nh1.advertise<yolov5_ros_msgs::Silos>("/yolov5/silos",100);

    message_filters::Subscriber<nav_msgs::Odometry> lidar_sub(nh, "/Odometry", 100);
    message_filters::Subscriber<yolov5_ros_msgs::Judge> camera_sub(nh, "/yolov5/judge", 100);
    TimeSynchronizer<nav_msgs::Odometry, yolov5_ros_msgs::Judge> sync(lidar_sub, camera_sub, 100);
    // typedef sync_policies::ApproximateTime<lidar_sub, camera_sub> MySyncPolicy;
    sync.registerCallback(boost::bind(&callback, _1, _2));
    //4.实例化 订阅者 对象

    // ros::Subscriber odomsub = message_filters.subscribe<nav_msgs::Odometry>("/Odometry",1000,odomcb);

   
    //5.处理订阅的消息(回调函数)

    //     6.设置循环调用回调函数
    ros::spin();

    return 0;
}
// void odomcb(const nav_msgs::OdometryConstPtr &odom_msg){
//     double odom_time = odom_msg->header.stamp.toSec();
//     double x = odom_msg->pose.pose.position.x;
//     double y = odom_msg->pose.pose.position.y;
//     double z = odom_msg->pose.pose.position.z;
//     double ox = odom_msg->pose.pose.orientation.x;
//     double oy = odom_msg->pose.pose.orientation.y;
//     double oz = odom_msg->pose.pose.orientation.z;
//     double ow = odom_msg->pose.pose.orientation.w;
//     tf::Quaternion quat;
//     tf::quaternionMsgToTF(odom_msg->pose.pose.orientation, quat);
//     double roll, pitch, yaw;//定义存储roll,pitch and yaw的容器
//     tf::Matrix3x3(quat).getRPY(roll, pitch, yaw); //进行转换
//     ROS_INFO("x:%f, y:%f,z:%f\n旋转:  roll:%f  pitch:%f  yaw:%f", x, y,z,roll,pitch,yaw);
    
// }
// void imucb(const sensor_msgs::ImuConstPtr &imu_msg){
   
// }
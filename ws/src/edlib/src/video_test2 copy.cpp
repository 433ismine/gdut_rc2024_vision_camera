#include <vector>
#include "EDLib.h"
#include <stdio.h>
#include <string.h>
#include <iostream>
#include <ros/ros.h>
#include "opencv2/opencv.hpp"
#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/videoio.hpp"
#include <cv_bridge/cv_bridge.h>
#include "geometry_msgs/PoseStamped.h" 
#include <image_transport/image_transport.h>
#include <camera_info_manager/camera_info_manager.h>

using namespace cv;
using namespace std;
////////////////////
int gradThresh=38;
int anchor_thresh=0;
int sigmai=3;
double sigma=sigmai;
int validateSegmentsb=1;
bool validateSegments=validateSegmentsb;
/////////////////////
double _line_error=5;
int _min_line_len =5 ;
double _max_distance_between_two_lines=5 ;
double _max_error=5;
int lineError=_line_error/1;
int maxDistanceBetweenTwoLines=_max_distance_between_two_lines/1;
int maxError=_max_error/1;
int counter=0;
//////////////////////
#define max2(a,b) (a>b?a:b)
#define max3(a,b,c) (a>b?max2(a,c):max2(b,c))
#define min2(a,b) (a<b?a:b)
#define min3(a,b,c) (a<b?min2(a,c):min2(b,c))
//////////////////////
int hl=138,sl=39,vl=47;
int hh=190,sh=255,vh=255;
/////////////////////
    int can =160;
//cvRetangle
struct mask
{
    int maskdata[20][4];
    int count;
    int r;
    int px;
    int pz;
};

Mat undistort(Mat frame)
{
    cv::Mat k = (cv::Mat_<double>(3, 3) << 478.3854, 0.3169, 331.9190,
                                          0.0, 478.5842, 226.7371,
                                          0.0, 0.0, 1.0);

    cv::Mat d = (cv::Mat_<double>(1, 5) << -0.4085, 0.1536, 6.157666674460974e-04, -0.0017, 0.0);

	int h = frame.rows;
    int w = frame.cols;
	cv::Mat mapx, mapy;
    cv::initUndistortRectifyMap(k, d, cv::noArray(), k, cv::Size(w, h), CV_32FC1, mapx, mapy);

    cv::Mat undistorted_frame;
    cv::remap(frame, undistorted_frame, mapx, mapy, cv::INTER_LINEAR);

    return undistorted_frame;
}

// mask Rectang(Mat dst)
// {   
//     TickMeter tm;
//     tm.start();
//     mask m;
//     Mat srcImg=dst;
//     Mat dstImg = srcImg.clone();
//     vector<vector<Point>> contours;
//     vector<Vec4i> hierarcy;
//     findContours(srcImg, contours, hierarcy, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_NONE);
//     vector<Rect> boundRect(contours.size());  //定义外接矩形集合
//     vector<RotatedRect> box(contours.size()); //定义最小外接矩形集合
//     Point2f rect[4];
//     m.maskdata[20][4]={0};
//     int count = 0;
//     for(int i=0; i<contours.size(); i++)
//     {
//         box[i] = minAreaRect(Mat(contours[i]));  //计算每个轮廓最小外接矩形
//         boundRect[i] = boundingRect(Mat(contours[i]));
//         circle(dstImg, Point(box[i].center.x, box[i].center.y), 5, Scalar(0,0,0), -1, 8);  //绘制最小外接矩形的中心点
//         box[i].points(rect);  //把最小外接矩形四个端点复制给rect数组
//         rectangle(dstImg, Point(boundRect[i].x, boundRect[i].y), Point(boundRect[i].x + boundRect[i].width, boundRect[i].y + boundRect[i].height), Scalar(255,255,255), 2, 8);
//         float a1=m.maskdata[2]-m.maskdata[0];
//         float b1=m.maskdata[1]-m.maskdata[3];
//         float a2=boundRect[i].width-boundRect[i].x;
//         float b2=boundRect[i].height-boundRect[i].y;
//         if(a2 / b2 <= 8.0 && a2 / b2 >= 0.125){
//             m.maskdata[count][0]=boundRect[i].x;
//             m.maskdata[count][1]=boundRect[i].y;
//             m.maskdata[count][2]=boundRect[i].width;
//             m.maskdata[count][3]=boundRect[i].height;
//             count++;
//         }
//         else continue;
//     }

//     // cout<<"countersize:"<<contours.size()<<endl;
//     m.count=count;
//     return m;
// }
//pre
mask pre(Mat img)
{   
    // Mat temp=Saturation(img,50);
    Mat temp=img;
    TickMeter tm;
    tm.start();
    mask m;
    Mat hsv,hsvout;
    cv::cvtColor(temp,hsv,cv::COLOR_BGR2HSV);
    cv::Scalar lowerBound(100,60, 25);  
    cv::Scalar upperBound(120, 255, 255); 
    cv::inRange(hsv, lowerBound, upperBound,hsvout);

    /*清除小面积*/
    cv::Mat dst =hsvout.clone();
	std::vector<std::vector<cv::Point> > contours;  // 创建轮廓容器
	std::vector<cv::Vec4i> 	hierarchy;  
	// 寻找轮廓的函数
	// 第四个参数CV_RETR_EXTERNAL，表示寻找最外围轮廓
	// 第五个参数CV_CHAIN_APPROX_NONE，表示保存物体边界上所有连续的轮廓点到contours向量内
	cv::findContours(hsvout, contours, hierarchy, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_NONE, cv::Point());
	if (!contours.empty()) 
	{
		// 遍历所有轮廓
        Rect rect_out = boundingRect(cv::Mat(contours[0]));
        for (int i = 1; i < contours.size(); ++i)
	    {
		    cv::Rect rect = cv::boundingRect(cv::Mat(contours[i]));
            if(rect.area()>rect_out.area()) rect_out=rect;
	    } 
        m.maskdata[0][0]=rect_out.x;
        m.maskdata[0][1]=rect_out.y;
        m.maskdata[0][2]=rect_out.width;
        m.maskdata[0][3]=rect_out.height;       

	}
    return m;
	}

Mat masker(Mat src)
{   
    mask data=pre(src);
    TickMeter tm;
    tm.start();
    Mat mask1;
    Mat img=src;
    Mat hsvPurple;
    mask1 = Mat::zeros(img.size(), CV_8UC1);//定成黑色
    img = Mat::zeros(img.size(), CV_8UC1);//定成黑色
    int count=data.count;
    int d=20;
    // for(int i=0;i<count;i++)
    // {
        if(data.maskdata[0][0]+data.maskdata[0][2]<640-d)    data.maskdata[0][2]=data.maskdata[0][2]+d;
        else    data.maskdata[0][2]=640-data.maskdata[0][0];
        if(data.maskdata[0][1]+data.maskdata[0][3]<480-d)    data.maskdata[0][3]=data.maskdata[0][3]+d;
        else    data.maskdata[0][3]=480-data.maskdata[0][1];
        if(data.maskdata[0][0]>d)    data.maskdata[0][0]=data.maskdata[0][0]-d;
        else    data.maskdata[0][0]=0;
        if(data.maskdata[0][1]>d)    data.maskdata[0][1]=data.maskdata[0][1]-d;
        else    data.maskdata[0][1]=0;    
        //矩形掩膜
        Rect r1(data.maskdata[0][0],data.maskdata[0][1],data.maskdata[0][2],data.maskdata[0][3]);
        mask1(r1).setTo(255);
    // }
    src.copyTo(img, mask1);
    return img;
}

int float_to_int(float x)
{
        if (std::isinf(x) || std::isinf(-x)|| x!=x){
            return 0;
        }
    return (int)x;
}
//ed识别
mask reconize(Mat img)
{    
    mask camera1;
    vector<Vec6d> ellipses,colors;
    vector<Vec4f> lines;
    Mat colorImg = img;
    // cv::resize(img,colorImg,Size(4*can , 3*can));

        EDColor testEDColor = EDColor(colorImg, gradThresh,anchor_thresh,sigmai,validateSegments);
        EDCircles colorCircle = EDCircles(testEDColor);
        vector<mCircle> found_ccircles = colorCircle.getCircles();
        int maxd=0;
        int maxr=0;
        float k,d,x;
        // float d[found_ccircles.size()+1]={0};//深度
        for (int i = 0; i < found_ccircles.size(); i++)
        {
            Point center((int)found_ccircles[i].center.x, (int)found_ccircles[i].center.y);
            Size axes((int)found_ccircles[i].r, (int)found_ccircles[i].r);
            double angle(0.0);
            Scalar color = Scalar(0, 255, 0);
            if(found_ccircles[i].r>17)
            {
                ellipse(colorImg, center, axes, angle, 0, 360, color, 1, LINE_AA);
                // cout<<"半径："<<found_ccircles[i].r<<endl;
                // d[i]=23956/found_ccircles[i].r;//距离
            }
            if(found_ccircles[i].r>maxd)
            {
                maxd=found_ccircles[i].r;
                maxr=found_ccircles[i].center.x;
            }
                
        }
        k=95.0/maxr;
        d=2.0*maxr+210;
        x=1.0*k*(maxr-320);
        camera1.px=float_to_int(x);
        camera1.pz=float_to_int(d);
        camera1.r=float_to_int(maxr);
        

        // for (int i = 0; i < found_cellipses.size(); i++)
        // {   

        //     Point center((int)found_cellipses[i].center.x, (int)found_cellipses[i].center.y);
        //     Size axes((int)found_cellipses[i].axes.width, (int)found_cellipses[i].axes.height);
        //     double angle = found_cellipses[i].theta * 180 / CV_PI;
        //     Scalar color = Scalar(255, 255, 0);
        //     if(found_cellipses[i].axes.width>=80 && found_cellipses[i].axes.height>=80)
        //     {
        //         ellipse(colorImg1, center, axes, angle, 0, 360, color, 1, LINE_AA);
        //     }
        // }
        // cv::imshow("colorImg", colorImg);
        // cv::waitKey(10);
        
        counter++;
        return camera1;
}

int judge(int r1,int r2){
    if(r2==0){
        return 1;
    }
    else {
        if(r1>r2-30 && r1<r2+30){
        return 1;
        }
        else return 0;
    }
}

int main(int argc, char **argv)
{   
    mask camera;
    setlocale(LC_ALL,"");
    //********** variables    **********/
    cv::Mat src;
    VideoCapture capture(0);
    //string src = "",image_pub = "";
    //********** rosnode init **********/
    ros::init(argc, argv, "camera1");
    ros::NodeHandle camera1;

    //********** rosnode init **********/
    // image_transport::ImageTransport main_cam_image(hikrobot_camera);
    // image_transport::CameraPublisher image_pub = main_cam_image.advertiseCamera("/camera1/ball_position", 1000);
    // sensor_msgs::Image image_msg;
    // sensor_msgs::CameraInfo camera_info_msg;
    // cv_bridge::CvImagePtr cv_ptr = boost::make_shared<cv_bridge::CvImage>();
    // cv_ptr->encoding = sensor_msgs::image_encodings::BGR8;  // 转换为BGR8
    // src = cv_ptr->image;

    ros::Publisher pub = camera1.advertise<geometry_msgs::PoseStamped>("/camera1/ball_position",100);
    geometry_msgs::PoseStamped pose_msg;
    float x=camera.px;
    float z=camera.pz;
    vector<_Float32> array = {x,z};
    ros::Rate rate(50);
    ////////////////////////////////////////////////////////////////
    // cv::namedWindow("1", cv::WINDOW_AUTOSIZE);      
    // cv::createTrackbar("gradThresh","1",&gradThresh,100);
    // cv::createTrackbar("anchor_thresh","1",&anchor_thresh,100);
    // cv::createTrackbar("sigmai","1",&sigmai,15);
    // cv::createTrackbar("validateSegmentsb","1",&validateSegmentsb,1);
    // cv::createTrackbar("_line_error","1",&lineError,1000);
    // cv::createTrackbar("_min_line_len","1",&_min_line_len,1000);
    // cv::createTrackbar("maxDistanceBetweenTwoLines","1",&maxDistanceBetweenTwoLines,1000);
    // cv::createTrackbar("maxError","1",&maxError,1000);
    
    // cv::namedWindow("hsvpur", cv::WINDOW_AUTOSIZE);      
    // cv::createTrackbar("hl","hsvpur",&hl,255);
    // cv::createTrackbar("sl","hsvpur",&sl,255);
    // cv::createTrackbar("vl","hsvpur",&vl,255);
    // cv::createTrackbar("hh","hsvpur",&hh,255);
    // cv::createTrackbar("sh","hsvpur",&sh,255);
    // cv::createTrackbar("vh","hsvpur",&vh,255);

    // cv::namedWindow("colorImg", cv::WINDOW_AUTOSIZE);         
    // cv::createTrackbar("x","colorImg",&can,360);

    int count=0;
    int balls[3]={0,0,0};
    while (ros::ok())
    {    
        capture >> src;
        // src=imread("/home/moon/picture/balls1/14.png");
        if (src.empty())
        {   
            continue;
        }
        src=undistort(src);
        // cv::imshow("src", src);
        // cv::waitKey(10);
        Mat src1= masker(src);
        camera=reconize(src1);
        if(judge(camera.r,balls[0])){
            balls[0]=camera.r;
            balls[1]=camera.px;
            balls[2]=camera.pz;
        }

        if(count>7) {
            pose_msg.pose.position.x = camera.px;
            pose_msg.pose.position.y = camera.pz;
            pose_msg.pose.position.z = 0;
            pose_msg.pose.orientation.x = 0.0;
            pose_msg.pose.orientation.y = 0.0;
            pose_msg.pose.orientation.z = 0.0;
            pose_msg.pose.orientation.w = 1.0;
            pose_msg.header.frame_id = "ball_position" ;
            pose_msg.header.stamp = ros::Time::now();
            pub.publish(pose_msg);
            // rate.sleep();
            // cout<<"r="<<camera.r<<endl;
            // cout<<"球坐标：["<<camera.px<<","<<camera.pz<<"]"<< endl;
            cout<<"r="<<balls[0]<<endl;
            cout<<"球坐标：["<<balls[1]<<","<<balls[2]<<"]"<< endl;
            count = 0;
            balls[0]=0;
            balls[1]=0;
            balls[2]=0;
        }
        else count++;
    }    
    return 0;
}
/*
代码结构
主函数调用masker获取预处理图像 供reconize函数调用 EDlib完成圆识别
masker获取pre处理的图像，经行掩膜绘制
pre为Rectang提供hsv筛选下轮廓图的结果，同时返回rectang的轮廓角点结果
==>>所有有关hsv的修改应当在pre中进行
==>>所有有关掩膜形状的修改应当在masker中进行（结合rectang）
==>>所有有关最后圆形筛选的修改应当在reconzie中进行

*/ 
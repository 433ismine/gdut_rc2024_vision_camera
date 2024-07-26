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
#include "std_msgs/Float32MultiArray.h" 
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
//////////////////////
#define max2(a,b) (a>b?a:b)
#define max3(a,b,c) (a>b?max2(a,c):max2(b,c))
#define min2(a,b) (a<b?a:b)
#define min3(a,b,c) (a<b?min2(a,c):min2(b,c))
//////////////////////
int hl=138,sl=39,vl=47;
int hh=190,sh=255,vh=255;
//////////////////////
double src_width,src_height,src_fps;
//cvRetangle
struct mask
{
    float maskdata[20][4];
    int count;
    _Float32 px;
    _Float32 pz;
};
struct came
{
    _Float32 px;
    _Float32 pz;
};
deque<mask> position;

// 饱和度
cv::Mat Saturation(cv::Mat src, int percent)
{   

	float Increment = percent* 1.0f / 100;
	cv::Mat temp = src.clone();
	int row = src.rows;
	int col = src.cols;
	for (int i = 0; i < row; ++i)
	{
		uchar *t = temp.ptr<uchar>(i);
		uchar *s = src.ptr<uchar>(i);
		for (int j = 0; j < col; ++j)
		{
			uchar b = s[3 * j];
			uchar g = s[3 * j + 1];
			uchar r = s[3 * j + 2];
			float max = max3(r, g, b);
			float min = min3(r, g, b);
			float delta, value;
			float L, S, alpha;
			delta = (max - min) / 255;
			if (delta == 0)
				continue;
			value = (max + min) / 255;
			L = value / 2;
			if (L < 0.5)
				S = delta / value;
			else
				S = delta / (2 - value);
			if (Increment >= 0)
			{
				if ((Increment + S) >= 1)
					alpha = S;
				else
					alpha = 1 - Increment;
				alpha = 1 / alpha - 1;
				t[3 * j + 2] =static_cast<uchar>( r + (r - L * 255) * alpha);
				t[3 * j + 1] = static_cast<uchar>(g + (g - L * 255) * alpha);
				t[3 * j] = static_cast<uchar>(b + (b - L * 255) * alpha);
			}
			else
			{
				alpha = Increment;
				t[3 * j + 2] = static_cast<uchar>(L * 255 + (r - L * 255) * (1 + alpha));
				t[3 * j + 1] = static_cast<uchar>(L * 255 + (g - L * 255) * (1 + alpha));
				t[3 * j] = static_cast<uchar>(L * 255 + (b - L * 255) * (1 + alpha));
			}
		}
	}
    return temp;
}
mask Rectang(Mat dst)
{   
    mask m;
    Mat srcImg=dst;
    Mat dstImg = srcImg.clone();
    vector<vector<Point>> contours;
    vector<Vec4i> hierarcy;
    findContours(srcImg, contours, hierarcy, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_NONE);
    vector<Rect> boundRect(contours.size());  //定义外接矩形集合
    vector<RotatedRect> box(contours.size()); //定义最小外接矩形集合
    Point2f rect[4];
    m.maskdata[20][4]={0};
    for(int i=0; i<contours.size(); i++)
    {
        box[i] = minAreaRect(Mat(contours[i]));  //计算每个轮廓最小外接矩形
        boundRect[i] = boundingRect(Mat(contours[i]));
        circle(dstImg, Point(box[i].center.x, box[i].center.y), 5, Scalar(0,0,0), -1, 8);  //绘制最小外接矩形的中心点
        box[i].points(rect);  //把最小外接矩形四个端点复制给rect数组
        rectangle(dstImg, Point(boundRect[i].x, boundRect[i].y), Point(boundRect[i].x + boundRect[i].width, boundRect[i].y + boundRect[i].height), Scalar(255,255,255), 2, 8);
        m.maskdata[i][0]=boundRect[i].x;
        m.maskdata[i][1]=boundRect[i].y;
        m.maskdata[i][2]=boundRect[i].width;
        m.maskdata[i][3]=boundRect[i].height;
    }
   
    m.count=contours.size();
    return m;
}
//pre
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
mask pre(Mat img)
{   
    Mat temp=img;
    mask m;
    // imshow("img",temp);
    Mat hsv,hsvout;
    cv::cvtColor(temp,hsv,cv::COLOR_BGR2HSV);
    cv::Scalar lowerBound(100,130, 0);  
    cv::Scalar upperBound(120, 205, 255); 
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
		std::vector<std::vector<cv::Point> >::const_iterator itc = contours.begin();
		// 遍历所有轮廓
		while (itc != contours.end()) 
		{
			// 定位当前轮廓所在位置
			cv::Rect rect = cv::boundingRect(cv::Mat(*itc));
			// contourArea函数计算连通区面积
			double area = contourArea(*itc);
			// 若面积小于设置的阈值
			if (area < 500) 
			{   
				// 遍历轮廓所在位置所有像素点
				for (int i = rect.y; i < rect.y + rect.height; i++) 
				{
					uchar *output_data = dst.ptr<uchar>(i);
					for (int j = rect.x; j < rect.x + rect.width; j++) 
					{
						// 将连通区的值置0
						if (output_data[j] != 0) 
						{
							output_data[j] = 0;
						}
					}
				}
			}
			itc++;
		}

	}
    m=Rectang(dst);
    return m;
}
Mat masker(Mat src)
{   
    mask data=pre(src);
    Mat mask1;
    Mat img=src;
    mask1 = Mat::zeros(img.size(), CV_8UC1);//定成黑色
    img = Mat::zeros(img.size(), CV_8UC1);//定成黑色
    int count=data.count;
    // cout<<"////////////////         "<<count<<endl;
    for(int i=0;i<count;i++)
    {
        // cout<<"////////////////        masker       ///////////////////"<<endl;
        if(data.maskdata[i][0]>src_width/20.0)
        {   
            int original=data.maskdata[i][0];
            data.maskdata[i][0]=data.maskdata[i][0]-(src_width/20.0-5);
            if(original+data.maskdata[i][2]<19.0/20.0*src_width)
            {
                data.maskdata[i][2]=data.maskdata[i][2]+src_width/20.0-5;
            }
        }
        if(data.maskdata[i][1]>src_height/20.0)
        {   
            int original = data.maskdata[i][1];
            data.maskdata[i][1]=data.maskdata[i][1]- (src_height/20.0-5);
            if(original+data.maskdata[i][3]<19.0/20.0*src_height)
            {
                data.maskdata[i][3]=data.maskdata[i][3]+ (src_width/20.0-5);
            }   
        }
        //矩形掩膜
        // ROS_INFO("shuju%f,%f",src_width/20.0,src_width/20.0*19.0);
        // ROS_INFO("yanmo:%f,%f,%f,%f",data.maskdata[i][0],data.maskdata[i][1],data.maskdata[i][2],data.maskdata[i][3]);
        Rect r1(data.maskdata[i][0],data.maskdata[i][1],data.maskdata[i][2],data.maskdata[i][3]);
        mask1(r1).setTo(255);
    }
    src.copyTo(img, mask1);
    return img;
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
        int maxr=0;
        int x=0,y=0,ymin=0;
        float k,d;
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
            if(found_ccircles[i].r>maxr)
            {
                maxr=found_ccircles[i].r;
                x=found_ccircles[i].center.x;
                y = found_ccircles[i].center.y;
                ymin = y -maxr;
            }

        }
        if( maxr!=0 )
        {
            // k=(src_width/640.0)*45625.0/maxr;
            // camera1.pz=5880.133*exp(-0.859*maxr)+1460.877*exp(-0.0108*maxr);
            float a1 = 18800;
            float b1 = -0.0145;
            float c1= 2045.1;
            float d1= -0.0029;
            float d= a1*exp(b1*ymin) + c1*exp(d1*ymin);
            camera1.pz = d;
            // maxr = 341.8112*exp(-0.0383*d/10)+65.6061*exp(-0.0053*d/10);
            camera1.px=1.0*(95.0/maxr)*(x-src_width/2.0);
            // ROS_INFO("shen:%d",maxr);
        }
        else
        {
            camera1.pz=0;
            camera1.px=0;
        }

        cv::imshow("colorImg", colorImg);
        cv::waitKey(10);
        return camera1;
}
int main(int argc, char **argv)
{
    mask relative_position;
    mask reu;
    setlocale(LC_ALL,"");
    //********** variables    **********/
    cv::Mat src;
    VideoCapture capture(12);
    capture.set(cv::CAP_PROP_FOURCC, cv::VideoWriter::fourcc('M','J','P','G'));
    capture.set(cv::CAP_PROP_FRAME_WIDTH,1280);
    capture.set(cv::CAP_PROP_FRAME_HEIGHT,720);
     src_width = capture.get(cv::CAP_PROP_FRAME_WIDTH);
     src_height = capture.get(cv::CAP_PROP_FRAME_HEIGHT);
     src_fps = capture.get(cv::CAP_PROP_FPS);
    // ROS_INFO("%f,%f,%f",src_width,src_height,src_fps);
    //********** rosnode init **********/
    ros::init(argc, argv, "camera1");
    ros::NodeHandle camera1;

    ros::Publisher pub = camera1.advertise<geometry_msgs::PoseStamped>("/camera1/ball_position",100);
    // ros::Subscriber postamp = nh.subscribe<nav_msgs::Odometry>("/Odometry",1000,lidar);
    geometry_msgs::PoseStamped pose_msg;
    float x=relative_position.px;
    float z=relative_position.pz;
    vector<_Float32> array = {x,z};
    ros::Rate rate(30);
    ////////////////////////////////////////////////////////////////

    int count=0;
    while (ros::ok())
    {   
        capture >> src;
        if (src.empty())
        {   
            ROS_ERROR("没有图像输入");
            break;
        }
        printf("%d,%d",src.cols,src.rows);
        // src=undistort(src);
        cv::imshow("src", src);
        cv::waitKey(10);
        Mat src1= masker(src);
        relative_position=reconize(src1);
        if(relative_position.pz >= 100)
        {
            if(position.size() < 10 )
            {   
                position.push_back(relative_position);
            } 
            if(position.size() == 10) 
            {   
                reu.pz = 9999;
                reu.px = 9999;
                for(int i=0;i<position.size();i++)
                {   
                    if(position.at(i).pz<reu.pz)
                    {
                        reu.pz = position.at(i).pz;
                        reu.px = position.at(i).px;
                    }
                    // ROS_ERROR("OK");
                }
                ROS_INFO("%f,%f",reu.pz,reu.px);
                if(reu.pz != 9999 && reu.px != 9999)
                {
                pose_msg.pose.position.x = reu.px;
                pose_msg.pose.position.z = reu.pz;
                pub.publish(pose_msg);
                ROS_INFO("xiangduzuibiao:x:%f,z:%f",pose_msg.pose.position.x,pose_msg.pose.position.z);
                position.pop_front();
                }
            }
        }

    rate.sleep();
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
==>>所有有关最后圆形筛选的修改应当在reconzie中进行6

*/
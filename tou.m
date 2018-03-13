%柱面投影  徐刚
%2014.8.26 多幅图像
%参量：原图长宽W,H；投影角 thta；投影半径 r； 
%相机参数：640*480 thta 70-80
%Question: 像素尺寸和实际尺寸联系
function [T1]=tou(T0)
%clear all;
%img = imread('2.jpg');

%%imtool(img); %show this picture
[H,W,~,N]=size(T0);%得到rgb图片的三个参数,长宽尺寸,与表征灰度的cc值3
%mm = H;              %640  480   3
%nn = W;              %
%C = zeros(mm,nn,rgb); %与原图像同样大小但没有像素值的0矩阵

thta=50;             %角度制

thta=thta*pi/180;       %投影角度  弧度
r=W/(2*tan(thta/2));  %投影半径 也是焦距 像素级

tic;
%w=1:W;
%w=zeros(1,numel(w));
%h=1:H;
%h=zeros(1,numel(h));

T1=uint8(zeros( 420 ,520 , 3 , 6));     %%%%为了加快循环速度，提前开辟空间，如果换图像了，记得修改459 ,740 , 3 , 8
%T1=unit8([]);

for x=1:W
    for y=1:H
       x_=r*atan(x/r-W/2/r)+r*atan(W/2/r);
       y_=r*(y-H/2)/sqrt((x-W/2)^2+r^2)+H/2;
        
        a=round(x_);%a,b为修正后像素坐标 取整round fix ceil floor
        b=round(y_); 
        if a>0 && b>0 
            for i=1:N
             T1(b,a,:,i)=T0(y,x,:,i);%像素填充
            end
        end
 
    end
end

%figure ;imshow(C);
%imwrite(C,'n_2.jpg')
%imtool(C);
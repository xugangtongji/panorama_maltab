
clear;clc;
%%%%%%%%%%%%%%%%%%
fprintf('输入图像');
T0=uint8([]);T=uint8([]);
%%%%%%%%%%%%%%%%%%%%%%
i1=imread('xg11.jpg');T0(:,:,:,1)=i1;       %i1=multi_resolution(i1,level);T(:,:,:,1)=i1;
i2=imread('xg22.jpg');T0(:,:,:,2)=i2;       %%图像数量%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%important    
i3=imread('xg33.jpg');T0(:,:,:,3)=i3;         %i3=multi_resolution(i3,level);T(:,:,:,3)=i3;
i4=imread('xg44.jpg');T0(:,:,:,4)=i4;            %i4=multi_resolution(i4,level);T(:,:,:,4)=i4;
i5=imread('xg55.jpg');T0(:,:,:,5)=i5;               %i5=multi_resolution(i5,level);T(:,:,:,5)=i5;
 i6=imread('xg66.jpg');T0(:,:,:,6)=i6;                %i6=multi_resolution(i6,level);T(:,:,:,6)=i6;
% i7=imread('7.jpg');T0(:,:,:,7)=i7;          %i7=multi_resolution(i7,level);T(:,:,:,7)=i7;
%  i8=imread('8.jpg');T0(:,:,:,8)=i8;     %i8=multi_resolution(i8,level);T(:,:,:,8)=i8;
% i9=imread('X9.jpg');T0(:,:,:,9)=i9;%i9=multi_resolution(i9,level);T(:,:,:,9)=i9;
% i10=imread('X10.jpg');T0(:,:,:,10)=i10;
% i11=imread('X11.jpg');T0(:,:,:,11)=i11;
[H,W,d,M]=size(T0);%%%要求图像的大小相同



% L=M*w;%%图像总长度
% suml=0;%%重叠区域总长度
%%%%%%%%%%%%%%%%%变换到柱面坐标系
tic
fprintf('变换到柱面坐标系...');
T1=tou(T0);
[HH,WW,~,~]=size(T1);
toc
%%%%%%%%%%%%%%%sift求偏移量

fprintf('sift计算偏移量...');

%pic1=T1(:,WW/2:WW,:,1);
%pic2=T1(:,:,:,2);

panorama1=T1(:,:,:,1);

tic
h=zeros(4);
w=zeros(4);

for i=2:M
 
 [matchLoc1,matchLoc2] = siftMatch(T1(:,WW/2:WW,:,i-1),T1(:,1:WW/2,:,i));
 
matchLoc1=mean(matchLoc1(:,1:2));
matchLoc2=mean(matchLoc2(:,1:2));


h(i)=round(matchLoc2(2)-matchLoc1(2));
w(i)=round(matchLoc2(1)+WW/2-matchLoc1(1));

panorama1=mosaic(panorama1,T1(:,:,:,i),h(i),w(i));

end

%%%%%%%%%%%%%融合重叠部分
fprintf('融合重叠部分,拼接全图...');

toc

%%%%%%%%%%%%%%%%重构图像
fprintf('保存、显示结果...');
imwrite(panorama1,'xx12.jpg','jpg');
imshow(panorama1,[]);

% % %%%%%柱面全景图像拼合算法研究
% 
clc;clear;

image1=(imread('D3.jpg'));[h,w,r]=size(image1);
image2=(imread('D4.jpg'));T0(:,:,:,1)=image1;T0(:,:,:,2)=image2;
subplot(121),imshow(image1);subplot(122),imshow(image2);
image11=multi_resolution(image1,2);
image22=multi_resolution(image2,2);
[r1,c1,d1]=size(image11);
[r2,c2,d2]=size(image22);
[i,j]=poc_2pow(image11,image22);
%%%%%%%%%%%%%%%%%%%%%相位相关计算偏移量
tic
fprintf('相位相关计算偏移量...');
[i,j]=poc_2pow(image11,image22);
coor_shift(1,1)=i;
coor_shift(1,2)=j;
coor_shift(2,1)=0;coor_shift(2,2)=0;
coor_shift=coor_shift*2^2;%%%将金字塔子层中的偏移量转换到原图的偏移量
toc
%%%%%%%%%%%%%%%%%变换到柱面坐标系
tic
fprintf('变换到柱面坐标系...');
f=sqrt(h^2+w^2);
[T1,coor_shift02]=coortransf(T0,f,coor_shift);
toc
%%%%%%%%%%%%%融合重叠部分
tic
fprintf('融合重叠部分,拼接全图...');
panorama1=mosaic(T1(:,:,:,1),T1(:,:,:,2),coor_shift02(1,1),coor_shift02(1,2));
toc
%%%%%%%%%%%%%%%%重构图像
tic
fprintf('保存、显示结果...');
imwrite(panorama1,'pic2.jpg','jpg');
imshow(panorama1,[]);
toc








% imr1=imresize(image11,4)+e1;
% imr2=imresize(image22,4)+e2;
% ie1=imr1-image1;
% ie2=imr2-image2;
% subplot(251),imshow(image1);subplot(252),imshow(image11);subplot(253),imshow(e1);subplot(254),imshow(imr1);subplot(255),imshow(ie1);
% subplot(256),imshow(image2);subplot(257),imshow(image22);subplot(258),imshow(e2);subplot(259),imshow(imr2);subplot(2,5,10),imshow(ie2);



clear;clc;
%%%%%%%%%%%%%%%%%%
fprintf('����ͼ��');
T0=uint8([]);T=uint8([]);
%%%%%%%%%%%%%%%%%%%%%%
i1=imread('xg11.jpg');T0(:,:,:,1)=i1;       %i1=multi_resolution(i1,level);T(:,:,:,1)=i1;
i2=imread('xg22.jpg');T0(:,:,:,2)=i2;       %%ͼ������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%important    
i3=imread('xg33.jpg');T0(:,:,:,3)=i3;         %i3=multi_resolution(i3,level);T(:,:,:,3)=i3;
i4=imread('xg44.jpg');T0(:,:,:,4)=i4;            %i4=multi_resolution(i4,level);T(:,:,:,4)=i4;
i5=imread('xg55.jpg');T0(:,:,:,5)=i5;               %i5=multi_resolution(i5,level);T(:,:,:,5)=i5;
 i6=imread('xg66.jpg');T0(:,:,:,6)=i6;                %i6=multi_resolution(i6,level);T(:,:,:,6)=i6;
% i7=imread('7.jpg');T0(:,:,:,7)=i7;          %i7=multi_resolution(i7,level);T(:,:,:,7)=i7;
%  i8=imread('8.jpg');T0(:,:,:,8)=i8;     %i8=multi_resolution(i8,level);T(:,:,:,8)=i8;
% i9=imread('X9.jpg');T0(:,:,:,9)=i9;%i9=multi_resolution(i9,level);T(:,:,:,9)=i9;
% i10=imread('X10.jpg');T0(:,:,:,10)=i10;
% i11=imread('X11.jpg');T0(:,:,:,11)=i11;
[H,W,d,M]=size(T0);%%%Ҫ��ͼ��Ĵ�С��ͬ



% L=M*w;%%ͼ���ܳ���
% suml=0;%%�ص������ܳ���
%%%%%%%%%%%%%%%%%�任����������ϵ
tic
fprintf('�任����������ϵ...');
T1=tou(T0);
[HH,WW,~,~]=size(T1);
toc
%%%%%%%%%%%%%%%sift��ƫ����

fprintf('sift����ƫ����...');

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

%%%%%%%%%%%%%�ں��ص�����
fprintf('�ں��ص�����,ƴ��ȫͼ...');

toc

%%%%%%%%%%%%%%%%�ع�ͼ��
fprintf('���桢��ʾ���...');
imwrite(panorama1,'xx12.jpg','jpg');
imshow(panorama1,[]);

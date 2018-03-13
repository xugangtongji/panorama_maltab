function D=mosaic(image1,image2,i,j)
% % %%%%%柱面全景图像拼合算法研究
% 
% [i,j]=phase_correlation(image1,image2);

[ra,ca,a]=size(image1);
[rb,cb,b]=size(image2);
Xa=image1;Ya=image2;
% dis=i;%%%上下偏移量
dis=i;
EXa=zeros(abs(dis),ca,3)+255;%%%上下扩充图像边缘为白色
EXb=zeros(abs(dis),cb,3)+255;
if dis>1 
  Xa=[EXa;image1];            %%%dis>0时
  Ya=[image2;EXb];
elseif dis<-1
    Xa=[image1;EXa];
    Ya=[EXb;image2];
end
dm=j;%%%拼缝宽度,在此处限定宽度不超过50pel
% if dm<=50
   A=Xa(:,1:(ca-dm-1),:);
   B1=Xa(:,(ca-dm):ca,:);
   B2=Ya(:,1:dm,:);
   B=imagefusion02(B1,B2);%%部分叠加（融合）
   C=Ya(:,(dm+1):cb,:);%%剪裁出第二图的剩余部分
% else
%     dm=50;
%     A=Xa(:,1:(ca-dm-1),:);
%    B1=Xa(:,(ca-dm):ca,:);
%    B2=Ya(:,(j-dm):j,:);
%    B=imagefusion02(B1,B2);%%部分叠加（融合）
%    C=Ya(:,(j+1):cb,:);%%剪裁出第二图的剩余部分
% end
    
   D=[A,B,C];%%聚合，实现拼接
   %%%%消除累积误差
   [r,c]=size(D);
   if dis>1 
       D=D(1:(r-dis),:,:);
   elseif dis<-1
       D=D((abs(dis)+1):r,:,:);
   end
       
%    figure,imshow(D);
 

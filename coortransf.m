function [T1,coor_shift02]=coortransf(T0,f,coor_shift)
%%%%图像坐标系到柱面坐标的转换
%对输入图像序列T0按焦距f进行变换
coor_shift02=coor_shift;%%%%第一维（行值）不变，第二维（列）在映射后更新
[H,W,r,N]=size(T0);
w2f=W/2/f;
h2=H/2;
constant2=f*atan(W/(2*f));
constant1=h2;

for y=1:W      %%%%%%   列
    angle=atan(y/f-w2f);%%%%atan((y-W/2)/f);
     y1=uint16(f*angle+constant2);
     if  y1==0  y1=1;  end
    for x=1:H  %%%%%%%%%%%%   行
     x1=uint16((x-h2)*cos(angle)+constant1);
     if  x1==0  x1=1;end
     if r==3   %%%%%%%%%%%%%彩色图像
         for n=1:N  %%%%%%%%%
             if (y==coor_shift(n,2)) coor_shift02(n,2)=y1; end%%%对应偏移量
             T1(x1,y1,:,n)=T0(x,y,:,n);%%%%点的映射
         end
     elseif r==1
%          T1(x1,y1)=T0(x,y);
     end
    end
end
%  [h,w,a,N]=size(T1);
%for i=1:60%%%边缘没有映射点的地方填白色
%    for j=1:w
%        if (T1(i,j,:,:)==0)
 %           T1(i,j,:,:)=255;
  %      end
   %     if (T1(h-i,j,:,:)==0)
    %        T1(i,j,:,:)=255;
 %       end
 %   end
%   end



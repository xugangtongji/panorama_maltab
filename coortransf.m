function [T1,coor_shift02]=coortransf(T0,f,coor_shift)
%%%%ͼ������ϵ�����������ת��
%������ͼ������T0������f���б任
coor_shift02=coor_shift;%%%%��һά����ֵ�����䣬�ڶ�ά���У���ӳ������
[H,W,r,N]=size(T0);
w2f=W/2/f;
h2=H/2;
constant2=f*atan(W/(2*f));
constant1=h2;

for y=1:W      %%%%%%   ��
    angle=atan(y/f-w2f);%%%%atan((y-W/2)/f);
     y1=uint16(f*angle+constant2);
     if  y1==0  y1=1;  end
    for x=1:H  %%%%%%%%%%%%   ��
     x1=uint16((x-h2)*cos(angle)+constant1);
     if  x1==0  x1=1;end
     if r==3   %%%%%%%%%%%%%��ɫͼ��
         for n=1:N  %%%%%%%%%
             if (y==coor_shift(n,2)) coor_shift02(n,2)=y1; end%%%��Ӧƫ����
             T1(x1,y1,:,n)=T0(x,y,:,n);%%%%���ӳ��
         end
     elseif r==1
%          T1(x1,y1)=T0(x,y);
     end
    end
end
%  [h,w,a,N]=size(T1);
%for i=1:60%%%��Եû��ӳ���ĵط����ɫ
%    for j=1:w
%        if (T1(i,j,:,:)==0)
 %           T1(i,j,:,:)=255;
  %      end
   %     if (T1(h-i,j,:,:)==0)
    %        T1(i,j,:,:)=255;
 %       end
 %   end
%   end



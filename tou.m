%����ͶӰ  ���
%2014.8.26 ���ͼ��
%������ԭͼ����W,H��ͶӰ�� thta��ͶӰ�뾶 r�� 
%���������640*480 thta 70-80
%Question: ���سߴ��ʵ�ʳߴ���ϵ
function [T1]=tou(T0)
%clear all;
%img = imread('2.jpg');

%%imtool(img); %show this picture
[H,W,~,N]=size(T0);%�õ�rgbͼƬ����������,����ߴ�,������Ҷȵ�ccֵ3
%mm = H;              %640  480   3
%nn = W;              %
%C = zeros(mm,nn,rgb); %��ԭͼ��ͬ����С��û������ֵ��0����

thta=50;             %�Ƕ���

thta=thta*pi/180;       %ͶӰ�Ƕ�  ����
r=W/(2*tan(thta/2));  %ͶӰ�뾶 Ҳ�ǽ��� ���ؼ�

tic;
%w=1:W;
%w=zeros(1,numel(w));
%h=1:H;
%h=zeros(1,numel(h));

T1=uint8(zeros( 420 ,520 , 3 , 6));     %%%%Ϊ�˼ӿ�ѭ���ٶȣ���ǰ���ٿռ䣬�����ͼ���ˣ��ǵ��޸�459 ,740 , 3 , 8
%T1=unit8([]);

for x=1:W
    for y=1:H
       x_=r*atan(x/r-W/2/r)+r*atan(W/2/r);
       y_=r*(y-H/2)/sqrt((x-W/2)^2+r^2)+H/2;
        
        a=round(x_);%a,bΪ�������������� ȡ��round fix ceil floor
        b=round(y_); 
        if a>0 && b>0 
            for i=1:N
             T1(b,a,:,i)=T0(y,x,:,i);%�������
            end
        end
 
    end
end

%figure ;imshow(C);
%imwrite(C,'n_2.jpg')
%imtool(C);
function [dis,dm]=phase_correlation(image1,image2);
%%%%%%%%%%%%%%%%%相位相关算法
%%% C=phase_correlation(imagea,imageb)   input two images
[H1,W1,d1]=size(image1);
[H2,W2,d2]=size(image2);
if d1==3 image1=rgb2gray(image1);end%%%灰度图
if d2==3 image2=rgb2gray(image2);end
Xb=image1;Yb=image2;
[image1,t1]=edge(image1,'canny');
 [image2,t2]=edge(image2,'canny');
A=fft2(im2double(image1));%傅立叶变换，频域
B=fft2(im2double(image2));
AB=conj(A).*(B);%%%共轭卷积，相当于改变相位
COR=ifft2(AB);%%%不归一化，反变换得相关
[C,i]=max(COR);[C,J]=max(C);I=i(J);%%%求峰值，（I，J）保存峰值坐标,即为平移量
if I<15 dis=I;
elseif H2-I<15 dis=I-H2;
else dis=0;
end
dm=J;
%%%%%%求精
% Xb=Xb(:,(W1-dm+1):W1);Yb=Yb(:,1:dm);
% [r1,c1]=size(Xb);[r2,c2]=size(Yb);
% r0=round(r1/6);c0=round(c1/5);%%模板的左上角
% h=round(r1*2/3);w=round(3*c1/5);%%模板的高度和宽度
% mask1=Xb(r0:(r0+h-1),c0:(c0+w-1));%%模板块
% maskYb=Yb;%%搜索块
% for i=1:(c2-w)  %%搜索范围,比原模板所在区域有所扩大,先向下移动再右
%     for j=1:(r2-h)
%         mask2=maskYb(j:(j+h-1),i:(i+w-1));%%取匹配块
%         e1=abs(double(mask1)-double(mask2));%%模板块与匹配块进行差运算
%         e2=0;e2_min=10000;
%         for p1=1:h
%              e2=e2+(e1(p1,1))^2+(e1(p1,w))^2;%%计算差矩阵的均方差,基于特征线
%         end
%         e2=e2/(2*h);
%         if (e2<e2_min)%%设定域值
%             e2_min=e2;
%             i_min=i;
%             j_min=j;
%         end 
%     end
% end
% dis=j_min-r0;
% dm=dm+i_min-c0;














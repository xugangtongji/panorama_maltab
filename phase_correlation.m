function [dis,dm]=phase_correlation(image1,image2);
%%%%%%%%%%%%%%%%%��λ����㷨
%%% C=phase_correlation(imagea,imageb)   input two images
[H1,W1,d1]=size(image1);
[H2,W2,d2]=size(image2);
if d1==3 image1=rgb2gray(image1);end%%%�Ҷ�ͼ
if d2==3 image2=rgb2gray(image2);end
Xb=image1;Yb=image2;
[image1,t1]=edge(image1,'canny');
 [image2,t2]=edge(image2,'canny');
A=fft2(im2double(image1));%����Ҷ�任��Ƶ��
B=fft2(im2double(image2));
AB=conj(A).*(B);%%%���������൱�ڸı���λ
COR=ifft2(AB);%%%����һ�������任�����
[C,i]=max(COR);[C,J]=max(C);I=i(J);%%%���ֵ����I��J�������ֵ����,��Ϊƽ����
if I<15 dis=I;
elseif H2-I<15 dis=I-H2;
else dis=0;
end
dm=J;
%%%%%%��
% Xb=Xb(:,(W1-dm+1):W1);Yb=Yb(:,1:dm);
% [r1,c1]=size(Xb);[r2,c2]=size(Yb);
% r0=round(r1/6);c0=round(c1/5);%%ģ������Ͻ�
% h=round(r1*2/3);w=round(3*c1/5);%%ģ��ĸ߶ȺͿ��
% mask1=Xb(r0:(r0+h-1),c0:(c0+w-1));%%ģ���
% maskYb=Yb;%%������
% for i=1:(c2-w)  %%������Χ,��ԭģ������������������,�������ƶ�����
%     for j=1:(r2-h)
%         mask2=maskYb(j:(j+h-1),i:(i+w-1));%%ȡƥ���
%         e1=abs(double(mask1)-double(mask2));%%ģ�����ƥ�����в�����
%         e2=0;e2_min=10000;
%         for p1=1:h
%              e2=e2+(e1(p1,1))^2+(e1(p1,w))^2;%%��������ľ�����,����������
%         end
%         e2=e2/(2*h);
%         if (e2<e2_min)%%�趨��ֵ
%             e2_min=e2;
%             i_min=i;
%             j_min=j;
%         end 
%     end
% end
% dis=j_min-r0;
% dm=dm+i_min-c0;














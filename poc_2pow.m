function [dis,dm]=poc_2pow(imageL,imageR);
%%%%%%%%%%%%%%%%%��λ����㷨
% imageL=image1;
% imageR=image2;
[H1,W1,d1]=size(imageL);
[H2,W2,d2]=size(imageR);
if d1==3 imageL=rgb2gray(imageL);end%%%�Ҷ�ͼ
if d2==3 imageR=rgb2gray(imageR);end
%%%%%%%%%%%%%��ȡ2�ݷ�ͼ�Ķ�ֵ��������
[imageL,t1]=edge(imageL,'canny',[],1.2);%%%%sigma=1.2(Ĭ��1)
[imageR,t2]=edge(imageR,'canny',[],1.2);%%%%��ֵ�Զ�ѡ��
Xb=imageL;Yb=imageR;
%%%%%%%%%%%%%%2�ݷ�ͼ
for i=5:11
    index2=2^i;
    if index2<=H1 && index2<=W1 h1=index2;end
    if index2<=H2 && index2<=W2 h2=index2;end
end
% minhw1=min(h1,w1);
% minhw2=min(h2,w2);
minhw1=h1;minhw2=h2;
offset1=round((H1-minhw1)/2);
offset2=round((H2-minhw2)/2);
imageL=imageL(offset1:offset1+minhw1-1,W1-minhw1+1:W1);%%%��ͼȡ����
imageR=imageR(offset2:offset2+minhw2-1,1:minhw2);%%%%��ͼȡ����
%%%%%%%%%%%%��λ����㷨��ƫ����
A=fft2(im2double(imageL));%����Ҷ�任��Ƶ��
B=fft2(im2double(imageR));
AB=conj(A).*(B);%%%���������൱�ڸı���λ
modAB=abs(AB);
%%%%%%%%%%%%���ֵ����I��J�������ֵ����,��Ϊƽ����
COR=ifft2(AB);%%%����һ�������任�����
emin=100000;
% for i=1:10    
    [maxC,sorti]=max(COR);
    [C,J]=max(maxC);
    I=sorti(J);
    if I<20 dis=I;
    elseif H2-I<20 dis=(I-H2);
    else dis=0;
    end
    dm=J;
%     top10(i,1)=dis;
%     top10(i,2)=dm;
%     top10(i,3)=C;
%     COR(I,J)=0;
%     try
%        newc=minhw1-dm+1;
%        block1=imageL(121:136,newc-8:newc+7);
%        block2=imageR(121:136,dm-8:dm+7);
%        e=abs((block1-block2));
%        e2=sum(sum(e.^2))/256;
% %        if e2<emin 
%            emin=(e2);
%            top1(i,1)=dis;top1(i,2)=dm;top1(i,3)=emin;
% %        end
%     catch
%         continue;
%     end
% end

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














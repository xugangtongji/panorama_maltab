function D=mosaic(image1,image2,i,j)
% % %%%%%����ȫ��ͼ��ƴ���㷨�о�
% 
% [i,j]=phase_correlation(image1,image2);

[ra,ca,a]=size(image1);
[rb,cb,b]=size(image2);
Xa=image1;Ya=image2;
% dis=i;%%%����ƫ����
dis=i;
EXa=zeros(abs(dis),ca,3)+255;%%%��������ͼ���ԵΪ��ɫ
EXb=zeros(abs(dis),cb,3)+255;
if dis>1 
  Xa=[EXa;image1];            %%%dis>0ʱ
  Ya=[image2;EXb];
elseif dis<-1
    Xa=[image1;EXa];
    Ya=[EXb;image2];
end
dm=j;%%%ƴ����,�ڴ˴��޶���Ȳ�����50pel
% if dm<=50
   A=Xa(:,1:(ca-dm-1),:);
   B1=Xa(:,(ca-dm):ca,:);
   B2=Ya(:,1:dm,:);
   B=imagefusion02(B1,B2);%%���ֵ��ӣ��ںϣ�
   C=Ya(:,(dm+1):cb,:);%%���ó��ڶ�ͼ��ʣ�ಿ��
% else
%     dm=50;
%     A=Xa(:,1:(ca-dm-1),:);
%    B1=Xa(:,(ca-dm):ca,:);
%    B2=Ya(:,(j-dm):j,:);
%    B=imagefusion02(B1,B2);%%���ֵ��ӣ��ںϣ�
%    C=Ya(:,(j+1):cb,:);%%���ó��ڶ�ͼ��ʣ�ಿ��
% end
    
   D=[A,B,C];%%�ۺϣ�ʵ��ƴ��
   %%%%�����ۻ����
   [r,c]=size(D);
   if dis>1 
       D=D(1:(r-dis),:,:);
   elseif dis<-1
       D=D((abs(dis)+1):r,:,:);
   end
       
%    figure,imshow(D);
 

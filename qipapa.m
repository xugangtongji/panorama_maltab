close all
I=imread('1.jpg');
G=rgb2gray(I);
ima=imadjust(G);
bw=im2bw(ima);
figure,imshow(bw)
level=graythresh(G);
bw2=im2bw(ima,level);
figure,imshow(bw2)
bw3=~bw2;
bw4 =bwareaopen(bw3, 20);
%bw4=imfill(~bw4,'hole');
figure,imshow(bw4)
bw5=~bw4;
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%������ɫ
R(~bw5)=255;
G(~bw5)=0;
B(~bw5)=0;
%������ɫ
R(bw5)=255;
G(bw5)=255;
B(bw5)=255;
rgb=cat(3,R,G,B);
figure,imshow(rgb)

%͸����
siz=size(I);
alpha=ones(siz(1),siz(2));
alpha(B==255)=0;
imwrite(rgb,'��_͸��.png','Alpha',alpha)
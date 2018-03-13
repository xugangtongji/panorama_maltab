clc;clear;
pana=imread('x1.jpg');
[m,n,r]=size(pana);
pana1(:,:,1)=R;
G=medfilt2(pana(:,:,2));
pana1(:,:,2)=G;
B=medfilt2(pana(:,:,3));
pana1(:,:,3)=B;
figure(1);imshow(pana1);
npana1=double([]);
npana1=norm(pana1);
figure(3);imshow(npana1,[]);
%%%%%%%%%
pana2(:,:,3)=B*0.8;
pana2(:,:,2)=G*1.1;
pana2(:,:,1)=R*0.9;
figure(2);imshow(pana2);
npana2=double([]);
npana2=norm(pana2);
figure(4);imshow(npana2,[]);
[m,n,r]=size(npana2);
num=0;
for i=1:m
    for j=1:n
        for k=1:r
            if npana2(i,j,k)~=npana1(i,j,k)
                num=num+1;
            end
        end
    end
end
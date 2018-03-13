clear
f = '12';
ext = 'jpg';
img1 = imread('111.jpg');
img2 = imread('222.jpg');
% img3 = imread('b3.jpg');

img0 = imMosaic(img2,img1,1);
% img0 = imMosaic(img1,img0,1);
figure,imshow(img0)
imwrite(img0,['K' f '.' ext],ext)
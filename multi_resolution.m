function T=multi_resolution(Xb,n)
%%%%%多分辨率分解
%%%%%% A=multi_resolution(Xb,n)
%%%% n-level  decomposition for Xb
[r1,c1,d1,N]=size(Xb);
for i=1:N
    Xb(:,:,1,N)=filter2(fspecial('gaussian'),Xb(:,:,1,N));%%默认高斯滤波器[3 3]，sigma=0.5
    Xb(:,:,2,N)=filter2(fspecial('gaussian'),Xb(:,:,2,N));
    Xb(:,:,3,N)=filter2(fspecial('gaussian'),Xb(:,:,3,N));
end
step=2^n;
for i=1:step:r1
    for j=1:step:c1
        T((i+step-1)/step,(j+step-1)/step,:,:)=Xb(i,j,:,:);
    end
end
% T(:,:,:,:)=imresize(Xb(:,:,:,:),1/step);
% Temp(:,:,:,:)=imresize(T(:,:,:,:),step);
% Terr(:,:,:,:)=Xb(:,:,:,:)-Temp(:,:,:,:);

% figure,imshow(A);




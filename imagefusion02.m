function C=imagefusion02(A,B)
%%%Í¼ÏñÈÚºÏ
[M,N,D]=size(A);
if D==3
    for i=1:(N-1)
        C(:,i,:)=round((double(A(:,i,:))*(N-i)+double(B(:,i,:))*i)/N);
    end
elseif D==1
    for i=1:(N-1)
        C(:,i)=round((double(A(:,i))*(N-i)+double(B(:,i))*i)/N);
    end
end

% figure,imshow(C/max(max(max(C))));





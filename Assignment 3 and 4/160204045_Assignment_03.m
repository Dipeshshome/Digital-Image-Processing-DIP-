im=[0 0 0 0 0 0 0;
   0 0 0 0 0 0 0;
   0 0 1 0 1 0 0;
   0 0 1 0 1 0 0;
   0 0 1 1 1 0 0;
   0 0 0 0 0 0 0;
   0 0 0 0 0 0 0];


figure;
imshow(im,'InitialMagnification',5000)


figure;

subplot(2,2,1);
imshow(im);
title('Original image');



[x,y]=size(im);
d=zeros(x,y);

m=[0 1 0; 1 1 1;0 1 0];

subplot(2,2,2);
imshow(im);
title('Mask image');

%Dilation
for s=2:x-1
    for t=2:y-1
        D=[im(s-1,t-1)*m(1) im(s-1,t)*m(2) im(s-1,t+1)*m(3) im(s,t-1)*m(4) im(s,t)*m(5) im(s,t+1)*m(6) im(s+1,t-1)*m(7) im(s+1,t)*m(8) im(s+1,t+1)*m(9)];
        d(s,t)=max(D);
    end
%     display(D);
    
end

subplot(2,2,3);
imshow(d);
title('Dialated image');

%subtracting to get output
subplot(2,2,4);
imshow(d-im);
title('Output Image');


figure;
imshow((d-im),'InitialMagnification',5000)

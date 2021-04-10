%Input Image
im=imread('input.png');
figure;
subplot(2,4,1);
imshow(im);
im=im2double(rgb2gray(im));

%Apllying Laplacian
S=padarray(a,[1 1],0,'both');
f1 = [0 1 0; 1 -4 1; 0 1 0];
I1 = S;
[row, col] = size(S);
for i = 1:row-2
   for j = 1:col-2 
      N = S(i:i+2, j:j+2);
      t1 = sum(sum(N.*f1));
      I1(i+1,j+1) = t1;
    end
end
b=I1(2:row-1,2:col-1);
subplot(2,4,2);
imshow(b,[]);

%Sharpen Image
c=S-I1;
c=(c(2:row-1,2:col-1));
subplot(2,4,3);
imshow(c);

%Sobel Filter
f1 = [-1 0 1; -2 0 2; -1 0 1];
f2 = [-1 -2 -1; 0 0 0; 1 2 1];

I1 = S;
I2 = S;

[row, col] = size(S);
    

for i = 1:row-2
   for j = 1:col-2 
      N = S(i:i+2, j:j+2);
      t1 = sum(sum(N.*f1));
      t2 = sum(sum(N.*f2));
      I1(i+1,j+1) = t1;
      I2(i+1,j+1) = t2;
    end
end

d=sqrt((I1.^2)+(I2.^2));
d=d(2:row-1,2:col-1);
[row1,col1]=size(d);
for i = 1:row1
   for j = 1:col1 
      if d(i,j)<0.1
          d(i,j)=0;
   
      end
   end
end
subplot(2,4,4);
imshow(d);


 %average filter   
 %out = medfilt2(magnitudeImage,[5 5]);
avg=[1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25];
S=padarray(d,[2 2],0,'both');
e = S;
for i = 1:row-4
    for j = 1:col-4  
        N = S(i:i+4, j:j+4);
        t1 = sum(sum(N.*avg));
        e(i+2,j+2) = t1;    
    end
end
[row1, col1] = size(e);
e=e(3:row1-2,3:col1-2);
subplot(2,4,5);
imshow(e);

%product of images
f=c.*e;
subplot(2,4,6);
imshow(f);


%addition of images
a_img=imadd(im,f);
subplot(2,4,7);
imshow(a_img);


%Applying power law transfromation
c=1;
gamma=1.5;
p_law=c*(a_img.^gamma);
subplot(2,4,8);
imshow(p_law);
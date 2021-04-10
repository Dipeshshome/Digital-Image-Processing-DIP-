%Input Image
Image = imread('input.png');
figure;
imshow(Image);
title('a');

img_gray = rgb2gray(Image);



%Apllying Laplacian
S=padarray(double(img_gray),[1 1],0,'both');
f1 = [0 1 0; 1 -4 1; 0 1 0];
b= S;
[row, col] = size(S);
for i = 1:row-2
   for j = 1:col-2 
      N = S(i:i+2, j:j+2);
      t1 = sum(sum(N.*f1));
      b(i+1,j+1) = t1;
    end
end
L_output=b(2:row-1,2:col-1);
figure;
imshow(L_output,[]);
title('b');


%Sharpen Image
sharp_image = S-b;
sharp_image=(sharp_image(2:row-1,2:col-1));
figure;
imshow(sharp_image,[]);
title('c');


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

sobel=sqrt((I1.^2)+(I2.^2));
sobel=sobel(2:row-1,2:col-1);
[row1,col1]=size(sobel);
for i = 1:row1
   for j = 1:col1 
      if sobel(i,j)<0.1
          sobel(i,j)=0;
   
      end
   end
end

figure;
imshow(sobel);
title('d');


 
    
%average filter   
avg = [1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25];
S=padarray(out,[2 2],0,'both');
out = S;
for i = 1:row-4
    for j = 1:col-4  
        N = S(i:i+4, j:j+4);
        t1 = sum(sum(N.*avg));
        out(i+2,j+2) = t1;    
    end
end

 [row1, col1] = size(out);
 out=out(3:row1-2,3:col1-2);
 figure;
 imshow(out);
 title('e');
 
 %ptoduct of images
 p_image = sharp_image .* out;
 figure;
 imshow(p_image);
 title('f');
 
 %addition of images
 a_image= imadd(double(img_gray),p_image);
 figure;
 imshow((a_image));
 title('g');
 
 
%Applying power law transfromation
D=im2double(img_gray);
[row,col]=size(D);
X=(zeros(row,col));
c=1;
Y = 0.5;

for i=1:row
    for j=1:col
        X(i,j)=(c*(D(i,j).^Y));
    end
end
figure;
imshow(X);
title('h');


%subplot
figure;
subplot(2,4,1);
imshow(Image);

subplot(2,4,2);
imshow(L_output,[]);

subplot(2,4,3);
imshow(sharp_image,[]);

subplot(2,4,4);
imshow(out,[]);

subplot(2,4,5);
imshow(sobel,[]);

subplot(2,4,6);
imshow(p_image,[]);

subplot(2,4,7);
imshow(a_image,[]);

subplot(2,4,8);
imshow(X);

 
    

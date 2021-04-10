
sigma = input('Enter the Sigma Value: ');
image = imread('RGB.png');
figure;
imshow(image);
title('Input image');

title('Gray image');
filter = 5; 

% rgb to gray 
img_gray = rgb2gray(image);
[row,col] = size(img_gray);
a = floor(filter/2);
display(a)

figure;
imshow(img_gray);
title('Gray image');

% new image with zero padding
paddedI = zeros(row + 2*a, col + 2*a,'uint8'); 
paddedI(3:row+2,3:col+2) = img_gray(:,:);
paddedI = im2double(paddedI);

figure;
imshow(paddedI);
title('Padded image');

% Gaussian Kernel
gaussian = zeros(filter,filter);

c = 1 /(2*pi*sigma^2);
for x = -a:a
    for y = -a:a
        t1= -(x^2 + y^2);
        t2= (2 * sigma^2);
        e = exp(t1 / t2);
        gaussian(x+a+1,y+a+1) = c * e;
    end
end

% Applying Gaussian Filter
[row,col] = size(paddedI);
for i = a+1:row-a
   for j = a+1:col-a
       t3 = paddedI(i-a : i+a, j-a : j+a);
       t4 = gaussian .* t3;
       t4 = sum(t4(:));
       paddedI(i,j) = t4;
   end
end

[row,col] = size(paddedI);
output = paddedI(a+1:row-a,a+1:col-a);

figure;
imshow(output); 
title('Output Image');


figure;
subplot(1,4,1);
imshow(image); 
title('Input image');
subplot(1,4,2);
imshow(img_gray); 
title('Gray image');
subplot(1,4,3);
imshow(paddedI);
title('Paded image');
subplot(1,4,4);
imshow(output); 
title('Output image');




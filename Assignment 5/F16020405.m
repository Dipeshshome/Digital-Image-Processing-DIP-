%Input Image
Image = imread('input.png');
figure;
imshow(Image);
title('a');

img_gray = rgb2gray(Image);

%Apllying Laplacian
L_filter = [0,1,0;1,-4,1;0,1,0];
L_output=imfilter(double(img_gray),L_filter);
figure;
imshow(L_output,[]);
title('b');

%Sharpen Image
sharp_image = double(img_gray) +  L_output;
figure;
imshow(sharp_image,[]);
title('c');


%Sobel Filter
magnitudeImage = imgradient(img_gray, 'Sobel');
figure;
imshow(magnitudeImage, []);
title('d');

 
    
 %average filter   
 %out = medfilt2(magnitudeImage,[5 5]);
 out = imfilter(magnitudeImage,ones(5)/25);
 figure;
 imshow(out,[]);
 title('e');
 
 %ptoduct of images
 p_image = sharp_image .* out;
 figure;
 imshow(p_image,[]);
 title('f');
 
 %addition of images
 a_image= imadd(double(img_gray),out);
 figure;
 imshow((a_image),[]);
 title('g');
 
 
%Applying power law transfromation
D=im2double(img_gray);
[row,col]=size(D);
X=(zeros(row,col));
c=1;
Y = 0.5

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
imshow(out, []);

subplot(2,4,5);
imshow(magnitudeImage, []);

subplot(2,4,6);
imshow(p_image, []);

subplot(2,4,7);
imshow(a_image, []);

subplot(2,4,8);
imshow(X, []);

 
    

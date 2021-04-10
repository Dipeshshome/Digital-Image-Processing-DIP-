%Read Images
Image=imread('Dipesh_RGB.png');
imtool(Image);
%Covert to grayscale
I=rgb2gray(Image);
figure;
imshow(I);
[row,col]=size(I);
P=zeros(1,256);
Q=zeros(1,256);
z=zeros(1,256);
a=zeros(1,256);
C=zeros(1,256);


%calculate and plot histogram

for i=1:row
    for j=1:col
               temp=I(i,j)+1;
               P(temp)=P(temp)+1;   
    end
end

figure;
bar(P);
title('Hist plot')
xlabel('1 to 256 pixel values')
ylabel('frequency')

%subplot
figure;
subplot(1,2,1);
imshow(I)
subplot(1,2,2);
bar(P);



%input from user gamma value
Y=input('Enter Gamma Value:');

D=im2double(I);
[row,col]=size(D);
X=(zeros(row,col));
c=1;
M=2^8-1;
%Applying power law transfromation

for i=1:row
    for j=1:col
        X(i,j)=(c*(D(i,j).^Y));
    end
end
figure;
imshow(X);
% figure;
% plot(D,X,'.-r');
X=uint8(X*M);

%histogram of transformed image

hist1=zeros(1,256);
for i=1:row
    for j=1:col
        t=X(i,j)+1;
        hist1(t)= hist1(t)+1;
    end
end
figure;
bar(hist1);
title('Hist plot')
xlabel('1 to 256 pixel values')
ylabel('frequency')


%subplot
figure;
subplot(1,2,1);
imshow(X)
subplot(1,2,2);
bar(hist1);


%Applying Brightness increase and decreasing

[row,col]=size(I);

A=input('Enter Theshold Value:');
for i=1:1:row
    for j=1:1:col
        if I(i,j)<A
        C(i,j)=I(i,j)*1.50;
        
        else
        C(i,j)=I(i,j)*0.75;
        end
    end
end
C=uint8(C);
figure;
imshow(C);

%histogram of transformed image
hist2=zeros(1,256);
for i=1:row
    for j=1:col
        tb=C(i,j)+1;
        hist2(tb)= hist2(tb)+1;
    end
end
figure;
bar(hist2);
title('Hist plot')
xlabel('1 to 256 pixel values')
ylabel('frequency')

%subplot
figure;
subplot(1,2,1);
imshow(C)
subplot(1,2,2);
bar(hist2);


%Applying log transformation

c = 1.9;

L = c*log(D+1);
figure;
imshow(L);

% figure;
% plot(D,L,'.-k');
L=uint8(L*M);
% imtool(L)


%histogram of transformed image
for i=1:row
    for j=1:col
               templ=L(i,j)+1;
               a(templ)=a(templ)+1;   
    end
end

figure;
bar(a);
title('Hist plot')
xlabel('1 to 256 pixel values')
ylabel('frequency')


%subplot
figure;
subplot(1,2,1);
imshow(L)
subplot(1,2,2);
bar(a);



%Applying Negation
Q=255-I;
figure;
imshow(Q);

%histogram of transformed image
for i=1:row
    for j=1:col
               temps=Q(i,j)+1;
               z(temps)=z(temps)+1;   
    end
end

figure;
bar(z);
title('Hist plot')
xlabel('1 to 256 pixel values')
ylabel('frequency')
% figure;
% plot(I,Q,'.-k');

%subplot
figure;
subplot(1,2,1);
imshow(Q)
subplot(1,2,2);
bar(z);







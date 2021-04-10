%Read Images
Image=imread('2+.jpg');
imtool(Image);
%Covert to grayscale
I=rgb2gray(Image);
figure;
imshow(I);
[row,col]=size(I);
P=zeros(1,256);
p=zeros(1,256);
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
%input from user gamma value
Y=input('Enter Gamma Value:');

D=im2double(I);
[row,col]=size(D);
X=(zeros(row,col));
c=1.5

%Applying power law transfromation

for i=1:row
    for j=1:col
        X(i,j)=c*(D(i,j).^Y);
    end
end
figure;
imshow(X);
X=uint8(X);

n=row*col;
pdf=zeros(1,256);
for i=1:256
    pdf(i)= p(i)/n;
end

cdf=zeros(1,256);
cdf(1)=pdf(1);
for i=2:256
    cdf(i)=cdf(i-1)+pdf(i);
end


filter=zeros(1,256);
for i=1:256
    filter(i)=round(255*cdf(i));
end

n_img=uint8(zeros(row,col));
for i=1:row
    for j=1:col
        t=X(i,j)+1;
        n_img(i,j)= filter(t);
    end
end

hist1=zeros(1,256);
for i=1:row
    for j=1:col
        t=n_img(i,j)+1;
        hist1(t)= hist1(t)+1;
    end
end

%histogram of transformed image

% hist1=zeros(1,256);
% for i=1:row
%     for j=1:col
%         t=X(i,j)+1;
%         hist1(t)= hist1(t)+1;
%     end
% end
figure;
bar(hist1);
title('Hist plot')
xlabel('1 to 256 pixel values')
ylabel('frequency')
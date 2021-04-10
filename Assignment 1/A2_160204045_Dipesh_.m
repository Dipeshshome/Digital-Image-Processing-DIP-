%Read Images
I1 = imread('A2_160204045_Dipesh_input_1.bmp');
imtool(I1);
I2 = imread('blank.jpg');
imtool(I2);
I4 = imread('blank.jpg');
I3 = imread('A2_160204045_Dipesh_input_2.bmp');
imtool(I3);
rgbcam1 = cat(3,I1,I1,I1);
rgbcam2 = cat(3,I3,I3,I3);
r=row/5
c=col/5

[row, col] = size(I2);
r=row/5
c=col/5

%Divide the two images into 5 rows and 5 colums and plot the combined image
 for c=1:3
 for i=1:r
     for j=1:c
          if I2(i,j,c) == 0
              I2(i,j,c) = rgbcam1(i,j,c);
              I2(i,j+50,c) = rgbcam2(i,j+50,c);
              I2(i,j+100,c) = rgbcam1(i,j+100,c);
              I2(i,j+150,c) = rgbcam2(i,j+150,c);
              I2(i,j+200,c) = rgbcam1(i,j+200,c);
              
         end
     end
 end
 end
 
 for c=1:3
 for i=61:120
     for j=1:50
          if I2(i,j,c) == 0
              I2(i,j,c) = rgbcam2(i,j,c);
              I2(i,j+50,c) = rgbcam1(i,j+50,c);
              I2(i,j+100,c) = rgbcam2(i,j+100,c);
              I2(i,j+150,c) = rgbcam1(i,j+150,c);
              I2(i,j+200,c) = rgbcam2(i,j+200,c);
              
         end
     end
 end
 end
 
 for c=1:3
 for i=121:180
     for j=1:50
          if I2(i,j,c) == 0
              I2(i,j,c) = rgbcam1(i,j,c);
              I2(i,j+50,c) = rgbcam2(i,j+50,c);
              I2(i,j+100,c) = rgbcam1(i,j+100,c);
              I2(i,j+150,c) = rgbcam2(i,j+150,c);
              I2(i,j+200,c) = rgbcam1(i,j+200,c);
              
         end
     end
 end
 end
 
 for c=1:3
 for i=181:240
     for j=1:50
          if I2(i,j,c) == 0
              I2(i,j,c) = rgbcam2(i,j,c);
              I2(i,j+50,c) = rgbcam1(i,j+50,c);
              I2(i,j+100,c) = rgbcam2(i,j+100,c);
              I2(i,j+150,c) = rgbcam1(i,j+150,c);
              I2(i,j+200,c) = rgbcam2(i,j+200,c);
              
         end
     end
 end
  end
for c=1:3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
 for i=241:300
     for j=1:50
          if I2(i,j,c) == 0
              I2(i,j,c) = rgbcam1(i,j,c);
              I2(i,j+50,c) = rgbcam2(i,j+50,c);
              I2(i,j+100,c) = rgbcam1(i,j+100,c);
              I2(i,j+150,c) = rgbcam2(i,j+150,c);
              I2(i,j+200,c) = rgbcam1(i,j+200,c);
              
         end
     end
 end
 end 
  

figure,imshow(I2),title('Combined Image')


% Rotate the image in 90 degree counterclockwise.
for c=1:3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
 for i=1:300
     for j=1:50
         I4(j,i,c) = I2(i,j,c);
         I4(j+50,i,c) = I2(i,j+50,c);
         I4(j+100,i,c) = I2(i,j+100,c);
         I4(j+150,i,c) = I2(i,j+150,c);
         I4(j+200,i,c) = I2(i,j+200,c);
                     
     end
 end
end

figure,imshow(I4),title('90 Degree Rotated Image')



















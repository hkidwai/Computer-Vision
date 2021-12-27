I = im2double(imread("method 1/venice1.jpg"));
I2 = rgb2gray(I);


figure 
subplot(2,1,1)
imshow(I);
subplot(2,1,2)
imshow(I2);

%snow
A = im2double(imread("method 1/snow1.jpg"));
A2 = rgb2gray(A);


figure 
subplot(2,1,1)
imshow(A);
subplot(2,1,2)
imshow(A2);

%myimg
B = im2double(imread("method 1/myimg1.jpg"));
B2 = rgb2gray(B);


figure 
subplot(2,1,1)
imshow(B);
subplot(2,1,2)
imshow(B2);

%myimg2
C = im2double(imread("method 1/myimg2.jpg"));
C2 = rgb2gray(C);


figure 
subplot(2,1,1)
imshow(C);
subplot(2,1,2)
imshow(C2);


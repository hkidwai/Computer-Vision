I = im2double(imread("excersize 4/method 2/venice3.jpg"));
Iadj = histeq(I);

figure 
subplot(2,1,1)
imshow(Iadj);
subplot(2,1,2)
imhist(Iadj)

%snow
A = im2double(imread("excersize 4/method 2/snow3.jpg"));
Aadj = histeq(A);

figure 
subplot(2,1,1)
imshow(Aadj);
subplot(2,1,2)
imhist(Aadj)

%myimgC
B = im2double(imread("excersize 4/method 2/myimgC.jpg"));
Badj = histeq(B);

figure 
subplot(2,1,1)
imshow(Badj);
subplot(2,1,2)
imhist(Badj)

%myimgD
C = im2double(imread("excersize 4/method 2/myimgD.jpg"));
Cadj = histeq(C);

figure 
subplot(2,1,1)
imshow(Cadj);
subplot(2,1,2)
imhist(Cadj)
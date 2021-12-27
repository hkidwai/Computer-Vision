I = im2double(imread("excersize 1/method 2/venice1.jpg"));
Ir = I(:,:, 1);
Ig = I(:,:, 2);
Ib = I(:,:, 3);

Igray = (Ir + Ig +Ib)/3;


figure 
subplot(2,1,1)
imshow(I);
subplot(2,1,2)
imshow(Igray);

%snow
A = im2double(imread("excersize 1/method 2/snow1.jpg"));
Ar = A(:,:, 1);
Ag = A(:,:, 2);
Ab = A(:,:, 3);

Agray = (Ar + Ag +Ab)/3;


figure 
subplot(2,1,1)
imshow(A);
subplot(2,1,2)
imshow(Agray);

%myimg1
B = im2double(imread("excersize 1/method 2/myimg1.jpg"));
Br = B(:,:, 1);
Bg = B(:,:, 2);
Bb = B(:,:, 3);

Bgray = (Br + Bg +Bb)/3;


figure 
subplot(2,1,1)
imshow(B);
subplot(2,1,2)
imshow(Bgray);

%myimg2
C = im2double(imread("excersize 1/method 2/myimg2.jpg"));
Cr = C(:,:, 1);
Cg = C(:,:, 2);
Cb = C(:,:, 3);

Cgray = (Cr + Cg +Cb)/3;


figure 
subplot(2,1,1)
imshow(C);
subplot(2,1,2)
imshow(Cgray);
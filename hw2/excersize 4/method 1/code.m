I = im2double(imread("excersize 4/method 1/venice3.jpg"));

figure 
subplot(2,1,1)
imshow(I);
subplot(2,1,2)
imhist(I)

Ihsv = rgb2hsv(I);
h=Ihsv(:,:,1);
s=Ihsv(:,:,2);
v=Ihsv(:,:,3);


Iadj = (imadjust(v, [0.2 0.48], [0 1]));

Iadj2 = hsv2rgb(cat(3, h, s, v));

figure 
subplot(2,1,1)
imshow(Iadj2);
subplot(2,1,2)
imhist(Iadj)

%snow
A = im2double(imread("excersize 4/method 1/snow3.jpg"));

figure 
subplot(2,1,1)
imshow(A);
subplot(2,1,2)
imhist(A)

Ahsv = rgb2hsv(A);
hA=Ahsv(:,:,1);
sA=Ahsv(:,:,2);
vA=Ahsv(:,:,3);


Aadj = (imadjust(vA, [0.55 0.95], [0 1]));

Aadj2 = hsv2rgb(cat(3, hA, sA, vA));

figure 
subplot(2,1,1)
imshow(Aadj2);
subplot(2,1,2)
imhist(Aadj)

%myimgC
B = im2double(imread("excersize 4/method 1/myimgC.jpg"));

figure 
subplot(2,1,1)
imshow(B);
subplot(2,1,2)
imhist(B)

Bhsv = rgb2hsv(B);
hB=Bhsv(:,:,1);
sB=Bhsv(:,:,2);
vB=Bhsv(:,:,3);


Badj = (imadjust(vB, [0.1 0.8], [0 1]));

Badj2 = hsv2rgb(cat(3, hB, sB, vB));

figure 
subplot(2,1,1)
imshow(Badj2);
subplot(2,1,2)
imhist(Badj)

%myimgD
C = im2double(imread("excersize 4/method 1/myimgD.jpg"));

figure 
subplot(2,1,1)
imshow(C);
subplot(2,1,2)
imhist(C)

Chsv = rgb2hsv(C);
hC=Chsv(:,:,1);
sC=Chsv(:,:,2);
vC=Chsv(:,:,3);


Cadj = (imadjust(vC, [0.15 0.8], [0 1]));

Cadj2 = hsv2rgb(cat(3, hC, sC, vC));

figure 
subplot(2,1,1)
imshow(Cadj2);
subplot(2,1,2)
imhist(Cadj)
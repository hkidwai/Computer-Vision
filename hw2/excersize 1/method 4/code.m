I = im2double(imread("excersize 1/method 4/venice1.jpg"));
Ihsv=rgb2hsv(I);

Ih = Ihsv(:,:,1);
Is = Ihsv(:,:,2);
Iv = Ihsv(:,:,3);


figure 
subplot(2,1,1)
imshow(I);
subplot(2,1,2)
imshow(hsv2rgb(cat(3,Ih,Is*0,Iv)))

%snow
A = im2double(imread("excersize 1/method 4/snow1.jpg"));
Ahsv=rgb2hsv(A);

Ah = Ahsv(:,:,1);
As = Ahsv(:,:,2);
Av = Ahsv(:,:,3);


figure 
subplot(2,1,1)
imshow(A);
subplot(2,1,2)
imshow(hsv2rgb(cat(3,Ah,As*0,Av)))

%myimg1
B = im2double(imread("excersize 1/method 4/myimg1.jpg"));
Bhsv=rgb2hsv(B);

Bh = Bhsv(:,:,1);
Bs = Bhsv(:,:,2);
Bv = Bhsv(:,:,3);


figure 
subplot(2,1,1)
imshow(B);
subplot(2,1,2)
imshow(hsv2rgb(cat(3,Bh,Bs*0,Bv)))

%myimg2
C = im2double(imread("excersize 1/method 4/myimg2.jpg"));
Chsv=rgb2hsv(C);

Ch = Chsv(:,:,1);
Cs = Chsv(:,:,2);
Cv = Chsv(:,:,3);


figure 
subplot(2,1,1)
imshow(C);
subplot(2,1,2)
imshow(hsv2rgb(cat(3,Ch,Cs*0,Cv)))
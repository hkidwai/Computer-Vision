I = im2double(imread("excersize 3/venice2.jpg"));
Ir = I(:,:, 1);
Ig = I(:,:, 2);
Ib = I(:,:, 3);

MeanR = mean2(Ir);
MeanG = mean2(Ig);
MeanB = mean2(Ib);

MeanAvg = mean2(MeanR+MeanG+MeanB);

Avg= ((Ir*0.6262) + (Ig*0.6346) + (Ib*0.4658)) * 1.7266;

figure 
subplot(2,1,1)
imshow(I);
subplot(2,1,2)
imshow(Avg)

%snow
A = im2double(imread("excersize 3/snow2.jpg"));
Ar = A(:,:, 1);
Ag = A(:,:, 2);
Ab = A(:,:, 3);

MeanRA = mean2(Ar);
MeanGA = mean2(Ag);
MeanBA = mean2(Ab);

MeanAvgA = mean2(MeanRA+MeanGA+MeanBA);

AvgA= ((Ar*0.3731) + (Ag*0.3059) + (Ab*0.3739)) * 1.0529;

figure 
subplot(2,1,1)
imshow(A);
subplot(2,1,2)
imshow(AvgA)

%myimgX
B = im2double(imread("excersize 3/myimgX.jpg"));
Br = B(:,:, 1);
Bg = B(:,:, 2);
Bb = B(:,:, 3);

MeanRB = mean2(Br);
MeanGB = mean2(Bg);
MeanBB = mean2(Bb);

MeanAvgB = mean2(MeanRB+MeanGB+MeanBB);

AvgB= ((Br*0.5662) + (Bg*0.4428) + (Bb*0.4266)) * 1.4658;

figure 
subplot(2,1,1)
imshow(B);
subplot(2,1,2)
imshow(AvgB)

%myimgY
C = im2double(imread("excersize 3/myimgY.jpg"));
Cr = C(:,:, 1);
Cg = C(:,:, 2);
Cb = C(:,:, 3);

MeanRC = mean2(Cr);
MeanGC = mean2(Cg);
MeanBC = mean2(Cb);

MeanAvgC = mean2(MeanRC+MeanGC+MeanBC);

AvgC = ((Cr*0.4990) + (Cg*0.4831) + (Cb*0.4455)) * 1.4356;

figure 
subplot(2,1,1)
imshow(C);
subplot(2,1,2)
imshow(AvgC)
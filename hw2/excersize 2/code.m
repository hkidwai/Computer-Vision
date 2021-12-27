I = im2double(imread("excersize 2/venice1.jpg"));
Ir = I(:,:, 1);
Ig = I(:,:, 2);
Ib = I(:,:, 3);

sepia_r = (Ir*0.393) + (Ig*0.679) + (Ib*0.189);
sepia_g = (Ir*0.349) + (Ig*0.686) + (Ib*0.168);
sepia_b = (Ir*0.272) + (Ig*0.534)+ (Ib*0.131);



figure 
subplot(2,1,1)
imshow(I);
subplot(2,1,2)
imshow(cat(3, sepia_r, sepia_g, sepia_b))

%snow
A = im2double(imread("excersize 2/snow1.jpg"));
Ar = A(:,:, 1);
Ag = A(:,:, 2);
Ab = A(:,:, 3);

sepia_r = (Ar*0.393) + (Ag*0.679) + (Ab*0.189);
sepia_g = (Ar*0.349) + (Ag*0.686) + (Ab*0.168);
sepia_b = (Ar*0.272) + (Ag*0.534)+ (Ab*0.131);


figure 
subplot(2,1,1)
imshow(A);
subplot(2,1,2)
imshow(cat(3, sepia_r, sepia_g, sepia_b))

%myimg1
B = im2double(imread("excersize 2/myimgA.jpg"));
Br = B(:,:, 1);
Bg = B(:,:, 2);
Bb = B(:,:, 3);

sepia_r = (Br*0.393) + (Bg*0.679) + (Bb*0.189);
sepia_g = (Br*0.349) + (Bg*0.686) + (Bb*0.168);
sepia_b = (Br*0.272) + (Bg*0.534)+ (Bb*0.131);


figure 
subplot(2,1,1)
imshow(B);
subplot(2,1,2)
imshow(cat(3, sepia_r, sepia_g, sepia_b))

%myimg2
C = im2double(imread("excersize 2/myimgB.jpg"));
Cr = C(:,:, 1);
Cg = C(:,:, 2);
Cb = C(:,:, 3);

sepia_r = (Cr*0.393) + (Cg*0.679) + (Cb*0.189);
sepia_g = (Cr*0.349) + (Cg*0.686) + (Cb*0.168);
sepia_b = (Cr*0.272) + (Cg*0.534)+ (Cb*0.131);



figure 
subplot(2,1,1)
imshow(C);
subplot(2,1,2)
imshow(cat(3, sepia_r, sepia_g, sepia_b))
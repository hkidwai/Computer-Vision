I = im2double(imread("excersize 5/method 1/myimgP.jpg"));
Ir = I(:,:, 1);
Ig = I(:,:, 2);
Ib = I(:,:, 3);

%High blue + green values with low reds = UNC blue!
aqua_r = (Ir*0.402) + (Ig*0.353) + (Ib*0.250);
aqua_g = (Ir*0.510) + (Ig*0.810) + (Ib*0.118);
aqua_b = (Ir*0.452) + (Ig*0.754)+ (Ib*0.603);

figure 
subplot(1,1,1)
imshow(cat(3, aqua_r, aqua_g, aqua_b))

%myimgQ
A = im2double(imread("excersize 5/method 1/myimgQ.jpg"));
Ar = A(:,:, 1);
Ag = A(:,:, 2);
Ab = A(:,:, 3);

Aaqua_r = (Ar*0.402) + (Ag*0.353) + (Ab*0.250);
Aaqua_g = (Ar*0.510) + (Ag*0.810) + (Ab*0.118);
Aaqua_b = (Ar*0.452) + (Ag*0.754)+ (Ab*0.603);

figure 
subplot(1,1,1)
imshow(cat(3, Aaqua_r, Aaqua_g, Aaqua_b))

%myimgR
B = im2double(imread("excersize 5/method 1/myimgR.jpg"));
Br = B(:,:, 1);
Bg = B(:,:, 2);
Bb = B(:,:, 3);

Baqua_r = (Br*0.402) + (Bg*0.353) + (Bb*0.250);
Baqua_g = (Br*0.510) + (Bg*0.810) + (Bb*0.118);
Baqua_b = (Br*0.452) + (Bg*0.754)+ (Bb*0.603);

figure 
subplot(1,1,1)
imshow(cat(3, Baqua_r, Baqua_g, Baqua_b))


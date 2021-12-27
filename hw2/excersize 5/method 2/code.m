
%%%% Next Filter %%%%
%Creating a filter to change the time of day; an "evening" filter. Also
%works very very well with the gaussian filter!
%myimgP
II = im2double(imread("excersize 5/method 2/myimgP.jpg"));
IIr = II(:,:, 1);
IIg = II(:,:, 2);
IIb = II(:,:, 3);

%low values everywhere to keep it dark
Ieve_r = (IIr*0.3) + (IIg*0.3) + (IIb*0.150);
Ieve_g = (IIr*0.113) + (IIg*.22) + (IIb*0.392);
Ieve_b = (IIr*0.152) + (IIg*0.354)+ (IIb*0.303);


Icolor = cat(3, Ieve_r, Ieve_g, Ieve_b);

%combine gaussian filter with the color filter
gauss = fspecial("gaussian", [663 1180], 400 );
max(gauss(:));
norm_gauss = gauss/max(gauss(:));
Ivig = Icolor.* norm_gauss;

figure 
subplot(1,1,1)
imshow(Ivig)


%myimgR
AA = im2double(imread("excersize 5/method 2/myimgR.jpg"));
AAr = AA(:,:, 1);
AAg = AA(:,:, 2);
AAb = AA(:,:, 3);

eve_r = (AAr*0.3) + (AAg*0.3) + (AAb*0.150);
eve_g = (AAr*0.113) + (AAg*.22) + (AAb*0.392);
eve_b = (AAr*0.152) + (AAg*0.354)+ (AAb*0.303);


Acolor = cat(3, eve_r, eve_g, eve_b);

gauss = fspecial("gaussian", [3024 4032], 1200 );
max(gauss(:));
norm_gauss = gauss/max(gauss(:));
Avig = Acolor.* norm_gauss;

figure 
subplot(1,1,1)
imshow(Avig)


%myimgQ
B = im2double(imread("excersize 5/method 2/myimgQ.jpg"));
Br = B(:,:, 1);
Bg = B(:,:, 2);
Bb = B(:,:, 3);

Bev_r = (Br*0.3) + (Bg*0.3) + (Bb*0.150);
Bev_g = (Br*0.113) + (Bg*.22) + (Bb*0.392);
Bev_b = (Br*0.152) + (Bg*0.354)+(Bb*0.303);


Bcolor = cat(3, Bev_r, Bev_g, Bev_b);

gauss = fspecial("gaussian", [2108 1134], 1000 );
max(gauss(:));
norm_gauss = gauss/max(gauss(:));
Bvig = Bcolor.* norm_gauss;

figure 
subplot(1,1,1)
imshow(Bvig)
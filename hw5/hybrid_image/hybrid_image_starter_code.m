close all; % closes all figures (remaining from previous run)

% read images and convert to single format
im1 = im2double(imread('./set5_far.jpg')); %Smooth		% "far" picture
im2 = im2double(imread('./set5_near.jpg')); 	%Busy		% "near" picture
im1 = rgb2gray(im1); % convert to grayscale
im2 = rgb2gray(im2);

im3 = im2double(imread('./set2_hybrid.jpg'));
% use this if you want to align the two images (e.g., by the eyes) and crop
% them to be of same size
[im2, im1] = align_images(im2, im1);

LPF1 = LPF(im1);
HPF1 = HPF(im2);


%% Choose the cutoff frequencies for the low-pass andhigh-pass filters
cutoff_low  = 50                % provide a value for the low-pass filter cutoff frequency (sigma of gaussian)
cutoff_high = 20               % provide a value for the high-pass filter cutoff frequency (sigma of gaussian)


%% Compute the hybrid image (you supply this code) 

hybridImage = imfuse(LPF1, HPF1, 'blend');

figure(10); imshow(hybridImage);




%im_12 = hybridImage(im1, im2, cutoff_low, cutoff_high);

%% Crop resulting image (optional)
%{
figure(1), hold off, imagesc(im12), axis image, colormap gray
disp('input crop points');
[x, y] = ginput(2);  x = round(x); y = round(y);
im12 = im12(min(y):max(y), min(x):max(x), :);
figure(1), hold off, imagesc(im12), axis image, colormap gray
%}

%% For your ONE favorite hybrid result, also show the Gaussian and Laplacian Pyramids
%% (use code from HW3)

 levels = 6 % number of pyramid levels (you may use more or fewer, as needed)

% display gaussian pyramid
%display_gaussian(hybridImage);
%display_laplacian(im3);

function display_gaussian(pyr)  % code is complete!
% displays the Gaussian pyramid
    montage(pyr);               
end

% display laplacian pyramid
function display_laplacian(pyr) % code is complete!
% displays the Laplacian pyramid
    levels = size(pyr, 1);      
    for i=1:levels-1
        pyr(i) = pyr(i) + 0.5;   % false color all levels except topmost by adding 0.5
    end
    montage(pyr);
end

%% Your functions appear below (or in separate files)

function LPF = LPF(im1) %Far/Smooth picture

%%%LPF for image 1%%%
    im1f = fft2(im1);
    imagesc(log(abs(im1f)));
    
    im1f = fftshift(im1f);
   
    imagesc(log(abs(im1f)));

    [height, width, ~] = size(im1f);
    
    G = fspecial('gaussian', [height, width], 50);
    G = G/max(G(:));

 
    im1_lpf = im1f .* G;
    
 
    imagesc(log(abs(im1_lpf))); colorbar;

    imagesc(log(abs(im1_lpf)), [-4 11]); colorbar;

    im1_lpf_image = real(ifft2(ifftshift(im1_lpf)));

    LPF = im1_lpf_image;
end


function HPF = HPF (im2) %Close/Busy picture
%%%LPF for image 2%%%
    im2f = fft2(im2);
    imagesc(log(abs(im2f)));
    
    im2f = fftshift(im2f);

    
    imagesc(log(abs(im2f))); colorbar; %%%% Where we find our sigma %%%%

    [height, width, ~] = size(im2f);
    
    G = fspecial('gaussian', [height, width], 20);
    
    
    G = G/max(G(:));

    imshow(G);
 
    im2_lpf = im2f .* G;
    

    imagesc(log(abs(im2_lpf))); colorbar;

    imagesc(log(abs(im2_lpf)), [-4 12]); colorbar;

    im2_lpf_image = real(ifft2(ifftshift(im2_lpf)));

    imshow(im2_lpf_image);
    %%%%%%%%%%%% HPF %%%%%%%%%%
    
    H = 1-G;

    im2_hpf = im2f .* H;
    %figure(8); 
    imagesc(log(abs(im2_hpf)), [-4 12]); colorbar;
    im2_hpf_image = real(ifft2(ifftshift(im2_hpf)));
    
   
    HPF = im2_hpf_image;
end




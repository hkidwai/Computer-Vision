% starter script for HW3

im_bg = im2double(imread('./samples/swim.jpg'));        % background image
im_obj = im2double(imread('./samples/bear.jpg'));       % source image

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mango_obj = im2double(imread('./samples/mango.jpg'));
%source URL: https://d2d8wwwkmhfcva.cloudfront.net/800x/d2lnr5mha7bycj.cloudfront.net/product-image/file/large_142dea31-50d8-4729-8e76-e03bf6cb5934.jpg
apple_bg = im2double(imread('./samples/apple.jpg')); 
%source URL: https://freshway.pk/wp-content/uploads/2020/09/Orange-shakri.jpg

eye_obj = im2double(imread('./samples/eye.jpg')); 
%source URL: https://p1.hiclipart.com/preview/959/663/784/halloween-app-zombie-camera-eye-00027-png-clipart.jpg
hand_bg = im2double(imread('./samples/hand.jpg')); 
%source URL: https://thumbs.dreamstime.com/b/open-hand-palm-to-camera-fingers-isolated-23079064.jpg

flower_obj = im2double(imread('./samples/flower.jpg')); 
%source URL: https://image.architonic.com/img_pro1-6/153/6069/instabilelab-news-2018-winter-flowers-02-sq.jpg
prayermat_bg = im2double(imread('./samples/prayermat.jpg')); 
%source URL: https://images-na.ssl-images-amazon.com/images/I/71A-tXxobTL.jpg

sun_obj = im2double(imread('./samples/sun.jpg'));
%source URL: https://www.howitworksdaily.com/wp-content/uploads/2012/03/Sun-200x200.jpg
space_bg = im2double(imread('./samples/space.jpg')); 
%source URL: https://images.newscientist.com/wp-content/gallery/hubble/007092c1094.jpg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% get source region mask (extracted object) from the user
objmask = getMask(im_obj);

% Next, do the following.  1) Align the source object (im_s) and mask (mask_s)
% with the background image.  2) Pad the object by 64 pixels each side to
% allow for feathering/blending overlap.

[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, 64);
mask_s = im2double(mask_s);

% Uncomment the following lines to see the results of getMask() and
% alignSource()

% figure; imshow(objmask);
 %figure; imshow(im_s);
 %figure; imshow(mask_s);


    % Let us try 3 different methods:
    %
    %   1.  Simple cut-and-paste.

im_cut_and_paste = cut_and_paste(im_bg, im_s, mask_s);

    %   2.  Feathering.
    
blur = 16;     % width of crossfade
im_feather = alpha_blend(im_bg, im_s, mask_s, blur);
    
    %   3.  Blending based on Laplacian pyramids.

levels = 6;         % levels in the Laplacian pyramid
im_blend = laplacian_blend(im_bg, im_s, mask_s, levels);
    % Plot the pictures, and comment on the results obtained.

figure; imshow(im_cut_and_paste);
figure; imshow(im_feather);
figure; imshow(im_blend);




function im_cut_and_paste = cut_and_paste(im_bg, im_s, mask_s)
 
        im_cut_and_paste = im_s .* mask_s + im_bg .* (1-mask_s);

end


function im_feather = alpha_blend(im_bg, im_s, mask_s, blur)
        
        im_feather = imgaussfilt(mask_s, blur) .* im_s + imgaussfilt((1-mask_s), blur) .* im_bg;
    
end

  
function im_blend = laplacian_blend(im_bg, im_s, mask_s, levels)   
%Laplacian level i of object * Gaussian level i of mask) + (Laplacian level i of background * (1-Gaussian level i of mask)
      %Collapse function call. I think I have the wrong variable
     pyr_laplacian_collapse(6);
    
     
end


%imgaussfilt(im, 2^(i-1));
 % calculate gaussian pyramid
%  use it to calculate laplacian pyramid 

function pyr_G = pyr_gaussian(im, levels)
% Computes Gaussian pyramid of image im over number of levels
    pyr_G = cell([levels, 1]);      % declare cell array of height "levels", and width 1
    
    pyr_G{1} = im;                  % level 1 is the orignal image
    for i=2:levels
        pyr_G{i} = imresize (imgaussfilt(pyr_G(i-1), 2) , 0.5); %confident this is correct
            
    end                             % level i is image at level i-1 filtered with Gaussian(2)
                                    % and then downsampled by factor of 2
end

function pyr_L = pyr_laplacian(im, levels)
% Computes Laplacian pyramid of image im over number of levels
    pyr_G = pyr_gaussian(im, levels);   % first compute the Gaussian pyramid

    pyr_L = cell([levels, 1]);      % declare cell array of height "levels", and width 1
    
    pyr_L{levels} = pyr_G{levels};  % top level of Laplacian pyramid is the same as that of Gaussian pyramid
    for i= levels-1
       pyr_L{i} = pyr_G{i} - imresize(pyr_G{i+1}, size(pyr_G(i)));
       %Second size function is there to make sure we specify an exact size
       %to avoid errors
                                    % level i of Laplacian is the difference of
                                    % Gaussian level i and upsampled level i+1
                                    % equalizes size by upsampling G{i+1}
    end
end


    
function display_gaussian(pyr)  % code is complete!
% displays the Gaussian pyramid
    montage(pyr);               
end
    
function display_laplacian(pyr) % code is complete!
% displays the Laplacian pyramid
    levels = size(pyr, 1);      
    for i=1:levels-1
        pyr{i} = pyr{i} + 0.5;   % false color all levels except topmost by adding 0.5
    end
    montage(pyr);
end
    
function im = pyr_laplacian_collapse(pyr)
% computes the image from its Laplacian pyramid
    levels = size(pyr, 1);
       pyr_L(im_s, levels) * pyr_G(mask_s, levels) + pyr_L(im_bg, levels) * (1-pyr_G(mask_s, levels));
       %Pretty sure this is the correct formula. I hope I've formatted it
       %correctly, but I'm pretty sure I'm using incorrect variables
       
end
       %}
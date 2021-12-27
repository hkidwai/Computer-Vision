close all;    % close all figure windows

I=im2double(imread('set5_original.jpg'));
figure(1); imshow(I);
%set 2 URL: https://www.xperiencepakistan.co.uk/wp-content/uploads/2018/09/cricket-1.jpg
%set 3 URL: https://st4.depositphotos.com/19960896/30833/i/600/depositphotos_308331954-stock-photo-rangoli-assorted-indian-sweets-mithai.jpg
%set 4 URL: https://lh3.googleusercontent.com/proxy/GO5Hccap8aFnT2xDDtqBu7TE-jAphdbrQt1zQJQUHGF2YuuHX2UJvor1gTiwW8j9NOd-0gqeBHAvF9EEbKXu8Np7DdVgKwCf2jHeCvxjPfOlecqcpsatXg8rBKLR_tWvnA
%set 5 URL: https://live.staticflickr.com/1122/1339049741_047cdba289_b.jpg


% The following lines can be helpful during debugging
% to avoid having to repeatedly draw the mask.  You can enter
% it once, save it as an image, and then comment the getMask()
% call and simply read the mask in from file.
%
mask = getMask(I);
% imwrite(im2double(mask), 'mask.png');
% mask = im2double(imread('mask.png'));   
% figure(2); imshow(mask);

fg = I .* mask;
bg = I .* (1 - mask);
%figure(3); imshow(fg);
%figure(4); imshow(bg);

radius = 3;            % choose this carefully for each image
disk = fspecial('disk', radius);

%figure; imshow(method1(I, mask, disk));
%figure; imshow(method2(I, mask, disk));
figure; imshow(method3(I, mask, disk));



function result = method1(I, mask, filter)
    I_blur = imfilter(I, filter, 'replicate');
    result = I_blur .* (1 - mask) + I .* mask;
end

function result = method2(I, mask, filter)
    bg = I .* (1 - mask);
    bg_blur = imfilter(bg, filter, 'replicate');
    result = bg_blur .* (1 - mask) + I .* mask;
end

function result = method3(I, mask, filter)
    % YOUR CODE HERE
    bg = I .* (1 - mask);
    bg_blur = imfilter(bg, filter, 'replicate');
    numerator = bg_blur .* (1 - mask) + I .* mask; %From Method 2
    
    m_blur = imfilter((1-mask), filter, 'replicate'); %Mask complement blur
    
    result = (bg_blur ./ m_blur); %Create the equation
    
    I_mask = double(isnan(result)) .* I; 
    
    result(isnan(result)) = 0; %Make the isNaNs 0
    
    result = result + I_mask ; %Combine for final result
    
  
end



function [mask, poly] = getMask(im)
% [mask, poly] = getMask(im)
% Asks user to draw polygon around input image.  Provides binary mask of
% polygon and a chain of all interior boundary points.

disp('Draw polygon around source object in clockwise order, q to stop')
figure(1), hold off, imagesc(im), axis image;
sx = [];
sy = [];
while 1
    figure(1)
    [x, y, b] = ginput(1);
    if b=='q'
        break;
    end
    sx(end+1) = x;
    sy(end+1) = y;
    hold on, plot(sx, sy, '*-');
end

mask = poly2mask(sx, sy, size(im, 1), size(im, 2));
if nargout>1
    [poly.x, poly.y] = mask2chain(mask);
end
end

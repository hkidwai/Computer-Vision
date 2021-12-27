
image = im2double(imread('./samples/urn.jpg'));

align_basic1 = align_basic(image);

align_better1 = align_better(image);

align_final1 = align_final(image);
   
    
function align_basic = align_basic(image)
[height, width] = size(image);
    height1 = round(height/3);
    
    blue = imcrop(image, [0 0 width height1]); 
    green = imcrop(image, [0 height1 width height1-1]); 
    red = imcrop(image, [0 height1*2 width height1-1]); 
    
%Norxcorr2 using red as a template
    redgreen = normxcorr2(green, red);
    redblue = normxcorr2(blue, red);

    
%Find peaks and calculate offsets
    [ypeak1, xpeak1] = find(redgreen==max(redgreen(:)));
    yoffSet1 = ypeak1-size(green,1);
    xoffSet1 = xpeak1-size(green,2);
%Check if offsets are past the +/- 30 boundry, and then change them if 
%they are
    if yoffSet1 > 30 
        yoffSet1 = 30;
    end
    
    if yoffSet1 < -30 
        yoffSet1 = -30;
    end
    
    if xoffSet1 > 30 
        xoffSet1 = 30;
    end
    
    if xoffSet1 < -30 
        xoffSet1 = -30;
    end
    
 %Translate the redgreen image by the offsets   
    redgreenimg = imtranslate(green, [xoffSet1,yoffSet1]);

  
 %Repeat for the redblue image 
    [ypeak2, xpeak2] = find(redblue==max(redblue(:)));
    yoffSet2 = ypeak2-size(blue,1);
    xoffSet2 = xpeak2-size(blue,2);

    if yoffSet2 > 30 
        yoffSet2 = 30;
    end
    
    if yoffSet2 < -30 
        yoffSet2 = -30;
    end
    
    if xoffSet2 > 30 
        xoffSet2 = 30;
    end
    
    if xoffSet2 < -30 
        xoffSet2 = -30;
    end
    
    redblueimg = imtranslate(blue, [xoffSet2,yoffSet2]);


 %Concatenate the two images
    align_basic = cat(3, red, redgreenimg, redblueimg);

    figure
    imshow(align_basic);


end

    
    
    
function align_better = align_better(image)


  [height, width] = size(image);
    height1 = round(height/3);
    
    blue = imcrop(image, [0 0 width height1]); 
    blue = imcrop(blue, [0.2*width 0.2*height1 0.6*width 0.6*height]);
    
    green = imcrop(image, [0 height1 width height1-1]); 
    green = imcrop(green, [0.2*width 0.2*height1 0.6*width 0.6*height]);
    
    red = imcrop(image, [0 height1*2 width height1-1]);   
    red = imcrop(red, [0.2*width 0.2*height1 0.6*width 0.6*height]);

%Norxcorr2 using red as a template
    redgreen = normxcorr2(green, red);
    redblue = normxcorr2(blue, red);

    
%Find peaks and calculate offsets
    [ypeak1, xpeak1] = find(redgreen==max(redgreen(:)));
    yoffSet1 = ypeak1-size(green,1);
    xoffSet1 = xpeak1-size(green,2);
    
%Check if offsets are past the +/- 30 boundry, and then change them if 
%they are
    if yoffSet1 > 30 
        yoffSet1 = 30;
    end
    
    if yoffSet1 < -30 
        yoffSet1 = -30;
    end
    
    if xoffSet1 > 30 
        xoffSet1 = 30;
    end
    
    if xoffSet1 < -30 
        xoffSet1 = -30;
    end
    
 %Translate the redgreen image by the offsets   
    redgreenimg = imtranslate(green, [xoffSet1,yoffSet1]);

  
 %Repeat for the redblue image 
    [ypeak2, xpeak2] = find(redblue==max(redblue(:)));
    yoffSet2 = ypeak2-size(blue,1);
    xoffSet2 = xpeak2-size(blue,2);

    if yoffSet2 > 30 
        yoffSet2 = 30;
    end
    
    if yoffSet2 < -30 
        yoffSet2 = -30;
    end
    
    if xoffSet2 > 30 
        xoffSet2 = 30;
    end
    
    if xoffSet2 < -30 
        xoffSet2 = -30;
    end
    
    redblueimg = imtranslate(blue, [xoffSet2,yoffSet2]);

  

 %Concatenate the two images
    align_better = cat(3, red, redgreenimg, redblueimg);
    
    
    figure
    imshow(align_better);

end

 


%Ok I'm pretty proud of this next function, even though it's not the most
%graceful way of doing the job, it works pretty cleverly (if I do say so 
%myself)!

%Unfortunately it's not perfect, but for some images it works beautifully 
%(like Khan and Urn)

function align_final = align_final (image) 
rowMeans = mean(image, 2); %Calculate the average values for the rows
columnMeans = mean(image, 1);%and the columns


rows2 = find(rowMeans(:,:) <= 0.3 & rowMeans(:,:) > 0); %Find all rows with
%mean values between 0.3 and 0
image(rows2,:) = [1]; %Give them the value of 1 (You'll see why in a bit!)
 
columns2 = find(columnMeans(:,:) <= 0.3 & columnMeans(:,:) > 0); %Same with 
%columns
image(:,columns2) = [1];

rowMeans2 = mean(image, 2); %Now recalculate the means for rows
columnMeans2 = mean(image, 1);%and columns with our new values

rows = find(rowMeans2(:,:)>= 0.9); %And now find all rows with averages 
%greater than or equal to 0.9. This also takes care of our row values of 0 
%to 0.3, since we turned them into 1 before!
image(rows,:) = [];% Delete them

columns = find(columnMeans2(:,:)>= 0.9);%Same with columns
image(:,columns) = [];

%Now we have a successfully trimmed the rows & columns for our cropping!

%%%%%%%%%%%%%%%%%  
[height, width] = size(image);
    height1 = round(height/3);
    
    blue = imcrop(image, [0 0 width height1]); 
    green = imcrop(image, [0 height1 width height1-1]); 
    red = imcrop(image, [0 height1*2 width height1-1]); 
    
    redgreen = normxcorr2(green, red);
    redblue = normxcorr2(blue, red);

    [ypeak1, xpeak1] = find(redgreen==max(redgreen(:)));
    yoffSet1 = ypeak1-size(green,1);
    xoffSet1 = xpeak1-size(green,2);
    
    
    if yoffSet1 > 30 
        yoffSet1 = 30;
    end
    
    if yoffSet1 < -30 
        yoffSet1 = -30;
    end
    
    if xoffSet1 > 30 
        xoffSet1 = 30;
    end
    
    if xoffSet1 < -30 
        xoffSet1 = -30;
    end
    
    redgreenimg = imtranslate(green, [xoffSet1,yoffSet1]);

    
    [ypeak2, xpeak2] = find(redblue==max(redblue(:)));
    yoffSet2 = ypeak2-size(blue,1);
    xoffSet2 = xpeak2-size(blue,2);

    if yoffSet2 > 30 
        yoffSet2 = 30;
    end
    
    if yoffSet2 < -30 
        yoffSet2 = -30;
    end
    
    if xoffSet2 > 30 
        xoffSet2 = 30;
    end
    
    if xoffSet2 < -30 
        xoffSet2 = -30;
    end
    
    redblueimg = imtranslate(blue, [xoffSet2,yoffSet2]);

    
    align_final = cat(3, red, redgreenimg, redblueimg);

    figure
    imshow(align_final);
   



end


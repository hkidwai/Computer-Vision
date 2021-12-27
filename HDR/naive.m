
images = ['./Memorial_SourceImages/memorial0061.png', './Memorial_SourceImages/memorial0062.png','./Memorial_SourceImages/memorial0063.png','./Memorial_SourceImages/memorial0064.png','./Memorial_SourceImages/memorial0065.png','./Memorial_SourceImages/memorial0066.png','./Memorial_SourceImages/memorial0067.png','./Memorial_SourceImages/memorial0068.png','./Memorial_SourceImages/memorial0069.png','./Memorial_SourceImages/memorial0070.png','./Memorial_SourceImages/memorial0071.png','./Memorial_SourceImages/memorial0072.png','./Memorial_SourceImages/memorial0073.png','./Memorial_SourceImages/memorial0074.png','./Memorial_SourceImages/memorial0075.png','./Memorial_SourceImages/memorial0076.png']
exposures = getData('./Memorial_SourceImages/memorial.hdr_image_list.txt');
exposures = 1./exposures;

hdr1 = makehdr_naive(ldrs, images);

function hdr = makehdr_naive(ldrs, exposures)
    % ldrs is an height x width x 3chanels x imagespage matrix which can be created with ldrs = cat(4, ldr1, ldr2, ...);
    % exposures is a vector of exposure times (in seconds) corresponding to ldrs
   
    [exposures,sortexp] = sort(reshape(exposures,1,1,1,[]));
    ldrs = ldrs(:,:,:,sortexp); %Sort exposures from dark to light

    ldrs_norm = ldrs ./ exposures;
    
    
    %Create naive HDR here
    hdr_image =  mean(ldrs_norm, 4);
    result1 = tonemap(hdr_image, 'AdjustSaturation', 3.0);
    
    figure();
    imshow(result1);
end
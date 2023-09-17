clear;
close all;

% 1. loads the sample image into a variable
I_rgb = imread("input/test_image_1.jpg");
% convert the input test image into grayscale
I = rgb2gray(I_rgb);

% 2. applies histogram operations (e.g. stretching) to enhance quality
stretched_I = imadjust(I);

% 3. creates a binary mask using the image of an empty table and thresholding
empty_rgb = imread("input/empty.jpg");
% convert the empty input image into grayscale
empty = rgb2gray(empty_rgb);
% apply histogram operations
stretched_empty = imadjust(empty);

% subtract the two images, for me subtract test from empty gives better solution
subtracted_I =  stretched_empty-stretched_I;
%creates a binary image and fill holes 
threshold_I = imbinarize(subtracted_I);
filled_thresholded_I = imfill(threshold_I,'holes');

% plot the first figure
figure(1);
subplot(1,2,1); 
imshow(I_rgb);
title('Original inpu image');
subplot(1,2,2); 
imshow(filled_thresholded_I);
title('Thresholded binary image');


% 4.applies a ball-detecting conv. kernel to find the round objects with MATLAB’s built-in kernel generator
H = fspecial('disk',40);
circular_obj = conv2(filled_thresholded_I,H, 'same'); 

% plot second figure
figure(2);
colormap('jet');
imagesc(circular_obj);
colorbar;
axis equal off;
title('Result of the convolution');

% 5. crops the round objects from the image one-by-one and return  
% 6. for each round object it gives a 2D position as a coordinate in cm
% 7. if the object is a ball, quantize its value based on color (histogram)
[coordinates, str] =  cropping_balls(circular_obj, I_rgb);

% 8. for each possible ball number print a list in which the presence and position 
%info is listed (i.e. is the ball with value X visible and if yes, where?)
if(any(str(:) == 16))
    disp("cue @ (" + string(coordinates(1,str == 16)) + ", " + string(coordinates(2, str == 16)) + ") ");
end
for i = 1:15  
    if( any(str(:) == i))
        disp(string(i) +"  @ (" + string(coordinates(1,str == i)) + ", " + string(coordinates(2, str == i)) + ") ");
    else
         disp(string(i) + "  is NOT VISIBLE");
    end
end

% sometimes the striped and full of the same color get mixed. This could be
% improved in the furute by defining more precise threshold values for them
% and by determining the intervalls for the HSV values to each color more
% precisely 



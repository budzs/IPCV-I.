function [Solution] = processor(input_img, verbose)
if nargin > 1
  verbose = verbose;
else
  verbose = false;
end
%Start by applying an RGB to grayscale operation
I_gray = rgb2gray(input_img);

%2. applies histogram operations (e.g. stretching) to enhance quality
I_streatched = stretch_lin(I_gray);

% an edge finding operation
I_edge = edge(I_streatched,'canny',.250,sqrt(2));


% %3. applies Fourier transform to get the phase and magnitude matrices

I_fft = fft2(I_streatched);
[~, M] = fourier_parts(I_fft);

I_edge_fft = edge(M,'canny',0.52);

%4. uses the frequency domain data to restore the rotation of the image
[H, theta, r] = hough(I_edge_fft);
P = houghpeaks(H, 1, 'threshold', ceil(0.3*max(H(:))));
lines = houghlines(M, theta, r, P, 'FillGap', 5, 'MinLength', 7);

if verbose
    figure(1);
    subplot(1,2,1);
    imshow(input_img);
    title("Original input image");
end
%angle = fftimg2angle(L);
I = imrotate(I_edge, lines.theta, 'bicubic', 'loose');
if verbose
    subplot(1,2,2);
    imshow(I);
    title("Straightened edge image");
end
%5. applies a Hough-like transformation to find the circles in the image
if verbose
    figure(2);
    subplot(1,2,1);
end
I_og_rot = imrotate(input_img, lines.theta, 'bicubic', 'loose');


[centers, radii, ~] = imfindcircles(I, [20,500], 'Sensitivity',0.88);
centers = centers(1:8,:); 
radiiStrong5 = radii(1:8);

%plotting figure 2
if verbose
    imshow(I_og_rot);

viscircles(centers, radiiStrong5,'EdgeColor','r');
title("Straightened original image with circles");
end
centers = sortrows(centers,2);
%plotting figure 3
if verbose
    figure(3);
end
Solution = zeros(4,2);
for i = 1:2:8
    j = i+1;
    ii = i;
    jj =j;
    
    if centers(j,1) < centers(i,1)
        ii = j;
        jj = i;
    end
    %6. examines the histogram inside the circles
    if verbose
    subplot(4,2,ii);
    imshow(imcrop(I, [centers(i,1)-45 centers(i,2)-40 90 90]));
    end
    caption = "false";
    a = sum(sum(imcrop(I, [centers(i,1)-45 centers(i,2)-40 90 90])));

    % threshold for x in circle
    if a > 616
        caption = "true";
        row = 0;
        col = 0;
        if mod(ii,2) == 0
            col = 2;
            row = ii / 2;
        else
            col = 1;
            row = (ii+1) / 2;
        end
        Solution(row,col) = 1;
    end
    title(caption, 'FontSize', 14);
    if verbose
        subplot(4,2,jj);
        imshow(imcrop(I, [centers(j,1)-45  centers(j,2)-40 90 90]));
    end
    b = sum(sum(imcrop(I, [centers(j,1)-45 centers(j,2)-40 90 90])));
    caption = "false";
    if b > 616
        caption = "true";
        row = 0;
        col = 0;
        if mod(jj,2) == 0
            col = 2;
            row = jj / 2;
        else
            col = 1;
            row = (jj+1) / 2;
        end
        Solution(row,col) = 1;
    end
    title(caption, 'FontSize', 14);
    
end
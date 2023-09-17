function pine = find_the_pine(I)
    HSV =rgb2hsv(I);
    B = squeeze(HSV(:, :, 1));
    pine = B < 0.15;
    
end
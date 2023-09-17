function output_img = stretch_log(input_img, c)
    %point-wise log transformation at every pixel
    input_img = c* log(double(input_img)+ 1); 
    
    minimum = min(input_img, [], 'all', 'linear');
    maximum = max(input_img, [], 'all', 'linear');
    %Stretch its dynamic range
    output_img = uint8((255/ (maximum- minimum))* (input_img- minimum));
end

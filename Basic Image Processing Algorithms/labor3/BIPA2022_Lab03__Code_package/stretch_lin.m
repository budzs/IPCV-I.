function output_img = stretch_lin(input_img)
    double_img = double(input_img);
    minimum= min(double_img(:));
    maximum= max(double_img(:));
    output_img= uint8((255/ (maximum- minimum))* (input_img- minimum));
end

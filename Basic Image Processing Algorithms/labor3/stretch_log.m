function output_img = stretch_log(input_img, c)
    input_img = c * log(double(input_img)+1);
    mini=min(input_img,[],'all','linear');
    maxi=max(input_img,[],'all','linear');
    output_img=uint8((255/(maxi-mini))*(input_img-mini));
end

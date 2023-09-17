function output_img = stretch_lin(input_img)
    hist=calc_hist_vector(input_img);
    min=find(hist,1)-1;
    max=find(hist,1,'last')-1;
    output_img=(255/(max-min))*(input_img-min);
end
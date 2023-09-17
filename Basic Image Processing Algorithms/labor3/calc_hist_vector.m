function hist_vector = calc_hist_vector(input_img)
    hist_vector=zeros(1,256);
    for x=1:size(input_img,1)
        for y=1:size(input_img,2)
            hist_vector(input_img(x,y)+1)=hist_vector(input_img(x,y)+1)+1;
        end
    end
end
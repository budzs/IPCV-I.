function output_img = myconv(input_img, kernel)
    n=(size(kernel,1)-1)/2;
    m=(size(kernel,2)-1)/2;
    padded_img = padarray(input_img, [n, m]);
    rotated_kernel = rot90(kernel, 2);
    
    for y = 1: size(input_img, 1)
        for x=1: size(input_img, 2)
            N = padded_img(y:y+2*n,x:x+2*m);
            output_img(y, x) = sum(N.*rotated_kernel, 'all');
        end
    end
end

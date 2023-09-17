function output_img = myconv(input_img, kernel)
    a=(size(kernel,1)-1)/2;
    b=(size(kernel,2)-1)/2;
    padded=padarray(input_img,[a b]);
    K_rot=rot90(rot90(kernel));
    for row = 1:size(input_img,1)
        for column = 1:size(input_img,2)
            output_img(row, column)=sum(padded(row:row+2*a,column:column+2*b).*K_rot,'all');
        end
    end
end

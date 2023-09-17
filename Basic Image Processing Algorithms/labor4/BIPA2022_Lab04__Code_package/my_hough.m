function [H] = my_hough(input_img)
    [x, y] = size(input_img);
    d = ceil(sqrt(x.^2 + y.^2));
    H = zeros((2*d+1), 180);
    
    for x = 1:x
        for y = 1:y
            if input_img(x, y)>0
                for i = 1: 180
                    r = round(x*cosd(i) + y*sind(i));
                    H(r+d+1, i) = H(r+d+1, i)+1; 
                end
            end
        end
    end
    
end

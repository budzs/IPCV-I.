function [coordinates, labels] = cropping_balls(input_img, original)
    % calculated coordinates are stored in "coordinates" array 
    coordinates = zeros(2, 16);
    window_size = 50;
    labels = zeros(1, 16);
    
    % iterate through the max possible ball number
    for n = 1:16
        [max_value, ind] = max(input_img(:));

        % breaking criterias: no maximum found, too low maximum value
        if (ind == 1) || max_value < 0.1
            break;
        end

        % crop the found ball and modify the result of the convolution
        [row, col] = ind2sub( size(input_img) , ind );
        output = imcrop(original, [col-window_size, row-window_size, 2*window_size, 2*window_size]);
        for i = 1:180
            for j = 1:180
                input_img(row-90+i, col-90+j)= 0;
            end
        end

        % label balls according to their colors ( I used HSV values)
        labels = color(output, labels, n);
        
        % 6. for each round object it gives a 2D position as a coordinate in cm
        [x,y] = position(row, col);
        coordinates(1,n) = x;
        coordinates(2,n) = y;
        
        % plot the third figure
        figure(3);
        subplot(4,4,n);
        imshow(output);
        str = "(" + string(x)+ ","+ string(y)+ ")";
        title(str);
        
        % plot the fourth figure
        figure(4);
        subplot(4,4,n);
        imshow(output);
        title(labels(1,n));
    end
end


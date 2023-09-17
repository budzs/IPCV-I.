function [x,y] = position(row, col)
    % calculate the position in cm with foot spot being the origin
    
    % get only the playing field 
    row = row -(2413-2200)/2;
    col = col -(1385-1100)/2;
    
    % calculate the row and col numbers from pixels to inches
    frac = 44/1100;
    x_norm = frac * col;
    y_norm = frac * row;
    
    % give the foot spot as origin
    origo_x = 66;
    origo_y = 22;
    
    % calculate the positions from the origin in cms
    x = (origo_x - x_norm)*2.54 ;
    y = (origo_y - y_norm)*2.54;
end

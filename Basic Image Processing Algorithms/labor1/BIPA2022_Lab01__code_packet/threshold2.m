function [TH] = threshold2(IMG, level)
    if size(IMG, 3) ~= 1
        IMG = rgb2gray(IMG);
        warning("Not grayscale so converting it to grayscale.")
    end
    
    TH = IMG > level;
    TH = uint8(TH) * 255;
        
end
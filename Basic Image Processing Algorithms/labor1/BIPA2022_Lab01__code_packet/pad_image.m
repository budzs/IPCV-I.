function [PAD] = pad_image(varargin)
%varargin is used with {}
    img = varargin{1};
    if length(varargin) == 2
        border_size = varargin{2};
    else
        border_size=10;
    end
    sizeImg = size(img);
    if length(sizeImg) == 3 && sizeImg(3) == 3
        img = rgb2gray(img);
        warning('Input image was converted to grayscale.');
    end
    PAD = zeros(sizeImg(1) + border_size * 2, sizeImg(2) + border_size * 2);
    PAD((border_size + 1) : border_size + sizeImg(1), (border_size + 1) : border_size + sizeImg(2)) = img;
    PAD = PAD./ 255;
end
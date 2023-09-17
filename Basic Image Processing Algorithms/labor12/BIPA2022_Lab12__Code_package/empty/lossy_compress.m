function [compressed] = lossy_compress(input_image, block_size, k)
    cut_size = floor(size(input_image)/block_size) * block_size;
    input_image = double(input_image);
    LIST = [];
    for r = 1:block_size:cut_size(1)
        for c = 1:block_size:cut_size(2)
            cropped  = input_image(r:r+block_size-1, c:c+block_size-1);
            LIST = [LIST; reshape(cropped.',1,[])];
        end
    end
        [a,b]=kmeans(LIST,k);
        compressed.LUT = a;
        compressed.DICT = b;
        compressed.cut_size = cut_size;
    
    
end

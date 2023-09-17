function [decompressed_image] = lossless_decompress(compressed_image)
        
    decompressed_image=[];
    for y=1:size(compressed_image,1)
        symbol=compressed_image{y,1}(1);
        row_pixels=[];
        for x=2:length(compressed_image{y})
            block = repmat(symbol, 1, compressed_image{y}(x));
            row_pixels = [row_pixels, block];
            symbol=~symbol;
        end
        decompressed_image(y,:)=row_pixels;
    end

        
end

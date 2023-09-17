function [decompressed] = lossy_decompress(compressed)

    LIST = compressed.DICT(compressed.LUT, :);
    decompressed=uint8(zeros(compressed.cut_size));
    block_size = sqrt(numel(LIST(1,:)));
    k=1;
    for r = 1:block_size:compressed.cut_size(1)
        for c = 1:block_size:compressed.cut_size(2)
            part = reshape(LIST(k,:), block_size, block_size);
            decompressed(r:r+block_size-1, c:c+block_size-1) = part;
            k=k+1;
        end
    end
    decompressed=uint8(decompressed);
    
end

function [compressed_image] = lossless_compress(noncompressed_image)
    
    
    compressed_image=cell(size(noncompressed_image,1),1);
    
    for y=1:size(noncompressed_image,1)
        counter=1;
        symbol=noncompressed_image(y,1);
        row_desc=symbol;
        for x=2:size(noncompressed_image,2)
            if noncompressed_image(y,x)== symbol
                counter=counter+1;
            else
                symbol= noncompressed_image(y,x);
                 row_desc = [row_desc, counter];
                 counter=1;
            end
            if x==size(noncompressed_image,2) && noncompressed_image(y,x)== symbol
                row_desc = [row_desc, counter];
            end
    
        end
        compressed_image{y}=row_desc;
    end

end
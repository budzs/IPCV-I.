function norm_HOG = pmHOG_extractHOG(I)
    h = size(I,1)/8;
    w = size(I,2)/8;
    norm_HOG = zeros(h-1,w-1,36);
    
    for x = 1:w-1
        for y = 1:h-1
            x0 = 8*(x-1)+1;
            y0 = 8*(y-1)+1;
            submatrix = I(y0:y0+15, x0:x0+15);
            feature_vector = zeros(1,1,36);
            
            a = [1:8; 1:8; 9:16; 9:16];
            b = [1:8; 9:16; 1:8; 9:16];
            for p = 1:4
                C = submatrix(a(p,:), b(p, :));
                [PHI, MAG] = pmHOG_gradient(C);
                H = pmHOG_binner(PHI, MAG);
                temp = (p-1)*9+1;
                feature_vector(temp:temp+8) = H;
            end
            
            feature_vector = feature_vector / sum(feature_vector);
            norm_HOG(y, x, :) = feature_vector;
        end
    end
end

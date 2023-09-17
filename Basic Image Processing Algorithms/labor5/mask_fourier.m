function newF = mask_fourier(F, x, y, r)
    F = fftshift(F);
    x = round(x);
    y = round(y);

    for n = 1:numel(x)
            x_1 = max(1, y(n)-r);
            x_2 = min(y(n)+r, size(F,1));
            y_1 = max(1, x(n)-r);
            y_2 = min(size(F,2), x(n)+r);
            F(x_1:x_2, y_1:y_2) =0+0*1i;      
    end


    newF = ifftshift(F);
end

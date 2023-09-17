function [x_tilde] = restoration_wiener_white(y, h, var_n)
    Y = fft2(y);
    H = psf2otf(h,size(Y));

    NSPR = var_n / var(y(:));

    
    R = conj(H)./(abs(H).^2+(NSPR));

    X_TILDE = R.*Y;

    x_tilde = ifft2(X_TILDE);
end

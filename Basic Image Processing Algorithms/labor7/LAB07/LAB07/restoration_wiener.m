function [x_tilde] = restoration_wiener(y, h, n)
   
    Y = fft2(y);
    N = fft2(n);
    H = psf2otf(h,size(Y));

    P_NN = N.*conj(N);
    P_XX = Y .* conj(Y);%Approximation


    
    R = conj(H)./(abs(H).^2+(P_NN./P_XX));

    X_TILDE = R.*Y;

    x_tilde = ifft2(X_TILDE);
end

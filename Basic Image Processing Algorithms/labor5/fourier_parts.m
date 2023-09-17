function [P, M] = fourier_parts(F)
    Y = fftshift(F);
    P = angle(Y);
    M = abs(Y);
end

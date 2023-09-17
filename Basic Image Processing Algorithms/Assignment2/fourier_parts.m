function [I_phase_log, I_magnitude_log] = fourier_parts(F)
    img_phase = angle(F);
    %img_magnitude = abs(F);
    I_magnitude_log = log(abs(F)+1);
    I_magnitude_log = fftshift(I_magnitude_log);
    I_phase_log = log(abs(img_phase)+1);
    I_phase_log = fftshift(I_phase_log);
    
end

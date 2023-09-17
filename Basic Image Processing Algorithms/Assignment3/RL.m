function [deconv_img] = RL(I,PFS)
    
    P = psf2otf(PFS,[size(I,1),size(I,2)]);

    r = im2double(I(:,:,1));
    g = im2double(I(:,:,2));
    b = im2double(I(:,:,3));

    r_og = r;
    g_og = g;
    b_og = b;

     for i=1:20
        r_og = r_og.*(ifft2(fft2(r./(ifft2(fft2(r_og).*P))).*conj(P)));
        g_og = g_og.*(ifft2(fft2(g./(ifft2(fft2(g_og).*P))).*conj(P)));
        b_og = b_og.*(ifft2(fft2(b./(ifft2(fft2(b_og).*P))).*conj(P)));
     end
    
    deconv_img = zeros(size(I));
    deconv_img(:,:,1) = r_og.*255;
    deconv_img(:,:,2) = g_og.*255;
    deconv_img(:,:,3) = b_og.*255;
    
    deconv_img = uint8(deconv_img);
end
function y_edgetapered = blur_edge(y)

    Y = fft2(y);
    h = fspecial('gaussian',60,10);
    H = psf2otf(h,size(Y));

    blurred_image = ifft2(Y.*H);

    wm = ones(70);
    wm = padarray(wm,1,1);
    wm = imresize(wm,size(Y),'bilinear');

    y_edgetapered = wm .* y + (1-wm).*blurred_image;

end

function B = ordered_dither(I, D)
    [h, w] = size(I);
    k = size(D, 1);
    DTM = repmat(D, [h/k, w/k]);
    B = I > DTM;
end

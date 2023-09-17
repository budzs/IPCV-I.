function [score] = detectPedestrians(I, sample_HOG)
    norm_HOG = pmHOG_extractHOG(I);
    H = sample_HOG .* norm_HOG;
    H = H(H>0.01);
    score = sum(H(:), 'omitnan');
end

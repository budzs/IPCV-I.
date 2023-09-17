function [PHI, MAG] = pmHOG_gradient(I) 
    I = double(I);
    Hx = [-1, 0, 1];
    Hy = [-1; 0; 1];
    
    X = imfilter(I, Hx, 'replicate', 'same');
    Y = imfilter(I, Hy, 'replicate', 'same');
    
    PHI = rad2deg(atan(Y./X));
    MAG = sqrt(X.^2+Y.^2);
    
end

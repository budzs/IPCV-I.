function [y, h, n] = degradation(x)
    h = fspecial('motion',21,11);
    n = randn(size(x,1),size(x,2)).*sqrt(0.001);
    y = n + imfilter(x,h,'replicate','same','conv');
end

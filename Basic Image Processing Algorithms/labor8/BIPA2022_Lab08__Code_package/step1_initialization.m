function [LUT, M] = step1_initialization(S, k)

    LUT = zeros(1,size(S,1));

    M = S(1:floor(size(S,1)/k):end-1,:);
 
end

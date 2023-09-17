function [O] = image_segmenter(I, k)

    S =  reshape(I,[size(I,1)*size(I,2),3]);
    [LUT, M] = mykmeans(S,k);
    A = M(LUT,:);
    O = reshape(A, size(I));

end

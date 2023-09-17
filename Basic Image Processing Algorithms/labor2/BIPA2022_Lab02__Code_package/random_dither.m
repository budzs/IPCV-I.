function B = random_dither(A)
    M = randi(size(A));
    A = M + A;
    B = A>1; 
end

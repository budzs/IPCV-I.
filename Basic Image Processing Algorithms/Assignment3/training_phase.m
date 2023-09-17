function MODEL = training_phase(T_cell)
    N = size(T_cell, 2);
    MODEL = zeros(N,9);
    for n = 1:N
        for k = 1:9
            H = laws_kernel(k);
            A = conv2(T_cell{n}, H,'same');
            MODEL(n,k) =  sum(sum(A.^2))/numel(A);
        end
    end
end

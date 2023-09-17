function [LUT, M, i] = mykmeans(S, k)
    [LUT, M] = step1_initialization(S, k);
    i = 0;
    converged = false;

    while ~converged && (i < 100)

        i = i + 1;
        LUT = step2_assignment(S, k, LUT, M);
        Mnew = step3_update(S, k, LUT, M);
        
        %Cheking for convergence
        error = norm(norm(M - Mnew).^2).^2;
        converged = error < 0.02;
        
        M = Mnew;
    end
end

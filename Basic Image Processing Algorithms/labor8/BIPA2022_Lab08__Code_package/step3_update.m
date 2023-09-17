function M = step3_update(S, k, LUT, M)
    for i = 1:k
        SS = S(LUT==i,:);
        M(i,:) = mean(SS); 
    end
end

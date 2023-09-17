function LUT = step2_assignment(S, k, LUT, M)
    for i = 1:size(S,1)
        x_i = S(i,:);
        d = zeros(1,k);        
        for j=1:k
            m = M(j,:);
            d(j) = sum((x_i - m).^2);
        end
        
        [~,LUT(i)] = min(d); 

    end
end

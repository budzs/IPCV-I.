function [r_vect, t_vect] = non_max_sup(A, k, p)
    r_vect = zeros(k, 1);
    t_vect = zeros(k, 1);
    maxi= k+1;
    while k > 0
        %[row, col] = find(ismember(A, max(A(:))));
        [~, I] = max(A(:));
        [r, theta] = ind2sub(size(A), I);
        r_vect( maxi-k) = r;
        t_vect( maxi-k) = theta;
        
        x_1 = max(1, r-p);
        x_2 = min(size(A,1), r+p);
        y_1 = max(1, theta-p);
        y_2 = min(size(A,2), theta+p);
        A(x_1:x_2, y_1:y_2) =0;
            

        k = k-1;
    end
end

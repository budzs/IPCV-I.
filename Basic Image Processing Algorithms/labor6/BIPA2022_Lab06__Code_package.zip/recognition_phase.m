function [ClassMap,D]  = recognition_phase(I, MODEL)
    ClassMap = zeros(size(I));
    
    for k = 1:9
        H = laws_kernel(k);
        B = conv2(I, H, 'same');
        N = ones(15)/(15*15);
        BB(:,:,k) = conv2(B.^2,N, 'same');
    end
    N = size(MODEL,1);
    D = zeros(size(I, 1),size(I, 2), 4);
    for x = 1 : size(I,1)
        for y = 1 : size(I,2)
            sum_abs_diff = zeros(1, N);
            for n = 1:N
                v = BB(x,y,:);
                m = MODEL(n,:);
                sum_abs_diff(n) = sum(abs(v(:) - m(:)));
            end
            D(x, y, :) = sum_abs_diff;
            [~, loc] = min(sum_abs_diff);
            ClassMap(x,y) = loc;
            
        end
    end
end

function H = laws_kernel(k)
    if  mod(k,1) ~= 0 || k < 1 || k >9
        error('Invalid value for k');
    end
    
    K{1} = 1/6* [1; 2; 1];
    K{2} = 1/2*[1; 0; -1];
    K{3} = 1/2*[1; -2; 1];
    b = ceil(double(k)/3);
    a = k - (b-1)*3;
    H = K{a} * K{b}';
    H = H';
end

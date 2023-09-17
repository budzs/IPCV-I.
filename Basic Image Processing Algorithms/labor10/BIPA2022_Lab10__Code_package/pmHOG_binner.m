function H = pmHOG_binner(PHI, MAG)
    H = zeros(1,9);
    for i = 1:9
        mini = -90 +20*(i-1);
        maxi = mini+20;
        LOG_MASK = (PHI >= mini & PHI < maxi);
        M = MAG(LOG_MASK);
        H(i) = sum(M, 'all');
    end
end

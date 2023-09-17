function labels = color(output, label, n)
% With given H, S, V intervalls label the balls accounding to heir colors
% and saves the information in the "labels" array 
    labels = label;
    H = squeeze(output(:, :, 1));
    S = squeeze(output(:, :, 2));
    V = squeeze(output(:, :, 3));

    %________________ 10,2 ___________________
    L1 = V > 120;
    L2 = H < 50;
    output_l = and(L1, L2);
    if sum(sum(output_l)) > 500
        if sum(sum(output_l)) < 1000
            labels(1,n) = 10;
        else
            labels(1, n) = 2;
        end
    end
    
    %________________ 8 ___________________
    L1  = V < 10;
    L2 = H < 50;

    output_l = and(L1, L2);
    if sum(sum(output_l)) > 2500
        labels(1, n) = 8;
    end

    %________________ "16" ___________________
    L1 = S >100;
    L3  = V > 100;
    L4 = H > 80;
    L5 = H < 180;
    output_l2 = and(L3, L4);
    output_l = and(L1, L5);
    output_l = and(output_l, output_l2);
    if sum(sum(output_l)) > 1700
        labels(1, n) = 16;
    end
    
    %________________ 3, 11 ___________________
    L1 = H < 150;
    L2 = H > 120;
    L3 = V < 20;

    output_l2 = and(L1, L2);
    output_l = and(output_l2, L3);
    if sum(sum(output_l)) > 150
        if  sum(sum(output_l)) > 450
            labels(1, n) = 3;
        else
            labels(1, n) = 11;
        end
    end

    %________________ 1, 9 ___________________
    L1 = H < 200;
    L2 = V > 30;
    L3 = V < 60;
    L4 = H > 120;

    output_l2 = and(L1, L2);
    output_l = and(L4, L3);
    output_l = and(output_l, output_l2);

    if sum(sum(output_l)) > 300
        if  sum(sum(output_l)) > 655
            labels(1, n) = 1;
        else
            labels(1, n) = 9;
        end
    end
    %________________ 6, 14 ___________________
    L1 = H < 30;
    L2 = H > 10;
    L3 = V < 15;
    L4 = V > 0;

    output_l = and(L1, L2);
    output_l2 = and(L3, L4);
    output_l = and(output_l, output_l2);

    if sum(sum(output_l)) > 900
        if  sum(sum(output_l)) > 1800
            labels(1, n) = 6;
        else
            labels(1, n) = 14;
        end
    end

    %________________ 7, 15 ___________________
    L1  = H < 80;
    L2 = H > 20;
    L3 = V < 10;
    L4 = V > 0;
    output_l = and(L1, L2);
    output_l2 = and(L3, L4);
    output_l = and(output_l, output_l2);

    if sum(sum(output_l)) > 1100
        if  sum(sum(output_l)) > 2100
            labels(1, n) = 7;
        else
            labels(1, n) = 15;
        end
    end

    %________________ 4, 12 ___________________
    L1 = H < 180;
    L4 = H > 100;
    L2 = V > 50;
    L3 = V < 90;
    L5 = S < 40;

    output_l2 = and(L1, L2);
    output_l = and(L4, L3);
    output_l = and(output_l, L5);
    output_l = and(output_l, output_l2);

    if sum(sum(output_l)) > 0
        if  sum(sum(output_l)) > 1180
            labels(1, n) = 4;
        else
            labels(1, n) = 12;
        end
    end
    
    %________________ 5, 13 ___________________
    L1 = H < 180;
    L2 = V > 25;
    L3 = V < 40;
    L4 = H > 120;

    output_l2 = and(L1, L2);
    output_l = and(L4, L3);
    output_l = and(output_l, output_l2);

    if sum(sum(output_l)) > 200
        if  sum(sum(output_l)) > 500
            labels(1, n) = 5;
        else
            labels(1, n) = 13;
        end
    end

    end
function [VOTED] = label(img, I_train)
    % 4. identifies the regions using a texture matching algorithm (Laws filter)
    % R
    I = mat2gray((I_train(:,:,1)));
    T1 = I(  1:158,    1:193);
    T2 = I(  159:345,  1:193);
    T3 = I(  1:158,    194:361);
    T4 = I(  159:345,  194:361);
    T_cell = {T1, T2, T3, T4};
    MODEL = training_phase(T_cell);
    R = mat2gray(img(:,:,1));
    [D_r] = recognition_phase(R, MODEL);

    %G
    I = mat2gray((I_train(:,:,2)));
    T1 = I(  1:158,    1:193);
    T2 = I(  159:345,  1:193);
    T3 = I(  1:158,    194:361);
    T4 = I(  159:345,  194:361);
    T_cell = {T1, T2, T3, T4};
    MODEL = training_phase(T_cell);
    R = mat2gray(img(:,:,2));
    [D_g] = recognition_phase(R, MODEL);

    % B
    I = mat2gray((I_train(:,:,3)));
    T1 = I(  1:158,    1:193);
    T2 = I(  159:345,  1:193);
    T3 = I(  1:158,    194:361);
    T4 = I(  159:345,  194:361);
    T_cell = {T1, T2, T3, T4};
    MODEL = training_phase(T_cell);
    R = mat2gray(img(:,:,3));
    [D_b] = recognition_phase(R, MODEL);

    G = zeros( 4);
    for x = 1 : size(R,1)
        for y = 1 : size(R,2)
            G =  D_b(x, y, :) + D_r(x, y, :) +D_g(x, y, :);
            [~, loc] = min(G);
            GUESS(x,y) = loc;
        end
    end
    
    % 5. filters/enhances the result based on majority voting
    VOTED = majority_voting(GUESS, 30);

end
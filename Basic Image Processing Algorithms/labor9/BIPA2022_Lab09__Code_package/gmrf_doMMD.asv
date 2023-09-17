function mrf=gmrf_doMMD(mrf)

         cmap = load('MRF_colormap.mat'); % the colormap
            h = mrf.imagesize(1);         % height of the image
            w = mrf.imagesize(2);         % width of the image
         cnum = mrf.classnum;             % number of classes
         beta = mrf.Beta;                 % value of parameter beta
    DeltaUmin = mrf.DeltaUmin;            % value of minimal necessary energy change
            T = mrf.T0;                   % temperature at the begining
            c = mrf.c;                    % the c constant parameter
     

           cycle = 0;
    summa_deltaE = 2 * DeltaUmin; % the first iteration is guaranteed

    while summa_deltaE > DeltaUmin 
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             BELOW THIS LINE            %
        %                                        %
        % ====================================== %
        
        summa_deltaE = 0;
        cycle = cycle+1;
        for y = 1:h
            for x = 1:w
                C = mrf.classmask(y, x);
                Cn = [];
                for y_ = max(y-1, 1):min(y+1, h)
                    for x_ = max(x-1, 1): min(x+1, w)
                        if x_ ~= x || y_ ~= y
                            Cn = ([Cn, mrf.classmask(y_, x_)]);
                        end
                    end
                end
            end
        end
        
        
        C_new = C;
        while C_new ==C && cnum ~= 1
            C_new = randi(cnum);
        end
        posterior_act = mrf.logProbs{C}(y, x);
        posterior_new = mrf.logProbs{C_new}(y, x);
        
        prior_act = -1* beta* sum(Cn ==C) + beta* sum(Cn ~=C);
        prior_new =-1* beta* sum(Cn ==C_new) + beta* sum(Cn ~=C_new);
        
        U_act = posterior_act +prior_act;
        U_new = posterior_new +prior_new;
        
        dU = U_new - U_act;
        
        if dU < 0 || rand() < exp(-dU/T)
            %Update
            summa_deltaE = summa_deltaE + abs(dU);
            mrf.classmask(y,x) = C_new;
            
        end    
        
        
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             ABOVE THIS LINE            %
        %                                        %
        % ====================================== %    
        
        imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
        %fprintf('Iteration #%i\n', cycle);
        title(['Class map in cycle ', num2str(cycle)]);
        drawnow;
    end
end

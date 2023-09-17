function [BGR] = swap_RB_dump(RGB)
    
    for y = 1 : size(RGB, 2) % every column
         for x = 1 : size(RGB, 1) % every row
             BGR(x, y, 1) = RGB(x, y, 3);
             BGR(x, y, 2) = RGB(x, y, 2);
             BGR(x, y, 3) = RGB(x, y, 1);
         end
    end    
end
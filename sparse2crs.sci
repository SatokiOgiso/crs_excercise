function [AA, IA, JA] = sparse2crs(A)
    AA = [];
    IA = [];
    JA = [];
    size_of_A = size(A);
    for i = 1:size_of_A(1);
        is_new_row = 1;
        for j = 1:size_of_A(2);
            if A(i, j) ~= 0
                AA = [AA, A(i, j)];
                JA = [JA, j];
                if is_new_row
                    is_new_row = 0;
                    IA = [IA, length(AA)];
                end
            end
        end
        if is_new_row
            is_new_row = 0;
            IA = [IA, length(AA)];
        end
    end
endfunction

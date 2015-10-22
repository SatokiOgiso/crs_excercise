function [result]=prod_matrix_vector_crs(AA, IA, JA, x)
    columns = length(IA); // resultの行数を取得
    result = zeros(columns, 1); // resultの大きさを定義
    rows = [IA, length(JA)+1]; //列の始まりと終わりを格納
    for i = 1:columns;
        //スパース行列の行ごとにベクトルとの内積を計算
        for j = rows(i):rows(i+1)-1;
            result(i) = result(i) + AA(j) * x(JA(j)); 
        end
    end
endfunction

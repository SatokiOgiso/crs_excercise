//CRS formatの疎行列に左から列ベクトルを掛ける

function [result]=prod_matrix_vector_crs(AA, IA, JA, x)
    columns = length(IA)-1; // resultの行数を取得
    result = zeros(columns, 1); // resultの大きさを定義
    for i = 1:columns
        //スパース行列の行ごとにベクトルとの内積を計算
        for j = IA(i):IA(i+1)-1
            print(%io(2), i)
            print(%io(2), j)
            if j ~= 0
                result(i) = result(i) + AA(j) * x(JA(j)); 
            end
        end
    end
endfunction

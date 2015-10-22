//課題3
exec('sparse2crs.sci');
exec('prod_matrix_vector_crs.sci');
exec('prod_matrix_t_vector_crs.sci');

A = sprand(1000, 1000, 0.005); A = A.' + A;

AL = tril(A, -1); // 下三角行列を求める
AD = diag(A); //対角成分のみの 1-dimentional array
[AAL, IAL, JAL] = sparse2crs(AL); //下三角行列をCRS形式に変換

x = ones(1000, 1); //適当にベクトルを作る

y = prod_matrix_vector_crs(AAL, IAL, JAL, x) + AD .* x + prod_matrix_t_vector_crs(AAL, IAL, JAL, x);// AL * x + AD * x + AL^T * x
    
norm_of_difference = norm(y - A * x);

print(%io(2), norm_of_difference)

//関数の読み込み
exec('prod_matrix_vector_crs.sci');
exec('sparse2crs.sci');

A = sprand(1000,1000,0.005); //疎行列生成

[AA, IA, JA] = sparse2crs(A); //CRS (CSR?)に変換

x = ones(1000, 1); //適当にベクトルを作る

AprodX  = prod_matrix_vector_crs(AA, IA, JA); //CRSで積を計算
norm_of_difference = norm(AprodX - A * x); //Scilabの演算と比較

print(%io(2), norm_of_difference)

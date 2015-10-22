exec('prod_matrix_vector_crs.sci');
exec('sparse2crs.sci');

A = sprand(1000,1000,0.005);

[AA, IA, JA] = sparse2crs(A);

x = ones(1000, 1);

AprodX  = prod_matrix_vector_crs(AA, IA, JA);
norm_of_difference = norm(AprodX - A * x);

print(%io(2), norm_of_difference)

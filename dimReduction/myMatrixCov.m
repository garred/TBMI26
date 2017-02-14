function matrixCov = myMatrixCov(x)
    M = [];
    for i = 1:size(x,1)
        for j = 1:i
            M(i,j) = myCov(x(i,:), x(j,:));
        end
    end
    matrixCov = M + M' - diag(diag((M)));
end
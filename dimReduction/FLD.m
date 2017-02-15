function W = FLD(X1, X2) 

    C = myMatrixCov(X1) + myMatrixCov(X2);
    W = inv(C) * (mean(X1,2) - mean(X2,2));

end
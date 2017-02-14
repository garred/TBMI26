function matrixCorr = myMatrixCorr(x)
    M = eye(size(x,1));
    for i = 1:size(x,1)
        for j = 1:(i-1)
            M(i,j) = myCorr(x(i,:), x(j,:));
        end
    end
    matrixCorr = M + M' - eye(size(x,1));
end
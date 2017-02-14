function V = myVar(x)
    % x is a matrix with N columns, the different rows are the number of
    % features
    N = size(x,2);
    M = mean(x,2);
    
    V = (1/N)*sum((x - M).^2,2);
end
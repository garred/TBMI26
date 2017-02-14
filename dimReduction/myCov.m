function cov = myCov(x,y)
    % x and y are different features
    N = size(x,2);
    Mx = mean(x,2);
    My = mean(y,2);
    
    cov = (1/N)*((x - Mx)*(y - My)');
end
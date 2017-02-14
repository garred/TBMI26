function Xnorm = myZnorm(x)
    Mx = mean(x,2);
    var = myVar(x);
    
    Xnorm = (x-Mx)./sqrt(var);
end
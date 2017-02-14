function C = myCorr(x,y)
    C = myCov(x,y)./sqrt(myVar(x).*myVar(y));
end
function [ output ] = h( x, P,T,F )
%H is the threshold function. 
%  P: polarity
%  T: threshold
%  F: feature used
    

    output = (P .* x(F,:) >= P .* T) * 2 - 1;   

end


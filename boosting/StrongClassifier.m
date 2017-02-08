function [ H ] = StrongClassifier( x, A,P,T,F )
%STRONGCLASSIFIER Summary of this function goes here

    H = sign(sum(A .* h(x, P,T,F) ));

end


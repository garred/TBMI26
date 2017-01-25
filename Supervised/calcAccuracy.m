function [ acc ] = calcAccuracy( cM )
%CALCACCURACY Takes a confusion matrix amd calculates the accuracy

%acc = 0; % Replace with your own code
succes = trace(cM);
totalData = sum(sum(cM));

acc = succes/totalData;

end


function [ cM ] = calcConfusionMatrix( Lclass, Ltrue )
%CALCCONFUSIONMATRIX Summary of this function goes here
%   Detailed explanation goes here
% Lclass is a vector with the output of the kNN calculations
% Ltrue is the desired output
% cM is the output. The confusion Matrix

classes = unique(Ltrue);
numClasses = length(classes);
cM = zeros(numClasses); % square matrix (numClases x numClases)

cM = confusionmat(Lclass, Ltrue); % can we use this?

end


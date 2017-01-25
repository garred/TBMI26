function [ labelsOut ] = kNN(X, k, Xt, Lt)
%KNN Your implementation of the kNN algorithm
%   Inputs:
%               X  - Features to be classified
%               k  - Number of neighbors
%               Xt - Training features
%               LT - Correct labels of each feature vector [1 2 ...]'
%
%   Output:
%               LabelsOut = Vector with the classified labels

ndata = size(X);
ndata = ndata(2);
ntrain = size(Xt);
ntrain = ntrain(2);

dist = zeros(ntrain,2);

neighbours = zeros(ntrain, ndata);
indices = 1:ntrain;

for i = 1:ndata
    x = X(:,i);
    dist(:,1) = sqrt(sum((Xt-x).^2));
    dist(:,2) = indices;
    
    dist = sortrows(dist);    
    neighbours(:, i) = dist(:, 2);
end


labelsOut = Lt(neighbours(1:k,:));

if k~=1
    labelsOut = mode(labelsOut, 1);
else
    labelsOut = labelsOut';
end


end
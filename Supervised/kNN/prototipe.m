k = 3;
L = Lt{2};

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


labels = L(neighbours(1:k,:));


output = mode(labels, 1);







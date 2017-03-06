function out = sample(values,probs)
% out = sample(values,probs)
%
% e.g. out = sample([1 2 3 4], [0.2 0.1 0.1 0.6]);
%
% will give out=1 with probability 0.2, out=2 with prob. 0.1 etc... 
%
% Modified to allow any real values, not just in the interval [0-1].

probs = exp(probs);
p = cumsum(probs(:));
p = p / p(end);
out = find(p > rand);
out = values(out(1));

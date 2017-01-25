function [ Y, L ] = runMultiLayer( X, W, V )
%RUNMULTILAYER Calculates output and labels of the net
%   Inputs:
%               X  - Features to be classified (matrix)
%               W  - Weights of the hidden neurons (matrix)
%               V  - Weights of the output neurons (matrix)
%
%   Output:
%               Y = Output for each feature, (matrix)
%               L = The resulting label of each feature, (vector) 

% Calculate net output
Y1 = tanh(W*X);
Y = tanh(V*[ones(1,size(Y1,2)); Y1]);


% Calculate classified labels (Hint, use the max() function)

[maxim,L] = max(Y);
end


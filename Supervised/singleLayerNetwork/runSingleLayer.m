function [ Y, L ] = runSingleLayer(X, W)
%EVALUATESINGLELAYER Summary of this function goes here
%   Inputs:
%               X  - Features to be classified (matrix)
%               W  - Weights of the neurons (matrix)
%
%   Output:
%               Y = Output for each feature, (matrix)
%               L = The resulting label of each feature, (vector) 

% Calculate net output
Y = W*X;

% Calculate classified labels (Hint, use the max() function)

[maxim,L] = max(Y);
end

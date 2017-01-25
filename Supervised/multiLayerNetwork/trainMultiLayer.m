function [Wout,Vout, trainingError, testError ] = trainMultiLayer(Xtraining,Dtraining,Xtest,Dtest, W0, V0,numIterations, learningRate )
%TRAINMULTILAYER Trains the network (Learning)
%   Inputs:
%               X* - Trainin/test features (matrix)
%               D* - Training/test desired output of net (matrix)
%               V0 - Weights of the output neurons (matrix)
%               W0 - Weights of the hidden neurons (matrix)
%               numIterations - Number of learning setps (scalar)
%               learningRate - The learningrate (scalar)
%
%   Output:
%               Wout - Weights after training (matrix)
%               Vout - Weights after training (matrix)
%               trainingError - The training error for each iteration
%                               (vector)
%               testError - The test error for each iteration
%                               (vector)

% Initiate variables
trainingError = nan(numIterations+1,1);
testError = nan(numIterations+1,1);
numTraining = size(Xtraining,2);
numTest = size(Xtest,2);
numClasses = size(Dtraining,1) - 1;
Wout = W0;
Vout = V0;

% Calculate initial error
Z = runMultiLayer(Xtraining, W0, V0);
Ytest = runMultiLayer(Xtest, W0, V0);
trainingError(1) = sum(sum((Z - Dtraining).^2))/(numTraining*numClasses);
testError(1) = sum(sum((Ytest - Dtest).^2))/(numTest*numClasses);

N = size(Xtraining,2); % num of samples
Y = Dtraining;

for n = 1:numIterations
Z = runMultiLayer(Xtraining, Wout, Vout);

numerator =  Vout'*(Z-Y);
Vout*Xtraining
tanprim = tanhprim(Vout*Xtraining));
numerator.*tanprim;

%grad_v = (2/N)*((Vout'*(Z - Y)).*tanhprim(Vout*tanh(Wout*Xtest)))*Xtest'; %Calculate the gradient for the output layer
grad_w = (2/N)*((Z-Y)*(V*X)); %..and for the hidden layer.


Wout = Wout; %Take the learning step.
Vout = Vout; %Take the learning step.

Z = runMultiLayer(Xtraining, Wout, Vout);
Ytest = runMultiLayer(Xtest, Wout, Vout);

trainingError(1+n) = sum(sum((Z - Y).^2))/(numTraining*numClasses);
testError(1+n) = sum(sum((Ytest - Dtest).^2))/(numTest*numClasses);
end

end


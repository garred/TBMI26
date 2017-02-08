function [Wout,Vout, trainingError, testError ] = trainMultiLayer(Xtraining,Dtraining,Xtest,Dtest, W0, V0,numIterations, learningRate, momentum )
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

X = Xtraining;
D = Dtraining;

Wout = W0;
Vout = V0;

trainingError = [];
testError = [];

classes = size(Dtraining, 1);
samplesTrain = size(Xtraining, 2);
samplesTest = size(Xtraining, 2);

old_dW = zeros(size(Wout));
old_dV = zeros(size(Vout));

time_init = clock;

for iteration = 1:numIterations
    
    % Estimate the remaining training time and print it
    if mod(iteration,100)==0
        r = (clock-time_init)*((numIterations-iteration)/(iteration+1));
        r(2) = r(1)*12 + r(2);
        r(3) = r(2)*30 + r(3);
        r(4) = r(3)*24 + r(4);
        r(5) = r(4)*60 + r(5);
        r = r(5)*60 + r(6);
        disp(iteration)
        disp(r)
    end
    
    % Calculate the forward activation
    z1 = Wout * X;
    z1 = [ones(1, size(z1,2)); z1];
    a1 = tanh(z1);
    z2 = Vout * a1;
    a2 = tanh(z2);

    % Propagate the backward errors
    e2 = (a2 - D) .* tanhprim(z2);
    e1 = (Vout'*e2) .* tanhprim(z1);
    
    % Calculate the weights updates and update
    dW = learningRate * e1(2:end,:) * X';
    dV = learningRate * e2 * a1';
    
    Wout = Wout - dW - momentum*old_dW;
    Vout = Vout - dV - momentum*old_dV;
    
    % Stores the last 
    old_dW = dW;
    old_dV = dV;
    
    % Store the training and test errors
    trainingError = [trainingError sum(sum((a2-D).^2))/(classes*samplesTrain)];
    a2 = runMultiLayer(Xtest, Wout, Vout);
    testError = [testError sum(sum((a2-Dtest).^2))/(classes*samplesTest)];
    
end

end


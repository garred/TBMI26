%% This script will help you test out your single layer neural network code

%% Select which data to use:

%% Select which data to use:

% 1 = dot cloud 1
% 2 = dot cloud 2
% 3 = dot cloud 3
% 4 = OCR data

dataSetNr = 4; % Change this to load new data 

[X, D, L] = loadDataSet( dataSetNr );

%% Select a subset of the training features

numBins = 2; % Number of Bins you want to devide your data into
numSamplesPerLabelPerBin = 100; % Number of samples per label per bin, set to inf for max number (total number is numLabels*numSamplesPerBin)
selectAtRandom = true; % true = select features at random, false = select the first features

[ Xt, Dt, Lt ] = selectTrainingSamples(X, D, L, numSamplesPerLabelPerBin, numBins, selectAtRandom );

% Note: Xt, Dt, Lt will be cell arrays, to extract a bin from them use i.e.
% XBin1 = Xt{1};
%% Modify the X Matrices so that a bias is added

Xtraining = Xt{1};
Xtest = Xt{2};

numTraining = size(Xtraining);
numTraining = numTraining(2);

numTest = size(Xtest);
numTest = numTest(2);

% The Training Data
Xtraining = [ones(1,numTraining); Xtraining];


% The Test Data
Xtest = [ones(1,numTest); Xtest];


%% Train your single layer network
% Note: You nned to modify trainSingleLayer() in order to train the network

numIterations = 400; % Change this, Numner of iterations (Epochs)
learningRate = 0.005; % Change this, Your learningrate

n = size(Xtraining,1);
k = length(unique(Lt{1}));

W0 = rand(k,n); % Change this, Initiate your weight matrix W. W is kxn where k = number of outputs and
                % n is the number of features + 1

[W, trainingError, testError ] = trainSingleLayer(Xtraining,Dt{1},Xtest,Dt{2}, W0,numIterations, learningRate );

% Plot errors
figure(1101)
clf
[mErr, mErrInd] = min(testError);
plot(trainingError,'k','linewidth',1.5)
hold on
plot(testError,'r','linewidth',1.5)
plot(mErrInd,mErr,'bo','linewidth',1.5)
hold off
title('Training and Test Errors, Single Layer')
legend('Training Error','Test Error','Min Test Error')

%% Calculate The Confusion Matrix and the Accuracy of the Evaluation Data
% Note: you have to modify the calcConfusionMatrix() function yourselfs.

[ Y, LSingleLayerTraining ] = runSingleLayer(Xtraining, W);
[ Y, LSingleLayerTest ] = runSingleLayer(Xtest, W);

% The confucionMatrix
cM = calcConfusionMatrix( LSingleLayerTest, Lt{2})

% The accuracy
acc = calcAccuracy(cM)

%% Plot classifications
% Note: You do not need to change this code.

if dataSetNr < 4
    plotResultSingleLayer(W,Xtraining,Lt{1}',LSingleLayerTraining,Xtest,Lt{2}',LSingleLayerTest)
else
    plotResultsOCR( Xtest, Lt{2}, LSingleLayerTest)
end

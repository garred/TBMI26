%% This script will help you test out your single layer neural network code

%% Select which data to use:

% 1 = dot cloud 1
% 2 = dot cloud 2
% 3 = dot cloud 3
% 4 = OCR data

dataSetNr = 4; % Change this to load new data 

[X, D, L] = loadDataSet( dataSetNr );

%plotCase(X,D)

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
% Note: You nned to modify trainMultiLayer() in order to train the network

numHidden = 100; % Change this, Number of hidde neurons 
numIterations = 40000; % Change this, Numner of iterations (Epochs)
learningRate = 0.005; % Change this, Your learningrate

numFeatures = size(Xtraining,1);
numClasses = length(unique(Lt{1}));


V0 = rand(numClasses,numHidden+1); % Change this, Initiate your weight matrix W
W0 = rand(numHidden,numFeatures); % Change this, Initiate your weight matrix V

%
[W,V, trainingError, testError ] = trainMultiLayer(Xtraining,Dt{1},Xtest,Dt{2}, W0,V0,numIterations, learningRate );

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

[ Y, LMultiLayerTraining ] = runMultiLayer(Xtraining, W, V);
[ Y, LMultiLayerTest ] = runMultiLayer(Xtest, W,V);

% The confucionMatrix
cM = calcConfusionMatrix( LMultiLayerTest, Lt{2})

% The accuracy
acc = calcAccuracy(cM)

%% Plot classifications
% Note: You do not need to change this code.

if dataSetNr < 4
    plotResultMultiLayer(W,V,Xtraining,Lt{1}',LMultiLayerTraining,Xtest,Lt{2}',LMultiLayerTest)
else
    plotResultsOCR( Xtest, Lt{2}, LMultiLayerTest )
end

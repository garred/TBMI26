%% Parameters

nF = 100;%50; %Number of features
nK = 32;%10; %Number of classifiers
nT = 400;%2000; %Train samples

%% Initializing

[image_train,x_train,y_train, image_test,x_test,y_test] = GiveMeWhatINeed(nF, nT);

%% Training

[P, T, F, A] = Adaboost( nK, x_train, y_train );

%% Testing

H = StrongClassifier(x_test, A,P,T,F);
sum(y_test==H)/size(y_test,2)

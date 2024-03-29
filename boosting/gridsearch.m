
%% Default grid search

levels = 10;
accuracy = [];
time = [];
nT = 100;%2000; %Train samples

for f = 1:levels
    nF = 2^f;
    [x_train,y_train, x_test,y_test] = GiveMeWhatINeed(nF, nT);
    
    for k = 1:levels
        nK = 2^k;
        
        time(f,k) = cputime;
        [P, T, F, A] = Adaboost( nK, x_train, y_train );
        time(f,k) = cputime - time(f,k)
        H = StrongClassifier(x_test, A,P,T,F);        
        accuracy(f,k) = sum(y_test==H)/size(y_test,2)        
    end    
end

imagesc(accuracy);

%% Grid search over # of weak classifiers

levels = 10;
accuracy = [];
time = [];
nT = 100;
nF = 100;

[image_train,x_train,y_train, image_test,x_test,y_test] = GiveMeWhatINeed(nF, nT);

for k = 1:levels
    nK = 2^k;

    time(k) = cputime;
    [P, T, F, A] = Adaboost( nK, x_train, y_train );
    time(k) = cputime - time(k)
    H = StrongClassifier(x_test, A,P,T,F);        
    accuracy(k) = sum(y_test==H)/size(y_test,2)        
end

plot(accuracy);


%% Experiments plotting faces

difficult = H~=y_test;
easy = H==y_test;
%% Plot mean difficult images
colormap(gray)
difficult_images = image_test(:,:,difficult & (y_test>0));
mean_difficult = mean(difficult_images,3);
imagesc(mean_difficult);
%% Plot mean easy images
easy_images = image_test(:,:,easy & (y_test>0));
mean_easy = mean(easy_images,3);
imagesc(mean_easy);
%% Plot all images
mean_all = mean(image_test(:,:,y_test>0),3);
imagesc(mean_all);

%% Plot easy-difficult ¿?¿?¿?
imagesc(mean_easy-mean_difficult)
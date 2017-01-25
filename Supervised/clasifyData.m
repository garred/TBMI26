function acc =  clasifyData(X, Lt, maxK)
    % X is the total amount of data divided in bins
    
    
    nbins = length(X);
    
    for k = 1:maxK
        for t = 1:nbins
            testData = X{t};
            Ltest = Lt{t};
            trainingData = [];
            Ltraining = [];
            for i = 1:nbins
               if(i~=t)
                   trainingData = [trainingData X{i}];
                   Ltraining = [Ltraining Lt{i}];
               end
            end
            
            labelsOut = kNN(testData, k, trainingData, Ltraining); 
            
            cM = calcConfusionMatrix(labelsOut,Ltest);
            
            acc(k,t) = calcAccuracy(cM);
        end
    end
    
    acc = mean(acc,2);
    

end
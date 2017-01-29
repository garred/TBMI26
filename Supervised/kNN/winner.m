function class = winner(labelsOut, distances)

    kPerClass = zeros(1, max(unique(labelsOut)));
    distancePerClass = zeros(1, max(unique(labelsOut)));
    
    index = 1:max(unique(labelsOut));
    
    for i = 1:max(unique(labelsOut))
        kPerClass(i) = size(labelsOut == i,2);
    end
    [maxim, kindex] = max(kPerClass);
    kindex
    if (size(kindex,2) > 1)
        for i = 1:max(unique(labelsOut))
            distancePerClass(i) = sum(distances(labelsOut == i));
        end
        [minim, dindex] = min(distancePerclass(i) > 0);
        class = dindex(1);
    else
        class = labelsOut(kindex);
    end
    

end



%     [repetitions, item] = hist(labelsOut,unique(labelsOut))
%     maximal_repetitions = repetitions==max(repetitions)
%     
%     if sum(maximal_repetitions) > 1
%         maximal_items = item(maximal_repetitions)
%         dist_indices = labelsOut(labelsOut
%         
%     else
%         class = item(maximal_repetitions)
%     end

function [ acc ] = calcAccuracy( cM )
%CALCACCURACY Takes a confusion matrix amd calculates the accuracy

%acc = 0; % Replace with your own code

colums = size(cM);
colums = colums(2);

nTotalSucces = 0;
nTotalFail = 0;
for i=1:colums
   nSucces = cM(i,i);
   nFail = sum(cM(:,i))-nSucces;
   
   nTotalSucces = nTotalSucces + nSucces;
   nTotalFail = nTotalFail + nFail;
end

acc = nTotalSucces/(nTotalSucces + nTotalFail);

end


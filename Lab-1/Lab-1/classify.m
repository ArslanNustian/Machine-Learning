function numb = classify(myImg,probMatrix,numClasses,labelNumbCount)
calculatedProbability = zeros(numClasses,1);
cumulativeProbability = 1;
for n = 1:numClasses
    for m = 1:size(myImg,1)
        pixelVal = myImg(m);
        prob = probMatrix(m,n);
        cumulativeProbability = cumulativeProbability*((prob^pixelVal)*((1-prob)^(1-pixelVal)));
    end
    calculatedProbability(n) = (labelNumbCount(n)/sum(labelNumbCount))*cumulativeProbability;
    cumulativeProbability = 1;
end
[maxNum,index] = max(calculatedProbability);
numb= index - 1;
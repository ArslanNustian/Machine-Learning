clear
clc
%--------------------------------------------------------------------------
% Data loading
%--------------------------------------------------------------------------
load mnist.mat
trainSize = 60000;
testSize = 10000;
numClasses = 10;
trainingImg = data(:,1:trainSize);
trainingLabel = label(1:trainSize);
testImg = data(:,trainSize+1:end);
testLabel = label(trainSize+1:end);
%--------------------------------------------------------------------------
% Training
%--------------------------------------------------------------------------
labelNumbCount = zeros(numClasses,1);
probMatrix = zeros(size(trainingImg,1),numClasses);
for n = 1:size(trainingImg,2)
    numbVal = trainingLabel(n);
    labelNumbCount(numbVal+1) = labelNumbCount(numbVal+1) + 1;
    for m = 1:size(trainingImg,1)
        probMatrix(m,numbVal+1) = probMatrix(m,numbVal+1) + trainingImg(m,n);
    end
end
for n = 1:numClasses
    probMatrix(:,n) = probMatrix(:,n)/labelNumbCount(n);
end
%--------------------------------------------------------------------------
% Testing
%--------------------------------------------------------------------------
count = 0;
for n = 1:size(testImg,2)
    myImg = testImg(:,n);
    numb = classify(myImg,probMatrix,numClasses,labelNumbCount);
    if(numb == testLabel(n))
        count = count + 1;
    end
end
accuracy = (count/size(testImg,2))*100;
%--------------------------------------------------------------------------
% For one image
%--------------------------------------------------------------------------
imageNumber = randi([1 testSize]);
myImg = testImg(:,imageNumber);
numb = classify(myImg,probMatrix,numClasses,labelNumbCount);
imshow(reshape(myImg,28,28),[]), title(strcat('Predicted Number: ',num2str(numb)));
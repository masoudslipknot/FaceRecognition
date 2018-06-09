function[counter]=faze2()
D = 'C:\Users\farazpc.ir\Downloads\Compressed\FaceData\FaceData\Database';
S = dir(fullfile(D,'*.jpg'));
p= dir(fullfile(D,'*.mat'));
trainingFeatures = zeros(100,72000);
traincell=cell(100,1);
T = table(100,64);
featureCount = 1;
counter=0;
for i=1:20
for k = (i-1)*10+2:(i-1)*10+6
    file1 = fullfile(D,S(k-1).name);
    im1 = imread(file1);
    im1 = rgb2gray(im1);
    test2 = fullfile(D,p(k-1).name);
   featurepositionstest(k)=load(test2);
   xposionstest=featurepositionstest(k).x;
   ypositionstest=featurepositionstest(k).y;
    movingPointstest= [xposionstest(1) ypositionstest(1); xposionstest(2) ypositionstest(2);xposionstest(3) ypositionstest(3); xposionstest(4) ypositionstest(4);xposionstest(5) ypositionstest(5)];
     fixedPointstest= [28 38; 70 38;43 59; 32 75 ; 63 75];
    tformtest = fitgeotrans(movingPointstest,fixedPointstest,'affine');
    im1 = imwarp(im1,tformtest,'OutputView',imref2d([100 , 100]));
    
    strsec=S(k).name;
    newone = extractAfter(S(k).name,'0');
    strone=erase(strsec, newone);
    %faceDetector = vision.CascadeObjectDetector();
    %bbox = step(faceDetector,im1);
    %im1 = imcrop(im1,[bbox(1)-15 bbox(2)-15 bbox(3)+15 bbox(4)+15]);
    im1 = imresize(im1,[250 250]);
    imshow(im1)
    %imshow(im1)
    %points = detectSURFFeatures(im1);
   %features = extractFeatures(im1, points);
    features = extractHOGFeatures(im1,'NumBins',20);
    %features = helperExtractDenseSURF(im1);
    %featuresreduced = features * surfPCA.pcaCoeff;
    %queryvector = helperEncodeFisherVector(featuresreduced,fisherGMM.GMModel);
     trainingFeatures(featureCount,:)=features;
    % traincell{featureCount,1}=features;
    % T(featureCount,featureCount)=features;
    
    trainingLabel{featureCount} = strone; 
    featureCount = featureCount + 1;

end
end
%T = array2table(trainingFeatures);
%faceclassifier = svmtrain(trainingFeatures,trainingLabel); 
faceclassifier= fitcecoc(trainingFeatures, trainingLabel);

%faceclassifier= fitcecoc(M, trainingLabel);
for y=1:20
    for number=(y-1)*10+6:(y-1)*10+10
        file1 = fullfile(D,S(number-1).name);
         test2 = fullfile(D,p(number-1).name);
    im2 = imread(file1);
    im2 = rgb2gray(im2);
    featurepositionstest(number)=load(test2);
   xposionstest=featurepositionstest(number).x;
   ypositionstest=featurepositionstest(number).y;
    movingPointstest= [xposionstest(1) ypositionstest(1); xposionstest(2) ypositionstest(2);xposionstest(3) ypositionstest(3); xposionstest(4) ypositionstest(4);xposionstest(5) ypositionstest(5)];
     fixedPointstest= [28 38; 70 38;43 59; 32 75 ; 63 75];
    tformtest = fitgeotrans(movingPointstest,fixedPointstest,'affine');
    im2 = imwarp(im2,tformtest,'OutputView',imref2d([100 , 100]));
    %faceDetector = vision.CascadeObjectDetector();
    %bbox = step(faceDetector,im2);
    %im2 = imcrop(im2,[bbox(1)-15 bbox(2)-15 bbox(3)+15 bbox(4)+15]);
    im2 = imresize(im2,[250 250]);
    %imshow(im2)
    %points = detectSURFFeatures(im2);
   %features = extractFeatures(im2, points,'SURFSize',128);
    distest = extractHOGFeatures(im2,'NumBins',20);
    personlabel = predict(faceclassifier,distest);
    str = S(number).name;
            newStr = extractAfter(S(number).name,'0');
            strr=erase(str,newStr);
            tf = strcmp(strr,personlabel);
            if tf==1
                counter=counter+1;
            end
    end

           

end
end
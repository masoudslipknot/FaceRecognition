# FaceRecognition
Detecting celebrities Faces.
Using matlab for detecting the celebrities faces by having 100 pictures as trained ones. 
After applying affine transformation on train pictures we use gabber filter to calculate all descriptive features.
also, for test pictures we have the same process then we have vectors for each picture 
which is about its descriptive features and by comparing them with test picture’s vectors we try to find similarities between them. 
we find the most possible picture (closer to train ones) and for 70 percent of cases it works correctly In Faze two we used HOG 
in order to describe face features after that we used SVM for classification. same process for test pictures 
and by predicting their labels. 
The codes worked for 85 percent of cases which is an improvement in comparison with first faze

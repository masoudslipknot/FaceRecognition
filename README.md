# FaceRecognition
<h3> Project Description.</h3>

Using Matlab for detecting the celebrities faces by having 100 pictures as trained ones. After applying an Affine transformation on train pictures we use Gabber filter to calculate all descriptive features.</br>
For test pictures, we pursue the same approach. For each picture we represent descriptive features by a vector and compare it with test pictures most similar picture among train ones is chosen and The label is set for the test image for 70 percent of cases the label is predicted correctly. </br>
In phase two HOG descriptor is used for Feature Extraction and SVM is used for classification. same approach is pursued to predict test images’ labels. In 85 percent of cases, images are classified as expected which is an improvement in comparison with the first phase.

<h2> Computer vision techniques </h2>
 Feature Extraction:</br>
In computer vision and image processing, a feature is a piece of information which is relevant for solving the computational task related to a certain application.</br>
This is the same sense as feature in machine learning and pattern recognition generally, though image processing has a very sophisticated collection of features. Features may be specific structures in the image such as points, edges or objects. Features may also be the result of a general neighborhood operation or feature detection applied to the image.

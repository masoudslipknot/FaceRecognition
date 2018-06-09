
function[newinfo]=comvision()
D = 'C:\Users\farazpc.ir\Downloads\Compressed\FaceData\FaceData\Database';
S = dir(fullfile(D,'*.jpg'));
p= dir(fullfile(D,'*.mat'));
featurepositions=[201,1];
xposions=[1,2,3,4,5];
ypositions=[1,2,3,4,5];
xpos=[100 150  135 110 155];
ypos=[100 95 120 135 130];
 newinfo=zeros(50,200);
clear featurepositions;
for i=1:20
for k = (i-1)*10+2:(i-1)*10+6
    file1 = fullfile(D,S(k-1).name);
    file2 = fullfile(D,p(k-1).name);
    featurepositions(k-1)=load(file2);
    xposions=featurepositions(k-1).x;
    ypositions=featurepositions(k-1).y;
    im1 = imread(file1);
    %imshow(im1);
    %hold on; plot(xposions, ypositions, '*r'); hold off;
   % hold on;
   % figure;
     movingPoints= [xposions(1) ypositions(1); xposions(2) ypositions(2);xposions(3) ypositions(3); xposions(4) ypositions(4);xposions(5) ypositions(5)];
     fixedPoints= [28 38; 70 38;43 59; 32 75 ; 63 75];
    tform = fitgeotrans(movingPoints,fixedPoints,'affine');
    B = imwarp(im1,tform,'OutputView',imref2d([100 , 100]));
    %imshow(B);
    Gab = Create_Gab_Kernels([10 10 10 10 10 10], 100);
     imggray = rgb2gray(B);
     imggab = Compute_Gabbed_Image(double(imggray),Gab);
         m=0;
        for q=1:60
        
          imgfinal=imggab{1,q};
          
          newinfo(k-1,1+m)=imgfinal(28,38);
          newinfo(k-1,2+m)=imgfinal(70 ,38);
          newinfo(k-1,3+m)=imgfinal(43 ,59);
          newinfo(k-1,4+m)=imgfinal(32 ,75);
          newinfo(k-1,5+m)=imgfinal(63 ,75);
          m=m+5;
          
        end
     
end
end
end




   
           
         
    
     
  
    
     
    


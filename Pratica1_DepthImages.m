close all;
clear all;
clc;
% ________________________________________________ Read the images
img_  = imread('./Images/original_depth_rm.png');
img1_ = imread('./Images/profundidad1.jpg');
img2_ = imread('./Images/profundidad2.jpg');
img3_ = imread('./Images/profundidad3.jpg');
img4_ = imread('./Images/profundidad4.jpg');
img5_ = imread('./Images/profundidad5_rm.jpg');
img6_ = imread('./Images/profundidad6.jpg');
% ___________________________ Convert to gray scale Convert to 1-channel)
img  = rgb2gray(img_);
img1 = rgb2gray(img1_);
img2 = rgb2gray(img2_);
img3 = rgb2gray(img3_);
img4 = rgb2gray(img4_);
img5 = rgb2gray(img5_);
img6 = rgb2gray(img6_);

%% ________________________________________________ 1. FILTRADO ESPACIAL
% ___________________________________________ Filters
% ___________________________ Mode Filter
img1Mode = uint8(colfilt(img1,[3 3],'sliding',@mode));
img2Mode = uint8(colfilt(img2,[3 3],'sliding',@mode));
img3Mode = uint8(colfilt(img3,[3 3],'sliding',@mode));
img4Mode = uint8(colfilt(img4,[3 3],'sliding',@mode));
img5Mode = uint8(colfilt(img5,[3 3],'sliding',@mode));
img6Mode = uint8(colfilt(img6,[3 3],'sliding',@mode));
% ___________________________ Median Filter
img1Median = medfilt2(img1, [3 3]); 
img2Median = medfilt2(img2, [3 3]);
img3Median = medfilt2(img3, [3 3]);
img4Median = medfilt2(img4, [3 3]);
img5Median = medfilt2(img5, [3 3]);
img6Median = medfilt2(img6, [3 3]);
% ___________________________ Maximum Filter
img1Maximum = imdilate(img1,strel('square', 3));
img2Maximum = imdilate(img2,strel('square', 3));
img3Maximum = imdilate(img3,strel('square', 3));
img4Maximum = imdilate(img4,strel('square', 3));
img5Maximum = imdilate(img5,strel('square', 3));
img6Maximum = imdilate(img6,strel('square', 3));
% ___________________________ Minimum Filter
img1Minimum = imerode(img1,strel('square', 3));
img2Minimum = imerode(img2,strel('square', 3));
img3Minimum = imerode(img3,strel('square', 3));
img4Minimum = imerode(img4,strel('square', 3));
img5Minimum = imerode(img5,strel('square', 3));
img6Minimum = imerode(img6,strel('square', 3));
% ___________________________ Average Filter
AverageFilter = fspecial('average', [3, 3]);

img1Average = imfilter(img1, AverageFilter);
img2Average = imfilter(img2, AverageFilter);
img3Average = imfilter(img3, AverageFilter);
img4Average = imfilter(img4, AverageFilter);
img5Average = imfilter(img5, AverageFilter);
img6Average = imfilter(img6, AverageFilter);
% ___________________________ Gauss Filter
GaussFilter = fspecial('gaussian', [5, 5]);

img1Gauss = imfilter(img1, GaussFilter);
img2Gauss = imfilter(img2, GaussFilter);
img3Gauss = imfilter(img3, GaussFilter);
img4Gauss = imfilter(img4, GaussFilter);
img5Gauss = imfilter(img5, GaussFilter);
img6Gauss = imfilter(img6, GaussFilter);
% ___________________________________________ Median Square Error
[m n] = size(img1);
numElements = m * n;
% _____ Mode Filter
MSEImg1Mode = sum(sum((img - img1Mode).^2))/numElements
MSEImg2Mode = sum(sum((img - img2Mode).^2))/numElements
MSEImg3Mode = sum(sum((img - img3Mode).^2))/numElements
MSEImg4Mode = sum(sum((img - img4Mode).^2))/numElements
MSEImg5Mode = sum(sum((img - img5Mode).^2))/numElements
MSEImg6Mode = sum(sum((img - img6Mode).^2))/numElements
% _____ Median Filter
MSEImg1Median = sum(sum((img - img1Median).^2))/numElements
MSEImg2Median = sum(sum((img - img2Median).^2))/numElements
MSEImg3Median = sum(sum((img - img3Median).^2))/numElements
MSEImg4Median = sum(sum((img - img4Median).^2))/numElements
MSEImg5Median = sum(sum((img - img5Median).^2))/numElements
MSEImg6Median = sum(sum((img - img6Median).^2))/numElements
% _____ Maximum Filter
MSEImg1Maximum = sum(sum((img - img1Maximum).^2))/numElements
MSEImg2Maximum = sum(sum((img - img2Maximum).^2))/numElements
MSEImg3Maximum = sum(sum((img - img3Maximum).^2))/numElements
MSEImg4Maximum = sum(sum((img - img4Maximum).^2))/numElements
MSEImg5Maximum = sum(sum((img - img5Maximum).^2))/numElements
MSEImg6Maximum = sum(sum((img - img6Maximum).^2))/numElements
% _____ Minimum Filter
MSEImg1Minimum = sum(sum((img - img1Minimum).^2))/numElements
MSEImg2Minimum = sum(sum((img - img2Minimum).^2))/numElements
MSEImg3Minimum = sum(sum((img - img3Minimum).^2))/numElements
MSEImg4Minimum = sum(sum((img - img4Minimum).^2))/numElements
MSEImg5Minimum = sum(sum((img - img5Minimum).^2))/numElements
MSEImg6Minimum = sum(sum((img - img6Minimum).^2))/numElements
% _____ Average Filter
MSEImg1Average = sum(sum((img - img1Average).^2))/numElements
MSEImg2Average = sum(sum((img - img2Average).^2))/numElements
MSEImg3Average = sum(sum((img - img3Average).^2))/numElements
MSEImg4Average = sum(sum((img - img4Average).^2))/numElements
MSEImg5Average = sum(sum((img - img5Average).^2))/numElements
MSEImg6Average = sum(sum((img - img6Average).^2))/numElements
% _____ Gauss Filter
MSEImg1Gauss = sum(sum((img - img1Gauss).^2))/numElements
MSEImg2Gauss = sum(sum((img - img2Gauss).^2))/numElements
MSEImg3Gauss = sum(sum((img - img3Gauss).^2))/numElements
MSEImg4Gauss = sum(sum((img - img4Gauss).^2))/numElements
MSEImg5Gauss = sum(sum((img - img5Gauss).^2))/numElements
MSEImg6Gauss = sum(sum((img - img6Gauss).^2))/numElements

% ___________________________________________ Save the results
% _____ img1
imwrite(img1Mode, './Results/Depth/Part1/Filters/img1Mode.jpg');
imwrite(img1Median, './Results/Depth/Part1/Filters/img1Median.jpg');
imwrite(img1Maximum, './Results/Depth/Part1/Filters/img1Maximum.jpg');
imwrite(img1Minimum, './Results/Depth/Part1/Filters/img1Minimum.jpg');
imwrite(img1Average, './Results/Depth/Part1/Filters/img1Average.jpg');
imwrite(img1Gauss, './Results/Depth/Part1/Filters/img1Gauss.jpg');
% _____ img2
imwrite(img2Mode, './Results/Depth/Part1/Filters/img2Mode.jpg');
imwrite(img2Median, './Results/Depth/Part1/Filters/img2Median.jpg');
imwrite(img2Maximum, './Results/Depth/Part1/Filters/img2Maximum.jpg');
imwrite(img2Minimum, './Results/Depth/Part1/Filters/img2Minimum.jpg');
imwrite(img2Average, './Results/Depth/Part1/Filters/img2Average.jpg');
imwrite(img2Gauss, './Results/Depth/Part1/Filters/img2Gauss.jpg');
% _____ img3
imwrite(img3Mode, './Results/Depth/Part1/Filters/img3Mode.jpg');
imwrite(img3Median, './Results/Depth/Part1/Filters/img3Median.jpg');
imwrite(img3Maximum, './Results/Depth/Part1/Filters/img3Maximum.jpg');
imwrite(img3Minimum, './Results/Depth/Part1/Filters/img3Minimum.jpg');
imwrite(img3Average, './Results/Depth/Part1/Filters/img3Average.jpg');
imwrite(img3Gauss, './Results/Depth/Part1/Filters/img3Gauss.jpg');
% _____ img4
imwrite(img4Mode, './Results/Depth/Part1/Filters/img4Mode.jpg');
imwrite(img4Median, './Results/Depth/Part1/Filters/img4Median.jpg');
imwrite(img4Maximum, './Results/Depth/Part1/Filters/img4Maximum.jpg');
imwrite(img4Minimum, './Results/Depth/Part1/Filters/img4Minimum.jpg');
imwrite(img4Average, './Results/Depth/Part1/Filters/img4Average.jpg');
imwrite(img4Gauss, './Results/Depth/Part1/Filters/img4Gauss.jpg');
% _____ img5
imwrite(img1Mode, './Results/Depth/Part1/Filters/img5Mode.jpg');
imwrite(img5Median, './Results/Depth/Part1/Filters/img5Median.jpg');
imwrite(img5Maximum, './Results/Depth/Part1/Filters/img5Maximum.jpg');
imwrite(img5Minimum, './Results/Depth/Part1/Filters/img5Minimum.jpg');
imwrite(img5Average, './Results/Depth/Part1/Filters/img5Average.jpg');
imwrite(img5Gauss, './Results/Depth/Part1/Filters/img5Gauss.jpg');
% _____ img6
imwrite(img6Mode, './Results/Depth/Part1/Filters/img6Mode.jpg');
imwrite(img6Median, './Results/Depth/Part1/Filters/img6Median.jpg');
imwrite(img6Maximum, './Results/Depth/Part1/Filters/img6Maximum.jpg');
imwrite(img6Minimum, './Results/Depth/Part1/Filters/img6Minimum.jpg');
imwrite(img6Average, './Results/Depth/Part1/Filters/img6Average.jpg');
imwrite(img6Gauss, './Results/Depth/Part1/Filters/img6Gauss.jpg');

% ___________________________________________ Edges
% _____ Originals
imgEdge = edge(img, 'log'); 

% _____ img1Filters
img1EdgeMode    = edge(img1Mode, 'prewitt');
img1EdgeMedian  = edge(img1Median, 'canny');
img1EdgeMaximum = edge(img1Maximum, 'prewitt');
img1EdgeMinimum = edge(img1Minimum, 'canny');
img1EdgeAverage = edge(img1Average, 'canny');
img1EdgeGauss   = edge(img1Gauss, 'canny');
% _____ img2Filters
img2EdgeMode    = edge(img2Mode, 'prewitt');
img2EdgeMedian  = edge(img2Median, 'canny');
img2EdgeMaximum = edge(img2Maximum, 'prewitt');
img2EdgeMinimum = edge(img2Minimum, 'prewitt');
img2EdgeAverage = edge(img2Average, 'canny');
img2EdgeGauss   = edge(img2Gauss, 'canny');
% _____ img3Filters
img3EdgeMode    = edge(img3Mode, 'prewitt');
img3EdgeMedian  = edge(img3Median, 'prewitt');
img3EdgeMaximum = edge(img3Maximum, 'prewitt');
img3EdgeMinimum = edge(img3Minimum, 'prewitt');
img3EdgeAverage = edge(img3Average, 'sobel');
img3EdgeGauss   = edge(img3Gauss, 'sobel');
% _____ img4Filters
img4EdgeMode    = edge(img4Mode, 'prewitt');
img4EdgeMedian  = edge(img4Median, 'sobel');
img4EdgeMaximum = edge(img4Maximum, 'prewitt');
img4EdgeMinimum = edge(img4Minimum, 'prewitt');
img4EdgeAverage = edge(img4Average, 'sobel');
img4EdgeGauss   = edge(img4Gauss, 'sobel');
% _____ img5Filters
img5EdgeMode    = edge(img5Mode, 'prewitt');
img5EdgeMedian  = edge(img5Median, 'prewitt');
img5EdgeMaximum = edge(img5Maximum, 'prewitt');
img5EdgeMinimum = edge(img5Minimum, 'prewitt');
img5EdgeAverage = edge(img5Average, 'roberts');
img5EdgeGauss   = edge(img5Gauss, 'sobel');
% _____ img6Filters
img6EdgeMode    = edge(img6Mode, 'prewitt');
img6EdgeMedian  = edge(img6Median, 'roberts');
img6EdgeMaximum = edge(img6Maximum, 'prewitt');
img6EdgeMinimum = edge(img6Minimum, 'prewitt');
img6EdgeAverage = edge(img6Average, 'roberts');
img6EdgeGauss   = edge(img6Gauss, 'roberts');

% ___________________________________________ Median Square Error
% _____ img1
MSEImg1ModeEdge    = sum(sum((imgEdge - img1EdgeMode).^2))/numElements
MSEImg1MedianEdge  = sum(sum((imgEdge - img1EdgeMedian).^2))/numElements
MSEImg1MaximumEdge = sum(sum((imgEdge - img1EdgeMaximum).^2))/numElements
MSEImg1MinumumEdge = sum(sum((imgEdge - img1EdgeMinimum).^2))/numElements
MSEImg1AverageEdge = sum(sum((imgEdge - img1EdgeAverage).^2))/numElements
MSEImg1GaussEdge   = sum(sum((imgEdge - img1EdgeGauss).^2))/numElements
% _____ img2
MSEImg2ModeEdge    = sum(sum((imgEdge - img2EdgeMode).^2))/numElements
MSEImg2MedianEdge  = sum(sum((imgEdge - img2EdgeMedian).^2))/numElements
MSEImg2MaximumEdge = sum(sum((imgEdge - img2EdgeMaximum).^2))/numElements
MSEImg2MinumumEdge = sum(sum((imgEdge - img2EdgeMinimum).^2))/numElements
MSEImg2AverageEdge = sum(sum((imgEdge - img2EdgeAverage).^2))/numElements
MSEImg2GaussEdge   = sum(sum((imgEdge - img2EdgeGauss).^2))/numElements
% _____ img3
MSEImg3ModeEdge    = sum(sum((imgEdge - img3EdgeMode).^2))/numElements
MSEImg3MedianEdge  = sum(sum((imgEdge - img3EdgeMedian).^2))/numElements
MSEImg3MaximumEdge = sum(sum((imgEdge - img3EdgeMaximum).^2))/numElements
MSEImg3MinumumEdge = sum(sum((imgEdge - img3EdgeMinimum).^2))/numElements
MSEImg3AverageEdge = sum(sum((imgEdge - img3EdgeAverage).^2))/numElements
MSEImg3GaussEdge   = sum(sum((imgEdge - img3EdgeGauss).^2))/numElements
% _____ img4
MSEImg4ModeEdge    = sum(sum((imgEdge - img4EdgeMode).^2))/numElements
MSEImg4MedianEdge  = sum(sum((imgEdge - img4EdgeMedian).^2))/numElements
MSEImg4MaximumEdge = sum(sum((imgEdge - img4EdgeMaximum).^2))/numElements
MSEImg4MinumumEdge = sum(sum((imgEdge - img4EdgeMinimum).^2))/numElements
MSEImg4AverageEdge = sum(sum((imgEdge - img4EdgeAverage).^2))/numElements
MSEImg4GaussEdge   = sum(sum((imgEdge - img4EdgeGauss).^2))/numElements
% _____ img5
MSEImg5ModeEdge    = sum(sum((imgEdge - img5EdgeMode).^2))/numElements
MSEImg5MedianEdge  = sum(sum((imgEdge - img5EdgeMedian).^2))/numElements
MSEImg5MaximumEdge = sum(sum((imgEdge - img5EdgeMaximum).^2))/numElements
MSEImg5MinumumEdge = sum(sum((imgEdge - img5EdgeMinimum).^2))/numElements
MSEImg5AverageEdge = sum(sum((imgEdge - img5EdgeAverage).^2))/numElements
MSEImg5GaussEdge   = sum(sum((imgEdge - img5EdgeGauss).^2))/numElements
% _____ img6
MSEImg6ModeEdge    = sum(sum((imgEdge - img6EdgeMode).^2))/numElements
MSEImg6MedianEdge  = sum(sum((imgEdge - img6EdgeMedian).^2))/numElements
MSEImg6MaximumEdge = sum(sum((imgEdge - img6EdgeMaximum).^2))/numElements
MSEImg6MinumumEdge = sum(sum((imgEdge - img6EdgeMinimum).^2))/numElements
MSEImg6AverageEdge = sum(sum((imgEdge - img6EdgeAverage).^2))/numElements
MSEImg6GaussEdge   = sum(sum((imgEdge - img6EdgeGauss).^2))/numElements

% ___________________________________________ Save the results
imwrite(imgEdge, './Results/Depth/Part1/Edges/imgEdge.jpg')
% _____ img1
imwrite(img1EdgeMode, './Results/Depth/Part1/Edges/img1EdgeMode.jpg')
imwrite(img1EdgeMedian, './Results/Depth/Part1/Edges/img1EdgeMedian.jpg')
imwrite(img1EdgeMaximum, './Results/Depth/Part1/Edges/img1EdgeMaximum.jpg')
imwrite(img1EdgeMinimum, './Results/Depth/Part1/Edges/img1EdgeMinimum.jpg')
imwrite(img1EdgeAverage, './Results/Depth/Part1/Edges/img1EdgeAverage.jpg')
imwrite(img1EdgeGauss, './Results/Depth/Part1/Edges/img1EdgeGauss.jpg')
% _____ img2
imwrite(img2EdgeMode, './Results/Depth/Part1/Edges/img2EdgeMode.jpg')
imwrite(img2EdgeMedian, './Results/Depth/Part1/Edges/img2EdgeMedian.jpg')
imwrite(img2EdgeMaximum, './Results/Depth/Part1/Edges/img2EdgeMaximum.jpg')
imwrite(img2EdgeMinimum, './Results/Depth/Part1/Edges/img2EdgeMinimum.jpg')
imwrite(img2EdgeAverage, './Results/Depth/Part1/Edges/img2EdgeAverage.jpg')
imwrite(img2EdgeGauss, './Results/Depth/Part1/Edges/img2EdgeGauss.jpg')
% _____ img3
imwrite(img3EdgeMode, './Results/Depth/Part1/Edges/img3EdgeMode.jpg')
imwrite(img3EdgeMedian, './Results/Depth/Part1/Edges/img3EdgeMedian.jpg')
imwrite(img3EdgeMaximum, './Results/Depth/Part1/Edges/img3EdgeMaximum.jpg')
imwrite(img3EdgeMinimum, './Results/Depth/Part1/Edges/img3EdgeMinimum.jpg')
imwrite(img3EdgeAverage, './Results/Depth/Part1/Edges/img3EdgeAverage.jpg')
imwrite(img3EdgeGauss, './Results/Depth/Part1/Edges/img3EdgeGauss.jpg')
% _____ img4
imwrite(img4EdgeMode, './Results/Depth/Part1/Edges/img4EdgeMode.jpg')
imwrite(img4EdgeMedian, './Results/Depth/Part1/Edges/img4EdgeMedian.jpg')
imwrite(img4EdgeMaximum, './Results/Depth/Part1/Edges/img4EdgeMaximum.jpg')
imwrite(img4EdgeMinimum, './Results/Depth/Part1/Edges/img4EdgeMinimum.jpg')
imwrite(img4EdgeAverage, './Results/Depth/Part1/Edges/img4EdgeAverage.jpg')
imwrite(img4EdgeGauss, './Results/Depth/Part1/Edges/img4EdgeGauss.jpg')
% _____ img5
imwrite(img5EdgeMode, './Results/Depth/Part1/Edges/img5EdgeMode.jpg')
imwrite(img5EdgeMedian, './Results/Depth/Part1/Edges/img5EdgeMedian.jpg')
imwrite(img5EdgeMaximum, './Results/Depth/Part1/Edges/img5EdgeMaximum.jpg')
imwrite(img5EdgeMinimum, './Results/Depth/Part1/Edges/img5EdgeMinimum.jpg')
imwrite(img5EdgeAverage, './Results/Depth/Part1/Edges/img5EdgeAverage.jpg')
imwrite(img5EdgeGauss, './Results/Depth/Part1/Edges/img5EdgeGauss.jpg')
% _____ img6
imwrite(img6EdgeMode, './Results/Depth/Part1/Edges/img6EdgeMode.jpg')
imwrite(img6EdgeMedian, './Results/Depth/Part1/Edges/img6EdgeMedian.jpg')
imwrite(img6EdgeMaximum, './Results/Depth/Part1/Edges/img6EdgeMaximum.jpg')
imwrite(img6EdgeMinimum, './Results/Depth/Part1/Edges/img6EdgeMinimum.jpg')
imwrite(img6EdgeAverage, './Results/Depth/Part1/Edges/img6EdgeAverage.jpg')
imwrite(img6EdgeGauss, './Results/Depth/Part1/Edges/img6EdgeGauss.jpg')

%% ________________________________________________ 2. Filtrado temporal
% Depth: img1Median , img5Gauss
% _____ img1Median
% _____ Low-Pass
 img1ILPF = IdealLowPassFilter(img1Median, 75, m, n);
 img1BLPF = ButterworthLowPassFilter (img1Median, 75, m, n);
 img1GLPF = GaussianLowPassFilter (img1Median, 50, m, n);
% _____ High-Pass
 img1IHPF = IdealHighPassFilter(img1Median, 20, m, n);
 img1BHPF = ButterworthHighPassFilter (img1Median, 30, m, n);
 img1GHPF = GaussianHighPassFilter (img1Median, 20, m, n);

% 
% _____ img5Gauss
% _____ Low-Pass
 img5ILPF = IdealLowPassFilter(img5Gauss, 50, m, n);
 img5BLPF = ButterworthLowPassFilter (img5Gauss, 50, m, n);
 img5GLPF = GaussianLowPassFilter (img5Gauss, 50, m, n);
% _____ High-Pass
 img5IHPF = IdealHighPassFilter(img5Gauss, 30, m, n);
 img5BHPF = ButterworthHighPassFilter (img5Gauss, 20, m, n);
 img5GHPF = GaussianHighPassFilter (img5Gauss, 20, m, n);

% ___________________________________________ Median Square Error
% _____ img1Median
% _____ Low-Pass
MSEImg1ILPF = sum(sum((double(img) - round(img1ILPF)).^2))/numElements
MSEImg1BLPF = sum(sum((double(img) - round(img1BLPF)).^2))/numElements
MSEImg1GLPF = sum(sum((double(img) - round(img1GLPF)).^2))/numElements
% _____ High-Pass
MSEImg1IHPF = sum(sum((double(img) - round(img1IHPF)).^2))/numElements
MSEImg1BHPF = sum(sum((double(img) - round(img1BHPF)).^2))/numElements
MSEImg1GHPF = sum(sum((double(img) - round(img1GHPF)).^2))/numElements
% _____ img5Gauss
% _____ Low-Pass
MSEImg5ILPF = sum(sum((double(img) - round(img5ILPF)).^2))/numElements
MSEImg5BLPF = sum(sum((double(img) - round(img5BLPF)).^2))/numElements
MSEImg5GLPF = sum(sum((double(img) - round(img5GLPF)).^2))/numElements
% _____ High-Pass
MSEImg5IHPF = sum(sum((double(img) - round(img5IHPF)).^2))/numElements
MSEImg5BHPF = sum(sum((double(img) - round(img5BHPF)).^2))/numElements
MSEImg5GHPF = sum(sum((double(img) - round(img5GHPF)).^2))/numElements

 
% ___________________________________________ Save the results
% _____ img1Median
% _____ Low-Pass
figure(1), imshow(img1ILPF, []);
saveas(figure(1), './Results/Depth/Part2/Low_Pass/img1IdealFilter.jpg');
figure(1), imshow(img1BLPF, []);
saveas(figure(1), './Results/Depth/Part2/Low_Pass/img1ButterworthFilter.jpg');
figure(1), imshow(img1GLPF, []);
saveas(figure(1), './Results/Depth/Part2/Low_Pass/img1GaussianFilter.jpg');
% _____ High-Pass
figure(1), imshow(img1IHPF, []);
saveas(figure(1), './Results/Depth/Part2/High_Pass/img1IdealFilter.jpg');
figure(1), imshow(img1BHPF, []);
saveas(figure(1), './Results/Depth/Part2/High_Pass/img1ButterworthFilter.jpg');
figure(1), imshow(img1GHPF, []);
saveas(figure(1), './Results/Depth/Part2/High_Pass/img1GaussianFilter.jpg');

% _____ img5Gauss
% _____ Low-Pass
figure(1), imshow(img5ILPF, []);
saveas(figure(1), './Results/Depth/Part2/Low_Pass/img5IdealFilter.jpg');
figure(1), imshow(img5BLPF, []);
saveas(figure(1), './Results/Depth/Part2/Low_Pass/img5ButterworthFilter.jpg');
figure(1), imshow(img5GLPF, []);
saveas(figure(1), './Results/Depth/Part2/Low_Pass/img5GaussianFilter.jpg');
% _____ High-Pass
figure(1), imshow(img5IHPF, []);
saveas(figure(1), './Results/Depth/Part2/High_Pass/img5IdealFilter.jpg');
figure(1), imshow(img5BHPF, []);
saveas(figure(1), './Results/Depth/Part2/High_Pass/img5ButterworthFilter.jpg');
figure(1), imshow(img5GHPF, []);
saveas(figure(1), './Results/Depth/Part2/High_Pass/img5GaussianFilter.jpg');

%% ________________________________________________ 3. Review
% ___________________________________________ Laplacian
% _____ img1
LaplacianFilter = fspecial('laplacian');
img1Laplacian = imfilter(img1, LaplacianFilter);
% _____ img2
LaplacianFilter = fspecial('laplacian');
img2Laplacian = imfilter(img2, LaplacianFilter);
% _____ img3
LaplacianFilter = fspecial('laplacian');
img3Laplacian = imfilter(img3, LaplacianFilter);
% _____ img4
LaplacianFilter = fspecial('laplacian');
img4Laplacian = imfilter(img4, LaplacianFilter);
% _____ img5
LaplacianFilter = fspecial('laplacian');
img5Laplacian = imfilter(img5, LaplacianFilter);
% _____ img6
LaplacianFilter = fspecial('laplacian');
img6Laplacian = imfilter(img6, LaplacianFilter);

% ___________________________________________ Save the results
imwrite(img1Laplacian, './Results/Depth/Part3/Laplacian/img1Laplacian.jpg');
imwrite(img2Laplacian, './Results/Depth/Part3/Laplacian/img2Laplacian.jpg');
imwrite(img3Laplacian, './Results/Depth/Part3/Laplacian/img3Laplacian.jpg');
imwrite(img4Laplacian, './Results/Depth/Part3/Laplacian/img4Laplacian.jpg');
imwrite(img5Laplacian, './Results/Depth/Part3/Laplacian/img5Laplacian.jpg');
imwrite(img6Laplacian, './Results/Depth/Part3/Laplacian/img6Laplacian.jpg');

% ___________________________________________ Edges
% _____ imgOriginal
imgEdgeILPF = IdealLowPassFilter(img, 15, m, n);
imgEdgeIHPF = IdealHighPassFilter(img, 200, m, n);
%
imgEdgeLP = double(img) - imgEdgeILPF;
imgEdgeHP = double(img) - imgEdgeILPF;
% _____ img1Median
img1EdgeBLPF = ButterworthLowPassFilter(img1Median, 10, m, n);
img1EdgeBHPF = ButterworthHighPassFilter(img1Median, 200, m, n);
%
img1EdgeLP = double(img1Median) - img1EdgeBLPF;
img1EdgeHP = double(img1Median) - img1EdgeBLPF;
% _____ img5Gauss
img5EdgeGLPF = GaussianLowPassFilter(img5Gauss, 200, m, n);
img5EdgeGHPF = GaussianHighPassFilter(img5Gauss, 200, m, n);
%
img5EdgeLP = double(img5Gauss) - img5EdgeGLPF;
img5EdgeHP = double(img5Gauss) - img5EdgeGLPF;

% ___________________________________________ Save the results
% _____ imgOriginal
figure(1), imshow(imgEdgeLP, []);
saveas(figure(1), './Results/Depth/Part3/Edges/imgOriginalLP.jpg');
figure(1), imshow(imgEdgeHP, []);
saveas(figure(1), './Results/Depth/Part3/Edges/imgOriginalHP.jpg');
% _____ img1Median
figure(1), imshow(img1EdgeLP, []);
saveas(figure(1), './Results/Depth/Part3/Edges/img1LP.jpg');
figure(1), imshow(img1EdgeHP, []);
saveas(figure(1), './Results/Depth/Part3/Edges/img1HP.jpg');
% _____ img5Gauss
figure(1), imshow(img5EdgeLP, []);
saveas(figure(1), './Results/Depth/Part3/Edges/img5LP.jpg');
figure(1), imshow(img5EdgeHP, []);
saveas(figure(1), './Results/Depth/Part3/Edges/img5HP.jpg');

% ________________________________________________ 4 Alternative Mode Filter
% _____ Size of kernel
  km = 3;
  kn = 3;
% _____ img1
img1AltMode = AlternativeModeFilter(img1, km, kn);
% _____ img2
img2AltMode = AlternativeModeFilter(img2, km, kn);
% _____ img3
img3AltMode = AlternativeModeFilter(img3, km, kn);
% _____ img4
img4AltMode = AlternativeModeFilter(img4, km, kn);
% _____ img5
img5AltMode = AlternativeModeFilter(img5, km, kn);
% _____ img6
img6AltMode = AlternativeModeFilter(img6, km, kn);

% ___________________________________________ Median Square Error
% _____ img1
MSEImg1AltMode  = sum(sum((img - img1AltMode).^2))/numElements
% _____ img2
MSEImg2AltMode  = sum(sum((img - img2AltMode).^2))/numElements
% _____ img3
MSEImg3AltMode  = sum(sum((img - img3AltMode).^2))/numElements
% _____ img4
MSEImg4AltMode  = sum(sum((img - img4AltMode).^2))/numElements
% _____ img5
MSEImg5AltMode  = sum(sum((img - img5AltMode).^2))/numElements
% _____ img6
MSEImg6AltMode  = sum(sum((img - img6AltMode).^2))/numElements

% ___________________________________________ Save the results
imwrite(img1AltMode, './Results/Depth/Part4/img1AltMode.jpg');
% ___________________________________________ Save the results
imwrite(img2AltMode, './Results/Depth/Part4/img2AltMode.jpg');
% ___________________________________________ Save the results
imwrite(img3AltMode, './Results/Depth/Part4/img3AltMode.jpg');
% ___________________________________________ Save the results
imwrite(img4AltMode, './Results/Depth/Part4/img4AltMode.jpg');
% ___________________________________________ Save the results
imwrite(img5AltMode, './Results/Depth/Part4/img5AltMode.jpg');
% ___________________________________________ Save the results
imwrite(img6AltMode, './Results/Depth/Part4/img6AltMode.jpg');



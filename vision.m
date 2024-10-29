clc;
clear;
close all;

imagePath = 'E:\pro\fate\fa.jpg';
originalImage = imread(imagePath);

binaryImage = im2bw(originalImage);
grayImage = rgb2gray(originalImage);
imwrite(binaryImage, 'E:\pro\fate\binaryImage.jpg');
imwrite(grayImage, 'E:\pro\fate\grayImage.jpg');

highContrastImage = imadjust(grayImage, [0.3 0.7]);
lowContrastImage = imadjust(grayImage, [0.1 0.9]);
imwrite(highContrastImage, 'E:\pro\fate\highContrastImage.jpg');
imwrite(lowContrastImage, 'E:\pro\fate\lowContrastImage.jpg');

pepperNoiseImage = imnoise(originalImage, 'salt & pepper', 0.02);
gaussianNoiseImage = imnoise(originalImage, 'gaussian', 0, 0.01);
speckleNoiseImage = imnoise(originalImage, 'speckle', 0.04);
imwrite(pepperNoiseImage, 'E:\pro\fate\pepperNoiseImage.jpg');
imwrite(gaussianNoiseImage, 'E:\pro\fate\gaussianNoiseImage.jpg');
imwrite(speckleNoiseImage, 'E:\pro\fate\speckleNoiseImage.jpg');

filteredPepperNoiseImage = cat(3, medfilt2(pepperNoiseImage(:,:,1), [3 3]),...
                               medfilt2(pepperNoiseImage(:,:,2), [3 3]),...
                               medfilt2(pepperNoiseImage(:,:,3), [3 3]));
imwrite(filteredPepperNoiseImage, 'E:\pro\fate\filteredPepperNoiseImage.jpg');

edgeImage = edge(grayImage, 'sobel');
imwrite(edgeImage, 'E:\pro\fate\edgeImage1.jpg');

gaussianFilter = fspecial('gaussian', [5 5], 2);
blurredImage = imfilter(im2double(originalImage), gaussianFilter, 'symmetric');
imwrite(blurredImage, 'E:\pro\fate\blurredImage.jpg');

imshow(originalImage);

figure;
redChannel = originalImage(:, :, 1);
imwrite(redChannel, 'Red_Channel_Image.jpg');
imshow(redChannel);
title('Red Channel Image');

figure;
greenChannel = originalImage(:, :, 2);
imwrite(greenChannel, 'Green_Channel_Image.jpg');
imshow(greenChannel);
title('Green Channel Image');

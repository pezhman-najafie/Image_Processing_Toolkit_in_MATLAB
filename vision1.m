addpath('E:\project\');
originalImage = imread('IMG_20231002_223005_760.jpg');
figure; imshow(originalImage);

binaryImage = imbinarize(originalImage);
grayImage = rgb2gray(originalImage);
colorImage = originalImage;
imwrite(binaryImage, fullfile('E:\project\', 'binary_image.jpg'));
imwrite(grayImage, fullfile('E:\project\', 'gray_image.jpg'));
imwrite(colorImage, fullfile('E:\project\', 'color_image.jpg'));

% Contrast Adjustment
gray_image = imread('gray_image.jpg');
high_contrast_image = imadjust(gray_image, [0.2, 0.8], [0, 1]);
figure;
subplot(1, 2, 1), imshow(gray_image), title('Original Image');
subplot(1, 2, 2), imshow(high_contrast_image), title('High Contrast Image');
imwrite(high_contrast_image, fullfile('E:\project\', 'high_contrast_image.jpg'));

low_contrast_image = imadjust(gray_image, [0, 1], [0.2, 0.8]);
figure;
subplot(1, 2, 1), imshow(gray_image), title('Original Image');
subplot(1, 2, 2), imshow(low_contrast_image), title('Low Contrast Image');
imwrite(low_contrast_image, fullfile('E:\project\', 'low_contrast_image.jpg'));

% Noise Addition
original_image = imread('IMG_20231002_223005_760.jpg');
noisy_image = imnoise(original_image, 'salt & pepper', 0.02);
figure;
subplot(1, 2, 1), imshow(original_image), title('Original Image');
subplot(1, 2, 2), imshow(noisy_image), title('Salt & Pepper Noise');
imwrite(noisy_image, fullfile('E:\project\', 'noisy_image.jpg'));

noisy2_image = imnoise(original_image, 'gaussian', 0.02);
figure;
subplot(1, 2, 1), imshow(original_image), title('Original Image');
subplot(1, 2, 2), imshow(noisy2_image), title('Gaussian Noise');
imwrite(noisy2_image, fullfile('E:\project\', 'noisy2_image.jpg'));

noisy3_image = imnoise(original_image, 'speckle');
figure;
subplot(1, 2, 1), imshow(original_image), title('Original Image');
subplot(1, 2, 2), imshow(noisy3_image), title('Speckle Noise');
imwrite(noisy3_image, fullfile('E:\project\', 'noisy3_image.jpg'));

% Noise Removal
noisy_image = imread('noisy2_image.jpg');
G = fspecial('gaussian', [3 3], 1);
filtered_image = imfilter(noisy_image, G);
figure;
subplot(1, 2, 1), imshow(noisy_image), title('Noisy Image');
subplot(1, 2, 2), imshow(filtered_image), title('Denoised Image');
imwrite(filtered_image, fullfile('E:\project\', 'denoised_image.jpg'));

% Sobel Edge Detection
image = imread('IMG_20231002_223005_760.jpg');
gray = rgb2gray(image);
threshold = 0.5;
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];
Gx = conv2(double(gray), sobel_x);
Gy = conv2(double(gray), sobel_y);
G = sqrt(Gx.^2 + Gy.^2);
edge_image = zeros(size(G));
edge_image(G > threshold) = 1;
figure;
subplot(1, 2, 1), imshow(image), title('Original Image');
subplot(1, 2, 2), imshow(edge_image), title('Edge Detection');
imwrite(edge_image, fullfile('E:\project\', 'edge_image.jpg'));

% Blurring Image
image1 = imread('IMG_20231002_223005_760.jpg');
sigma = 2;
blurred_image = imgaussfilt(image1, sigma);
figure;
subplot(1, 2, 1), imshow(image1), title('Original Image');
subplot(1, 2, 2), imshow(blurred_image), title('Blurred Image');
imwrite(blurred_image, fullfile('E:\project\', 'blurred_image.jpg'));

% HSV and RGB Channel Extraction
originalImage2 = imread('IMG_20231002_223005_760.jpg');
hsvImage = rgb2hsv(originalImage2);
figure;
subplot(1, 3, 1), imshow(hsvImage(:, :, 1)), title('H Channel');
subplot(1, 3, 2), imshow(hsvImage(:, :, 2)), title('S Channel');
subplot(1, 3, 3), imshow(hsvImage(:, :, 3)), title('V Channel');

originalImage = imread('IMG_20231002_223005_760.jpg');
redChannel = originalImage(:, :, 1);
greenChannel = zeros(size(originalImage, 1), size(originalImage, 2));
blueChannel = zeros(size(originalImage, 1), size(originalImage, 2));
rgbImage = cat(3, redChannel, greenChannel, blueChannel);
figure;
subplot(1, 2, 1), imshow(originalImage), title('Original Image');
subplot(1, 2, 2), imshow(rgbImage), title('RGB Channel Image');
imwrite(rgbImage, fullfile('E:\project\', 'rgbImage.jpg'));

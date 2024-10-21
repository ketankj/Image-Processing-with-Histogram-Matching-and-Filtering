clear all;
close all;
clc;

% Read the original color image
original_img = imread('image.jpg');

% Convert the image to grayscale
gray_img = rgb2gray(original_img);

% Add noise to the grayscale image
noisy_gray_img = imnoise(gray_img, 'salt & pepper', 0.15);

% Define the size of the neighborhood for the filters
window_size = 7;

% Apply the median filter
median_filtered_img = Filter.median_filter(noisy_gray_img, window_size);

% Apply the adaptive filter
adaptive_filtered_img = Filter.adaptive_filter(noisy_gray_img, window_size);

% Display the images
figure;

subplot(2, 3, 1);
imshow(original_img);
title('Original Color Image');

subplot(2, 3, 2);
imshow(gray_img);
title('Grayscale Image');

subplot(2, 3, 3);
imshow(noisy_gray_img);
title('Grayscale Image with Noise');

subplot(2, 3, 4);
imshow(uint8(median_filtered_img)); % Convert back to uint8 for display
title('Median Filtered Image');

subplot(2, 3, 5);
imshow(uint8(adaptive_filtered_img)); % Convert back to uint8 for display
title('Adaptive Filtered Image');

% Assuming median_filtered_img and adaptive_filtered_img are your final filtered images

% Convert the original color image to YCbCr color space
original_img_ycbcr = rgb2ycbcr(original_img);

% Replace the Y channel with the median filtered grayscale image
median_filtered_img_ycbcr = original_img_ycbcr;
median_filtered_img_ycbcr(:, :, 1) = median_filtered_img;

% Replace the Y channel with the adaptive filtered grayscale image
adaptive_filtered_img_ycbcr = original_img_ycbcr;
adaptive_filtered_img_ycbcr(:, :, 1) = adaptive_filtered_img;

% Convert back to RGB color space
median_filtered_img_rgb = ycbcr2rgb(median_filtered_img_ycbcr);
adaptive_filtered_img_rgb = ycbcr2rgb(adaptive_filtered_img_ycbcr);

% Display the color images with the filtered Y channel
figure;

subplot(1, 2, 1);
imshow(uint8(median_filtered_img_rgb));
title('Median Filtered Color Image');

subplot(1, 2, 2);
imshow(uint8(adaptive_filtered_img_rgb));
title('Adaptive Filtered Color Image');
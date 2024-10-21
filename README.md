Project Overview
This project involves implementing key image processing techniques using MATLAB:

Histogram Matching: A MATLAB function that performs histogram matching between two grayscale images.
Image Filtering: A MATLAB script to apply two different filters (median and adaptive) to a grayscale image, without using built-in MATLAB functions like medfilt2 or ordfilt2.
Features
1. Histogram Matching
A class-based implementation that:

Computes histograms of two grayscale images.
Matches the histogram of one image to another.
Displays the original images, their histograms, and the matched image using MATLAB's subplot.
Key methods in the Histogram class:

histogram_matching: Takes two input images and matches their histograms.
compute_histogram: Calculates the histogram of a grayscale image.
compute_mapping: Computes the mapping of pixel intensity between the two images.
apply_mapping: Applies the mapping to the input image for histogram matching.
2. Image Filtering
A class-based implementation of two filters:

Median Filter: Applies a median filter with a customizable window size.
Adaptive Filter: Performs adaptive filtering based on local image statistics.
Key methods in the Filter class:

median_filter: Applies median filtering to an image.
adaptive_filter: Applies adaptive filtering using local mean and standard deviation for noise reduction.
The script:

Converts a color image to grayscale.
Adds salt and pepper noise.
Applies both median and adaptive filters to the noisy image.
Displays the original, noisy, and filtered images.
Analysis and Results
The Histogram Matching function effectively transfers the histogram distribution from one image to another, producing a visually consistent matched image.
The Median Filter successfully removes salt and pepper noise, while the Adaptive Filter balances noise reduction and detail preservation.
Problems Faced
Initially faced challenges organizing MATLAB code, leading to nested function calls that affected performance and readability.
Solution: Reorganized the code into class structures, improving maintainability and execution.
How to Run
Clone the repository:
bash
Copy code
git clone https://github.com/yourusername/image-processing-histogram-filtering.git
Open MATLAB and navigate to the project directory.
Run the main.m script to execute the Histogram Matching or Image Filtering tasks.
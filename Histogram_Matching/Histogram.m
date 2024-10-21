classdef Histogram
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    methods(Static)
          function matched_img = histogram_matching(image1, image2)
                % Read input images
                img1 = imread(image1);
                img2 = imread(image2);
                
                % Compute histograms
                hist1 = Histogram.compute_histogram(img1);
                hist2 = Histogram.compute_histogram(img2);
                
                % Perform histogram matching
                mapping = Histogram.compute_mapping(hist2, hist1);
                matched_img = Histogram.apply_mapping(img1, mapping);
            end
            
            function hist = compute_histogram(image)
                hist = zeros(256, 1);
                [rows, cols] = size(image);
                
                for i = 1:rows
                    for j = 1:cols
                        intensity = image(i, j);
                        hist(intensity + 1) = hist(intensity + 1) + 1;
                    end
                end
            end
            
            function mapping = compute_mapping(reference_hist, target_hist)
                % Compute cumulative histograms
                ref_cum_hist = cumsum(reference_hist) / sum(reference_hist);
                tar_cum_hist = cumsum(target_hist) / sum(target_hist);
                
                
                % Initialize mapping array
                mapping = zeros(256, 1);
                
                % Perform histogram matching
                for i = 1:256
                    [~, index] = min(abs(ref_cum_hist - tar_cum_hist(i)));
                    mapping(i) = index - 1;
                end
            end
            
            function matched_img = apply_mapping(image, mapping)
                [rows, cols] = size(image);
                matched_img = zeros(rows, cols);
                
                for i = 1:rows
                    for j = 1:cols
                        intensity = image(i, j);
                        matched_img(i, j) = mapping(intensity + 1);
                    end
                end
            end
    end
end
classdef Filter
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here    
    methods(Static)
        % Adaptive filter function
        function output_img = adaptive_filter(input_img, window_size)
            [rows, cols] = size(input_img);
            output_img = zeros(rows, cols);
        
            for i = 1 + window_size : rows - window_size
                for j = 1 + window_size : cols - window_size
                    window = input_img(i - window_size : i + window_size, j - window_size : j + window_size);
                    local_mean = mean(window(:));
                    local_std_dev = std(double(window(:))); % Convert to double for accurate calculation
                    threshold = local_mean + 2 * local_std_dev; % Adjust the threshold as needed
                    if input_img(i, j) > threshold
                        output_img(i, j) = local_mean;
                    else
                        output_img(i, j) = input_img(i, j);
                    end
                end
            end
        end
        % Median filter function
        function output_img = median_filter(input_img, window_size)
            [rows, cols] = size(input_img);
            output_img = zeros(rows, cols);
            half_window = floor(window_size / 2);
        
            for i = 1 + half_window : rows - half_window
                for j = 1 + half_window : cols - half_window
                    window = input_img(i - half_window : i + half_window, j - half_window : j + half_window);
                    output_img(i, j) = median(window(:));
                end
            end
        end
    end
end

       

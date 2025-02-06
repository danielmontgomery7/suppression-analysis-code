function [target_num_data, downsample_rate] = calculate_downsample_rate(current_num_data, current_freq, target_freq)
    %INPUT:
    %   current_num_data: the length of the current number of data points
    %   current_freq: the current sampling frequency of the data
    %   target_freq: the sampling frequency you would like to downsample to
    %OUTPUT:
    %   target_num_data: the length of a vector after you downsample it
    %   downsample_rate: the number of indices you will skip over to
    %   downsample the data (e.g. down_data = data(1:downsample_rate:end);)
    
    % create estimates
    downsample_rate = floor(current_freq/target_freq);
    target_num_data = ceil(current_num_data/downsample_rate);
    
end
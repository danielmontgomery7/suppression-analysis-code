function downsample_spks = calculate_downsample_spikes(spks, freq, downsample_freq)
    %INPUT:
    %   spks: boolean vector of spike data (0 means no spike, 1 means spike)
    %   freq: frequency of the current high spike boolean vector
    %   downsample_freq: frequency of the spike boolean vector you want
    %OUTPUT:
    %   downsample_spks: boolean of spikes (0 means no spike, 1 means spike)
    
    % create time vectors
    ndata = length(spks);
    t = 0:(1/freq):((ndata/freq) - (1/freq));
    [target_num_data, ~] = calculate_downsample_rate(ndata, freq, downsample_freq);
    t_downsample = 0:(1/downsample_freq):((target_num_data/downsample_freq) - (1/downsample_freq));
    
    % downsample spike bool by using the downsample time vector as the
    % edges in a call to histcounts; note that a spike happening anytime
    % between the two given times in the t_downsample vector will just be
    % said to have occurred at the leftmost time; thus the need for an
    % extra 0 at the end (to make up for lost index due to edge
    % delineation)
    downsample_spks = histcounts(t(spks), t_downsample);
    downsample_spks = [downsample_spks, 0];
    
    % correct for multiple spikes occuring in a bin (by simply making it
    % just 1 spike)
    downsample_spks(downsample_spks > 1) = 1;
    downsample_spks = logical(downsample_spks);

end
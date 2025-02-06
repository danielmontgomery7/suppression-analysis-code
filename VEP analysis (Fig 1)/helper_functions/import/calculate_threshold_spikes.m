function spks = calculate_threshold_spikes(high_pass_data, rms, threshold, freq)
    %INPUT:
    %   high_pass_data: vector of high pass data
    %   rms: vector of corresponding moving RMS for the high pass data
    %   threshold: the value you want for spks = high_pass_data < -threshold*rms
    %   freq: frequency of the high pass data
    %OUTPUT:
    %   spks: boolean of spikes (0 means no spike, 1 means spike)
    
    % get putative spike times via threshold
    spks = high_pass_data < -threshold*rms;
    spike_inds = find(spks);
    
    % eliminate spike times that occur within 250 microseconds of each other
    search_ind = floor((freq/1000)*0.25);
    spike_inds = spike_inds([true, diff(spike_inds)>search_ind]);
    
    % create search matrix for each spike ind (250 microseconds on either side),
    % then correct for an index being too small or too large for the vector
    check_inds = spike_inds + (-search_ind:search_ind)';
    [row, col] = find(check_inds < 1);
    for i = 1:length(row)
        check_inds(row(i), col(i)) = 1;
    end
    [row, col] = find(check_inds > length(high_pass_data));
    for i = 1:length(row)
        check_inds(row(i), col(i)) = 1;
    end
    
    % using the search matrix, determine for each spike what the most
    % negative portion is and make that the spike time
    [~, min_inds] = min(high_pass_data(check_inds), [], 1);
    for j = 1:length(spike_inds)
        spike_inds(j) = check_inds(min_inds(j), j);
    end
    spks = false(1, length(spks));
    spks(spike_inds) = true;

end
function event_inds = calculate_event_indices(event_ts, num_data, freq)
    %INPUT:
    %   event_ts: vector of times at which events occurred
    %   num_data: integer of how many data points are available
    %   freq: frequency of data
    %OUTPUT:
    %   event_inds: vector of indices at which event occurred between 1 and
    %   num_data
    
    % create time vector and ensure row vector
    sample_period = 1/freq;
    t = 0:(sample_period):((num_data/freq)-sample_period);
    event_ts = event_ts(:)';

    % get estimate for event indices
    event_inds = round(event_ts./sample_period);
    event_inds = event_inds + [-4:4]';
    try
        t_predictions = t(event_inds);
    catch
        event_inds = event_inds(5, :);
        disp('Fix digital catch in calculate event inds')
        return
    end
    [~, min_ind] = min(abs(t_predictions - event_ts), [], 1);
    linear_ind = sub2ind(size(event_inds), min_ind, 1:size(event_inds, 2));
    event_inds = event_inds(linear_ind);
    
    % check/fix estimates
    check_bool = (abs(t(event_inds) - event_ts) < ((sample_period+0.5*sample_period)/2));
    bad_inds = find(check_bool == 0);
    if ~isempty(bad_inds)
        for idx = bad_inds
           [~, event_inds(idx)] = min(abs(t - event_ts(idx)));
        end
    end

end
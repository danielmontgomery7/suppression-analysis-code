function [event_ts, event_id] = calculate_intan_event_information(intanFileInfo, time_file, event_file, intan_app_event_data)
% INPUT:
%   intanFileInfo: parent intanFileInfo object for the time and event files
%   time_file: path to intan file of time data
%   event_file: path to intan file of event data
%   intan_app_event_data: data struct of event information from the Intan event app 
% OUTPUT:
%   event_ts: vector of time stamps at which events occurred
%   event_id: vector of event ids corresponding to event_ts

    % extract time vector
    t = import_intan_time_vector(intanFileInfo, time_file);

    % extract event vector
    ev = import_intan_event_vector(intanFileInfo, event_file);

    % iterate user-specified event data
    freqs = intanFileInfo.get_original_freqs();
    fnames = fieldnames(intan_app_event_data)';
    first_ten_msecs = 1:(10*(freqs(1)/1000));
    event_ts = [];
    event_id = [];
    for fname = fnames

        ev_data = intan_app_event_data.(fname{:});
        evid = ev_data.evid;
    
        % algorithm for finding the starting points
        %   1) find all points between the user-specified bound
        %   2) store the first point as the first stimulus flip/flop
        %   3) find sharp transitions in indices (indicating a jump from stim
        %      or flip/flop) and store those as the subsequent flips/flops
        %      note: sharp transitions means a difference in the time index
        %      of more than ten milliseconds (so more than 300 indices
        %      between the values if the data is sampled at 30000 Hz)
        %   4) ensure the average of the first ten msec after the point are
        %      stable (within the user-specified bounds) to eliminate erroenous
        %      points; erroneous points are caused by a voltage being sampled
        %      at a midway point while transitioning to a different voltage
        pts = find(ev>ev_data.evlo & ev<ev_data.evhi);
        pts = [pts(1), pts(find(diff(pts)>first_ten_msecs(end))+1)];
        avg_first_ten = mean(ev(pts + first_ten_msecs'), 1);
        pts = pts(find(avg_first_ten>ev_data.evlo & avg_first_ten<ev_data.evhi));
    
        event_ts = cat(2, event_ts, t(pts));
        event_id = cat(2, event_id, repelem(evid, 1, length(pts)));
        
    end

    [event_ts, event_sort] = sort(event_ts);
    event_id = event_id(event_sort);
    
    % plot values to check
    plot_bool = false;
    if plot_bool
        figure()
        hold on
        plot(t, ev, 'k')
        for fname = fnames
            plot_id = intan_app_event_data.(fname{:}).evid;
            plot_inds = ismember(event_id, plot_id);
            plot_y = mean([intan_app_event_data.(fname{:}).evlo, intan_app_event_data.(fname{:}).evhi]);
            scatter(event_ts(plot_inds), plot_y*ones(1, sum(plot_inds)), 'r', 'filled')
            % special note: because gray flip/flop and black flip/flop are
            % encoded with the same id value, the figure will look like the
            % code is double-counting gray and black events; it's not,
            % rather the figure is just looking for all gray/black events
            % and placing them at both the flip and flop locations
        end
        hold off       
    end
    
end
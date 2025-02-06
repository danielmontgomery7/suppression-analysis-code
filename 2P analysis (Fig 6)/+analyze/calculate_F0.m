function [F0, F0_all] = calculate_F0(data_struct, separated_traces)
    % Possible fields for params.F0:
        % 'ibi'
        % "grey'
        % 'avg'
        % 'median'
        % 'min'
        % 'preceding_ibi'

%% Calculate different versions of F0
    % based on ibi
        ibi_condition = [separated_traces.stimulus] == "ibi";
        ibi = separated_traces(ibi_condition).corrected_F;
%         F0_all.ibi = mean(mean(ibi, 2), 3);

        mid_frame = floor(size(ibi,2)*0.75); % Last quarter of ibi
        half_ibi = ibi(:,mid_frame:end,:);
        F0_all.ibi = mean(mean(half_ibi, 2), 3);

    % based on grey period
        grey_condition = [separated_traces.stimulus] == "grey";
        grey = separated_traces(grey_condition).corrected_F;
        F0_all.grey = mean(mean(grey, 2), 3);

    % based on average fluorescence
        F0_all.avg = mean(data_struct.traces.corrected_F, 2);

    % based on median fluorescence
        F0_all.median = median(data_struct.traces.corrected_F, 2);

    % based on minimum fluorescence (5th percentile)
        sorted_traces = sort(data_struct.traces.corrected_F, 2);
        min_idx = round(size(sorted_traces, 2) * 0.05);
        F0_all.min = sorted_traces(:, min_idx);
        
    % based on preceding ibi
%         F0_all.preceding_ibi = ibi;
        mid_frame = floor(size(ibi,2)*0.75); % Last half of preceding ibi
        F0_all.preceding_ibi = ibi(:,mid_frame:end,:);



%     % based on second half of preceding ibi (this currently doesn't work)
%         sz = size(ibi);
%         F0_all.preceding_ibi = ibi(1:sz(1), 1:sz(2), round(sz(3)/2):sz(3));
    


%% Determine which version of F0 to use

    if isfield(data_struct.params, 'F0')
        specified_F0 = lower(string(data_struct.params.F0));
    else
        specified_F0 = "ibi"; % default
    end

    F0_field_name = strcat("F0_all.", specified_F0);
    
    F0 = eval(F0_field_name);












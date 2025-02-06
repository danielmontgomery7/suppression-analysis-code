function [traces_dFF, average_dFF_table, average_dFF] = calculate_dFF(data_struct, separated_traces, F0)


n_conditions = length(separated_traces) - 2;        % exclude ibi and grey conditions
traces_dFF = separated_traces(1:n_conditions);      % get stimulus names from separated_traces
traces_dFF = rmfield(traces_dFF, 'corrected_F');    % remove corrected_F field


%%
for iStim = 1:n_conditions

    if ndims(F0) == 3
        block_idx = data_struct.params.Block_order == iStim;
%         mid_frame = size(F0, 2) - round(size(F0, 2)/2);
%         F0_temp = mean(F0(:,mid_frame:end,block_idx), 2);
        F0_temp = mean(F0(:,:,block_idx), 2);
        traces_dFF(iStim).dFF = (separated_traces(iStim).corrected_F - F0_temp) ./ F0_temp;     % calculate F0 using a different value for each block
    else
        traces_dFF(iStim).dFF = (separated_traces(iStim).corrected_F-F0) ./ F0;     % calculate dF/F based on an average across blocks
    end
    
    traces_dFF(iStim).average_trace = squeeze(mean(traces_dFF(iStim).dFF, 3));
    traces_dFF(iStim).block_averages = squeeze(mean(traces_dFF(iStim).dFF, 2));
    traces_dFF(iStim).average_dFF = mean(traces_dFF(iStim).average_trace, 2);
end



%% Organize average dF/F into a table

average_dFF = nan(length(traces_dFF(1).average_dFF), length(traces_dFF));   % preallocate
for iStim = 1:n_conditions                                                  % put average dFFs into an array
    average_dFF(:, iStim) = traces_dFF(iStim).average_dFF;
end

average_dFF_table = array2table(average_dFF);                                     % convert array into table
for iStim = 1:n_conditions
    header_temp = char(traces_dFF(iStim).stimulus);                         % get headers for each column
    average_dFF_table.Properties.VariableNames{iStim} = header_temp;              
end



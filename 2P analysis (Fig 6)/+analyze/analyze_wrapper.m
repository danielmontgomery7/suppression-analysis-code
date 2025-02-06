function [data_struct] = analyze_wrapper(varargin)
    % 1) data_struct: output from IOS_import_wrapper
        % e.g. 'D:\Daniel\2P\L6_SRP\DM716\day1'
    % 2) parameters: structure with the following possible fields:
        % .F0 (How F0 is calculated: 'ibi', 'grey', 'median', 'avg', 'min', 'preceding_ibi')
    % 3) file name to use to save

    data_struct = varargin{1};

    if nargin > 1
        data_struct.params = catstruct(data_struct.params, varargin{2});
    end
    
    if nargin > 2
        data_struct.params.recording_session = varargin{3};
    end

%% Call functions

    % extract fluorescence traces from suite2p file
    data_struct = analyze.extract_traces(data_struct);  

    % get timing of each block
    block_timing = analyze.get_block_timing(data_struct);

    % organize fluorescence data into blocks
    separated_traces = analyze.organize_block_data(data_struct, block_timing);

    % calculate F0 based on specified input
    [F0, F0_all] = analyze.calculate_F0(data_struct, separated_traces);

    % calculate dF/F for all traces and get average dF/F values for each 
    if exptype == "SRP"
        [traces_dFF, average_dFF] = analyze.calculate_dFF(data_struct, separated_traces, F0);
    elseif exptype == "IOS"
        [traces_dFF, average_dFF] = analyze.calculate_dFF(separated_traces, F0); 
    end
    


%% Output

    data_struct.params.block_timing = block_timing;
    data_struct.traces.separated_traces = separated_traces;
    data_struct.traces.F0 = F0;
    if exptype == "SRP"
        data_struct.traces.F0_all = F0_all;
    end
	data_struct.traces_dFF = traces_dFF;    
    data_struct.average_dFF = average_dFF{:,:};
    data_struct.average_dFF_table = average_dFF;


%% Save
    if exptype == "SRP"
        if nargin > 2
            save_path = [data_struct.params.save_path, char(data_struct.params.recording_session), '.mat'];
            save(save_path, 'data_struct');
        end
    elseif exptype == "IOS"
            save_path = [data_struct.params.save_path, char(data_struct.params.Recording_ID), '.mat'];
            save(save_path, 'data_struct');
    end



end
    


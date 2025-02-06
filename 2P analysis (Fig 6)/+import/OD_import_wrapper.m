function [data_struct] = OD_import_wrapper(varargin)
    % 1) experiment name: string or char array specifying which experiment to import
        % e.g. 'DM853_Baseline'
    % 2) parameters: structure with the following possible fields:
        % .grey_frames (number of grey frames)
        % .grey_timing (timing of the grey period- 'start' or 'end')


    mouse = varargin{1};
    session = varargin{2};

    info = describe_experiments.group_assignments(mouse, session); % get info about the specified experiment
    
    if nargin > 2
        params = catstruct(info.params, varargin{3});
    else
        params = info.params;
    end
    
    save_path = info.data_file;
    save_filename = [save_path, '\', info.mouse, '_', info.session, '.mat'];
    experiment_log_filename = info.mat_file;

%% Check to see if data structure has already been imported and saved, then update rois from suite2p
    
%     if exist(save_filename, 'file')
%         load(save_filename, 'data_struct')
%         import.update_rois(data_struct, params);
% %         save(save_filename, 'data_struct');
%         return
%     end
        
%% Select files to import

    file_info = import.OD_get_filenames(save_path, experiment_log_filename);   % get file names that need to be imported
   
%% Import data files

    suite2p_data = import.import_suite2p_traces(file_info);                 % import suite2p data

    params = import.import_experiment_params(file_info, params);            % load experimental parameters from the stimulus computer

    ttl_timing = import.import_csv(file_info, params);                              % load the timing of the stimuli

    frame_timing = import.import_xml(file_info);                            % import .xml file with timing of each frame
    
%% Get experimental parameters

    params.fs = mean(1./deriv(frame_timing.LE));           % calculate sampling frequency

%% Output

    data_struct.file_info = file_info;      
    data_struct.suite2p_data = suite2p_data;
    data_struct.ttl_timing = ttl_timing;
    data_struct.ttl_timing.LE.frame_timing = frame_timing.LE;
    data_struct.ttl_timing.RE.frame_timing = frame_timing.RE;
    data_struct.params = params;
    
%% Save
    
    save(save_filename, 'data_struct');
    
end
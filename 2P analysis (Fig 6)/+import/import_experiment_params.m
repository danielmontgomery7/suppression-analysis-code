function params = import_experiment_params(varargin)
%   1) file_info (from get_filenames function)
%   2) params

file_info = varargin{1};

if ~isstruct(file_info.experiment_log)
    if file_info.experiment_log ~= 0
        
        load(file_info.experiment_log, 'stim_info');
        
        params = catstruct(stim_info, stim_info.params);
        params = rmfield(params, 'params');
    end
else % for OD experiments with separate LE and RE recordings
    
    LE_temp = load(file_info.experiment_log.LE, 'Experiment_Log');
    LE = LE_temp.Experiment_Log;
    RE_temp = load(file_info.experiment_log.LE, 'Experiment_Log');
    RE = RE_temp.Experiment_Log;
        
    params = LE.parameters;
        params.LE_block_order = LE.block_order;
        params.LE_stimuli = LE.stimuli;
        params.RE_block_order = RE.block_order;
        params.RE_stimuli = RE.stimuli;

        params.block_order.LE = LE.block_order;
        params.block_order.RE = RE.block_order;
end

if nargin >= 2
    params = catstruct(params, varargin{2});
end
    






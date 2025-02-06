function params = import_SRP_params(varargin)
%   1) file_info (from get_filenames function)
%   2) params

%% Load
file_info = varargin{1};

if file_info.experiment_log ~= 0
    load(file_info.experiment_log, 'Experiment_Log');
end

%% Calculate some things

for iStim = 1:length(Experiment_Log.stimuli)
    stim_details = strsplit(string(Experiment_Log.stimuli(iStim)), ["cy/°", " ", "%"]);
    Block_order_Desc(iStim).trialType = stim_details(2);
%     Block_order_desc(iStim).trialType = strcat(temp(2), ", ", temp(3), "% contrast")
end

reversals_per_block = Experiment_Log.parameters.flip_flop_reps * 2;
stimulus_frequency = 1/Experiment_Log.parameters.t_stim;
seconds_per_block = reversals_per_block / stimulus_frequency;

%% Output
params.Date_and_Time = Experiment_Log.stim_order(1).time;
params.Contrast = str2num(stim_details(3));
params.Cycles_per_degree = str2num(stim_details(1));
params.Reversals_per_block = reversals_per_block;
params.Temporal_frequency = stimulus_frequency;
params.Block_Length = seconds_per_block;
params.Interblock_Interval = Experiment_Log.parameters.interTrialInterval;
params.Blocks_per_condition = length(Experiment_Log.stim_order);
params.Conditions = length(Experiment_Log.stimuli);
params.Block_order = [Experiment_Log.stim_order.order];
params.Block_order_Desc = Block_order_Desc;


if nargin >= 2
    params = catstruct(params, varargin{2}); % allows input to function to overwrite imported params
end






function info = SOM_IOS_info(mouse, session)


% L23_IOS.mice = ["DM864", "DM865"];

% inputs = strsplit(string(recording_session), ["_", " "]);
% mouse = inputs{1};
% session = inputs{2};

experiment = 'SOM IOS'; 
% experiment_folder = 'D:\Daniel\2P\IOS\';
experiment_folder ='Z:\Daniel#\Experiments#\2P raw data\SOM IOS\';
recording_folder = 'Z:\Daniel#\Experiments#\2P raw data\ExperimentalRecords\Interocular Suppression\';




%% DM866

DM866.params.extra_grey_frames = 0;
DM866.params.grey_timing = 'start';

DM866.IOS1.experiment_path = 'DM866\20220720'; % L2/3
DM866.IOS2.experiment_path = 'DM866\20220722'; % L2/3
% DM866.sess3.experiment_path = 'DM866\20220725'; % L4

DM866.IOS1.recording_path = '2022-07-20\DM866_18-26.mat';
DM866.IOS2.recording_path = '2022-07-22\DM866_16-52.mat';
% DM866.sess3.recording_path = '2022-07-25\___________.mat';




%% DM868

DM868.params.extra_grey_frames = 0;
DM868.params.grey_timing = 'start';

DM868.IOS1.experiment_path = 'DM868\20220720'; % L2/3
DM868.IOS2.experiment_path = 'DM868\20220722'; % L2/3
% DM868.IOS3.experiment_path = 'DM868\20220725'; % L4

DM868.IOS1.recording_path = '2022-07-20\DM868_19-15.mat';
DM868.IOS2.recording_path = '2022-07-22\DM868_16-05.mat';
% DM868.IOS3.recording_path = '2022-07-25\___________.mat';




%% DM942

DM942.params.extra_grey_frames = 0;
DM942.params.grey_timing = 'start';

DM942.IOS1.experiment_path = 'DM942\IOSd1'; % L2/3
DM942.IOS2.experiment_path = 'DM942\PhaseOffset1'; % L2/3

DM942.IOS1.recording_path = '2022-12-15\DM942_12-41.mat';
DM942.IOS2.recording_path = '2023-01-13\DM942_16-00.mat';




%% DM943

DM943.params.extra_grey_frames = 0;
DM943.params.grey_timing = 'start';

DM943.IOS1.experiment_path = 'DM943\IOSd1'; % L2/3
DM943.IOS2.experiment_path = 'DM943\PhaseOffset1'; % L2/3

DM943.IOS1.recording_path = '2022-12-15\DM943_13-21.mat';
DM943.IOS2.recording_path = '2023-01-13\DM943_16-41.mat';




%% DM945

DM945.params.extra_grey_frames = 0;
DM945.params.grey_timing = 'start';

DM945.IOS1.experiment_path = 'DM945\IOSd1'; % L2/3
DM945.IOS2.experiment_path = 'DM945\PhaseOffset1'; % L2/3

DM945.IOS1.recording_path = '2022-12-15\DM945_14-01.mat';
DM945.IOS2.recording_path = '2023-01-13\DM945_17-19.mat';




%% Output

params = eval(strcat(mouse, ".params"));
experiment_path = eval(strcat(mouse, ".", session, ".experiment_path"));
recording_path = eval(strcat(mouse, ".", session, ".recording_path"));


data_file = [experiment_folder, experiment_path];
mat_file = [recording_folder, recording_path];


% info.recording_session = recording_session;
info.experiment = experiment;
info.mouse = mouse;
info.session = session;
info.data_file = data_file;
info.mat_file = mat_file;
info.params = params;








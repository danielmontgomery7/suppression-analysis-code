function info = L23_OD_info(mouse, session)


% L23_IOS.mice = ["DM864", "DM865"];

% inputs = strsplit(string(recording_session), ["_", " "]);
% mouse = inputs{1};
% session = inputs{2};

experiment = 'L23 OD'; 
% experiment_folder = 'D:\Daniel\2P\IOS\';
experiment_folder = 'Z:\Daniel#\Experiments#\2P raw data\L23 OD\';
recording_folder = 'Z:\Daniel#\Experiments#\2P raw data\ExperimentalRecords\DriftingGratings\';



%% DM941

DM941.params.extra_grey_frames = 0;
DM941.params.grey_timing = 'start';

DM941.OD1.experiment_path = 'DM941\OD1';

DM941.OD1.recording_path.LE = '2023-02-09\2023-02-09 15-32.mat';
DM941.OD1.recording_path.RE = '2023-02-09\2023-02-09 15-51.mat';


%% DM947

DM947.params.extra_grey_frames = 0;
DM947.params.grey_timing = 'start';

DM947.OD1.experiment_path = 'DM947\OD1';

DM947.OD1.recording_path.LE = '2023-02-09\2023-02-09 16-17.mat';
DM947.OD1.recording_path.RE = '2023-02-09\2023-02-09 16-35.mat';


%% DM951

DM951.params.extra_grey_frames = 0;
DM951.params.grey_timing = 'start';

DM951.OD1.experiment_path = 'DM951\20230215';

DM951.OD1.recording_path.LE = '2023-02-15\2023-02-15 18-23.mat';
DM951.OD1.recording_path.RE = '2023-02-15\2023-02-15 18-23.mat';


%% DM953

DM953.params.extra_grey_frames = 0;
DM953.params.grey_timing = 'start';

DM953.OD1.experiment_path = 'DM953\20230215';

DM953.OD1.recording_path.LE = '2023-02-15\2023-02-15 19-08.mat';
DM953.OD1.recording_path.RE = '2023-02-15\2023-02-15 19-26.mat';


%% DM968

DM968.params.extra_grey_frames = 0;
DM968.params.grey_timing = 'start';

DM968.OD1.experiment_path = 'DM968\20230309';
DM968.OD2.experiment_path = 'DM968\20230310';
DM968.OD3.experiment_path = 'DM968\20230311';

DM968.OD1.recording_path.LE = '2023-03-09\2023-03-09 19-27.mat';
DM968.OD1.recording_path.RE = '2023-03-09\2023-03-09 19-45.mat';
DM968.OD2.recording_path.LE = '2023-03-10\2023-03-10 09-29.mat';
DM968.OD2.recording_path.RE = '2023-03-10\2023-03-10 09-48.mat';
DM968.OD3.recording_path.LE = '2023-03-11\2023-03-11 10-33.mat';
DM968.OD3.recording_path.RE = '2023-03-11\2023-03-11 10-52.mat';


%% DM969

DM969.params.extra_grey_frames = 0;
DM969.params.grey_timing = 'start';

DM969.OD1.experiment_path = 'DM969\20230309';
DM969.OD2.experiment_path = 'DM969\20230310';
DM969.OD3.experiment_path = 'DM969\20230311';

DM969.OD1.recording_path.LE = '2023-03-09\2023-03-09 20-11.mat';
DM969.OD1.recording_path.RE = '2023-03-09\2023-03-09 20-29.mat';
DM969.OD2.recording_path.LE = '2023-03-10\2023-03-10 10-12.mat';
DM969.OD2.recording_path.RE = '2023-03-10\2023-03-10 10-30.mat';
DM969.OD3.recording_path.LE = '2023-03-11\2023-03-11 11-15.mat';
DM969.OD3.recording_path.RE = '2023-03-11\2023-03-11 11-33.mat';


%% DM970

DM970.params.extra_grey_frames = 0;
DM970.params.grey_timing = 'start';

DM970.OD1.experiment_path = 'DM970\20230309';
DM970.OD2.experiment_path = 'DM970\20230310';
DM970.OD3.experiment_path = 'DM970\20230311';

DM970.OD1.recording_path.LE = '2023-03-09\2023-03-09 20-58.mat';
DM970.OD1.recording_path.RE = '2023-03-09\2023-03-09 21-16.mat';
DM970.OD2.recording_path.LE = '2023-03-10\2023-03-10 10-55.mat';
DM970.OD2.recording_path.RE = '2023-03-10\2023-03-10 11-14.mat';
DM970.OD3.recording_path.LE = '2023-03-11\2023-03-11 12-01.mat';
DM970.OD3.recording_path.RE = '2023-03-11\2023-03-11 12-19.mat';


%% DM972

DM972.params.extra_grey_frames = 0;
DM972.params.grey_timing = 'start';

DM972.OD1.experiment_path = 'DM972\20230309';
DM972.OD2.experiment_path = 'DM972\20230310';
DM972.OD3.experiment_path = 'DM972\20230311';

DM972.OD1.recording_path.LE = '2023-03-09\2023-03-09 21-42.mat';
DM972.OD1.recording_path.RE = '2023-03-09\2023-03-09 22-01.mat';
DM972.OD2.recording_path.LE = '2023-03-10\2023-03-10 11-45.mat';
DM972.OD2.recording_path.RE = '2023-03-10\2023-03-10 12-04.mat';
DM972.OD3.recording_path.LE = '2023-03-11\2023-03-11 13-26.mat';
DM972.OD3.recording_path.RE = '2023-03-11\2023-03-11 13-44.mat';


%% DM974

DM974.params.extra_grey_frames = 0;
DM974.params.grey_timing = 'start';

DM974.OD1.experiment_path = 'DM974\20230309';
DM974.OD2.experiment_path = 'DM974\20230310';
DM974.OD3.experiment_path = 'DM974\20230311';

DM974.OD1.recording_path.LE = '2023-03-09\2023-03-09 22-28.mat';
DM974.OD1.recording_path.RE = '2023-03-09\2023-03-09 22-47.mat';
DM974.OD2.recording_path.LE = '2023-03-10\2023-03-10 12-55.mat';
DM974.OD2.recording_path.RE = '2023-03-10\2023-03-10 13-14.mat';
DM974.OD3.recording_path.LE = '2023-03-11\2023-03-11 12-44.mat';
DM974.OD3.recording_path.RE = '2023-03-11\2023-03-11 13-02.mat';


%% Output

params = eval(strcat(mouse, ".params"));
experiment_path = eval(strcat(mouse, ".", session, ".experiment_path"));
recording_path = eval(strcat(mouse, ".", session, ".recording_path"));


data_file = [experiment_folder, experiment_path];
mat_file.LE = [recording_folder, recording_path.LE];
mat_file.RE = [recording_folder, recording_path.RE];


info.recording_session = [mouse '_' session];
info.experiment = experiment;
info.mouse = mouse;
info.session = session;
info.data_file = data_file;
info.mat_file = mat_file;
info.params = params;








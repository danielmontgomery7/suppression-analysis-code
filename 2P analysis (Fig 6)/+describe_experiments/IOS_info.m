function info = IOS_info(mouse, session)


% L23_IOS.mice = ["DM864", "DM865"];

% inputs = strsplit(string(recording_session), ["_", " "]);
% mouse = inputs{1};
% session = inputs{2};

experiment = 'IOS'; 
experiment_folder = 'Z:\Daniel#\Experiments#\2P raw data\Excitatory IOS\';
recording_folder = 'Z:\Daniel#\Experiments#\2P raw data\ExperimentalRecords\Interocular Suppression\';



%% DM877

DM877.params.extra_grey_frames = 0;
DM877.params.grey_timing = 'start';

DM877.sess1.experiment_path = 'DM877\20220627';

DM877.sess1.recording_path = '27-Jun-2022\DM877-IOS-Sess1_Stim-Info_2022-06-27 18-24.mat';


%% DM883

DM883.params.extra_grey_frames = 0;
DM883.params.grey_timing = 'start';

DM883.IOS1.experiment_path = 'DM883\20220709';
DM883.IOS2.experiment_path = 'DM883\20220719';
DM883.IOS3.experiment_path = 'DM883\20220720';
DM883.IOS4.experiment_path = 'DM883\20220809';

DM883.IOS1.recording_path = '2022-07-09\DM883_12-34.mat';
DM883.IOS2.recording_path = '2022-07-19\DM883_14-01.mat';
DM883.IOS3.recording_path = '2022-07-20\DM883_15-49.mat';
DM883.IOS4.recording_path = '2022-08-09\DM883______.mat';


%% DM884

DM884.params.extra_grey_frames = 0;
DM884.params.grey_timing = 'start';

DM884.IOS1.experiment_path = 'DM884\20220708'; % L2/3
DM884.IOS2.experiment_path = 'DM884\20220709'; % L4
DM884.IOS3.experiment_path = 'DM884\20220719'; % L4
DM884.IOS4.experiment_path = 'DM884\20220720'; % L2/3
DM884.IOS5.experiment_path = 'DM884\20220809'; % L2/3

DM884.IOS1.recording_path = '2022-07-08\DM884_16-50.mat';
DM884.IOS2.recording_path = '2022-07-09\DM884_13-15.mat';
DM884.IOS3.recording_path = '2022-07-19\DM884_14-52.mat';
DM884.IOS4.recording_path = '2022-07-20\DM884_16-37.mat';
DM884.IOS5.recording_path = '2022-08-09\DM884______.mat';

%% DM885

DM885.params.extra_grey_frames = 0;
DM885.params.grey_timing = 'start';

DM885.IOS1.experiment_path = 'DM885\20220709';
DM885.IOS2.experiment_path = 'DM885\20220719';
DM885.IOS3.experiment_path = 'DM885\20220720';
DM885.IOS4.experiment_path = 'DM885\20220809';

DM885.IOS1.recording_path = '2022-07-09\DM885_13-57.mat';
DM885.IOS2.recording_path = '2022-07-19\DM885_15-39.mat';
DM885.IOS3.recording_path = '2022-07-20\DM885_17-31.mat';
DM885.IOS4.recording_path = '2022-08-09\DM885______.mat';

%% DM940

DM940.params.extra_grey_frames = 0;
DM940.params.grey_timing = 'start';

DM940.IOS1.experiment_path = 'DM940\PhaseOffset1';

DM940.IOS1.recording_path = '2023-01-13\DM940_15-13.mat';

%% DM941

DM941.params.extra_grey_frames = 0;
DM941.params.grey_timing = 'start';

DM941.IOS1.experiment_path = 'DM941\IOSd1';
DM941.IOS2.experiment_path = 'DM941\PhaseOffset1';
DM941.IOS3.experiment_path = 'DM941\20230207';

DM941.IOS1.recording_path = '2022-12-15\DM941_14-43.mat';
DM941.IOS2.recording_path = '2023-01-13\DM941_14-32.mat';
DM941.IOS3.recording_path = '2023-02-07\.mat';


%% DM950

DM950.params.extra_grey_frames = 0;
DM950.params.grey_timing = 'start';

DM950.IOS_preTTX.experiment_path = 'DM950\20230215\No Occluder\PreTTX';
DM950.IOS_postTTX.experiment_path = 'DM950\20230215\No Occluder\PostTTX';

DM950.IOS_preTTX.recording_path = '2023-02-15\DM950_10-10.mat';
DM950.IOS_postTTX.recording_path = '2023-02-15\DM950_monoc2_15-30.mat';


%% DM951

DM951.params.extra_grey_frames = 0;
DM951.params.grey_timing = 'start';

DM951.IOS_preTTX.experiment_path = 'DM951\20230215\No Occluder\PreTTX';
DM951.IOS_postTTX.experiment_path = 'DM951\20230215\No Occluder\PostTTX';

DM951.IOS_preTTX.recording_path = '2023-02-15\DM951_11-00.mat';
DM951.IOS_postTTX.recording_path = '2023-02-15\DM951_monoc2_15-59.mat';


%% DM952

DM952.params.extra_grey_frames = 0;
DM952.params.grey_timing = 'start';

DM952.IOS_preTTX.experiment_path = 'DM952\20230215\No Occluder\PreTTX';
DM952.IOS_postTTX.experiment_path = 'DM952\20230215\No Occluder\PostTTX';

DM952.IOS_preTTX.recording_path = '2023-02-15\DM952_11-46.mat';
DM952.IOS_postTTX.recording_path = '2023-02-15\DM952_monoc2_17-56.mat';


%% DM953

DM953.params.extra_grey_frames = 0;
DM953.params.grey_timing = 'start';

DM953.IOS_preTTX.experiment_path = 'DM953\20230215\No Occluder\PreTTX';
DM953.IOS_postTTX.experiment_path = 'DM953\20230215\No Occluder\PostTTX';

DM953.IOS_preTTX.recording_path = '2023-02-15\DM953_13-52.mat';
DM953.IOS_postTTX.recording_path = '2023-02-15\DM953_monoc2_17-13.mat';


%% DM954

DM954.params.extra_grey_frames = 0;
DM954.params.grey_timing = 'start';

DM954.IOS_preTTX.experiment_path = 'DM954\20230215\No Occluder\PreTTX';
DM954.IOS_postTTX.experiment_path = 'DM954\20230215\No Occluder\PostTTX';

DM954.IOS_preTTX.recording_path = '2023-02-15\DM954_14-40.mat';
DM954.IOS_postTTX.recording_path = '2023-02-15\DM954_monoc2_16-37.mat';


%% DM968

DM968.params.extra_grey_frames = 0;
DM968.params.grey_timing = 'start';

DM968.IOS.experiment_path = 'DM968\20230309';

DM968.IOS.recording_path = '2023-03-09\DM968_16-03.mat';


%% DM969

DM969.params.extra_grey_frames = 0;
DM969.params.grey_timing = 'start';

DM969.IOS.experiment_path = 'DM969\20230309';

DM969.IOS.recording_path = '2023-03-09\DM969_16-43.mat';


%% DM970

DM970.params.extra_grey_frames = 0;
DM970.params.grey_timing = 'start';

DM970.IOS.experiment_path = 'DM970\20230309';

DM970.IOS.recording_path = '2023-03-09\DM970_17-21.mat';


%% DM972

DM972.params.extra_grey_frames = 0;
DM972.params.grey_timing = 'start';

DM972.IOS.experiment_path = 'DM972\20230309';

DM972.IOS.recording_path = '2023-03-09\DM972_18-01.mat';


%% DM974

DM974.params.extra_grey_frames = 0;
DM974.params.grey_timing = 'start';

DM974.IOS.experiment_path = 'DM974\20230309';

DM974.IOS.recording_path = '2023-03-09\DM974_18-39.mat';


%% DM996

DM996.params.extra_grey_frames = 0;
DM996.params.grey_timing = 'start';

DM996.IOS.experiment_path = 'DM996\20230628';

DM996.IOS.recording_path = '2023-06-28\DM996_18-17.mat';


%% DM997

DM997.params.extra_grey_frames = 0;
DM997.params.grey_timing = 'start';

DM997.IOS.experiment_path = 'DM997\20230628';

DM997.IOS.recording_path = '2023-06-28\DM997_18-57.mat';


%% DM999

DM999.params.extra_grey_frames = 0;
DM999.params.grey_timing = 'start';

DM999.IOS.experiment_path = 'DM999\20230628';

DM999.IOS.recording_path = '2023-06-28\DM999_19-44.mat';


%% DM1000

DM1000.params.extra_grey_frames = 0;
DM1000.params.grey_timing = 'start';

DM1000.IOS.experiment_path = 'DM1000\20230628';

DM1000.IOS.recording_path = '2023-06-28\DM1000_20-24.mat';


%% DM1001

DM1001.params.extra_grey_frames = 0;
DM1001.params.grey_timing = 'start';

DM1001.IOS.experiment_path = 'DM1001\20230628';

DM1001.IOS.recording_path = '2023-06-28\DM1001_21-03.mat';



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












%% DM865

% DM865.params.extra_grey_frames = 2200;
% DM865.params.grey_timing = 'start';
% DM865.params.training_angle = 130;
% 
% DM865.Baseline.experiment_path = 'DM865\Baseline';
% DM865.SRPd1.experiment_path = 'DM865\SRPd1';
% DM865.SRPd2.experiment_path = 'DM865\SRPd2';
% DM865.SRPd3.experiment_path = 'DM865\SRPd3';
% DM865.SRPd4.experiment_path = 'DM865\SRPd4';
% DM865.Testing200um.experiment_path = 'DM865\Testing-200um';
% DM865.Testing350um.experiment_path = 'DM865\Testing-350um';
% 
% DM865.Baseline.recording_path = '2022-04-18\2022-04-18 16-00.mat';
% DM865.SRPd1.recording_path = '2022-04-18\2022-04-18 16-12.mat';
% DM865.SRPd2.recording_path = '2022-04-19\2022-04-19 17-02.mat';
% DM865.SRPd3.recording_path = '2022-04-20\2022-04-20 17-23.mat';
% DM865.SRPd4.recording_path = '2022-04-21\2022-04-21 14-45.mat';
% DM865.Testing200um.recording_path = '2022-04-22\2022-04-22 15-12.mat';
% DM865.Testing350um.recording_path = '2022-04-22\2022-04-22 15-27.mat';



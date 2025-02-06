function info = PV_TTX_info(mouse, session)


% PV_TTX.mice = ["DM859", "DM862", "DM863"];

% inputs = strsplit(string(recording_session), ["_", " "]);
% mouse = inputs{1};
% session = erase(recording_session, strcat(mouse, "_"));

% function info = PV_TTX_info(mouse, session)
% recording_session = char(strcat(mouse,"_",session));


experiment = 'PV TTX'; 
experiment_folder = 'D:\Daniel\2P\PV TTX\';
recording_folder = '\\bearlab-s2.mit.edu\BearShare\Daniel#\Experiments#\2P raw data\ExperimentalRecords\';



%% DM859

DM859.params.extra_grey_frames = 0;
DM859.params.grey_timing = 'both';

DM859.Baseline_LE.experiment_path = 'DM859\Baseline LE';
DM859.Baseline_RE.experiment_path = 'DM859\Baseline RE';
DM859.TTX_1hr_LE.experiment_path = 'DM859\TTX 1hr LE';
DM859.TTX_1hr_RE.experiment_path = 'DM859\TTX 1hr RE';
DM859.TTX_24hr_LE.experiment_path = 'DM859\TTX 24hr LE';
DM859.TTX_24hr_RE.experiment_path = 'DM859\TTX 24hr RE';
DM859.TTX_48hr_LE.experiment_path = 'DM859\TTX 48hr LE';
DM859.TTX_48hr_RE.experiment_path = 'DM859\TTX 48hr RE';
DM859.TTX_10days_LE.experiment_path = 'DM859\TTX 10days LE';
DM859.TTX_10days_RE.experiment_path = 'DM859\TTX 10days RE';

DM859.Baseline_LE.recording_path = '2022-06-09\2022-06-09 16-33.mat';
DM859.Baseline_RE.recording_path = '2022-06-09\2022-06-09 16-50.mat';
DM859.TTX_1hr_LE.recording_path = '2022-06-10\2022-06-10 16-53.mat';
DM859.TTX_1hr_RE.recording_path = '2022-06-10\2022-06-10 17-10.mat';
DM859.TTX_24hr_LE.recording_path = '2022-06-11\2022-06-11 15-46.mat';
DM859.TTX_24hr_RE.recording_path = '2022-06-11\2022-06-11 16-02.mat';
DM859.TTX_48hr_LE.recording_path = '2022-06-12\2022-06-12 16-40.mat';
DM859.TTX_48hr_RE.recording_path = '2022-06-12\2022-06-12 16-58.mat';
DM859.TTX_10days_LE.recording_path = '2022-06-21\2022-06-21 14-44.mat';
DM859.TTX_10days_RE.recording_path = '2022-06-21\2022-06-21 15-01.mat';



%% DM862

DM862.params.extra_grey_frames = 0;
DM862.params.grey_timing = 'both';

DM862.Baseline_LE.experiment_path = 'DM862\Baseline LE';
DM862.Baseline_RE.experiment_path = 'DM862\Baseline RE';
DM862.TTX_1hr_LE.experiment_path = 'DM862\TTX 1hr LE';
DM862.TTX_1hr_RE.experiment_path = 'DM862\TTX 1hr RE';
DM862.TTX_24hr_LE.experiment_path = 'DM862\TTX 24hr LE';
DM862.TTX_24hr_RE.experiment_path = 'DM862\TTX 24hr RE';
DM862.TTX_48hr_LE.experiment_path = 'DM862\TTX 48hr LE';
DM862.TTX_10days_LE.experiment_path = 'DM862\TTX 10days LE';
DM862.TTX_10days_RE.experiment_path = 'DM862\TTX 10days RE';

DM862.Baseline_LE.recording_path = '2022-06-09\2022-06-09 17-17.mat';
DM862.Baseline_RE.recording_path = '2022-06-09\2022-06-09 17-33.mat';
DM862.TTX_1hr_LE.recording_path = '2022-06-10\2022-06-10 17-54.mat';
DM862.TTX_1hr_RE.recording_path = '2022-06-10\2022-06-10 18-11.mat';
DM862.TTX_24hr_LE.recording_path = '2022-06-11\2022-06-11 17-00.mat';
DM862.TTX_24hr_RE.recording_path = '2022-06-11\2022-06-11 17-17.mat';
DM862.TTX_48hr_LE.recording_path = '2022-06-12\2022-06-12 17-38.mat';
% Didn't run RE for 48 hour timepoint
DM862.TTX_10days_LE.recording_path = '2022-06-21\2022-06-21 15-26.mat';
DM862.TTX_10days_RE.recording_path = '2022-06-21\2022-06-21 15-43.mat';



%% DM863

DM863.params.extra_grey_frames = 0;
DM863.params.grey_timing = 'both';

DM863.Baseline_LE.experiment_path = 'DM863\Baseline LE';
DM863.Baseline_RE.experiment_path = 'DM863\Baseline RE';
DM863.TTX_1hr_LE.experiment_path = 'DM863\TTX 1hr LE';
DM863.TTX_1hr_RE.experiment_path = 'DM863\TTX 1hr RE';
DM863.TTX_24hr_LE.experiment_path = 'DM863\TTX 24hr LE';
DM863.TTX_24hr_RE.experiment_path = 'DM863\TTX 24hr RE';
DM863.TTX_48hr_LE.experiment_path = 'DM863\TTX 48hr LE';
DM863.TTX_48hr_RE.experiment_path = 'DM863\TTX 48hr RE';
DM863.TTX_10days_LE.experiment_path = 'DM863\TTX 10days LE';
DM863.TTX_10days_RE.experiment_path = 'DM863\TTX 10days RE';


DM863.Baseline_LE.recording_path = '2022-06-09\2022-06-09 17-57.mat';
DM863.Baseline_RE.recording_path = '2022-06-09\2022-06-09 18-13.mat';
DM863.TTX_1hr_LE.recording_path = '2022-06-10\2022-06-10 18-47.mat';
DM863.TTX_1hr_RE.recording_path = '2022-06-10\2022-06-10 19-03.mat';
DM863.TTX_24hr_LE.recording_path = '2022-06-11\2022-06-11 17-47.mat';
DM863.TTX_24hr_RE.recording_path = '2022-06-11\2022-06-11 18-04.mat';
DM863.TTX_48hr_LE.recording_path = '2022-06-12\2022-06-12 18-05.mat';
DM863.TTX_48hr_RE.recording_path = '2022-06-12\2022-06-12 18-22.mat';
DM863.TTX_10days_LE.recording_path = '2022-06-21\2022-06-21 16-09.mat';
DM863.TTX_10days_RE.recording_path = '2022-06-21\2022-06-21 16-27.mat';







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








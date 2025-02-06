function info = blank_experiment_info(recording_session)

% PV_TTX.mice = ["DM859", "DM862", "DM863"];

inputs = strsplit(string(recording_session), ["_", " "]);
mouse = inputs{1};
session = inputs{2};

experiment = 'L6 SRP'; % for example
experiment_folder = 'D:\Daniel\2P\L6 SRP\';
recording_folder = '\\bearlab-s2.mit.edu\BearShare\Daniel#\Experiments#\2P raw data\ExperimentalRecords\';



%% mouseA

mouseA.params.extra_grey_frames = 0;
mouseA.params.grey_timing = '';

mouseA.sessX.experiment_path = 'mouseA\yyyymmdd\sessX';
mouseA.sessX.recording_path = 'yyyy-mm-dd\yyyy-mm-dd hh-mm.mat';

mouseA.sessY.experiment_path = 'mouseA\yyyymmdd\sessY';
mouseA.sessY.recording_path = 'yyyy-mm-dd\yyyy-mm-dd hh-mm.mat';

mouseA.sessZ.experiment_path = 'mouseA\yyyymmdd\sessZ';
mouseA.sessZ.recording_path = 'yyyy-mm-dd\yyyy-mm-dd hh-mm.mat';


%% mouseB

mouseB.params.extra_grey_frames = 0;
mouseB.params.grey_timing = '';

mouseB.sessX.experiment_path = 'mouseB\yyyymmdd\sessX';
mouseB.sessX.recording_path = 'yyyy-mm-dd\yyyy-mm-dd hh-mm.mat';

mouseB.sessY.experiment_path = 'mouseB\yyyymmdd\sessY';
mouseB.sessY.recording_path = 'yyyy-mm-dd\yyyy-mm-dd hh-mm.mat';

mouseB.sessZ.experiment_path = 'mouseB\yyyymmdd\sessZ';
mouseB.sessZ.recording_path = 'yyyy-mm-dd\yyyy-mm-dd hh-mm.mat';




%% Output

params = eval(strcat(mouse, ".params"));
experiment_path = eval(strcat(mouse, ".", session, ".experiment_path"));
recording_path = eval(strcat(mouse, ".", session, ".recording_path"));


data_file = [experiment_folder, experiment_path];
mat_file = [recording_folder, recording_path];


info.recording_session = recording_session;
info.experiment = experiment;
info.mouse = mouse;
info.session = session;
info.data_file = data_file;
info.mat_file = mat_file;
info.params = params;








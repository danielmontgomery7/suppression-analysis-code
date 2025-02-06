% function info = run_animal(info)

    % Note: this function should be called from an individual animal's
    %       folder/script.
    
    % create paths and perform checks for data in the above location
    %   Note: checks to see if there is event data, high-pass unit data, and
    %         the results of kilosort are available
    info = path.generate_and_check_paths(info);

    % run event data GUI, high-pass algorithm, and/or kilosort as needed
    %   Note: only needs to be done once (or copy-pasted from a similar
    %         experiment in the case of event data)
    %   Note: if it immediately finishes, it means all the data is already
    %         available (so check to make sure that makes sense)
    preprocess.create_files(info);


%%

    % Note: From here-on out, I generally assume all data are single linear 
    %       shanks and less than 128 channels (so everything is on the "A" 
    %       Intan channel scheme. There are remnants of "offsets" and others
    %       from when I was working with multiple types of probes.

    % import LFP data
    fprintf('Importing LFP data\n')
    [SRPData, info] = import.import_lfp_data(info);

    % compute channel map
    [SRPData, info] = import.compute_channel_map(SRPData, info);

    % add CSD (assumes linear shank ASSY77H3)
    fprintf('Calculating CSD\n')
    info.csd.vertical_distance = 20; % um
    [SRPData, info] = import.calculate_csd(SRPData, info); 

    % describe experiments
    info = import.describe_experiment(info);
    info.exp.stim.fam_stim = info.individual.pr_angle;

    % set defaults for viewing
    info = view.set_defaults(info);
    
    % view VEP/CSD data
    fprintf('Plotting VEPs and CSDs\n')
    view.view_map_vep_csd(SRPData, info)

%%     
    % decide L4
    while ~ismember(info.individual.L4, info.map.loc2intan.values())
        txt = input('Which channel is L4 (A-###): ', "s");
        if ismember(txt, info.map.loc2intan.values())
            info.individual.L4 = {txt};
        end
    end
    info.csd.L4 = info.individual.L4;
    info = import.create_L4_map(info);

    % calculate (or load) MUA data
    fprintf('Calculating or loading MUA\n')
    [SRPData, info] = import.calculate_mua_data(SRPData, info);
    %   note: due to RMS calculation for MUA threshold, initial calculation
    %         takes ~15 seconds/channel 

    % view MUAe/s
    fprintf('Plotting MUA\n')
    view.view_map_mua(SRPData, info)

    % grab all data
    fprintf('Processing VEP data\n')
    [data_struct, info] = process.grab_SRP_data(SRPData, info);

    % grab spect data
    fprintf('Processing spect data\n')
    [data_struct, info] = process.grab_spect_data(data_struct, info);

    % view spect data
    fprintf('Plotting spect data\n')
    view.view_map_norm_spect(data_struct, info)

%%
    % store data
    fprintf('Storing data\n')
    store.store_data(data_struct, info, SRPData)
    


%% Load things

    load(fullfile(info.path.save, 'raw_data', 'info.mat'))
    load(fullfile(info.path.save, 'raw_data', 'data_struct.mat'))
    load(fullfile(info.path.save, 'raw_data', 'SRPData.mat'))
%     load(fullfile(info.path.save, 'raw_data', 'spk_struct.mat'))
%     load(fullfile(info.path.save, 'mua.mat'))

%% Plot things
    info.view.smooth = true;
    info.view.zscore = true;

    % view VEPs over depths
    fprintf('Plotting all data\n')
    view.view_heatmap(data_struct, info, 'VEP')

    % view CSDs over depths
    view.view_heatmap(data_struct, info, 'CSD')

%     % view spectrums over depths
%     view.view_heatmap_spect(data_struct, info, 'lfp', 'raw')
%     view.view_heatmap_spect(data_struct, info, 'lfp', 'norm')

    % view MUAe/s over depths
    info.view.zscore = false;
    view.view_heatmap(data_struct, info, 'MUAe')

%     info.view.zscore = true;
    view.view_heatmap(data_struct, info, 'MUAs')


%     % view stationary LFP over depths
%     view.view_heatmap_stat(data_struct, info, 'LFP')
% 
%     % view stationary MUAe/s over depths
%     info.view.zscore = false;
%     view.view_heatmap_stat(data_struct, info, 'MUAe')


%% Single unit analysis

%     process.grab_ks_data(info);


% import and high pass filter all data
%   Note: requires a lot of available memory, might need to rethink later
spk_struct = spk.extract_high_pass_filtered_data(info);

% get range of spike waveforms for each spike cluster
spk_struct = spk.extract_kilosort_spikes(spk_struct, info);


% NEED TO ENSURE THAT THE TROUGH IS ACTUALLY THE TROUGH; LOOK AT SHIN AND MOORE 2019 FigS6Ai
% then can do trough to peak <= 0.4 is FS
% ALSO SENZAI 2019 Fig4A


% automatically sort into different types (based on peak and trough times)
%   (with additional input to reject waveform)
spk_struct = spk.automatically_label_spikes(spk_struct);

% view results of automated/manual spikes
spk.view_waveforms(spk_struct);

% calculate the span of voltage values for all units
% TO DO
%   get all waveforms into a 2D matrix (time by number of waveforms)
%   perform average unit waveform
%   calculate the maximum absolute value at any timepoint and divide everything by that
%   create a 3D matrix of zeros where one of the dimensions is -1:0.1:1
%   for each waveform, for each timepoint, place the normalized voltage as simply a 1 in the correct bin
%   average everything to get a nice 3D population plot (the average waveform should be where most of the data lies)

% grab SUA PSTH
spk_struct = spk.grab_psth_data(SRPData, spk_struct, info);

% view average PSTH
spk.view_average_psth(data_struct, spk_struct, info)

% [ODIs, LE_spikes, RE_spikes, n] = spk.view_ODI(spk_struct);
% [ODIs, LE_spikes, RE_spikes] = spk.view_L4_ODI(spk_struct);

% x = [LE_spikes, RE_spikes];

%% Save

high_pass_data = spk_struct.high_pass_data;
spk_struct = rmfield(spk_struct, 'high_pass_data');

save(fullfile(info.path.save, 'raw_data', 'spk_struct.mat'), 'spk_struct', '-v7.3');
save(fullfile(info.path.save, 'raw_data', 'high_pass_data.mat'), 'high_pass_data', '-v7.3');

%%

load(fullfile(info.path.save, 'raw_data', 'spk_struct.mat'));

% end
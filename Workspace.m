
% Set path to folders containing data (last \ is important)
 % path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\MD ramps\'; % MD_ramps
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\MD ramps\Ipsi VEPs\'; % MD_ramps
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\Monoc vs Binoc ramps\'; % Monoc_Binoc_ramps
%path2folders = '\\bearlab-s2.mit.edu\bearshare\Daniel#\Experiments#\VEP Suppression Data\Naive ramps\'; % Naive_ramps
% path2folders_2 = 'B:\Daniel#\Experiments#\VEP Suppression Data\Naive reverse ramps\'; % Naive_ramps
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\Orientation ramps (all)\'; % Orientation_ramps
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\SRP experiment\SRP Testing only\'; % SRP_experiment
 path2folders = '\\bearlab-s2.mit.edu\bearshare\Daniel#\Experiments#\VEP Suppression Data\SRP experiment\SRP Testing only\'; % SRP_experiment 
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\SRP experiment\SRP Training\'; % SRP_training
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\020 and 040 DiscRamps\'; % High_spatial_freq_ramps
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\MonocConcDisc no ramp\'; % Monoc_conc_disc
%  path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\P21 MD ramps\'; % P21_MD_ramps
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\P21 MD ramps\Ipsi VEPs\'; % P21_MD_Ipsi_VEPs
%path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\P21 MD ramps\Post TTX\'; % P21_MD_TTX_ramps
%  path2folders = '\\bearlab-s2.mit.edu\bearshare\Daniel#\Experiments#\VEP Suppression Data\MD TPOT\'; % TPOT
% path2folders = '\\bearlab-s2.mit.edu\bearshare\Daniel#\Experiments#\VEP Suppression Data\MD TPOT\training\'; % TPOT_training
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\Contrast Tuning\'; % Contrast_tuning
% path2folders = 'B:\Daniel#\Experiments#\SRP VEP data\Testing\'; % SRP_testing
%path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\MD acuity ramps\'; % MD_acuity_ramps
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\MD acuity ramps\Banana\'; % MD_acuity_ramps (Banana)
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\MD TTX contrast tuning\'; % MD_TTX_contrast_tuning
% path2folders = 'B:\Dan#\Experiments#\Phase offset ramps\Cucumber\'; % Phase_offset_ramps
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\Phase offset ramps\'; % Phase_offset_ramps 
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\Phase offset ramps\wrong ttls\'; % Phase_offset_ramps (Halibut)
% path2folders = 'B:\Daniel#\Experiments#\VEP Suppression Data\MD acuity ramps flipped\'; % MD_acuity_ramps_flipped
% path2folders = 'B:\Dan#\Dan Eric PLX files\MD acuity ramps flipped\'; % MD_acuity_ramps_flipped

% import PLX data 
rampData = import.import_plx_data(path2folders);
% rampData = import.import_plx_data(rampData, path2folders_2);

% assign mice to experiments
import.update_data_assignments(rampData)

% describe experiments
info = import.describe_experiments({'SRP_experiment'});

% grab ramp data
[data_struct, info] = process.grab_ramp_data(rampData, info);

% get spect data
[data_struct, info] = process.grab_spect_data(data_struct, info);

% % view stim VEPs (to decide good hemis)
view.view_vep_data(data_struct, info)


% specify good hemis
% info = process.specify_good_hemis(info); % LEFT HEMISPHERES
 info = process.specify_good_hemis_RHs(info); % RIGHT HEMISPHERES

% collect group data using good hemis
group_data = group.grab_group_data(data_struct, info);

% get summary statistics
group_data = group.get_summary_stats(group_data, info);

% % view group data
group.view_group_data(group_data, info)





%%
 data1 = group_data.P21_MD_ramps.summary_stats.nRamp1conc.MD.VEP_waveforms(1:300,:);
 data2 = group_data.P21_MD_ramps.summary_stats.nRamp2disc.MD.VEP_waveforms(1:300,:);
 
 figure(); 
 subplot(211); hold on
     plot(data1(:,1), 'Color', [0 0 0], 'LineWidth', 2)
     plot(data1(:,6), 'Color', [0 0 1], 'LineWidth', 2)
     plot(data1(:,2), 'Color', [0 0 0.2])
     plot(data1(:,3), 'Color', [0 0 0.4])
     plot(data1(:,4), 'Color', [0 0 0.6])
     plot(data1(:,5), 'Color', [0 0 0.8])
     xlabel('Time (ms)'); ylabel('Voltage (\muV)')
     legend('Monocular', 'Concordant');
 
 subplot(212); hold on
     plot(data2(:,1), 'Color', [0 0 0], 'LineWidth', 2)
     plot(data2(:,6), 'Color', [1 0 0], 'LineWidth', 2)
     plot(data2(:,2), 'Color', [0.2 0 0])
     plot(data2(:,3), 'Color', [0.4 0 0])
     plot(data2(:,4), 'Color', [0.6 0 0])
     plot(data2(:,5), 'Color', [0.8 0 0])
     xlabel('Time (ms)'); ylabel('Voltage (\muV)')
     legend('Monocular', 'Discordant');
    


%% Contrast ramp waveforms

% data1 = group_data.High_spatial_freq_ramps.summary_stats.DiscRamp020.VEP_waveforms(1:300,:);
% data2 = group_data.High_spatial_freq_ramps.summary_stats.DiscRamp040.VEP_waveforms  (1:300,:);


 data1 = group_data.MD_ramps.summary_stats.nRamp1conc.Sham.VEP_waveforms(1:300,:);
 data2 = group_data.MD_ramps.summary_stats.nRamp2disc.Sham.VEP_waveforms(1:300,:);
 data3 = group_data2.P21_MD_ramps.summary_stats.nRamp1conc.Sham.VEP_waveforms(1:300,:);
 data4 = group_data2.P21_MD_ramps.summary_stats.nRamp2disc.Sham.VEP_waveforms(1:300,:);
 data1 = (data1 + data3)/2;
 data2 = (data2 + data4)/2;

% data1 = group_data.Phase_offset_ramps.summary_stats.InPhaseConc.Sham.VEP_waveforms(1:300,:);
% data2 = group_data.Phase_offset_ramps.summary_stats.OutPhaseConc.Sham.VEP_waveforms(1:300,:);


% data1 = group_data.Monoc_Binoc_ramps.summary_stats.Monoc.VEP_waveforms(1:300,:);
% data2 = group_data.Monoc_Binoc_ramps.summary_stats.Binoc.VEP_waveforms(1:300,:);

% data1 = group_data.Phase_offset_ramps.summary_stats.InPhaseConc.Sham.VEP_waveforms(1:300,:);
% data2 = group_data.Phase_offset_ramps.summary_stats.OutPhaseConc.Sham.VEP_waveforms(1:300,:);

axis_dims = [0 300 -150 100];

figure('Position', [729 857 560 80]);
subplot(171);
    axis(axis_dims)
    scalebar('XLen', 200, 'XUnit', 'ms', 'YLen', 50, 'YUnit', '\muV')
    axis off
subplot(172);
    plot(data1(:,1), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(173);
    plot(data1(:,2), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(174);
    plot(data1(:,3), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(175);
    plot(data1(:,4), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(176);
    plot(data1(:,5), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(177);
    plot(data1(:,6), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off


figure('Position', [729 857 560 80]);
subplot(171);
    axis(axis_dims)
    scalebar('XLen', 200, 'XUnit', 'ms', 'YLen', 50, 'YUnit', '\muV')
    axis off
subplot(172);
    plot(data2(:,1), 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(173);
    plot(data2(:,2), 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(174);
    plot(data2(:,3), 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(175);
    plot(data2(:,4), 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(176);
    plot(data2(:,5), 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(177);
    plot(data2(:,6), 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off



%% Orientation ramp waveforms

data1 = group_data.Orientation_ramps.summary_stats.OrientationRamp.VEP_waveforms(1:300,:);


axis_dims = [0 300 -120 100];

figure('Position', [729 857 660 80]);
subplot(191);
    axis(axis_dims)
    scalebar('XLen', 200, 'XUnit', 'ms', 'YLen', 50, 'YUnit', '\muV')
    axis off
subplot(192);
    plot(data1(:,1), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(193);
    plot(data1(:,2), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(194);
    plot(data1(:,3), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(195);
    plot(data1(:,4), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(196);
    plot(data1(:,5), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(197);
    plot(data1(:,6), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(198);
    plot(data1(:,7), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(199);
    plot(data1(:,8), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off



%% SRP testing waveforms

data1 = group_data.SRP_experiment.summary_stats.testREfam.Monoc.VEP_waveforms(1:300,:); SRP
data2 = group_data.SRP_experiment.summary_stats.testREnov.Monoc.VEP_waveforms(1:300,:);
data3 = group_data.SRP_experiment.summary_stats.testREfam.BinocDisc.VEP_waveforms(1:300,:);
data4 = group_data.SRP_experiment.summary_stats.testREnov.BinocDisc.VEP_waveforms(1:300,:);
data5 = group_data.SRP_experiment.summary_stats.testREfam.BlackLE.VEP_waveforms(1:300,:);
data6 = group_data.SRP_experiment.summary_stats.testREnov.BlackLE.VEP_waveforms(1:300,:);

% data1 = group_data2.P21_MD_Ipsi_VEPs.summary_stats.IPSItest.MD.VEP_waveforms(1:300,:); % MD Ipsi
% data2 = group_data2.P21_MD_Ipsi_VEPs.summary_stats.IPSItest.Sham.VEP_waveforms(1:300,:); % Sham Ipsi
% data3 = group_data.P21_MD_ramps.summary_stats.nRamp1conc.MD.VEP_waveforms(1:300,1); % MD Contra
% data4 = group_data.P21_MD_ramps.summary_stats.nRamp1conc.Sham.VEP_waveforms(1:300,1); % Sham Contra

axis_dims = [0 300 -200 100];

figure('Position', [729 857 560 80]);
subplot(191);
    axis(axis_dims)
    scalebar('XLen', 200, 'XUnit', 'ms', 'YLen', 100, 'YUnit', '\muV')
    axis off
subplot(172);
    plot(data1, 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(173);
    plot(data2, 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(174);
    plot(data3, 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(175);
    plot(data4, 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(176);
    plot(data5, 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(177);
    plot(data6, 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off





%% High spatial frequency ramp

% data1 = group_data.MD_acuity_ramps_flipped.summary_stats.flipDiscRamp005.Sham.VEP_waveforms(1:300,:);
% data2 = group_data.MD_acuity_ramps_flipped.summary_stats.flipDiscRamp020.Sham.VEP_waveforms(1:300,:);
% data3 = group_data.MD_acuity_ramps_flipped.summary_stats.flipDiscRamp040.Sham.VEP_waveforms(1:300,:);
% data1 = group_data.MD_acuity_ramps_flipped.summary_stats.flipDiscRamp005.MD.VEP_waveforms(1:300,:);
% data2 = group_data.MD_acuity_ramps_flipped.summary_stats.flipDiscRamp020.MD.VEP_waveforms(1:300,:);
% data3 = group_data.MD_acuity_ramps_flipped.summary_stats.flipDiscRamp040.MD.VEP_waveforms(1:300,:);

% data1 = group_data2.MD_acuity_ramps.summary_stats.DiscRamp005.Sham.VEP_waveforms(1:300,:);
% data2 = group_data2.MD_acuity_ramps.summary_stats.DiscRamp020.Sham.VEP_waveforms(1:300,:);
% data3 = group_data2.MD_acuity_ramps.summary_stats.DiscRamp040.Sham.VEP_waveforms(1:300,:);
data1 = group_data2.MD_acuity_ramps.summary_stats.DiscRamp005.MD.VEP_waveforms(1:300,:);
data2 = group_data2.MD_acuity_ramps.summary_stats.DiscRamp020.MD.VEP_waveforms(1:300,:);
data3 = group_data2.MD_acuity_ramps.summary_stats.DiscRamp040.MD.VEP_waveforms(1:300,:);


% data1 = (7*data1a + 18*data1b) / 25;
% data2 = (7*data2a + 18*data2b) / 25;
% data3 = (7*data3a + 18*data3b) / 25;



axis_dims = [0 300 -150 100];

figure('Position', [729 857 560 80]);
subplot(171);
    axis(axis_dims)
    scalebar('XLen', 200, 'XUnit', 'ms', 'YLen', 50, 'YUnit', '\muV')
    axis off
subplot(172);
    plot(data1(:,1), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(173);
    plot(data1(:,2), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(174);
    plot(data1(:,3), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(175);
    plot(data1(:,4), 'Color', [0 0 1], 'LineWidth', 2)
    axis(axis_dims); axis off


figure('Position', [729 857 560 80]);
subplot(171);
    axis(axis_dims)
    scalebar('XLen', 200, 'XUnit', 'ms', 'YLen', 50, 'YUnit', '\muV')
    axis off
subplot(172);
    plot(data2(:,1), 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(173);
    plot(data2(:,2), 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(174);
    plot(data2(:,3), 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(175);
    plot(data2(:,4), 'Color', [1 0 0], 'LineWidth', 2)
    axis(axis_dims); axis off


figure('Position', [729 857 560 80]);
subplot(171);
    axis(axis_dims)
    scalebar('XLen', 200, 'XUnit', 'ms', 'YLen', 50, 'YUnit', '\muV')
    axis off
subplot(172);
    plot(data3(:,1), 'Color', [0 1 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(173);
    plot(data3(:,2), 'Color', [0 1 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(174);
    plot(data3(:,3), 'Color', [0 1 0], 'LineWidth', 2)
    axis(axis_dims); axis off
subplot(175);
    plot(data3(:,4), 'Color', [0 1 0], 'LineWidth', 2)
    axis(axis_dims); axis off






%% Load data

mice = [{'DM988'}, {'DM990'}, {'DM991'}, {'DM992'}, {'DM993'}, {'DM994'}, {'DM1005'}, {'DM1006'}, {'DM1007'}, {'DM1009'}, {'DM1010'}];

data_path = '\\bearlab-s2.mit.edu\bearshare\Daniel#\Experiments#\Units\Suppression\Individual Files and Code\';

layer_borders = [300, 60, -80, -260, -460];


group_struct = import.load_mouse_data(mice, data_path);

SUA_struct = import.load_SUA_data(mice, data_path);


%% Organize data

[VEP, VEP_stats, depth_VEPs] = process.VEP_analysis(group_struct);

[CSD, MUA] = process.CSD_MUA_analysis(group_struct);

zMUA = process.zscore_MUA(MUA);


%% Plot VEPs, CSDs, and MUA

view.view_VEPs(VEP, VEP_stats);

view.view_VEPs_by_layer(depth_VEPs)

view.view_group_heatmap(CSD, "CSD", layer_borders)

view.view_group_heatmap(MUA, "MUA", layer_borders)

view.view_group_heatmap(zMUA, "zMUA", layer_borders)

MUA_time = 1:25;
view.view_MUA_by_depth(MUA, layer_borders, MUA_time)


%% Compare with monocular condition

CI = 99; % percent confidence interval

view.view_group_heatmap_compare(CSD, "CSD", layer_borders, CI);

view.view_group_heatmap_compare(MUA, "MUA", layer_borders, CI);

view.view_group_heatmap_compare(zMUA, "zMUA", layer_borders, CI);


%% Plot traces for CSDs and MUA

cortex_borders = [300, -460];
x = view.view_group_traces(zMUA, "MUA", cortex_borders);

cortex_borders = [300, -460];
x = view.view_group_traces(MUA, "MUA", cortex_borders);

%% Organize SUA data

good_cells_only = false;

[SUA, SUA_raster, unit_depths] = process.SUA_analysis(SUA_struct, layer_borders, good_cells_only);


%% Plot SUA

zscore = true;
smooth_data = true;
plot_errorbars = false;

view.plot_layer_SUA(SUA, zscore, smooth_data, plot_errorbars)

view.plot_all_SUA(SUA, zscore, smooth_data, plot_errorbars)


%% Plot single unit PSTHs

zscore = true;
smooth_data = true;

view.plot_SUA_PSTH_by_layer(SUA, zscore, smooth_data)


%% Get rasters for SUA

view.plot_SUA_raster(SUA_raster.pyr.L23, [])

view.plot_SUA_raster(SUA_raster.pyr.L4, [])

view.plot_SUA_raster(SUA_raster.pyr.L5, [])

view.plot_SUA_raster(SUA_raster.pyr.L6, [])


view.plot_SUA_raster(SUA_raster.pv.L23, [])

view.plot_SUA_raster(SUA_raster.pv.L4, [])

view.plot_SUA_raster(SUA_raster.pv.L5, [])

view.plot_SUA_raster(SUA_raster.pv.L6, [])


%% Get SUA to run stats

% Get SUA for each layer for the early peak (40-80 ms) and late peak (100-200 ms)


output_format = 1; % 1 or 2
zscore = false;

SUA_stats = process.get_SUA_stats(SUA, output_format, zscore)


view.plot_SUA_cdf(SUA_stats.pyr.all.early_peak, 'RS early peak');
view.plot_SUA_cdf(SUA_stats.pyr.all.late_peak, 'RS late peak');
view.plot_SUA_cdf(SUA_stats.pv.all.early_peak, 'FS early peak');
view.plot_SUA_cdf(SUA_stats.pv.all.late_peak, 'FS late peak');






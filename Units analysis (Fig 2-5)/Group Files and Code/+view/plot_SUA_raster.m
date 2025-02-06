function [] = plot_SUA_raster(data_struct, cells)



conditions = fields(data_struct);
n_conds = length(conditions);
time_idx = 1:300;
% trial_idx = 1:100;
trial_idx = 1:5:250;
n_trials = length(trial_idx);
colors = [{[100, 100, 100]/255}, ... % grey
    {[87, 78, 249]/255}, ... % blue
    {[249, 64, 64]/255}, ... % red
    {[255, 160, 64]/255}]; % orange

%%%%
%find the most active cells
if isempty(cells)
    n_cells = 10;
    avg_activity = squeeze(mean(data_struct.antiphase, [1,2]))';
    [~, idx] = sort(avg_activity);
    cells = idx(end-n_cells+1:end);
end
%%%%

if isempty(cells)
    cells = 1:size(data_struct.(conditions{1}), 3);
    fig_position = [0.47 0.41 0.11 0.19];
    LineFormat.LineWidth = 3;
else
    fig_position = [0.47 0.41 0.11 0.19];
    LineFormat.LineWidth = 1.5;
end

for iCell = cells

    figure('Units', 'Normalized', 'Position', fig_position);

    for iCond = 1:n_conds

        temp_data = logical(data_struct.(conditions{iCond}));

        LineFormat.Color = colors{iCond};

        subplot(4,1,iCond)
        view.plotSpikeRaster(temp_data(time_idx,trial_idx,iCell)', 'LineFormat', LineFormat);

        set(gca,'XLim', [0 300], 'YLim', [0 n_trials], 'XTickLabel',[], 'YTickLabel',[], 'XTick',[], 'YTick',0:25:n_trials);

    end

    subplot(414)
    set(gca,'YTickLabel',[], 'XTickLabel',0:100:300, 'YTick', 0:25:n_trials, 'XTick', 0:100:300);
    subplot(411)
    title(iCell)

end


















end
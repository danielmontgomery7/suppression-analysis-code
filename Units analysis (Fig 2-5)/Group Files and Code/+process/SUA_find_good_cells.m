function responsive_cells = SUA_find_good_cells(mouse_SUA_data)



thresh = 5; % SD change to count as visually responsive
K = 10; % kernal for smoothing

cell_stat_avg = squeeze(mean(mouse_SUA_data.stat_pr, 2)); % average firing rate for each cell during stationary period


smooth_cell_stat_avg = smoothdata(cell_stat_avg, 1, 'movmean', K);
cell_avg = mean(smooth_cell_stat_avg, 1);
cell_std = std(smooth_cell_stat_avg, [], 1);

% cell_avg = mean(cell_stat_avg, 1);
% cell_std = std(cell_stat_avg, [], 1);

cell_thresh_high = cell_avg + thresh.*cell_std;
cell_thresh_low = cell_avg - thresh.*cell_std;

cell_pr_avg = squeeze(mean(mouse_SUA_data.pr, 2));

smooth_cell_pr_avg = smoothdata(cell_pr_avg, 1, 'movmean', K);

cell_max = max(smooth_cell_pr_avg(1:100,:));
cell_min = min(smooth_cell_pr_avg(1:100,:));


responsive_cells = cell_max > cell_thresh_high | cell_min < cell_thresh_low;
% responsive_cells = cell_max > cell_thresh_high;
% responsive_cells = cell_min < cell_thresh_low;



end
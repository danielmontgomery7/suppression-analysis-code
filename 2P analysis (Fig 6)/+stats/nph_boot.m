function [distribution, statistics] = nph_boot(data_struct, ops)
% 
% 
% Data struct
%   rows = cells
%   cols = blocks



%% Default options
if nargin < 2; ops = []; end

if ~isfield(ops, 'reps') 
    ops.reps = 10000;               end
if ~isfield(ops, 'samples') 
    ops.samples = length(data_struct);     end
if ~isfield(ops, 'CI_range') 
    ops.CI_range = 0.95;            end
if ~isfield(ops, 'plot_on')
    ops.plot_on = 1;                end
if ~isfield(ops, 'figure_handle')       % default: make new figure
    if ops.plot_on && isempty(get(groot,'CurrentFigure'))
        ops.figure_handle = 1;
    elseif ops.plot_on && ~isempty(get(groot,'CurrentFigure'))
        ops.figure_handle = gcf().Number+1;
    end
end
    

%% Get distribution

mice = fields(data_struct);
n_mice = length(mice);

distribution = nan(ops.reps,1);
for ii = 1:ops.reps

    random_mouse = mice(randi(n_mice));
    mouse_data = data_struct.(random_mouse{:});

    n_cells = size(mouse_data, 1);
    n_blocks = size(mouse_data, 2);

    random_cell = randi(n_cells, n_cells, 1); % choose cells with replacement
    random_block = randi(n_blocks, n_blocks, 1); % choose blocks with replacement

    
    distribution(ii) = mean(mean(mouse_data(random_cell, random_block)));

end


%% Get confidence interval

CI_range = [(0.5+ops.CI_range/2),(0.5-ops.CI_range/2)];
CI_idxs = round(ops.reps*CI_range);


sorted_dist = sort(distribution);
mid = sorted_dist(round(ops.reps/2));
CI = sorted_dist(CI_idxs);
statistics = [mid; CI];

%% Plot

if ops.plot_on

    figure(ops.figure_handle); hold on
    histogram(distribution);
    vline(mid); vline(CI);

end



end










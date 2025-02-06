function [output_diff, stats, output_data1, output_data2, p_value] = nph_boot_diff(data1, data2, ops)
% 
% 
% Data struct
%   rows = cells
%   cols = blocks



%% Default options
if nargin < 3; ops = []; end

if ~isfield(ops, 'data_format')         % default: input two structures
    ops.data_format = "structure";  end
if ~isfield(ops, 'reps')                % default: repeat bootstrap 10,000 times
    ops.reps = 10000;               end
if ~isfield(ops, 'CI_range')            % default: 95% confidence interval
    ops.CI_range = 0.95;            end
if ~isfield(ops, 'plot_on')             % default: don't plot
    ops.plot_on = 0;                end
if ~isfield(ops, 'mice_matched')        % default: compare the same mice in each group
    ops.mice_matched = 1;           end
if ~isfield(ops, 'cells_matched')       % default: different cells for each mouse
    ops.cells_matched = 0;          end
if ~isfield(ops, 'blocks_matched')      % default: blocks don't correspond between mice
    ops.blocks_matched = 0;         end
if ~isfield(ops, 'figure_handle')       % default: make new figure
    if ops.plot_on && isempty(get(groot,'CurrentFigure'))
        ops.figure_handle = 1;
    elseif ops.plot_on && ~isempty(get(groot,'CurrentFigure'))
        ops.figure_handle = gcf().Number+1;
    end
end



%% Get distribution for structures

if ops.data_format == "structure"

    mice1 = fields(data1);      % get list of mice in each group
    mice2 = fields(data2);
    n_mice1 = length(mice1);    % number of mice in each group
    n_mice2 = length(mice2);
    output_data1 = nan(ops.reps,1);  % preallocate output
    output_data2 = nan(ops.reps,1);
    
    for ii = 1:ops.reps                                     % repeat bootstrap [ops.reps] times
        
        if ops.mice_matched                                 % if mice are matched between datasets, compare each mouse to itself
            random_mouse = mice1(randi(n_mice1));
            mouse_data1 = data1.(random_mouse{:});
            mouse_data2 = data2.(random_mouse{:});
        else                                                % if mice are NOT matched between datasets, compare a random mouse from each
            random_mouse1 = mice1(randi(n_mice1));
            random_mouse2 = mice2(randi(n_mice2));
            mouse_data1 = data1.(random_mouse1{:});
            mouse_data2 = data2.(random_mouse2{:});
        end
    
        % sample from data1
        n_cells_1 = size(mouse_data1, 1);
        n_blocks_1 = size(mouse_data1, 2);
        random_cells_1 = randi(n_cells_1, n_cells_1, 1); % choose cells with replacement
        random_blocks_1 = randi(n_blocks_1, n_blocks_1, 1); % choose blocks with replacement
    
        % sample from data2
        n_cells_2 = size(mouse_data2, 1);
        n_blocks_2 = size(mouse_data2, 2);
        random_cells_2 = randi(n_cells_2, n_cells_2, 1); % choose cells with replacement
        random_blocks_2 = randi(n_blocks_2, n_blocks_2, 1); % choose blocks with replacement
    
        if ops.cells_matched % if cells (rows) in both data sets are the same
            random_cells_2 = random_cells_1;
        end
    
        if ops.blocks_matched % if blocks (columns) in both data sets correspond to each other
            random_blocks_2 = random_blocks_1;
        end
    
        output_data1(ii) = mean(mean(mouse_data1(random_cells_1, random_blocks_1)));
        output_data2(ii) = mean(mean(mouse_data2(random_cells_2, random_blocks_2)));
    
    end
end



%% Get distribution for vectors

if ops.data_format == "vectors" || ops.data_format == "arrays"

    output_data1 = nan(ops.reps,1);  % preallocate output
    output_data2 = nan(ops.reps,1);
    
    for ii = 1:ops.reps                                     % repeat bootstrap [ops.reps] times
            
        n_sample_1 = size(data1, 1);
%         random_sample_1 = randi(n_sample_1, 100, 1); % choose samples from dataset 1 with replacement
        random_sample_1 = randi(n_sample_1, n_sample_1, 1); % choose samples from dataset 1 with replacement

        n_sample_2 = size(data2, 1);
%         random_sample_2 = randi(n_sample_2, 100, 1); % choose samples from dataset 2 with replacement
        random_sample_2 = randi(n_sample_2, n_sample_2, 1); % choose samples from dataset 2 with replacement

        output_data1(ii) = mean(mean(data1(random_sample_1)));
        output_data2(ii) = mean(mean(data2(random_sample_2)));
    end
end


%% Get confidence interval

CI_range = [(0.5+ops.CI_range/2),(0.5-ops.CI_range/2)];
CI_idxs = round(ops.reps*CI_range);

output_diff = output_data1-output_data2;
sorted_dist = sort(output_diff);
mid = sorted_dist(round(ops.reps/2));
CI = sorted_dist(CI_idxs);
stats = [mid; CI];
    

%% Plot

if ops.plot_on

    figure(ops.figure_handle); hold on
    histogram(output_diff);
    vline(mid); vline(CI);

end


p_value = 2*min([sum(output_diff < 0)/ops.reps, sum(output_diff > 0)/ops.reps]);

fprintf('\n\np = %f\n', p_value)










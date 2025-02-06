function  plot_all_SUA(SUA, zscore, smooth_data, plot_errorbars)
%%
    % options
%     smooth_data = true;
%     zscore = false;
%     plot_errorbars = true;
    show_legend = false;
    
    % set some parameters for organizing data and plotting
    cell_types = [{'pyr'}, {'pv'}];
    layers = [{'L23'}, {'L4'}, {'L5'}, {'L6'}];
    conditions = ["monocular", "concordant", "discordant", "antiphase"];
    K = 1000/120; % kernal size for smoothing
    xvec = 1:400; % x-axis vector
    spike_types = [{'RS'}, {'FS'}]; % label plots as RS or FS, not pyr or pv
    colors = [{[100, 100, 100]/255}, ... % grey
        {[87, 78, 249]/255}, ... % blue
        {[249, 64, 64]/255}, ... % red
        {[255, 160, 64]/255}]; % orange
    
    % Make figure
    figure('Position', [1007 629 423 193])
    
    % Organize data
    n_cell_types = length(cell_types);
    iPlot = 0;
    for iCell = 1:n_cell_types

        iPlot = iPlot + 1;
        cell_type = cell_types{iCell};

        % Get data for each condition
        for ii = 1:length(conditions)
            data = SUA.(cell_type).all.(conditions{ii});
    
            if zscore == 1 % z-score based on average firing for all conditions
                all_data = [];
                for iii = 1:length(conditions)
                    all_data = [all_data; SUA.(cell_type).all.(conditions{iii})];
                end
                mn_data = mean(all_data, 1);
                std_data = std(all_data, [], 1);
                data = (data - mn_data)./std_data;
            end
    
            if smooth_data == 1
                avg_data{ii} = smoothdata(mean(data, 2), 1, 'movmean', K);
                sem_data{ii} = smoothdata(std(data, [], 2)./sqrt(1*size(data,2)), 1, 'gaussian', K);
            else
                avg_data{ii} = mean(data, 2);
                sem_data{ii} = std(data, [], 2)./sqrt(1*size(data,2));
            end
            low_data{ii} = avg_data{ii} - sem_data{ii};
            high_data{ii} = avg_data{ii} + sem_data{ii};
        end


        % Plot data
        subplot(1, n_cell_types, iPlot)
        hold on
        for ii = 1:length(conditions)
            if plot_errorbars == 1
                patch([xvec fliplr(xvec)], [low_data{ii}' fliplr(high_data{ii}')], colors{ii}, 'EdgeColor', 'none')
                plot(xvec, avg_data{ii}, '-k')
            else
                plot(xvec, avg_data{ii}(xvec), 'Color', colors{ii}, 'LineWidth', 2)
            end
        end

        spike_type = spike_types{iCell};
        xlim([0, 300]);
%         if spike_type == "RS" && ~zscore
%             ylim([0 0.025])
% %             ylim([0 0.012])
%         elseif spike_type == "FS" && ~zscore
%             ylim([0 0.08])
% %             ylim([0 0.04])
%         end
        title(sprintf('All %s cells (n = %d)', spike_type, size(data,2)))
        xlabel('Time (msec)')
        ylabel('Firing Rate')
        if iPlot == 2 && show_legend
            legend(conditions, 'Location', 'Northeast')
        end

    end

end
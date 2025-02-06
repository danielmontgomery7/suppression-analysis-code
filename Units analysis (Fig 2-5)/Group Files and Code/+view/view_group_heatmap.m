function [avg_data] = view_group_heatmap(data_struct, plot_type, layer_borders)


    smooth_plot = 1;
    
    % parameters
    tvep = 1:300;
    depth_vec = 400:-20:-600;
    cmap = inferno(100);
    xplotlim = [0 300];
    xplotticks = 0:100:300;
%     yplotlim = [-500 400];
%     yplotticks = -400:200:400;
    yplotlim = [-510 350];
    yplotticks = -400:200:400;
%     conditions = fields(data_struct);
    conditions = ["monocular", "concordant", "antiphase", "discordant"];
    n_conditions = length(conditions);
    
    
    if upper(plot_type) == 'CSD'
%         K = ones(3,1)/3;
        c_range = [-0.0025, 0.0025];
    elseif upper(plot_type) == 'MUA'
%         K = ones(1,9)/9;
        c_range = [20, 60];
    elseif upper(plot_type) == 'ZMUA'
%         K = ones(1,9)/9;
        c_range = [-2, 20];
    end
    
    % Get average across all mice
    for ii = 1:n_conditions
        iCondition = conditions{ii};
        n_mice = size(data_struct.(iCondition), 3);
        avg_data.(iCondition) = nanmean(data_struct.(iCondition)(tvep,:,:), 3)';
        if smooth_plot == 1
            if upper(plot_type) == "CSD"
                avg_data.(iCondition) = smoothdata(avg_data.(iCondition), 1, 'movmean', 3);
            elseif upper(plot_type) == "MUA"
                avg_data.(iCondition) = smoothdata(avg_data.(iCondition), 2, 'movmean', 1000/60);
            elseif upper(plot_type) == "ZMUA"
%                 avg_data.(iCondition) = smoothdata(avg_data.(iCondition), 2, 'movmean', 1000/120);
                avg_data.(iCondition) = smoothdata(avg_data.(iCondition), 2, 'movmean', 1000/60);
            end
%             avg_data.(iCondition) = conv2(avg_data.(iCondition), K, 'same');
        end
    end

    % Plot each condition in individual subplots
    figure('Position', [350 900 1650 260])
    for ii = 1:n_conditions
        iCondition = conditions{ii};
    
        subplot(1, n_conditions, ii)
            contourf(tvep, depth_vec, avg_data.(iCondition), 40, 'edgecolor', 'none');
            axis tight
            xlabel('Time (msec)')
            ylabel('Distance from L4 (\mum)')
            xlim(xplotlim)
            xticks(xplotticks)
            ylim(yplotlim)
            yticks(yplotticks)
            colormap(cmap)
            colorbar()
            clim(c_range)
            title(iCondition)
            set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')

        hline(layer_borders, 'w--')
    end
end

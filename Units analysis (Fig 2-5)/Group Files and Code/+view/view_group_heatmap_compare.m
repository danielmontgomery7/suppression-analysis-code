function avg_diff = view_group_heatmap_compare(data_struct, plot_type, layer_borders, percent_CI)


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
        c_range = [-0.001, 0.001];
    elseif upper(plot_type) == 'MUA'
%         K = ones(1,9)/9;
        c_range = [-8, 8];
    elseif upper(plot_type) == 'ZMUA'
%         K = ones(1,9)/9;
        c_range = [-6, 6];
    end



    % Get average difference across all mice
    for ii = 2:n_conditions
        iCondition = conditions{ii};
        n_mice = size(data_struct.(iCondition), 3);

        diff_data.(iCondition) = data_struct.(iCondition) - data_struct.monocular;
%         diff_data.(iCondition) = data_struct.(iCondition) - data_struct.antiphase;

        avg_diff.(iCondition) = nanmean(diff_data.(iCondition)(tvep,:,:), 3)';
        sem_diff.(iCondition) = nanstd(diff_data.(iCondition)(tvep,:,:), [], 3)' ./ sqrt(n_mice);
        if smooth_plot == 1
            if upper(plot_type) == "CSD"
                avg_diff.(iCondition) = smoothdata(avg_diff.(iCondition), 1, 'movmean', 3);
                sem_diff.(iCondition) = smoothdata(sem_diff.(iCondition), 1, 'movmean', 3);
            elseif upper(plot_type) == "MUA"
                avg_diff.(iCondition) = smoothdata(avg_diff.(iCondition), 2, 'movmean', 1000/60);
                sem_diff.(iCondition) = smoothdata(sem_diff.(iCondition), 2, 'movmean', 1000/60);
            elseif upper(plot_type) == "ZMUA"
                avg_diff.(iCondition) = smoothdata(avg_diff.(iCondition), 2, 'movmean', 1000/60);
                sem_diff.(iCondition) = smoothdata(sem_diff.(iCondition), 2, 'movmean', 1000/60);
            end
%             avg_diff.(iCondition) = conv2(avg_diff.(iCondition), K, 'same');
%             sem_diff.(iCondition) = conv2(sem_diff.(iCondition), K, 'same');
        end
    end

    temp = (percent_CI+100)/200;
    z_CI = norminv(temp);

    for ii = 2:n_conditions
        iCondition = conditions{ii};
        high = avg_diff.(iCondition) > z_CI .* sem_diff.(iCondition);
        low = avg_diff.(iCondition) < -z_CI .* sem_diff.(iCondition);

        diff_bool.(iCondition) = zeros(size(avg_diff.(iCondition)));
        diff_bool.(iCondition)(high) = 1;
        diff_bool.(iCondition)(low) = -1;
    end


    % Plot each condition in individual subplots
    figure('Position', [350 900 1650 260])
    for ii = 2:n_conditions
        iCondition = conditions{ii};
    
        subplot(1, n_conditions, ii)
            contourf(tvep, depth_vec, avg_diff.(iCondition), 40, 'edgecolor', 'none');
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
            title([iCondition ' - monocular'])
            set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')
        
        hline(layer_borders, 'w--') % add lines indicating layer borders
    end



    % Plot each condition in individual subplots
    figure('Position', [350 900 1650 260])
    for ii = 2:n_conditions
        iCondition = conditions{ii};
    
        subplot(1, n_conditions, ii)
%             contourf(tvep, depth_vec, diff_bool.(iCondition), 40, 'edgecolor', 'none');
            imagesc(tvep, depth_vec, diff_bool.(iCondition));
            set(gca,'YDir','normal')
            axis tight
            xlabel('Time (msec)')
            ylabel('Distance from L4 (\mum)')
            xlim(xplotlim)
            xticks(xplotticks)
            ylim(yplotlim)
            yticks(yplotticks)
            colormap(cmap)
            colorbar()
            clim([-1 1])
            title([iCondition ' - monocular'])
            set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')
        
        hline(layer_borders, 'w--') % add lines indicating layer borders
    end

end

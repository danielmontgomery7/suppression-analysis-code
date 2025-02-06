function  plot_SUA_PSTH_by_layer(SUA, zscore, smooth_data)%, sort_data)
%%
    
    % set some parameters for organizing data and plotting
    cell_types = [{'pyr'}, {'pv'}];
    conditions = ["monocular", "concordant", "antiphase", "discordant"];
    layers = ["L23", "L4", "L5", "L6"];
    K = 1000/60; % kernal size for smoothing
    spike_types = [{'RS'}, {'FS'}]; % label plots as RS or FS, not pyr or pv
    cmap = inferno(100);

    if zscore == 0
        c_range = [0 0.05];
    else
%         c_range = [-2 10];
        c_range = [-1 6];
    end


    % Organize data
    n_cell_types = length(cell_types);
    n_layers = length(layers);
    for iCell = 1:n_cell_types

        figure('Position', [1000 300 560 960])

        for iLayer = 1:n_layers

            cell_type = cell_types{iCell};
            layer = layers{iLayer};
    
            % Get data for each condition
            for iCond = 1:length(conditions)
                data.(conditions{iCond}) = SUA.(cell_type).(layer).(conditions{iCond});
    
                % data is organized as a 3-dimension vector:
                %   frames x trials x cell
        
                if zscore == 1 % z-score based on average firing for all conditions
                    all_data = [];
                    for iii = 1:length(conditions)
                        time_idx = 1:40;
                        all_data = [all_data; SUA.(cell_type).(layer).(conditions{iii})(time_idx,:,:)];
                    end
                    mn_data = mean(all_data, 1);            % find avgerage across all conditions and times for each cell
                    std_data = std(all_data, [], 1);        % find std deviation across all conditions and times for each cell
                    data.(conditions{iCond}) = (data.(conditions{iCond}) - mn_data)./std_data;
                end
        

                if smooth_data == 1 % smooth across time
                    data.(conditions{iCond}) = smoothdata(data.(conditions{iCond}), 1, 'movmean', K);
                end
    
    
                % sort units by average peak activity during monocular condition
%                 data_temp = data.(condition);
                data_temp = data.monocular;
                peak_data = squeeze(mean(data_temp(40:80,:)));
                [~, idx{iCond}] = sort(peak_data, 'descend');


                iSubplot = iCond + 4*(iLayer-1);

                subplot(4, 4, iSubplot); hold on
                    imagesc(data.(conditions{iCond})(:,idx{iCond})')
                    colormap(cmap)
                    xlim([0, 300])
                    ylim([0.5, length(idx{iCond})+0.5])
                    clim(c_range)
                    set(gca,'YDir','reverse') 
                    title([layers{iLayer}, ': ', conditions{iCond}])
            end
        end
    end
end
function  plot_SUA_PSTH(SUA, unit_depths, zscore, smooth_data, sort_data)
%%
    % options
%     smooth_data = true;
%     zscore = false;
%     show_legend = false;
    
    % set some parameters for organizing data and plotting
    cell_types = [{'pyr'}, {'pv'}];
    conditions = ["monocular", "concordant", "antiphase", "discordant"];
    K = 1000/60; % kernal size for smoothing
    spike_types = [{'RS'}, {'FS'}]; % label plots as RS or FS, not pyr or pv
    cmap = inferno(100);

    if zscore == 0
        c_range = [0 0.05];
        c_range_diff = [-0.2 0.2];
    else
%         c_range = [-2 10];
%         c_range_diff = [-12 12];
        c_range = [-1 6];
%         c_range_diff = [-6 6];
    end


%     figure();

    % Organize data
    n_cell_types = length(cell_types);
    iPlot = 0;
    for iCell = 1:n_cell_types

        figure('Position', [1000 300 560 960])

        iPlot = iPlot + 1;
        cell_type = cell_types{iCell};

        % Get data for each condition
        for ii = 1:length(conditions)
            data.(conditions{ii}) = SUA.(cell_type).all.(conditions{ii});

            % data is organized as a 3-dimension vector:
            %   frames x trials x cell
    
            if zscore == 1 % z-score based on average firing for all conditions
                all_data = [];
                for iii = 1:length(conditions)
                    time_idx = 1:40;
%                     time_idx = 501:2000;
                    all_data = [all_data; SUA.(cell_type).all.(conditions{iii})(time_idx,:,:)];
%                     all_data = [all_data; SUA.(cell_type).all.(conditions{iii})];
                end
                mn_data = mean(all_data, 1);            % find avgerage across all conditions and times for each cell
                std_data = std(all_data, [], 1);        % find std deviation across all conditions and times for each cell
%                 mn_data = mean(all_data, [1,2]);        % find avgerage across all conditions, times, and trials for each cell
%                 std_data = std(all_data, [], [1,2]);    % find std deviation across all conditions, times, and trials for each cell
                data.(conditions{ii}) = (data.(conditions{ii}) - mn_data)./std_data;
            end
    

            if smooth_data == 1 % smooth across time
                data.(conditions{ii}) = smoothdata(data.(conditions{ii}), 1, 'movmean', K);
            end


            if sort_data == 0 % unsorted
                idx = 1:length(unit_depths.(cell_type));

            elseif sort_data == 1 % sort units by depth
                [~, idx{ii}] = sort(unit_depths.(cell_type), 'descend');
    
                % find layer borders
                b1 = size(SUA.(cell_type).L23.monocular, 2);
                b2 = b1 + size(SUA.(cell_type).L4.monocular, 2);
                b3 = b2 + size(SUA.(cell_type).L5.monocular, 2);

            elseif sort_data == 2
                % sort units by average peak activity
                data_temp = data.(conditions{ii});
                peak_data = squeeze(mean(data_temp(40:80,:)));
                [~, idx{ii}] = sort(peak_data, 'descend');

            elseif sort_data == 3
                % sort units by max peak activity
                data_temp = data.(conditions{ii});
                peak_data = squeeze(max(data_temp));
                [~, idx{ii}] = sort(peak_data, 'descend');
            end

            subplot(1, 4, ii); hold on
                imagesc(data.(conditions{ii})(:,idx{ii})')
%                 imagesc(data.(conditions{ii})(:,idx)')
                colormap(cmap)
                xlim([0, 300])
                ylim([0.5, length(idx{ii})+0.5])
%                 ylim([0.5, length(idx)+0.5])
                clim(c_range)
                set(gca,'YDir','reverse') 
                title([spike_types{iCell}, ' units: ', conditions{ii}])
                if sort_data == 1
                    hline([b1 b2 b3]+0.5, 'w--')
                end                
        end

%         data.diff = data.(conditions{1})(:,idx{1})' - data.(conditions{2})(:,idx{2})';
% 
%         subplot(1, 5, 5); hold on
%             imagesc(data.diff)
%             colormap(cmap)
%             xlim([0, 300])
%             ylim([0.5, length(idx{ii})+0.5])
%             clim(c_range_diff)
%             set(gca,'YDir','reverse') 
%             title([spike_types{iCell}, ' units: Fam-Nov'])
%             if sort_data == 1
%                 hline([b1 b2 b3]+0.5, 'w--')
%             end                




    end
end
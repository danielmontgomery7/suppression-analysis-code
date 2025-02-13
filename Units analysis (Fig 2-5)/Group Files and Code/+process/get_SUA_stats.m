function output = get_SUA_stats(SUA, output_format, zscore)

% Output in spikes per second

% options
% output_format = 2; % 1 or 2
normalize = 0;
% zscore = 1; % need to add this

% set some parameters
t1 = 40; % start of early peak
t2 = 80; % end of early peak
t3 = 100; % start of late peak
t4 = 200; % end of late peak
cell_types = fields(SUA); % pyr and pv
layers = fields(SUA.(cell_types{1}));
conditions = fields(SUA.(cell_types{1}).(layers{1}));
n_layers = length(layers)-1; % exclude all

if output_format == 1 % this will give a format that's easy to plug into prism to run statistics
    for iCell = 1:length(cell_types)
        for iCond = 1:length(conditions)  
    
            % find max number of cells for preallocation
            max_cells = 0;
            for iLayer = 1:n_layers 
                cells_in_layer = size(SUA.(cell_types{iCell}).(layers{iLayer}).(conditions{iCond}), 2);
                if cells_in_layer > max_cells
                    max_cells = cells_in_layer;
                end
            end

            % preallocate
            output.(cell_types{iCell}).early_peak.(conditions{iCond}) = nan(max_cells, n_layers);
            output.(cell_types{iCell}).late_peak.(conditions{iCond}) = nan(max_cells, n_layers);
    
            for iLayer = 1:n_layers
    
                temp_data = 1000 * SUA.(cell_types{iCell}).(layers{iLayer}).(conditions{iCond});
                n_cells = size(temp_data,2);


    
                if zscore == 1 % z-score based on average firing for all conditions
                    all_data = [];
                    for iii = 1:length(conditions)
                        all_data = [all_data; SUA.(cell_types{iCell}).(layers{iLayer}).(conditions{iii})];
                    end
                    mn_data = mean(all_data, 1);
                    std_data = std(all_data, [], 1);
                    temp_data = temp_data ./ 1000;
                    temp_data = (temp_data - mn_data)./std_data;
                end


                if normalize == 1
                    baseline = mean(temp_data(1:t1-1, :), 1);
                    early = mean(temp_data(t1:t2, :), 1) - baseline;
                    late = mean(temp_data(t3+1:t4, :), 1) - baseline;
                    both = mean(temp_data(t1:t4, :), 1) - baseline;
                else
                    early = mean(temp_data(t1:t2, :), 1);
                    late = mean(temp_data(t3+1:t4, :), 1);
                    both = mean(temp_data(t1:t4, :), 1);
                end
    
                output.(cell_types{iCell}).early_peak.(conditions{iCond})(1:n_cells, iLayer) = early;
                output.(cell_types{iCell}).late_peak.(conditions{iCond})(1:n_cells, iLayer) = late;
                output.(cell_types{iCell}).combined_peaks.(conditions{iCond})(1:n_cells, iLayer) = both;
            end
        end
    end

elseif output_format == 2 % this will give a format that's easier for working with MATLAB

    for iCell = 1:length(cell_types)
        for iLayer = 1:length(layers)
            for iCond = 1:length(conditions)  
                
                temp_data = 1000 * SUA.(cell_types{iCell}).(layers{iLayer}).(conditions{iCond});
    


                if zscore == 1 % z-score based on average firing for all conditions
                    all_data = [];
                    for iii = 1:length(conditions)
                        all_data = [all_data; SUA.(cell_types{iCell}).(layers{iLayer}).(conditions{iii})];
                    end
                    mn_data = mean(all_data, 1);
                    std_data = std(all_data, [], 1);
                    temp_data = temp_data ./ 1000;
                    temp_data = (temp_data - mn_data)./std_data;
                end


                if normalize == 1
                    baseline = mean(temp_data(1:t1-1, :), 1);
                    early = mean(temp_data(t1:t2, :), 1) - baseline;
                    late = mean(temp_data(t3+1:t4, :), 1) - baseline;
                    both = mean(temp_data(t1:t4, :), 1) - baseline;
                else
                    early = mean(temp_data(t1:t2, :), 1);
                    late = mean(temp_data(t3+1:t4, :), 1);
                    both = mean(temp_data(t1:t4, :), 1);
%                     both = mean(temp_data(t1:120, :), 1);
                end
    
                output.(cell_types{iCell}).(layers{iLayer}).early_peak(:,iCond) = early;
                output.(cell_types{iCell}).(layers{iLayer}).late_peak(:,iCond) = late;
                output.(cell_types{iCell}).(layers{iLayer}).combined_peaks(:,iCond) = both;
            end
        end
    end
end


end
function output = view_group_traces(data_struct, plot_type, plot_depths)

smooth_plot = 1;

kernal_size = 16;

K = ones(1,kernal_size)/kernal_size;


depth_vec = 400:-20:-500;

%     yplotlim = [-510 350];
%     yplotticks = -400:200:400;


conditions = fields(data_struct);

n_conditions = length(conditions);

n_plots = length(plot_depths)-1;


colors = [{[100, 100, 100]/255}, ...
    {[87, 78, 249]/255}, ...
    {[249, 64, 64]/255}, ...
    {[255, 160, 64]/255}];



    for ii = 1:n_plots
    figure('Position', [1003 839 273 231]); hold on
     
        depth_upper = plot_depths(ii);
        depth_lower = plot_depths(ii+1);
    
        for iii = 1:n_conditions
    
            iCondition = conditions{iii};
        
            depth_bool = depth_vec <= depth_upper & depth_vec > depth_lower;
            data_temp = data_struct.(iCondition)(:, depth_bool, :);
            data_traces = squeeze(mean(data_temp, 2));
    
            mn_data{iii} = mean(data_traces, 2);
    
    %         avg_data.(iCondition) = mean(data_struct.(iCondition)(tvep,:,:), 3)';
            if smooth_plot == 1
                mn_data{iii} = smoothdata(mn_data{iii}, 1, 'movmean', 1000/60);
                hi(:,iii) = round(max(mn_data{iii})+1);
                lo(:,iii) = round(min(mn_data{iii})-1);
%                 mn_data{iii} = conv(mn_data{iii}, K);
%                 mn_data{iii} = mn_data{iii}(kernal_size:end);
%                 hi(:,iii) = round(max(mn_data{iii}(1:end-kernal_size))+1);
%                 lo(:,iii) = round(min(mn_data{iii}(1:end-kernal_size))-1);
            end
    
    %         baseline = mean(data_traces(1:30,:),1);
    %         early_peak(:,iii) = 100 * (mean(data_traces(40:80,:)) - baseline);
    %         late_peak(:,iii) = 100 * (mean(data_traces(81:200,:)) - baseline);
            early_peak(:,iii) = mean(data_traces(40:80,:));
            late_peak(:,iii) = mean(data_traces(101:200,:));
    
        end
    
        ax_range = [0, 300, min(lo),  max(hi)];
    
    
    %     % plot scalebar
    %     subplot(1, n_conditions+1, 1)
    %     helper.scalebar('XLen', 100, 'XUnit', 'ms', 'YLen', 1, 'YUnit', '\muV')% ...
    %         'Position', [110, -80], 'hTextX_Pos', [-26, -57], 'hTextY_Pos', [-70, -11]);
    %     axis(ax_range); axis on
        
        % plot VEP waveforms for each condition
        for iii = 1:n_conditions
    %         subplot(1, n_conditions+1, iii+1)
            plot(mn_data{iii}, 'LineWidth', 3, 'Color', colors{iii})
            axis(ax_range); % axis off
        %     title(condition)
        end
    
    
        output.early_peak = early_peak;
        output.late_peak = late_peak;
    
    
    end



end
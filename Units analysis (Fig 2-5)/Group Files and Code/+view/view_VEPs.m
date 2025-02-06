function [] = view_VEPs(VEP, VEP_stats)


    conditions = VEP_stats.conditions;
    y_min = round(min(mean(VEP_stats.neg,2))-5, -1); 
    y_max = round(max(mean(VEP_stats.pos,2))+5, -1);
    ax_range = [0, 300, y_min, y_max];


    %% Average VEP waveforms with scalebar
    
     
    % Make figure
    figure('Position', [1000 900 560 100]);
    n_subplots = length(conditions) + 1;
    
    % plot scalebar
    subplot(1, n_subplots, 1)
    helper.scalebar('XLen', 100, 'XUnit', 'ms', 'YLen', 100, 'YUnit', '\muV', ...
        'Position', [110, -80], 'hTextX_Pos', [-26, -50], 'hTextY_Pos', [-70, -11]);
    axis(ax_range); axis off
    
    % plot VEP waveforms for each condition
    for ii = 1:length(conditions)
        subplot(1, n_subplots, ii+1)
        plot(mean(VEP.(conditions{ii}),2), 'k', 'LineWidth', 2)
        axis(ax_range); axis off
        title(conditions{ii})
    end
    
    
    %% Plot overlapping VEPs
    colors = [{[100, 100, 100]/255}, ...
        {[87, 78, 249]/255}, ...
        {[249, 64, 64]/255}, ...
        {[255, 160, 64]/255}];

    K = ones(1,7)/7;
    
    figure('Position', [1003 839 273 231]); hold on
    
    for ii = 1:length(conditions)
        temp_data = conv(mean(VEP.(conditions{ii}),2), K);
        temp_data = temp_data - mean(temp_data(1:25)); % normalize VEP
        plot(temp_data(7:end), 'Color', colors{ii}, 'LineWidth', 2)
    end

    axis(ax_range);
    xlabel('Time (msec)')
    ylabel('Voltage (\muV)')
    legend(conditions, 'location', 'southeast')


end
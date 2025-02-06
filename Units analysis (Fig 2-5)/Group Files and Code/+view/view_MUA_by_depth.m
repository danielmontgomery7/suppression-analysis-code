function [] = view_MUA_by_depth(MUA, layer_borders, time_vec)


    % parameters

%     time_vec = 1:300; % ms
%     time_vec = 41:80; % ms
%     time_vec = 101:200; % ms

    depth_vec = 400:-20:-600;
    xplotlim = [15 60];
    xplotticks = -15:15:60;
%     yplotlim = [-500 400];
%     yplotticks = -400:200:400;
    yplotlim = [-510 350];
    yplotticks = -400:200:400;
    conditions = fields(MUA);
    n_conditions = length(conditions);

    colors = [{[100, 100, 100]/255}, ...
        {[87, 78, 249]/255}, ...
        {[249, 64, 64]/255}, ...
        {[255, 160, 64]/255}];



all_data = [];

for ii = 1:length(conditions)
    all_data = [all_data; MUA.(conditions{ii})(time_vec,:,:)];
end

MUA_data = squeeze(mean(all_data, 1));

mn_data = mean(MUA_data, 2);
std_data = std(MUA_data, [], 2);
sem_data = std_data./sqrt(size(MUA_data,2));


figure(); hold on
plot(mn_data, depth_vec, 'k')
plot(mn_data+sem_data, depth_vec, 'r')
plot(mn_data-sem_data, depth_vec, 'r')
hline(layer_borders, 'k--')

xlim(xplotlim)
xticks(xplotticks)
ylim(yplotlim)
yticks(yplotticks)


%     figure('Position', [1003 839 273 231]); hold on
% 
%     xlim(xplotlim)
%     xticks(xplotticks)
%     ylim(yplotlim)
%     yticks(yplotticks)
% 
%     hline(layer_borders(1:end), 'k--')
%     
%     for ii = 1:n_conditions
%         temp_data = nanmean(nanmean(MUA.(conditions{ii})(time_vec,:,:),1),3);
%         plot(temp_data, depth_vec, 'Color', colors{ii}, 'LineWidth', 2)
%     end
% 
%     xlabel('Voltage (\muV)')
%     ylabel('Distance from L4')
% %     legend(conditions, 'location', 'southeast')
%     title(sprintf('Time = %d-%d ms', time_vec(1)-1, time_vec(end)))






end
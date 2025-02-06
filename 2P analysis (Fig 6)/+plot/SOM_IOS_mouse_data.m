function stats = SOM_IOS_mouse_data(data_struct)

% nbins = params.nbins;
% ori_matching = params.ori_matching;


%%

if isfield(data_struct, 'average_dFF') % for data from a single mouse
    mouse_data = data_struct.average_dFF;

else % for data from a structure containing data from multiple mice
    mouse_ids = fields(data_struct);
    n_mice = size(mouse_ids, 1);
    mouse_data = [];
    for iMouse = 1:n_mice
        mouse_data = [mouse_data; data_struct.(mouse_ids{iMouse}).average_dFF];
    end
end

temp_monoc = mean(mouse_data(:,1:2),2);
temp_conc = mean(mouse_data(:,3:4),2);
temp_disc = mean(mouse_data(:,5:6),2);

% threshold = 0.3;
threshold = -1;
temp = max(mouse_data,[],2);
good_cells = temp>threshold;


monoc = temp_monoc(good_cells);
conc = temp_conc(good_cells);
disc = temp_disc(good_cells);


%%

Fmin = min([monoc; conc; disc]);
Fmax = max([monoc; conc; disc]);




% Scatter plots
figure('Position', [600 300 1000 300]);
subplot(131); hold on
scatter(monoc, conc, 'k.')
plot([Fmin Fmax], [Fmin Fmax], 'r--')
axis([Fmin Fmax Fmin Fmax])
xlabel('Monocular (dF/F)'); ylabel('Concordant (dF/F)')
set(gca,'TickDir','out')
axis square

subplot(132); hold on
scatter(monoc, disc, 'k.')
plot([Fmin Fmax], [Fmin Fmax], 'r--')
axis([Fmin Fmax Fmin Fmax])
xlabel('Monocular (dF/F)'); ylabel('Discordant (dF/F)')
set(gca,'TickDir','out')
axis square


subplot(133); hold on
scatter(conc, disc, 'k.')
plot([Fmin Fmax], [Fmin Fmax], 'r--')
axis([Fmin Fmax Fmin Fmax])
xlabel('Concordant (dF/F)'); ylabel('Discordant (dF/F)')
set(gca,'TickDir','out')
axis square


% CDF
figure('Position', [600 700 400 300]); hold on
[~, stats.monoc] = cdfplot(monoc);
[~, stats.conc] = cdfplot(conc);
[~, stats.disc] = cdfplot(disc);
xlabel('Average dF/F'); ylabel('Cumulative distribution (neurons)')
set(gca,'TickDir','out')
xlim([Fmin 1.5])
title(' ')
legend('Monoc', 'Conc', 'Disc', 'Antiphase', 'Location', 'SouthEast')
axis square
grid off




end
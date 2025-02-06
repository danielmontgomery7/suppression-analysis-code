function stats = IOS_mouse_data(data_struct)

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


% threshold = 0.3;
threshold = -1;
temp = max(mouse_data,[],2);
good_cells = temp>threshold;


monoc = mouse_data(good_cells,1);
conc = mouse_data(good_cells,2);
disc = mouse_data(good_cells,3);
offset = mouse_data(good_cells,4);


%%

Fmin = min([monoc; conc; disc; offset]);
Fmax = max([monoc; conc; disc; offset]);




% Scatter plots
figure('Position', [600 300 1000 1000]);
subplot(331); hold on
scatter(monoc, conc, 'k.')
plot([Fmin Fmax], [Fmin Fmax], 'r--')
axis([Fmin Fmax Fmin Fmax])
xlabel('Monocular (dF/F)'); ylabel('Concordant (dF/F)')
set(gca,'TickDir','out')
axis square

subplot(332); hold on
scatter(monoc, offset, 'k.')
plot([Fmin Fmax], [Fmin Fmax], 'r--')
axis([Fmin Fmax Fmin Fmax])
xlabel('Monocular (dF/F)'); ylabel('Phase Offset (dF/F)')
set(gca,'TickDir','out')
axis square

subplot(333); hold on
scatter(monoc, disc, 'k.')
plot([Fmin Fmax], [Fmin Fmax], 'r--')
axis([Fmin Fmax Fmin Fmax])
xlabel('Monocular (dF/F)'); ylabel('Discordant (dF/F)')
set(gca,'TickDir','out')
axis square


% figure('Position', [600 700 1000 300]);
subplot(335); hold on
scatter(conc, offset, 'k.')
plot([Fmin Fmax], [Fmin Fmax], 'r--')
axis([Fmin Fmax Fmin Fmax])
xlabel('Concordant (dF/F)'); ylabel('Phase Offset (dF/F)')
set(gca,'TickDir','out')
axis square

subplot(336); hold on
scatter(conc, disc, 'k.')
plot([Fmin Fmax], [Fmin Fmax], 'r--')
axis([Fmin Fmax Fmin Fmax])
xlabel('Concordant (dF/F)'); ylabel('Discordant (dF/F)')
set(gca,'TickDir','out')
axis square

subplot(339); hold on
scatter(offset, disc, 'k.')
plot([Fmin Fmax], [Fmin Fmax], 'r--')
axis([Fmin Fmax Fmin Fmax])
xlabel('Out of phase (dF/F)'); ylabel('Discordant (dF/F)')
set(gca,'TickDir','out')
axis square


% CDF
figure('Position', [600 700 400 300]); hold on
% figure('Position', [600 700 1000 300]);
% subplot(131); hold on
% [~, stats.monoc] = cdfplot(monoc);
% [~, stats.conc] = cdfplot(conc);
% [~, stats.disc] = cdfplot(disc);
% [~, stats.antiphase] = cdfplot(offset);
% xlabel('Average dF/F'); ylabel('Cumulative distribution (neurons)')
% set(gca,'TickDir','out')
% xlim([Fmin Fmax])
% title(' ')
% legend('Monoc', 'Conc', 'Disc', 'Antiphase', 'Location', 'SouthEast')
% axis square
% grid off


% subplot(132); hold on
[~, stats.monoc] = cdfplot(monoc);
[~, stats.conc] = cdfplot(conc);
[~, stats.disc] = cdfplot(disc);
[~, stats.antiphase] = cdfplot(offset);
xlabel('Average dF/F'); ylabel('Cumulative distribution (neurons)')
set(gca,'TickDir','out')
xlim([-0.5 1.5])
title(' ')
legend('Monoc', 'Conc', 'Disc', 'Antiphase', 'Location', 'SouthEast')
axis square
grid off


% subplot(133); hold on
% [~, stats.monoc] = cdfplot(monoc);
% [~, stats.conc] = cdfplot(conc);
% [~, stats.disc] = cdfplot(disc);
% [~, stats.antiphase] = cdfplot(offset);
% xlabel('Average dF/F'); ylabel('Cumulative distribution (neurons)')
% set(gca,'TickDir','out')
% axis([0 0.5 0.2 1])
% title(' ')
% legend('Monoc', 'Conc', 'Disc', 'Antiphase', 'Location', 'SouthEast')
% axis square
% grid off





end
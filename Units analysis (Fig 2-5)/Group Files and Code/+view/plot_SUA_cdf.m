function [] = plot_SUA_cdf(data, plot_title)



figure(); hold on
[~, stats.monoc] = cdfplot(data(:,1));
[~, stats.conc] = cdfplot(data(:,2));
[~, stats.disc] = cdfplot(data(:,3));
[~, stats.offset] = cdfplot(data(:,4));
xlabel('Firing rate (spks/sec)'); ylabel('Cumulative distribution (units)')
set(gca,'TickDir','out')
% xlim([0 40])
title(plot_title)
legend('Monoc', 'Conc', 'Disc', 'Antiphase', 'Location', 'SouthEast')
axis square
grid off






end
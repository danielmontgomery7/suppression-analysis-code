function create_pseudo_spectrum_figure(mouse_info, group_data)

    % specify plot parameters
    pseudo.xlim = [0 25];
    pseudo.xticks = 0:5:25;
    pseudo.fam_ylim = [4 10];
    pseudo.fam_yticks = 4:2:10;
    pseudo.nov_ylim = [0 12];
    pseudo.nov_yticks = 0:3:12;
    
    pseudo.hi_ylim = [4 12];
    pseudo.hi_yticks = 4:2:12;
    
    pseudo.lo_ylim = [2 10];
    pseudo.lo_yticks = 2:2:10;
    
    pseudo.diff_ylim = [-4 4];
    pseudo.diff_yticks = -4:2:4;
    cpseudo = [-2 6];
    tpseudo = 1:100;
    avg_start_ind = 26;
    freqs = mouse_info.freqs;
    
    % plot mean fam pseudo-spectrogram
    mean_fam_pseudo = mean(mean(group_data.SRPd7.fam__pr__pseudo_spect.raw, 3), 4);
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    surf(tpseudo, freqs, mean_fam_pseudo, 'edgecolor', 'none')
    axis tight
    view(0, 90)
    xlabel('Trial (#)')
    xlim([1 100])
    xticks(20:20:100)
    ylabel('Frequency (Hz)')
    ylim([min(freqs) 100])
    caxis(cpseudo)
    colormap('jet')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')
    
    % plot mean nov pseudo-spectrogram
    mean_nov_pseudo = mean(mean(group_data.SRPd7.nov__pr__pseudo_spect.raw, 3), 4);
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    surf(tpseudo, freqs, mean_nov_pseudo, 'edgecolor', 'none')
    axis tight
    view(0, 90)
    xlabel('Trial (#)')
    xlim([1 100])
    xticks(20:20:100)
    ylabel('Frequency (Hz)')
    ylim([min(freqs) 100])
    caxis(cpseudo)
    colormap('jet')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')
    
    % plot mean spectrogram supplements (due to weird MATLAB plot)
    empty_spectgram = zeros(size(mean_fam_pseudo, 1), size(mean_fam_pseudo, 2));
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    surf(tpseudo, freqs, empty_spectgram, 'edgecolor', 'none')
    axis tight
    view(0, 90)
    xlabel('Trial (#)')
    xlim([1 100])
    xticks(20:20:100)
    ylabel('Frequency (Hz)')
    ylim([min(freqs) 100])
    caxis(cpseudo)
    colorbar
    colormap('jet')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')
    
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    hold on
    surf(tpseudo, freqs, empty_spectgram, 'edgecolor', 'none')
    axis tight
    view(0, 90)
    hold off
    xlabel('Trial (#)')
    xlim([1 100])
    xticks(20:20:100)
    ylabel('Frequency (Hz)')
    ylim([min(freqs) 100])
    caxis(cpseudo)
    colormap('jet')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')
    
    % plot fam alpha/beta max power (and the average of last 75 trials) 
    % and fam gamma max power (and the average of last 75 trials)
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    fam_alpha_beta = group_data.SRPd7.fam__pr__pseudo_spect.max_alpha_beta.raw;
    fam_alpha_beta_late_avg = mean(mean(mean(fam_alpha_beta(avg_start_ind:end, :, :), 1), 2), 3);
    fam_alpha_beta = squeeze(mean(fam_alpha_beta, 2));
    fam_alpha_beta_sem = std(fam_alpha_beta, [], 2)./sqrt(size(fam_alpha_beta, 2));
    fam_alpha_beta_mn = mean(fam_alpha_beta, 2);
    fam_lo_alpha_beta = fam_alpha_beta_mn-fam_alpha_beta_sem;
    fam_hi_alpha_beta = fam_alpha_beta_mn+fam_alpha_beta_sem;
    fam_gamma = group_data.SRPd7.fam__pr__pseudo_spect.max_gamma.raw;
    fam_gamma_late_avg = mean(mean(mean(fam_gamma(avg_start_ind:end, :, :), 1), 2), 3);
    fam_gamma = squeeze(mean(fam_gamma, 2));
    fam_gamma_sem = std(fam_gamma, [], 2)./sqrt(size(fam_gamma, 2));
    fam_gamma_mn = mean(fam_gamma, 2);
    fam_lo_gamma = fam_gamma_mn-fam_gamma_sem;
    fam_hi_gamma = fam_gamma_mn+fam_gamma_sem;
    hold on
    patch([tpseudo fliplr(tpseudo)], [fam_lo_alpha_beta' fliplr(fam_hi_alpha_beta')], 'b', 'EdgeColor', 'none')
    plot(tpseudo, fam_alpha_beta_mn, 'k') 
    patch([tpseudo fliplr(tpseudo)], [fam_lo_gamma' fliplr(fam_hi_gamma')], 'c', 'EdgeColor', 'none')
    plot(tpseudo, fam_gamma_mn, 'k') 
    plot(tpseudo, repelem(fam_alpha_beta_late_avg, 1, 100), 'b')
    plot(tpseudo, repelem(fam_gamma_late_avg, 1, 100), 'c')
    hold off
    xlim(pseudo.xlim)
    xticks(pseudo.xticks)
    xlabel('Trials (#)')
    ylim(pseudo.fam_ylim)
    yticks(pseudo.fam_yticks)
    ylabel('Normalized Power (dB)')
    title('SRPd7')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')  
    
    % plot max power difference (with the average of last 75 trials)
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    alpha_beta_spect_data = group_data.SRPd7.fam__pr__pseudo_spect.max_alpha_beta.diffwith26plus;
    alpha_beta_spect_data = sort(alpha_beta_spect_data, 2);
    alpha_beta_mu_spect = alpha_beta_spect_data(:, 500);
    alpha_beta_lo_spect = alpha_beta_spect_data(:, 5);
    alpha_beta_hi_spect = alpha_beta_spect_data(:, 995);
    gamma_spect_data = group_data.SRPd7.fam__pr__pseudo_spect.max_gamma.diffwith26plus;
    gamma_spect_data = sort(gamma_spect_data, 2);
    gamma_mu_spect = gamma_spect_data(:, 500);
    gamma_lo_spect = gamma_spect_data(:, 5);
    gamma_hi_spect = gamma_spect_data(:, 995);
    hold on
    plot(pseudo.xlim, [0 0], 'k')
    patch([tpseudo fliplr(tpseudo)], [alpha_beta_lo_spect' fliplr(alpha_beta_hi_spect')], [0 0 1], 'EdgeColor', 'none')
    plot(tpseudo, alpha_beta_mu_spect, 'k') 
    sig_vals = (alpha_beta_lo_spect > 0) | (alpha_beta_hi_spect < 0);
    scatter(tpseudo(sig_vals), pseudo.diff_ylim(1)*ones(1, sum(sig_vals)), 15, '.b')
    patch([tpseudo fliplr(tpseudo)], [gamma_lo_spect' fliplr(gamma_hi_spect')], [0 1 1], 'EdgeColor', 'none')
    plot(tpseudo, gamma_mu_spect, 'k') 
    sig_vals = (gamma_lo_spect > 0) | (gamma_hi_spect < 0);
    scatter(tpseudo(sig_vals), pseudo.diff_ylim(1)*ones(1, sum(sig_vals)), 15, '.c')
    hold off
    ylim(pseudo.diff_ylim)
    yticks(pseudo.diff_yticks)
    ylabel('Normalized Power (dB)')
    xlim(pseudo.xlim)
    xticks(pseudo.xticks)
    xlabel('Trials (#)')
    title('Diff(OscEarly, AvgEnd)')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off') 
    fprintf('The first trial alpha/beta has a value of %0.2f (%0.2f %0.2f).\n', alpha_beta_mu_spect(1), alpha_beta_lo_spect(1), alpha_beta_hi_spect(1));
    fprintf('The first trial gamma has a value of %0.2f (%0.2f %0.2f).\n', gamma_mu_spect(1), gamma_lo_spect(1), gamma_hi_spect(1));
    
    % plot nov alpha/beta max power (and the average of last 75 trials) 
    % and nov gamma max power (and the average of last 75 trials)
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    nov_alpha_beta = group_data.SRPd7.nov__pr__pseudo_spect.max_alpha_beta.raw;
    nov_alpha_beta_late_avg = mean(mean(mean(nov_alpha_beta(avg_start_ind:end, :, :), 1), 2), 3);
    nov_alpha_beta = squeeze(mean(nov_alpha_beta, 2));
    nov_alpha_beta_sem = std(nov_alpha_beta, [], 2)./sqrt(size(nov_alpha_beta, 2));
    nov_alpha_beta_mn = mean(nov_alpha_beta, 2);
    nov_lo_alpha_beta = nov_alpha_beta_mn-nov_alpha_beta_sem;
    nov_hi_alpha_beta = nov_alpha_beta_mn+nov_alpha_beta_sem;
    nov_gamma = group_data.SRPd7.nov__pr__pseudo_spect.max_gamma.raw;
    nov_gamma_late_avg = mean(mean(mean(nov_gamma(avg_start_ind:end, :, :), 1), 2), 3);
    nov_gamma = squeeze(mean(nov_gamma, 2));
    nov_gamma_sem = std(nov_gamma, [], 2)./sqrt(size(nov_gamma, 2));
    nov_gamma_mn = mean(nov_gamma, 2);
    nov_lo_gamma = nov_gamma_mn-nov_gamma_sem;
    nov_hi_gamma = nov_gamma_mn+nov_gamma_sem;
    hold on
    patch([tpseudo fliplr(tpseudo)], [nov_lo_alpha_beta' fliplr(nov_hi_alpha_beta')], 'm', 'EdgeColor', 'none')
    plot(tpseudo, nov_alpha_beta_mn, 'k') 
    patch([tpseudo fliplr(tpseudo)], [nov_lo_gamma' fliplr(nov_hi_gamma')], 'r', 'EdgeColor', 'none')
    plot(tpseudo, nov_gamma_mn, 'k') 
    plot(tpseudo, repelem(nov_alpha_beta_late_avg, 1, 100), 'm')
    plot(tpseudo, repelem(nov_gamma_late_avg, 1, 100), 'r')
    hold off
    xlim(pseudo.xlim)
    xticks(pseudo.xticks)
    xlabel('Trials (#)')
    ylim(pseudo.nov_ylim)
    yticks(pseudo.nov_yticks)
    ylabel('Normalized Power (dB)')
    title('SRPd7')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')  
    
    % plot max power difference (with the average of last 75 trials)
    pseudo.diff_ylim = [-2 4];
    pseudo.diff_yticks = -2:2:4;
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    alpha_beta_spect_data = group_data.SRPd7.nov__pr__pseudo_spect.max_alpha_beta.diffwith26plus;
    alpha_beta_spect_data = sort(alpha_beta_spect_data, 2);
    alpha_beta_mu_spect = alpha_beta_spect_data(:, 500);
    alpha_beta_lo_spect = alpha_beta_spect_data(:, 5);
    alpha_beta_hi_spect = alpha_beta_spect_data(:, 995);
    gamma_spect_data = group_data.SRPd7.nov__pr__pseudo_spect.max_gamma.diffwith26plus;
    gamma_spect_data = sort(gamma_spect_data, 2);
    gamma_mu_spect = gamma_spect_data(:, 500);
    gamma_lo_spect = gamma_spect_data(:, 5);
    gamma_hi_spect = gamma_spect_data(:, 995);
    hold on
    plot(pseudo.xlim, [0 0], 'k')
    patch([tpseudo fliplr(tpseudo)], [alpha_beta_lo_spect' fliplr(alpha_beta_hi_spect')], [1 0 1], 'EdgeColor', 'none')
    plot(tpseudo, alpha_beta_mu_spect, 'k') 
    sig_vals = (alpha_beta_lo_spect > 0) | (alpha_beta_hi_spect < 0);
    scatter(tpseudo(sig_vals), pseudo.diff_ylim(1)*ones(1, sum(sig_vals)), 15, '.m')
    patch([tpseudo fliplr(tpseudo)], [gamma_lo_spect' fliplr(gamma_hi_spect')], [1 0 0], 'EdgeColor', 'none')
    plot(tpseudo, gamma_mu_spect, 'k') 
    sig_vals = (gamma_lo_spect > 0) | (gamma_hi_spect < 0);
    scatter(tpseudo(sig_vals), pseudo.diff_ylim(1)*ones(1, sum(sig_vals)), 15, '.r')
    hold off
    ylim(pseudo.diff_ylim)
    yticks(pseudo.diff_yticks)
    ylabel('Normalized Power (dB)')
    xlim(pseudo.xlim)
    xticks(pseudo.xticks)
    xlabel('Trials (#)')
    title('Diff(OscEarly, AvgEnd)')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off') 
    fprintf('The 5th trial alpha/beta has a value of %0.2f (%0.2f %0.2f).\n', alpha_beta_mu_spect(5), alpha_beta_lo_spect(5), alpha_beta_hi_spect(5));
    fprintf('The first trial gamma has a value of %0.2f (%0.2f %0.2f).\n', gamma_mu_spect(1), gamma_lo_spect(1), gamma_hi_spect(1));
    
    close all
    
    % plot fam/nov alpha/beta max power (and the average of last 75 trials) 
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    fam_alpha_beta = group_data.SRPd7.fam__pr__pseudo_spect.max_alpha_beta.raw;
    fam_alpha_beta_late_avg = mean(mean(mean(fam_alpha_beta(avg_start_ind:end, :, :), 1), 2), 3);
    fam_alpha_beta = squeeze(mean(fam_alpha_beta, 2));
    fam_alpha_beta_sem = std(fam_alpha_beta, [], 2)./sqrt(size(fam_alpha_beta, 2));
    fam_alpha_beta_mn = mean(fam_alpha_beta, 2);
    fam_lo_alpha_beta = fam_alpha_beta_mn-fam_alpha_beta_sem;
    fam_hi_alpha_beta = fam_alpha_beta_mn+fam_alpha_beta_sem;
    nov_alpha_beta = group_data.SRPd7.nov__pr__pseudo_spect.max_alpha_beta.raw;
    nov_alpha_beta_late_avg = mean(mean(mean(nov_alpha_beta(avg_start_ind:end, :, :), 1), 2), 3);
    nov_alpha_beta = squeeze(mean(nov_alpha_beta, 2));
    nov_alpha_beta_sem = std(nov_alpha_beta, [], 2)./sqrt(size(nov_alpha_beta, 2));
    nov_alpha_beta_mn = mean(nov_alpha_beta, 2);
    nov_lo_alpha_beta = nov_alpha_beta_mn-nov_alpha_beta_sem;
    nov_hi_alpha_beta = nov_alpha_beta_mn+nov_alpha_beta_sem;
    hold on
    patch([tpseudo fliplr(tpseudo)], [fam_lo_alpha_beta' fliplr(fam_hi_alpha_beta')], 'b', 'EdgeColor', 'none')
    plot(tpseudo, fam_alpha_beta_mn, 'k') 
    plot(tpseudo, repelem(fam_alpha_beta_late_avg, 1, 100), 'b')    
    patch([tpseudo fliplr(tpseudo)], [nov_lo_alpha_beta' fliplr(nov_hi_alpha_beta')], 'r', 'EdgeColor', 'none')
    plot(tpseudo, nov_alpha_beta_mn, 'k') 
    plot(tpseudo, repelem(nov_alpha_beta_late_avg, 1, 100), 'r')    
    hold off
    xlim(pseudo.xlim)
    xticks(pseudo.xticks)
    xlabel('Trials (#)')
    ylim(pseudo.lo_ylim)
    yticks(pseudo.lo_yticks)
    ylabel('Normalized Power (dB)')
    title('SRPd7 Lo Freq')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off') 
    
    % plot fam/nov gamma max power (and the average of last 75 trials) 
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    fam_gamma = group_data.SRPd7.fam__pr__pseudo_spect.max_gamma.raw;
    fam_gamma_late_avg = mean(mean(mean(fam_gamma(avg_start_ind:end, :, :), 1), 2), 3);
    fam_gamma = squeeze(mean(fam_gamma, 2));
    fam_gamma_sem = std(fam_gamma, [], 2)./sqrt(size(fam_gamma, 2));
    fam_gamma_mn = mean(fam_gamma, 2);
    fam_lo_gamma = fam_gamma_mn-fam_gamma_sem;
    fam_hi_gamma = fam_gamma_mn+fam_gamma_sem;
    nov_gamma = group_data.SRPd7.nov__pr__pseudo_spect.max_gamma.raw;
    nov_gamma_late_avg = mean(mean(mean(nov_gamma(avg_start_ind:end, :, :), 1), 2), 3);
    nov_gamma = squeeze(mean(nov_gamma, 2));
    nov_gamma_sem = std(nov_gamma, [], 2)./sqrt(size(nov_gamma, 2));
    nov_gamma_mn = mean(nov_gamma, 2);
    nov_lo_gamma = nov_gamma_mn-nov_gamma_sem;
    nov_hi_gamma = nov_gamma_mn+nov_gamma_sem;
    hold on
    patch([tpseudo fliplr(tpseudo)], [fam_lo_gamma' fliplr(fam_hi_gamma')], 'c', 'EdgeColor', 'none')
    plot(tpseudo, fam_gamma_mn, 'k') 
    plot(tpseudo, repelem(fam_gamma_late_avg, 1, 100), 'c')
    patch([tpseudo fliplr(tpseudo)], [nov_lo_gamma' fliplr(nov_hi_gamma')], 'r', 'EdgeColor', 'none')
    plot(tpseudo, nov_gamma_mn, 'k') 
    plot(tpseudo, repelem(nov_gamma_late_avg, 1, 100), 'r')
    hold off
    xlim(pseudo.xlim)
    xticks(pseudo.xticks)
    xlabel('Trials (#)')
    ylim(pseudo.hi_ylim)
    yticks(pseudo.hi_yticks)
    ylabel('Normalized Power (dB)')
    title('SRPd7 Hi Freq')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')  
    
end


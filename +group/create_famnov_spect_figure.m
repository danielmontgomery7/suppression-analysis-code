function create_famnov_spect_figure(mouse_info, group_data)

    % get relevant information for plotting
    fspect = mouse_info.freqs;
    fpepi = mouse_info.pepi_freqs;
    t = 0:399;
    
    vep.xlim = [0 400];
    vep.xticks = 0:100:400;
    vep.ylim = [-300 300];
    vep.yticks = -300:150:300;
    vep.diff_ylim = [-250 250];
    vep.diff_yticks = -250:125:250;   
    
    spect.xlim = [0 100];
    spect.xticks = 0:20:100;
    spect.ylim = [-4 6];
    spect.yticks = -4:2:6;
    spect.diff_ylim = [-3 6];
    spect.diff_yticks = -3:1.5:6;    
    
    pepi.xlim = [0 100];
    pepi.xticks = 0:20:100;
    pepi.ylim = [0 40];
    pepi.yticks = 0:10:40;
    pepi.diff_ylim = [-25 25];
    pepi.diff_yticks = -25:12.5:25;
    
    
    
  
    
    
    
    
    
    
    % plot fam nov VEP
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    fam_vep = group_data.SRPd7.fam__pr__data.raw;
    fam_vep = squeeze(mean(fam_vep, 2));
    fam_vep = smoothdata(fam_vep, 1, 'gaussian', 20);
    fam_sem = std(fam_vep, [], 2)./sqrt(size(fam_vep, 2));
    fam_mn_vep = mean(fam_vep, 2);
    fam_lo_vep = fam_mn_vep-fam_sem;
    fam_hi_vep = fam_mn_vep+fam_sem;    
    nov_vep = group_data.SRPd7.nov__pr__data.raw;
    nov_vep = squeeze(mean(nov_vep, 2));
    nov_vep = smoothdata(nov_vep, 1, 'gaussian', 20);
    nov_sem = std(nov_vep, [], 2)./sqrt(size(nov_vep, 2));
    nov_mn_vep = mean(nov_vep, 2);
    nov_lo_vep = nov_mn_vep-nov_sem;
    nov_hi_vep = nov_mn_vep+nov_sem; 
    hold on
    patch([t fliplr(t)], [fam_lo_vep' fliplr(fam_hi_vep')], 'b', 'EdgeColor', 'none')
    plot(t, fam_mn_vep, 'k')
    patch([t fliplr(t)], [nov_lo_vep' fliplr(nov_hi_vep')], 'r', 'EdgeColor', 'none')
    plot(t, nov_mn_vep, 'k') 
    hold off
    xlim(vep.xlim)
    xticks(vep.xticks)
    xlabel('Time (seconds)')
    ylim(vep.ylim)
    yticks(vep.yticks)
    ylabel('Voltage (\muV)')
    title('SRPd7')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')  
    
    % plot VEP difference
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    vep_data = group_data.SRPd7.fam__pr__data.diffwithnov;
    vep_data = sort(vep_data, 2);
    vep_data = smoothdata(vep_data, 1, 'gaussian', 20);
    mu_vep = vep_data(:, 500);
    lo_vep = vep_data(:, 5);
    hi_vep = vep_data(:, 995);
    hold on
    plot(vep.xlim, [0 0], 'k')
    patch([t fliplr(t)], [lo_vep' fliplr(hi_vep')], [0.5 0.5 0.5], 'EdgeColor', 'none')
    plot(t, mu_vep, 'k') 
    sig_vals = (lo_vep > 0) | (hi_vep < 0);
    scatter(t(sig_vals), vep.diff_ylim(1)*ones(1, sum(sig_vals)), 5, '.k')
    hold off
    ylim(vep.diff_ylim)
    yticks(vep.diff_yticks)
    ylabel('Voltage difference (\muV)')
    xlim(vep.xlim)
    xticks(vep.xticks)
    xlabel('Time (seconds)')
    title('Diff(Fam, Nov)')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off') 
    display_stats(t, 75, mu_vep, lo_vep, hi_vep)
    mags = sort(max(vep_data(76:166, :)) - min(vep_data(46:76, :)));
    fprintf('    VEP magnitude is %0.2f (%0.2f %0.2f).\n', mags(500), mags(5), mags(995));
    
    % plot fam nov normalized spect
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    fam_spect = group_data.SRPd7.fam__pr__norm_spect.raw;
    fam_spect = squeeze(mean(fam_spect, 2));
    fam_sem = std(fam_spect, [], 2)./sqrt(size(fam_spect, 2));
    fam_mn_spect = mean(fam_spect, 2);
    fam_lo_spect = fam_mn_spect-fam_sem;
    fam_hi_spect = fam_mn_spect+fam_sem;    
    nov_spect = group_data.SRPd7.nov__pr__norm_spect.raw;
    nov_spect = squeeze(mean(nov_spect, 2));
    nov_sem = std(nov_spect, [], 2)./sqrt(size(nov_spect, 2));
    nov_mn_spect = mean(nov_spect, 2);
    nov_lo_spect = nov_mn_spect-nov_sem;
    nov_hi_spect = nov_mn_spect+nov_sem; 
    hold on
    patch([fspect fliplr(fspect)], [fam_lo_spect' fliplr(fam_hi_spect')], 'b', 'EdgeColor', 'none')
    plot(fspect, fam_mn_spect, 'k')
    patch([fspect fliplr(fspect)], [nov_lo_spect' fliplr(nov_hi_spect')], 'r', 'EdgeColor', 'none')
    plot(fspect, nov_mn_spect, 'k') 
    hold off
    xlim(spect.xlim)
    xticks(spect.xticks)
    xlabel('Frequency (Hz)')
    ylim(spect.ylim)
    yticks(spect.yticks)
    ylabel('Normalized Power (dB)')
    title('SRPd7')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')  
    
    % plot normalized spect difference
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    spect_data = group_data.SRPd7.fam__pr__norm_spect.diffwithnov;
    spect_data = sort(spect_data, 2);
    mu_spect = spect_data(:, 500);
    lo_spect = spect_data(:, 5);
    hi_spect = spect_data(:, 995);
    hold on
    plot(spect.xlim, [0 0], 'k')
    patch([fspect fliplr(fspect)], [lo_spect' fliplr(hi_spect')], [0.5 0.5 0.5], 'EdgeColor', 'none')
    plot(fspect, mu_spect, 'k') 
    sig_vals = (lo_spect > 0) | (hi_spect < 0);
    scatter(fspect(sig_vals), spect.diff_ylim(1)*ones(1, sum(sig_vals)), 5, '.k')
    hold off
    ylim(spect.diff_ylim)
    yticks(spect.diff_yticks)
    ylabel('Normalized Power (dB)')
    xlim(spect.xlim)
    xticks(spect.xticks)
    xlabel('Frequency (Hz)')
    title('Diff(Fam, Nov)')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off') 
    display_stats(fspect, 50, mu_spect, lo_spect, hi_spect)
    
    % plot fam nov pepi
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    fam_pepi = group_data.SRPd7.fam__pr__pepi_percent.raw;
    fam_pepi = squeeze(mean(fam_pepi, 2));
    fam_sem = std(fam_pepi, [], 2)./sqrt(size(fam_pepi, 2));
    fam_mn_pepi = mean(fam_pepi, 2);
    fam_lo_pepi = fam_mn_pepi-fam_sem;
    fam_hi_pepi = fam_mn_pepi+fam_sem;  
    nov_pepi = group_data.SRPd7.nov__pr__pepi_percent.raw;
    nov_pepi = squeeze(mean(nov_pepi, 2));
    nov_sem = std(nov_pepi, [], 2)./sqrt(size(nov_pepi, 2));
    nov_mn_pepi = mean(nov_pepi, 2);
    nov_lo_pepi = nov_mn_pepi-nov_sem;
    nov_hi_pepi = nov_mn_pepi+nov_sem; 
    hold on
    patch([fpepi fliplr(fpepi)], [fam_lo_pepi' fliplr(fam_hi_pepi')], 'b', 'EdgeColor', 'none')
    plot(fpepi, fam_mn_pepi, 'k')
    patch([fpepi fliplr(fpepi)], [nov_lo_pepi' fliplr(nov_hi_pepi')], 'r', 'EdgeColor', 'none')
    plot(fpepi, nov_mn_pepi, 'k') 
    hold off
    xlim(pepi.xlim)
    xticks(pepi.xticks)
    xlabel('Frequency (Hz)')
    ylim(pepi.ylim)
    yticks(pepi.yticks)
    ylabel('Time in Episode (%)')
    title('SRPd7')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')  
    
    % plot pepi difference
    figure('units', 'normalized', 'outerposition', [0 0 0.15 0.25])
    pepi_data = group_data.SRPd7.fam__pr__pepi_percent.diffwithnov;
    pepi_data = sort(pepi_data, 2);
    mu_pepi = pepi_data(:, 500);
    lo_pepi = pepi_data(:, 5);
    hi_pepi = pepi_data(:, 995);
    hold on
    plot(pepi.xlim, [0 0], 'k')
    patch([fpepi fliplr(fpepi)], [lo_pepi' fliplr(hi_pepi')], [0.5 0.5 0.5], 'EdgeColor', 'none')
    plot(fpepi, mu_pepi, 'k') 
    sig_vals = (lo_pepi > 0) | (hi_pepi < 0);
    scatter(fpepi(sig_vals), pepi.diff_ylim(1)*ones(1, sum(sig_vals)), 5, '.k')
    hold off
    ylim(pepi.diff_ylim)
    yticks(pepi.diff_yticks)
    ylabel('Time in Oscillation (%)')
    xlim(pepi.xlim)
    xticks(pepi.xticks)
    xlabel('Frequency (Hz)')
    title('Diff(Fam, Nov)')
    set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off') 
    display_stats(fpepi, 50, mu_pepi, lo_pepi, hi_pepi)
    
end

function display_stats(xvec, mid_val, med, lo, hi)

    % split data by xvec
    xvec = xvec(:);
    med = med(:);
    lo = lo(:);
    lo = lo(:);
    mid_ind = sum(xvec <= mid_val);
    first_half = [xvec(1:mid_ind), med(1:mid_ind), lo(1:mid_ind), hi(1:mid_ind)];
    second_half = [xvec(mid_ind+1:end), med(mid_ind+1:end), lo(mid_ind+1:end), hi(mid_ind+1:end)];
    
    % get peak of first half
    [~, peak_ind] = max(abs(first_half(:, 2)));
    fprintf('For the first half, the peak is at position %d with an xvec value of %.2f.\n', peak_ind, first_half(peak_ind, 1));
    fprintf('    This has a value of %0.2f (%0.2f %0.2f).\n', first_half(peak_ind, 2:4));
    
    % get peak of second half
    [~, peak_ind] = max(abs(second_half(:, 2)));
    fprintf('For the second half, the peak is at position %d with an xvec value of %.2f.\n', peak_ind, second_half(peak_ind, 1));
    fprintf('    This has a value of %0.2f (%0.2f %0.2f).\n', second_half(peak_ind, 2:4));
    
end
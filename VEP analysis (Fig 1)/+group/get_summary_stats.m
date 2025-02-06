function data_struct = get_summary_stats(data_struct, info)

    for experiment = info.experiment
        for session = info.sessions
            for group = info.groups
                istim = 1;
                summary_stats = struct();
                for stim = info.stims

                    % VEP data
                    vep_data = data_struct.(experiment{:}).(session{:}).(group{:}).(stim{:}).data;
                    veps = vep_data.raw;
                    avg_veps = squeeze(mean(veps, 2));

                    neg = min(avg_veps(1:101, :));
                    pos = max(avg_veps(51:201, :));
%                     pos_area_under_curve = mean(avg_veps(76:201, :));
                    pos_area_under_curve = mean(avg_veps(100:201, :));
                    mag = pos-neg;

                    n = size(veps, 3);
                    
                    vep_waveform = mean(avg_veps, 2);
                    vep_std = std(avg_veps, 1, 2);
                    vep_sem = vep_std./sqrt(n);
                    
                    
                    
                    % Store VEP summary data
                    summary_stats.VEP_waveforms(:,istim) = vep_waveform;
                    summary_stats.VEP_waveform_sem(:,istim) = vep_sem;
                    
                    summary_stats.VEP_neg(:,istim) = neg;
                    summary_stats.VEP_pos(:,istim) = pos;
                    summary_stats.VEP_mag(:,istim) = mag;
                    summary_stats.VEP_pos_auc(:,istim) = pos_area_under_curve;
                    
                    
                    
                    
                    
                    % Spectrum data
                    spect_data = data_struct.(experiment{:}).(session{:}).(group{:}).(stim{:}).stat_spect;
                    spect = spect_data.raw;
                    spect_data.log = log10(spect);
                    avg_mouse_spect = squeeze(mean(log10(spect), 2));
                    
                    spect_avg = mean(avg_mouse_spect, 2);
                    spect_std = std(avg_mouse_spect, 1, 2);
                    spect_sem = spect_std./sqrt(n);
                    
                    low_freq_hz = [10 30];
                    mid_freq_hz = [55 60];
                    high_freq_hz = [60 80];
                    low_freq_idx = floor(405/100.*low_freq_hz(1)):floor(405/100.*low_freq_hz(2));
                    mid_freq_idx = floor(405/100.*mid_freq_hz(1)):floor(405/100.*mid_freq_hz(2));
                    high_freq_idx = floor(405/100.*high_freq_hz(1)):floor(405/100.*high_freq_hz(2));
                    
                    low_freq = mean(avg_mouse_spect(low_freq_idx,:));
                    mid_freq = mean(avg_mouse_spect(mid_freq_idx,:));
                    high_freq = mean(avg_mouse_spect(high_freq_idx,:));
                    
                    
                    
                    % Store summary spectrum data
                    
                    summary_stats.Spect_avg(:,istim) = spect_avg;
%                     summary_stats.Spect_sem(:,istim) = spect_sem;
                    summary_stats.Avg_10to30Hz(:,istim) = low_freq;
                    summary_stats.Avg_55to60Hz(:,istim) = mid_freq;
                    summary_stats.Avg_60to80Hz(:,istim) = high_freq;
                    
                    
                    istim = istim+1;
                end
                
                summary_stats.stim_order = info.stims;
                if strcmp(info.groups(1), "None")
                    data_struct.(experiment{:}).summary_stats.(session{:}) = summary_stats;
                else
                    data_struct.(experiment{:}).summary_stats.(session{:}).(group{:}) = summary_stats;
                end
                
            end
        end
    end
end


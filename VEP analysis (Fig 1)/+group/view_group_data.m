function view_group_data(group_data, info)

    % specify plot properties
    ramp_colors = {'b', 'g', 'r', 'k'};
    
    % iterate experiments to view the VEP
    for experiment = info.experiment
        
        for group = info.groups

            figure('units', 'normalized', 'outerposition', [0 0 0.6 0.4], 'Name',...
                [experiment{:}, ' Blue:Concordant Green:Discordant '])
    %             [experiment{:}, ' Blue:Monoc Green:Binoc '])
            hold on
            if string(group) ~= "None"
                title(group)
            end

            % iterate stims 
            tvep = info.tvep;

            for stim = info.stims

                % iterate ramps
                sessions = info.sessions;
                nsess = length(sessions);
                for isess = 1:nsess

                    data = group_data.(experiment{:}).(sessions{isess}).(group{:}).(stim{:}).data.raw;
                    data = data - mean(data(1:10, :, :), 1);
                    data = squeeze(mean(data, 2));
                    mn_data = mean(data, 2)';
                    sem_data = std(data, [], 2)'./sqrt(size(data, 2));
                    fill([tvep fliplr(tvep)], [mn_data-sem_data, fliplr(mn_data+sem_data)], ramp_colors{isess},...
                        'EdgeColor', 'none', 'FaceAlpha', 0.5)
                    plot(tvep, mn_data, 'k')

                end

                tvep = tvep + 500;

            end

            xlabel('Relative time (msec)')
            ylabel('Volage (\muV)')

        end
    end
    
    
    % iterate experiments to view the VEP magnitude
    for experiment = info.experiment
        for group = info.groups

            figure('units', 'normalized', 'outerposition', [0 0 0.3 0.4], 'Name',...
                [experiment{:}, ' Blue:Familiar Green:Novel '])
            hold on
            if string(group) ~= "None"
                title(group)
            end

            
            % iterate stims
            stims = info.stims;
            nstims = length(stims);
            for istim = 1:nstims
            
                sessions = info.sessions;
                nsess = length(sessions);
                for isess = 1:nsess
                    
                    if string(group) ~= "None"
                        vep_mags = group_data.(experiment{:}).summary_stats.(sessions{isess}).(group{:}).VEP_mag;
                    else
                        vep_mags = group_data.(experiment{:}).summary_stats.(sessions{isess}).VEP_mag;
                    end
                    
                    vep_mag_avg = mean(vep_mags);
                    vep_mag_ste = std(vep_mags, 1, 1)./sqrt(size(vep_mags,1));
                    bounds = [vep_mag_avg+vep_mag_ste; vep_mag_avg-vep_mag_ste];

                    fill(istim + [-0.1 0.1 0.1 -0.1], [bounds(1,istim) bounds(1,istim) bounds(2,istim) bounds(2,istim)], ...
                        ramp_colors{isess},'EdgeColor', 'none', 'FaceAlpha', 0.5)
                    plot(istim + [-0.1 0.1], [vep_mag_avg(istim), vep_mag_avg(istim)], 'k')
                end
            end
            xticks(1:nstims)
            xticklabels(stims)
            xlabel('Contrast (%)')
            ylabel('Volage (\muV)')
        end
    end
    
    
    
    
    % iterate experiments to view the VEP negativity
    for experiment = info.experiment
        for group = info.groups

            figure('units', 'normalized', 'outerposition', [0 0 0.3 0.4], 'Name',...
                [experiment{:}, ' Blue:Familiar Green:Novel '])
            hold on
            if string(group) ~= "None"
                title(group)
            end

            
            % iterate stims
            stims = info.stims;
            nstims = length(stims);
            for istim = 1:nstims
            
                sessions = info.sessions;
                nsess = length(sessions);
                for isess = 1:nsess
                    
                    if string(group) ~= "None"
                        vep_negs = group_data.(experiment{:}).summary_stats.(sessions{isess}).(group{:}).VEP_neg;
                    else
                        vep_negs = group_data.(experiment{:}).summary_stats.(sessions{isess}).VEP_neg;
                    end
                    
                    vep_neg_avg = mean(vep_negs);
                    vep_neg_ste = std(vep_negs, 1, 1)./sqrt(size(vep_negs,1));
                    bounds = [vep_neg_avg+vep_neg_ste; vep_neg_avg-vep_neg_ste];

                    fill(istim + [-0.1 0.1 0.1 -0.1], [bounds(1,istim) bounds(1,istim) bounds(2,istim) bounds(2,istim)], ...
                        ramp_colors{isess},'EdgeColor', 'none', 'FaceAlpha', 0.5)
                    plot(istim + [-0.1 0.1], [vep_neg_avg(istim), vep_neg_avg(istim)], 'k')
                end
            end
            xticks(1:nstims)
            xticklabels(stims)
            xlabel('Contrast (%)')
            ylabel('Volage (\muV)')
        end
    end
    
    
    
    
    
%     % iterate experiments to view the VEP neg
%     for experiment = info.experiment
%         for group = info.groups
% 
%             figure('units', 'normalized', 'outerposition', [0 0 0.3 0.4], 'Name',...
%                 [experiment{:}, ' Blue:Familiar Green:Novel '])
%             hold on
%             if string(group) ~= "None"
%                 title(group)
%             end
% 
%             % iterate stims
%             stims = info.stims;
%             nstims = length(stims);
%             for istim = 1:nstims
% 
%                 % iterate ramps
%                 sessions = info.ramps(experiment{:});
%                 nsess = length(sessions);
%                 for isess = 1:nsess
% 
%                     data = group_data.(experiment{:}).(sessions{isess}).(group{:}).(stims{istim}).data.raw;
%                     data = data - mean(data(1:10, :, :), 1);
%                     data = squeeze(mean(data, 2));
%                     [vep_neg, vep_neg_ind] = min(data, [], 1);
%                     ndata = length(vep_neg);
%                     mn_data = mean(vep_neg, 2)';
%                     sem_data = std(vep_neg, [], 2)'./sqrt(ndata);
%                     fill(istim + [-0.1 0.1 0.1 -0.1], mn_data + [-sem_data -sem_data sem_data sem_data], ramp_colors{isess},...
%                         'EdgeColor', 'none', 'FaceAlpha', 0.5)
%                     plot(istim + [-0.1 0.1], [mn_data, mn_data], 'k')
% 
% 
%                 end
% 
%             end
%             xticks(1:nstims)
%             xticklabels(stims)
%             xlabel('Contrast (%)')
%             ylabel('Volage (\muV)')
%         end
%     end
    
    
    
    
%         % iterate experiments to view the Familiar/Novel ratio
%     for experiment = info.experiment
%         
%         figure('units', 'normalized', 'outerposition', [0 0 0.3 0.4], 'Name',...
%             [experiment{:}, ' Blue:Familiar Green:Novel '])
%         hold on
%         if string(group) ~= "None"
%             title(group)
%         end
%         
%         % iterate stims
% %         stims = info.stims;
%         groups = info.groups;
% %         nstims = length(stims);
%         nstims = length(groups);
% %         for istim = 1:nstims
%         for istim = 1:nstims
%         
%             % iterate ramps
%             ramps = info.ramps(experiment{:});
%             nramps = length(ramps);
%             vep_mag = [];
%             data = [];
%             for iramp = 1:nramps
%                 
%                 data = group_data.(experiment{:}).(ramps{iramp}).(groups{istim}).data.raw;
%                 data = data - mean(data(1:10, :, :), 1);
%                 data = squeeze(mean(data, 2));
%                 [vep_neg, vep_neg_ind] = min(data, [], 1);
%                 ndata = length(vep_neg);
%                 vep_pos = NaN(1, ndata);
%                 for i = 1:ndata
%                     vep_pos(i) = max(data(vep_neg_ind(i):end, i));
%                 end
%                 vep_mag(iramp,:) = vep_pos - vep_neg;
%             end
%                 
%             fam_nov_ratio = vep_mag(1,:)./vep_mag(2,:);
%             mn_data = mean(fam_nov_ratio, 2)';
%             sem_data = std(fam_nov_ratio, [], 2)'./sqrt(ndata);
%             fill(istim + [-0.1 0.1 0.1 -0.1], mn_data + [-sem_data -sem_data sem_data sem_data], 'k',...
%                 'EdgeColor', 'none', 'FaceAlpha', 0.5)
%             plot(istim + [-0.1 0.1], [mn_data, mn_data], 'k')
%                 
%                 
%                         
%         end
%         xticks(1:nstims)
%         stims = info.groups;
%         xticklabels(stims)
% %         xlabel('Contrast (%)')
%         ylabel('Familiar/Novel ratio')
% 
%     end
    
    
    
    % iterate experiments to view the average concatenated spectrums
    freqs = info.spect_freqs;
    for experiment = info.experiment
        for group = info.groups
        
            figure('units', 'normalized', 'outerposition', [0 0 0.6 0.4], 'Name',...
                experiment{:})

            % iterate ramps
            sessions = info.sessions;
            nsess = length(sessions);
            for isess = 1:nsess

                subplot(1, nsess, isess)
                hold on
                tpres = 1:info.npresentations;
                for stim = info.stims
                    data = group_data.(experiment{:}).(sessions{isess}).(group{:}).(stim{:}).stat_spect.raw;
                    data = log10(squeeze(mean(data, 3)));
                    surf(tpres, freqs, data, 'EdgeColor', 'none')
                    tpres = tpres + info.npresentations;
                end

                axis tight
                view(0, 90)
                xlabel('Relative presentation (#) 0-50 contrast')
                ylim([0 100])
                yticks(0:20:100)
                ylabel('Frequency (Hz)')
                colormap('jet')
                colorbar()
                caxis([0 4.5]); % change to clim for Matlab 2022a or newer

                if string(group) ~= "None"
                    title([group, sessions{isess}])
                else
                    title(sessions{isess})
                end        
            end
        end
    end
    
    
    
    
    
    
    % iterate experiments to view the average spectrum
    freqs = info.spect_freqs;
    for experiment = info.experiment
        for group = info.groups
        % iterate ramps
        sessions = info.sessions;
        nsess = length(sessions);
        for isess = 1:nsess
            
            figure('units', 'normalized', 'outerposition', [0 0 0.6 0.4], 'Name',...
                experiment{:})
            hold on
            
            for stim = info.stims
                data = group_data.(experiment{:}).(sessions{isess}).(group{:}).(stim{:}).stat_spect.raw;
                data = log10(squeeze(mean(mean(data, 2), 3)));
                plot(freqs, data)
                tpres = tpres + info.npresentations;
            end
            legend(info.stims)
            xlabel('Frequency (Hz)')
            ylabel('Power (log10(\muv^2/Hz))')
            xlim([0 100])
            xticks(0:20:100)
            if string(group) ~= "None"
                title([group, sessions{isess}])
            else 
                title(sessions{isess})
            end
            
        end
        end
        
    end
    
    
    
    
    
    
end
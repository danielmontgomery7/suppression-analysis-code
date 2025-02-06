function view_vep_data(data_struct, info)

    % specify plot properties
    tvep = info.tvep;
    vep.xlim = [0 400];
    vep.xticks = [0:100:400];
    vep.ylim = [-300 300];
    vep.ylim = [-150 150];
    stims = info.stims;
    conditions = info.groups;
    nstims = length(stims);
    stim_color = linspace(1, 0.3, nstims);
    
    % view each experiment/mouse/hemi on different plots
    %   note: to make things consistent, I just assume there will be no
    %   more than 25 animals per experiment
    nrows = 9;
    ncols = 9;
    experiments = fieldnames(data_struct)';
    for experiment = experiments
        sessions = fieldnames(data_struct.(experiment{:}))';
        for session = sessions
            figure('units', 'normalized', 'outerposition', [0 0 1 1],...
                'NumberTitle', 'off', 'Name', [experiment{:}, ' ', session{:}, ' LH-Blue RH-Red'])
            mice = sort(fieldnames(data_struct.(experiment{:}).(session{:})))';
            nmice = length(mice);
            for imouse = 1:nmice
                
                % plot LH VEPs
                subplot(nrows, ncols, imouse)
                hold on            
                condition = fieldnames(data_struct.(experiment{:}).(session{:}).(mice{imouse}));
                mouse_data = data_struct.(experiment{:}).(session{:}).(mice{imouse}).(condition{1});
                if nstims>1
                    for istim = 1:nstims
                        LH_data = mouse_data.LH.(stims{istim}).data;
                        LH_data = LH_data - mean(LH_data(1:10, :));
                        LH_data = mean(LH_data, 2);
                        RH_data = mouse_data.RH.(stims{istim}).data;
                        RH_data = RH_data - mean(RH_data(1:10, :));
                        RH_data = mean(RH_data, 2);
                        plot(tvep, LH_data, 'LineWidth', 1, 'Color', [0 0 1 stim_color(istim)])
                        plot(tvep, RH_data, 'LineWidth', 1, 'Color', [1 0 0 stim_color(istim)])
                    end
                else
                    cond = fields(mouse_data.LH);
                    LH_data = mouse_data.LH.(cond{1}).data;
                    LH_data = LH_data - mean(LH_data(1:10, :));
                    LH_data = mean(LH_data, 2);
                    RH_data = mouse_data.RH.(cond{1}).data;
                    RH_data = RH_data - mean(RH_data(1:10, :));
                    RH_data = mean(RH_data, 2);
                    plot(tvep, LH_data, 'LineWidth', 1, 'Color', [0 0 1 stim_color(1)])
                    plot(tvep, RH_data, 'LineWidth', 1, 'Color', [1 0 0 stim_color(1)])
                end
                    
                    
                    
                xlim(vep.xlim)
                xticks(vep.xticks)
                ylim(vep.ylim)
                xlabel('Time (msec)')
                ylabel('Voltage (\muV)')
                title(mice{imouse})
                set(gca, 'FontSize', 8, 'TickDir', 'out', 'box', 'off')
                
            end
        end
    end
    warning on 
    
end



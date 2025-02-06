function [data_struct, info] = grab_spect_data(data_struct, info)

    % set parameters for chronux
    freq = info.freq;
    params = struct();
    params.tapers = [3 5];
    params.pad = 2;
    params.Fs = freq;
    params.fpass = [1 100];
    info.spect_params = params;
    
    % set stimulus parameters
    stims = info.stims;
    
    % iterate
    nbytes = fprintf('processing 1 of ??');
    chan_ind = 1;
    experiments = sort(fieldnames(data_struct))';
    for experiment = experiments
        ramps = sort(fieldnames(data_struct.(experiment{:})))';
        for ramp = ramps
            mice = sort(fieldnames(data_struct.(experiment{:}).(ramp{:})))';
            for mouse = mice
                condition = sort(fieldnames(data_struct.(experiment{:}).(ramp{:}).(mouse{:})))';
                for hemi = {'LH', 'RH'}
                    for stim = stims

                        % get stat data
                        stat_data = data_struct.(experiment{:}).(ramp{:}).(mouse{:}).(condition{:}).(hemi{:}).(stim{:}).stat_data;
                        stat_data = stat_data - mean(stat_data, 1);

                        % calculate spectrum 
                        [stat_spect, spect_freqs] = mtspectrumc(stat_data, params);

                        % store
                        data_struct.(experiment{:}).(ramp{:}).(mouse{:}).(condition{:}).(hemi{:}).(stim{:}).stat_spect = stat_spect;

                    end
                    
                    % update progress bar
                    while nbytes > 0
                        fprintf('\b')
                        nbytes = nbytes - 1;
                    end
                    chan_ind = chan_ind + 1;
                    nbytes = fprintf('processing %d of ??', chan_ind);

                end
                
            end
            
        end
        
    end
    
    % move progress bar to previous line
    info.spect_freqs = spect_freqs;
    fprintf('\n')
    
end
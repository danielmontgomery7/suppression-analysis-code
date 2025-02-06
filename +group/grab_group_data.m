function group_data = grab_group_data(data_struct, info)

    % construct data chains for group info
    data_chains = {};
    for experiment = info.experiment
        for session = info.sessions
            for group = info.groups
                for stim = info.stims
                    for data_field = {'data', 'stat_data', 'stat_spect'}
                        data_chains{end+1} = {experiment{:}, session{:}, group{:}, stim{:}, data_field{:}};
                    end
                end
            end
        end
    end

    % iterate data chains
    group_data = struct();
    for data_chain = data_chains
    
        % determine the max number of hemis for this experiment
        experiment = data_chain{:}{1};
        session = data_chain{:}{2};
        group = data_chain{:}{3};
        stim = data_chain{:}{4};
        data_field = data_chain{:}{5};
        mice = sort(fieldnames(data_struct.(experiment).(session)))';
        max_hemis = length(mice)*2;
        
        % get an example animal
        group_temp = fields(data_struct.(experiment).(session).(mice{1}));
        condition_temp = fields(data_struct.(experiment).(session).(mice{1}).(group_temp{1}).LH);
        exemplar = data_struct.(experiment).(session).(mice{1}).(group_temp{1}).LH.(condition_temp{1}).(data_field);
        [nvec, ntrials] = size(exemplar);
        
        % preallocate then populate matrix of results
        hemi_dict = info.good_hemis.(experiment).(session);
        all_data = NaN(nvec, ntrials, max_hemis);
        data_ind = 1;
        for mouse = mice     
            for hemi = hemi_dict.(mouse{:})
                
                if isempty(hemi{:}); continue; end

                    group_temp = fields(data_struct.(experiment).(session).(mouse{:}));
                    if string(group) == string(group_temp)
                        % put data in matrix
                        all_data(:, :, data_ind) = data_struct.(experiment).(session).(mouse{:}).(group).(hemi{:}).(stim).(data_field);
                        data_ind = data_ind + 1;
                    end
                    
            end
        end
        
        % remove NaN's and store
        all_data(:, :, isnan(all_data(1, 1, :))) = [];
        group_data.(experiment).(session).(group).(stim).(data_field).raw = all_data;
        
    end

end


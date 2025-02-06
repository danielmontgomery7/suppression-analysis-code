function ttl_timing = import_csv(file_info, params)


if ~isstruct(file_info.csv_filename)
    % Open csv file with stimulus timing
        temp_ttls = readmatrix(file_info.csv_filename);
     
        % downsample to 1000 Hz
        [~, idx] = unique(floor(temp_ttls(:,1)),'rows');
        ttls = round(temp_ttls(idx,:));
        
        timestamps = ttls(:,1)./1000; % save timestamps in seconds
        input0 = ttls(:,2); % input0 on during stimulus blocks, off during grey
        input1 = ttls(:,3); % input1 on during flops, off during flips and grey
        
        block_start = deriv(input0) > 1; % when input0 switches from 0 to 5;
        ibi_start = deriv(input0) < -1; % when input0 switches from 5 to 0;
    
        block_start_timestamps = timestamps(block_start);
        ibi_timestamps = timestamps(ibi_start);    
       
    % Save ttl timing
        ttl_timing.time = timestamps;
        ttl_timing.input0 = input0;
        ttl_timing.input1 = input1;
        
        ttl_timing.ibi_timestamps = ibi_timestamps;
        ttl_timing.block_start_timestamps = block_start_timestamps; 
    

else % For OD recordings with separate LE and RE recording files

    fn = fieldnames(file_info.csv_filename);
    for ii = 1:numel(fn)

        % Open csv file with stimulus timing
            temp_ttls = readmatrix(file_info.csv_filename.(fn{ii}));
            
            % downsample to 1000 Hz
            [~, idx] = unique(floor(temp_ttls(:,1)),'rows');
            ttls = round(temp_ttls(idx,:));
            
            timestamps = ttls(:,1)./1000; % save timestamps in seconds
            input0 = ttls(:,2); % input0 on during stimulus blocks, off during grey
            input1 = ttls(:,3); % input1 on during flops, off during flips and grey
            
            block_start = deriv(input0) > 1; % when input0 switches from 0 to 5;
            ibi_start = deriv(input0) < -1; % when input0 switches from 5 to 0;
            
            block_start_timestamps = timestamps(block_start);
            ibi_timestamps = timestamps(ibi_start);    

             % correct for voltage recordings that are too short
                if length(block_start_timestamps) < length(params.block_order.(fn{ii}))  
                    n_missing_ts = length(params.block_order.(fn{ii})) - length(block_start_timestamps);
                    avg_block_length = mean(deriv(block_start_timestamps));
                    last_ts = block_start_timestamps(end);
                    missing_ts = last_ts + (1:n_missing_ts)*avg_block_length;
                    block_start_timestamps = [block_start_timestamps; missing_ts]; end
                if length(ibi_timestamps) < length(params.block_order.(fn{ii}))  
                    n_missing_ts = length(params.block_order.(fn{ii})) - length(ibi_timestamps);
                    avg_block_length = mean(deriv(ibi_timestamps));
                    last_ts = ibi_timestamps(end);
                    missing_ts = last_ts + (1:n_missing_ts)*avg_block_length;
                    ibi_timestamps = [ibi_timestamps; missing_ts];
                end
            
        % Save ttl timing
            ttl_timing.(fn{ii}).time = timestamps;
            ttl_timing.(fn{ii}).input0 = input0;
            ttl_timing.(fn{ii}).input1 = input1;
            
            ttl_timing.(fn{ii}).ibi_timestamps = ibi_timestamps;
            ttl_timing.(fn{ii}).block_start_timestamps = block_start_timestamps;
    end
end
    
    
    
    
    










function extract_plx_file_data(dataContainer, file)
    %INPUT:
    %   file: string for file information
    
    % grab info from plx file; make event
    plxInfo = plxFileInfoClass(file);

    % grab important information
    channels = plxInfo.get_channels();
    num_chans = length(channels);
    split = strsplit(file, '\');
    split = strsplit(split{end}, '_');
    split(end) = {split{end}(1:end-4)}; % get rid of .plx
    mouse = split(1);
    others = split(2:3);
    chan_names = {'LH', 'RH'};
    
    % extract all channels of data
    for i = 1:num_chans
        
        % get data
        [~, ~, ~, ~, ad] = plx_ad_v(file, channels(i)-1);
        % note: chan-1 index is intentional: PLX channels start at 0
        % corresponding to MATLAB channel 1
        ad = 1000*(ad(:)'); % convert from mV to uV and ensure row vector
        
        % store w/ labels
        excData = extracellularDataClass(plxInfo, channels(i), ad);
        excData.add_labels([mouse, others, chan_names{i}])
        dataContainer.add_extracellular_data(excData)
        
    end
    
end

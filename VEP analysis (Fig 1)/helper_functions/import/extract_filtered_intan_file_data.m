function extract_filtered_intan_file_data(dataContainer, intanFileInfo, file, file_names, channel_name, target_freq, downsample_rate, b_filter, a_filter)
%INPUT:
%   dataContainer: instance of dataContainer = dataContainerClass();
%   intanFileInfo: instance of intanFileInfo = intanFileInfoClass(file);
%   file: string for path to the import file
%   file_names: a cell array of things to name the file (applied to all channels)
%   channel_name: the channel name (usually 'char-###')
%   target_freq: desired downsampled frequency
%   downsample_rate: integer, floor(current_freq/desired_freq)
%   b_filter and a_filter: outputs of a call to butter()

    % get data
    data = import_intan_data_vector(file);
    
    % downsample then run filter
    data = data(1:downsample_rate:end);
    lfp_data = filtfilt(b_filter, a_filter, data);
    
    % store w/ labels
    excData = extracellularDataClass(intanFileInfo, channel_name, lfp_data);
    excData.add_labels([file_names, channel_name])
    excData.set_freq(target_freq)
    excData.set_num_data(length(lfp_data))
    dataContainer.add_extracellular_data(excData)

end

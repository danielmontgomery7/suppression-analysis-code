function extract_intan_file_data(dataContainer, intanFileInfo, file, file_names, channel_name)
%INPUT:
%   dataContainer: instance of dataContainer = dataContainerClass();
%   intanFileInfo: instance of intanFileInfo = intanFileInfoClass(file);
%   file: string for path to the import file
%   file_names: a cell array of things to name the file (applied to all channels)
%   channel_name: the channel name (usually 'char-###')

    % get data
    data = import_intan_data_vector(file);
   
    % store w/ labels
    excData = extracellularDataClass(intanFileInfo, channel_name, data);
    excData.add_labels([file_names, channel_name])
    dataContainer.add_extracellular_data(excData)

end

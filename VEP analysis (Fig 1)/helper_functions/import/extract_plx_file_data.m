function extract_plx_file_data(dataContainer, plxFileInfo, file, file_names, channel_names)
%INPUT:
%   dataContainer: instance of dataContainer = dataContainerClass();
%   plxFileInfo: instance of plxFileInfo = plxFileInfoClass(file);
%   file: string for path to the import file
%   file_names: a cell array of things to name the file (applied to all channels)
%   channel_names: a cell array of things to name the channels within the 
%   file (in the order of their import; for bear lab it's channel 1, 3, and
%   7 which maps to [{'LH'}, {'RH'}, {'Piezo'}]) 

    % grab channel information
    channels = plxFileInfo.get_channels();
    num_chans = length(channels);
    
    % extract all channels of data
    for i = 1:num_chans
        
        % get data
        [~, ~, ~, ~, ad] = plx_ad_v(file, channels(i)-1);
        % note: chan-1 index is intentional: PLX channels start at 0
        % corresponding to MATLAB channel 1
        if  i ~= num_chans | num_chans == 2
            ad = 1000*(ad(:)'); % convert from mV to uV and ensure row vector
        else
            ad = ad(:)'; % leave as is for piezo and ensure row vector
        end
        
        % store w/ labels
        excData = extracellularDataClass(plxFileInfo, channels(i), ad);
        excData.add_labels([file_names, channel_names{i}])
        dataContainer.add_extracellular_data(excData)
        
    end
    
end

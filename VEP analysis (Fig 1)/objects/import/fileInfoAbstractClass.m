classdef fileInfoAbstractClass < handle
    
    % defines the methods all __FileInfoClass types must implement in order to
    % correctly process the data
    
    properties
        file
        channels
        original_num_data
        original_freqs
        eventInfo
        digitalInfo
    end
        
    methods (Abstract)
        
        % store/get data file
        set_file(self, file) 
        file = get_file(self)
        
        % store/get channels w/ data on them
        set_channels(self) 
        channels = get_channels(self)
        
        % store/get original number data points on each channel w/ data on 
        % them; downsampled versions stored in each instance of 
        % extracellularDataClass
        set_original_num_data(self)
        original_num_data = get_original_num_data(self)
        
        % store/get original number sample freqs on each channel w/ data on 
        % them; downsampled versions stored in each instance of 
        % extracellularDataClass
        set_original_freqs(self)
        original_freqs = get_original_freqs(self)
        
        % create/get event information object
        create_eventInfoObj(self) 
        eventInfo = get_eventInfoObj(self)
        
        % get original num_data and freqs
        [num_data, freq] = get_original_channel_information(self, channel)
        
    end
    
end
classdef plxFileInfoClass < fileInfoAbstractClass
    
    % PLX-specific implementation of fileInfoAbstractClass
    
    % note: plexon channels are indexed by 1 in MATLAB but by 0 in
    % plexon-provided SDK functions 
    
    methods
        
        function self = plxFileInfoClass(file)
            self.set_file(file)
            self.set_channels()
            self.set_original_num_data()
            self.set_original_freqs()
            self.create_eventInfoObj()
        end
        
        function set_file(self, file)
            self.file = file;
        end
        
        function set_channels(self)
            % note: this is stored as an array of integers
            [~, ~, ~, num_data] = plx_info(self.get_file(), 1);
            self.channels = find(num_data ~= 0);
            self.original_num_data = num_data(self.channels);
        end
        
        function set_original_num_data(self)
            % plx files set num data within set_channels function
        end
        
        function set_original_freqs(self)
            [~, freqs] = plx_adchan_freqs(self.get_file());
            self.original_freqs = freqs(self.get_channels())';
        end
        
        function create_eventInfoObj(self)
            [~, event_ts, event_id] = plx_event_ts(self.get_file(), 257); 
            % note: the Bear Lab uses the "Strobed" event channel for all
            % our recordings, which is on channel 257 for our system; the
            % below two functions are useful for determining event channels
            % [~, event_channels] = plx_event_chanmap(self.get_file());
            % [~, event_names] = plx_event_names(self.get_file());
            self.eventInfo = eventInfoClass(self, event_id', event_ts');
        end
        
        function file = get_file(self)
            file = self.file; 
        end
        
        function channels = get_channels(self)
            channels = self.channels;
        end
        
        function num_data = get_original_num_data(self)
            num_data = self.original_num_data;
        end
        
        function freqs = get_original_freqs(self)
            freqs = self.original_freqs;
        end
        
        function eventInfo = get_eventInfoObj(self)
            eventInfo = self.eventInfo;
        end
        
        function [num_data, freq] = get_original_channel_information(self, channel)
            ind = find(ismember(self.get_channels(), channel));
            freq = self.get_original_freqs();
            num_data = self.get_original_num_data();
            freq = freq(ind);
            num_data = num_data(ind);
        end
        
    end
    
end
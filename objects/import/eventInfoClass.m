classdef eventInfoClass < handle
    
    % stores and performs operations on all events corresponding to the
    % parent fileInfoClass's data file
    
    properties
        fileInfo
        event_id
        event_ts
        event_inds
    end
        
    methods
        
        function self = eventInfoClass(fileInfo, event_id, event_ts)
            self.set_fileInfoObj(fileInfo)
            self.set_event_information(event_id, event_ts)
            self.calculate_event_inds()
        end
        
        function set_fileInfoObj(self, fileInfo)
            self.fileInfo = fileInfo;
        end
        
        function set_event_information(self, event_id, event_ts)
            self.event_id = event_id(:)';
            self.event_ts = event_ts(:)';
        end
        
        function fileInfo = get_fileInfoObj(self)
            fileInfo = self.fileInfo;
        end
        
        function [event_id, event_ts] = get_event_information(self)
            event_id = self.event_id;
            event_ts = self.event_ts;
        end
        
        function event_inds = get_event_inds(self, num_data, freq)
            event_name = [['n', num2str(num_data)], ['_f', num2str(freq)]];
            event_inds = self.event_inds(event_name);
        end
        
        function calculate_event_inds(self)
            self.event_inds = containers.Map();
            [~, event_ts] = self.get_event_information();
            fileInfo = self.get_fileInfoObj();
            num_data = fileInfo.get_original_num_data();
            freqs = fileInfo.get_original_freqs();
            unique_pairs = unique([num_data(:), freqs(:)], 'rows');
            for pair = unique_pairs'
                ndata = pair(1);
                freq = pair(2);
                event_name = [['n', num2str(ndata)], ['_f', num2str(freq)]];
                self.event_inds(event_name) = calculate_event_indices(event_ts, ndata, freq);
            end
        end
        
        function calculate_event_inds_downsample(self, current_num_data, current_freq, target_freq)
            [~, event_ts] = self.get_event_information();
            [target_num_data, ~] = calculate_downsample_rate(current_num_data, current_freq, target_freq);
            event_name = [['n', num2str(target_num_data)], ['_f', num2str(target_freq)]];
            self.event_inds(event_name) = calculate_event_indices(event_ts, target_num_data, target_freq);
        end
        
    end
    
end
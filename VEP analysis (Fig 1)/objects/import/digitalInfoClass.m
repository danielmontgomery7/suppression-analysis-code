classdef digitalInfoClass < handle
    
    % stores and performs operations on all digital information 
    % corresponding to the parent fileInfoClass's data file
    
    properties
        fileInfo
        digital_ts
        digital_inds
    end
        
    methods
        
        function self = digitalInfoClass(fileInfo, digital_ts)
            self.set_fileInfoObj(fileInfo)
            self.set_digital_ts(digital_ts);
            self.calculate_digital_inds()
        end
        
        function set_fileInfoObj(self, fileInfo)
            self.fileInfo = fileInfo;
        end
        
        function set_digital_ts(self, digital_ts)
            self.digital_ts = digital_ts(:)';
        end
        
        function fileInfo = get_fileInfoObj(self)
            fileInfo = self.fileInfo;
        end
        
        function digital_ts = get_digital_ts(self)
            digital_ts = self.digital_ts;
        end
        
        function digital_inds = get_digital_inds(self, num_data, freq)
            event_name = [['n', num2str(num_data)], ['_f', num2str(freq)]];
            digital_inds = self.digital_inds(event_name);
        end
        
        function calculate_digital_inds(self)
            self.digital_inds = containers.Map();
            digital_ts = self.get_digital_ts();
            fileInfo = self.get_fileInfoObj();
            num_data = fileInfo.get_original_num_data();
            freqs = fileInfo.get_original_freqs();
            unique_pairs = unique([num_data(:), freqs(:)], 'rows');
            for pair = unique_pairs'
                ndata = pair(1);
                freq = pair(2);
                event_name = [['n', num2str(ndata)], ['_f', num2str(freq)]];
                self.digital_inds(event_name) = calculate_event_indices(digital_ts, ndata, freq);
            end
        end
        
        function calculate_digital_inds_downsample(self, current_num_data, current_freq, target_freq)
            digital_ts = self.get_digital_ts();
            [target_num_data, ~] = calculate_downsample_rate(current_num_data, current_freq, target_freq);
            event_name = [['n', num2str(target_num_data)], ['_f', num2str(target_freq)]];
            self.digital_inds(event_name) = calculate_event_indices(digital_ts, target_num_data, target_freq);
        end
        
    end
    
end
classdef extracellularDataClass < handle
    
    % stores the extracellular data corresponding to the parent 
    % fileInfoClass's data file
    
    properties
        fileInfo
        channel
        data
        csd
        freq
        num_data
        labels = {}
    end
        
    methods
        
        function self = extracellularDataClass(fileInfo, channel, data)
            self.set_fileInfoObj(fileInfo)
            self.set_channel(channel)
            self.set_data(data)
            [num_data, freq] = fileInfo.get_original_channel_information(self.get_channel());
            self.set_freq(freq)
            self.set_num_data(num_data)
        end
        
        function set_fileInfoObj(self, fileInfo)
            self.fileInfo = fileInfo;
        end
        
        function set_channel(self, channel)
            self.channel = channel;
        end
        
        function set_data(self, data)
            self.data = data(:)';
        end
        
        function set_csd(self, csd)
            self.csd = csd(:)';
        end
        
        function set_freq(self, freq)
            self.freq = freq;
        end
        
        function set_num_data(self, num_data)
            self.num_data = num_data;
        end
        
        function add_labels(self, labels_to_add)
            labels = self.get_labels();
            labels_to_add = labels_to_add(:)';
            for label_to_add = labels_to_add
                if isempty(labels)
                    labels = label_to_add;
                elseif sum(ismember(labels, label_to_add{:})) == 0
                    labels = [labels, label_to_add{:}];
                end
            end
            self.labels = labels;
        end
        
        function fileInfo = get_fileInfoObj(self)
            fileInfo = self.fileInfo;
        end
        
        function channel = get_channel(self)
            channel = self.channel;
        end
        
        function data = get_data(self)
            data = self.data;
        end
        
        function csd = get_csd(self)
            csd = self.csd;
        end
        
        function freq = get_freq(self)
            freq = self.freq;
        end
        
        function num_data = get_num_data(self)
            num_data = self.num_data;
        end
        
        function labels = get_labels(self)
            labels = self.labels;
        end
        
        function bool = contains_labels(self, labels_to_find)
            labels = self.get_labels();
            num_overlap = sum(ismember(labels, labels_to_find));
            bool = length(labels_to_find) == num_overlap;
        end
        
    end
    
end
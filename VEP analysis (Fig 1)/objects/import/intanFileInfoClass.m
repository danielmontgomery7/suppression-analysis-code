classdef intanFileInfoClass < fileInfoAbstractClass
    
    % Intan-specific implementation of fileInfoAbstractClass
    
    % note: must use the one-channel-per-file method of recording (such
    % that every data, analog, and event/time channel is in a separate file)
    
    properties
        intan_struct
    end
    
    methods
        
        function self = intanFileInfoClass(info_file, time_file, event_file)
            self.set_intan_struct(info_file)
            self.set_file(info_file)
            self.set_channels()
            self.set_original_num_data(time_file)
            self.set_original_freqs()
            self.create_eventInfoObj(time_file, event_file)
        end
        
        function set_intan_struct(self, info_file)
            self.intan_struct = read_Intan_RHD2000_file(info_file);
        end
        
        function set_file(self, info_file)
            self.file = info_file;
        end
        
        function set_channels(self)
            % note: this is stored as a cell array of strings
            self.channels = {self.get_intan_struct().amplifier_channels.native_channel_name};
        end
        
        function set_original_num_data(self, time_file)
            fileinfo = dir(time_file);
            num_samples = fileinfo.bytes/4; % int32 = 4 bytes 
            self.original_num_data = num_samples*ones(1, length(self.get_channels()));
        end
        
        function set_original_freqs(self)
            freq = self.get_intan_struct().frequency_parameters.amplifier_sample_rate;
            self.original_freqs = freq*ones(1, length(self.get_channels()));
        end
        
        function create_eventInfoObj(self, time_file, event_file)

            % load (or create) the user-specified event data
            sample_freq = self.get_original_freqs();
            sample_freq = sample_freq(1); % note that all freqs should be the same; see self.set_original_freqs() 
            while true
                try
                    load([self.get_intan_struct().path, 'intan_app_event_data.mat'])
                    break
                catch
                    create_intan_event_dictionary(self, time_file, event_file)
                end
            end
            
            % extract event start timestamps and id then create eventInfo Obj
            [event_ts, event_id] = ...
                calculate_intan_event_information(self, time_file, event_file, intan_app_event_data);
            self.eventInfo = eventInfoClass(self, event_id', event_ts');
            
        end
        
        function create_digitalInfoObj(self, time_file, digital_file)
            digital_ts = calculate_intan_digital_information(self, time_file, digital_file);
            self.digitalInfo = digitalInfoClass(self, digital_ts'); % make sure it's a column vector going into object 
        end
        
        function intan_struct = get_intan_struct(self)
            intan_struct = self.intan_struct;
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
        
        function digitalInfo = get_digitalInfoObj(self)
            digitalInfo = self.digitalInfo;
        end
        
        function [num_data, freq] = get_original_channel_information(self, channel)
            ind = find(ismember(self.get_channels(), channel));
            freq = self.get_original_freqs();
            num_data = self.get_original_num_data();
            freq = freq(ind);
            num_data = num_data(ind);
        end
        
        function [board_mode, main_ver, second_ver] = get_intan_import_info(self)
            intan_struct = self.get_intan_struct();
            board_mode = intan_struct.eval_board_mode;
            main_ver = intan_struct.data_file_main_version_number;
            second_ver = intan_struct.data_file_secondary_version_number;
        end
        
    end
    
end
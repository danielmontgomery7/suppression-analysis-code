function update_rois(varargin)

    data_struct = varargin{1};
    if nargin > 1
        data_struct.params = catstruct(data_struct.params, varargin{2});
    end

    save_path = data_struct.file_info.suite2p_folder;

    suite2p_data = import.import_suite2p_traces(data_struct.file_info);      % import suite2p data

    data_struct.suite2p_data = suite2p_data;                % add updated data to data_struct
    
    save([save_path '\data_struct.mat'], 'data_struct');    % re-save data_struct

end
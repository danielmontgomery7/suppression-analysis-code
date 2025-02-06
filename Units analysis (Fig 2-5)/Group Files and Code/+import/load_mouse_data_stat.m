function group_struct = load_mouse_data_stat(mice, data_path)



    % Load data
    group_struct = struct();
    for ii = 1:length(mice)
        fprintf('Loading data for %s (%d of %d)\n', string(mice{ii}), ii, length(mice));
        
        file_name = [mice{ii}, '.mat'];
        temp_struct = load(fullfile(data_path, mice{ii}, 'Code', file_name));
    
        temp_struct = rmfield(temp_struct, ["VEP", "MUAe", "MUAs"]);
        
        group_struct = catstruct(group_struct, temp_struct);
    end

end
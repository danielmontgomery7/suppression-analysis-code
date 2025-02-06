function group_struct = load_mouse_data(mice, data_path)



% Load data
group_struct = struct();
for ii = 1:length(mice)
    fprintf('Loading data for %s (%d of %d)\n', string(mice{ii}), ii, length(mice));
    
    file_name = [mice{ii}, '.mat'];
    temp_struct = load(fullfile(data_path, mice{ii}, 'Code', file_name));

    temp_struct.(mice{ii}) = rmfield(temp_struct.(mice{ii}), ["statVEP", "statMUAe", "statMUAs"]);
    
    group_struct = catstruct(group_struct, temp_struct);
end









end
function SUA_struct = load_SUA_data(mice, data_path)



    % Load data
    for ii = 1:length(mice)
        iMouse = mice{ii};
        temp_struct = load(fullfile(data_path, iMouse, 'Code', 'raw_data', 'spk_struct.mat'));
        SUA_struct.(iMouse) = temp_struct.spk_struct.psth;
        SUA_struct.(iMouse).units = temp_struct.spk_struct.units;

        fprintf('Loading SUA data for %s (%d of %d)\n', string(mice{ii}), ii, length(mice));
    end

end
function t = import_intan_time_vector(intanFileInfo, time_file)
%INPUT:
%   intanFileInfo: parent intanFileInfo object for the time file
%   time_file: string for path to the time file
%OUTPUT:
%   t: time vector for the intan file
    
    % determine how time vector should be extracted
    fileinfo = dir(time_file); 
    num_samples = fileinfo.bytes/4; % uint32 and int32 = 4 bytes 
    [~, main_ver, second_ver] = intanFileInfo.get_intan_import_info();
    if ((main_ver == 1 && second_ver >= 2) || (main_ver > 1))
        import_mode = 'int32';
    else
        import_mode = 'uint32';
    end
    
    % extract time vector
    fid = fopen(time_file, 'r'); 
    t = fread(fid, num_samples, import_mode); 
    fclose(fid); 
    
    % downsample by frequency
    freqs = intanFileInfo.get_original_freqs();
    t = t(:)'./freqs(1); % units = seconds
    
end

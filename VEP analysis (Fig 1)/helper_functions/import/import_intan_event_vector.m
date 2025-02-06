function ev = import_intan_event_vector(intanFileInfo, event_file)
%INPUT:
%   intanFileInfo: parent intanFileInfo object for the event file
%   event_file: string for path to the event file
%OUTPUT:
%   ev: event vector for the intan file

    % extract vent vector 
    fileinfo = dir(event_file); 
    num_samples = fileinfo.bytes/2; % uint16 = 2 bytes 
    fid = fopen(event_file, 'r'); 
    ev = fread(fid, num_samples, 'uint16'); 
    fclose(fid); 

    % convert data depending on version number of Intan
    [board_mode, ~, ~] = intanFileInfo.get_intan_import_info();
    if (board_mode == 1)
        ev = 152.59e-6 * (ev(:)' - 32768); % units = volts
    elseif (board_mode == 13) % Intan Recording Controller
        ev = 312.5e-6 * (ev(:)' - 32768); % units = volts    
    else
        ev = 50.354e-6 * ev(:)'; % units = volts
    end
        
end

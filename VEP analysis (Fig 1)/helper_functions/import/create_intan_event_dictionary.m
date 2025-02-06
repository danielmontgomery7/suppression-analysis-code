function create_intan_event_dictionary(intanFileInfo, time_file, event_file)
% INPUT:
%   intanFileInfo: parent intanFileInfo object for the time and event files
%   time_file: path to intan file of time data
%   event_file: path to intan file of event data
% CREATES:
%   intan_app_event_data: via an application, a struct is created and saved 
%       that contains the names of the events, the values they take, and the 
%       voltage range the events fall between (as specified by the user)

    % determine downsample factor (otherwise plots take forever to load)
    ndata = intanFileInfo.get_original_num_data();
    freqs = intanFileInfo.get_original_freqs();
    target_freq = 1000; % Hz
    [~, downsample_rate] = calculate_downsample_rate(ndata(1), freqs(1), target_freq);
    
    % extract time vector
    t = import_intan_time_vector(intanFileInfo, time_file);
    t = t(1:downsample_rate:end);

    % extract event vector
    ev = import_intan_event_vector(intanFileInfo, event_file);
    ev = ev(1:downsample_rate:end);
    
    % run and wait for the event application
    app = intan_event_app(t, ev, event_file);
    waitfor(app)
    
    % since app designer cannot handle output arguments, grab the saved
    % variable (saved to the base workspace) and save it in a MATLAB file
    % within the event_file path
    intan_app_event_data = evalin('base', 'intan_app_event_data');
    dir_pos = find(event_file == '/', 1, 'last');
    path = event_file(1:dir_pos);
    save([path, 'intan_app_event_data.mat'], 'intan_app_event_data', '-v7.3')

end
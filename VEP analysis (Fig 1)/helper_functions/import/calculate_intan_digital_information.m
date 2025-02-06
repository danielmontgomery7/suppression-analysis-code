function event_ts = calculate_intan_digital_information(intanFileInfo, time_file, digital_file)
% INPUT:
%   intanFileInfo: parent intanFileInfo object for the time and digital files
%   time_file: path to intan file of time data
%   digital_file: path to intan file of digital data
% OUTPUT:
%   event_ts: vector of time stamps at which events occurred

    % extract time vector
    t = import_intan_time_vector(intanFileInfo, time_file);

    % extract event vector
    dg = import_intan_digital_vector(digital_file);

    % determine when digital event started (ignore everything after it
    % until it returns to 0 value)
    event_inds = logical([false; diff(dg) == 1]);
    event_ts = t(event_inds);
    
end
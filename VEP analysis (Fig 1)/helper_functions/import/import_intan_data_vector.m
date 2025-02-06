function data = import_intan_data_vector(data_file)
%INPUT:
%   data_file: string for path to the data file
%OUTPUT:
%   data: data vector for the intan file
    
    % extract data vector
    fileinfo = dir(data_file); 
    num_samples = fileinfo.bytes/2; % int16 = 2 bytes 
    fid = fopen(data_file, 'r'); 
    data = fread(fid, num_samples, 'int16'); 
    fclose(fid); 
        
    % convert to microvolts
    data = 0.195 * data(:)';

end

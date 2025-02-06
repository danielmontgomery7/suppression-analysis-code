function dg = import_intan_digital_vector(digital_file)
%INPUT:
%   digital_file: string for path to the digital file
%OUTPUT:
%   dg: digital vector for the intan file

    % extract digital vector 
    fileinfo = dir(digital_file); 
    num_samples = fileinfo.bytes/2; % uint16 = 2 bytes 
    fid = fopen(digital_file, 'r'); 
    dg = fread(fid, num_samples, 'uint16'); 
    fclose(fid);
    dg = logical(dg);
        
end

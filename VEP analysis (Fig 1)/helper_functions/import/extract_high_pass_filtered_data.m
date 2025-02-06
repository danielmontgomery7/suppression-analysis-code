function high_pass_data = extract_high_pass_filtered_data(path2spike, nchans, sample_freq)
%INPUT:
%   path2spike: full path to .dat file containing the raw data (non-filtered)
%   nchans: number of channels
%   sample_freq: frequency of the current high spike boolean vector
%OUTPUT:
%   high_pass_data: nchans by nsamples matrix

    % get CAR data
    d = dir(path2spike);
    nsamples = d.bytes/(nchans*2); % int16 is 2 bytes
    fid = fopen(path2spike, 'r');
    fprintf('Extracting CAR data\n')
    high_pass_data = fread(fid, [nchans nsamples], '*int16');
    fprintf('CAR data extracted\n')
    fclose(fid);
    clear d fid nsamples
    
    % high pass with a 3rd order 150 Hz butterworth (like Kilosort)
    [b1, a1] = butter(3, 150/(sample_freq*2), 'high');
    nbytes = fprintf('High pass filtering 1 of %d', nchans);
    chan_ind = 1;
    for c = 1:nchans
        
        % high pass filter data
        high_pass_data(c, :) = butter_high_pass_filter(high_pass_data(c, :), a1, b1);
        
        % update progress bar
        while nbytes > 0
            fprintf('\b')
            nbytes = nbytes - 1;
        end
        chan_ind = chan_ind + 1;
        if chan_ind <= nchans
            nbytes = fprintf('High pass filtering %d of %d', chan_ind, nchans);
        else
            fprintf('High pass filtered %d of %d\n', nchans, nchans);
        end
        
    end
    
end

function out = butter_high_pass_filter(in, a1, b1)
    %INPUT:
    %   in: raw data
    %   a1/b1: outputs of butter function
    %OUTPUT:
    %   out: high-pass filtered data
    %
    % this function is the filter Kilosort normally uses to sort the spike
    % waveforms into templates
    
    % convert data
    in = single(in);
    
    % filter data
    out = filter(b1, a1, in);
    out = flipud(out);
    out = filter(b1, a1, out);
    out = flipud(out);

    % convert back
    out = int16(out);
    
end
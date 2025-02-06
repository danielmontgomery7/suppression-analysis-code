function [data_struct, info] = grab_ramp_data(rampData, info)

    % initialize
    data_struct = struct();
    freq = rampData.container(1).get_freq(); % assuming all are the same sample freq
    info.freq = freq;
    
    % set parameters for notch
    notch_bool = true;
    notch = 'butter';
    opts.freq = freq; 
    if strcmp(notch, 'butter')
        lo = 58; 
        hi = 62; 
        opts.filter = notch;
        [opts.b, opts.a] = butter(3, [lo hi]/(opts.freq/2), 'stop');
    elseif strcmp(notch, 'iir')
        opts.filter = 'iir';
        opts.notch_freq = 60;
        opts.bandwidth = 10;
    end
    
    % set parameters for task
    vep_inds = 0:399;
    stat_inds = 401:1000; % you ideally want to have 401:1000 if doing 1 Hz;
    stim_names = info.stims;
    cond_names = info.groups;
    stim_ids = info.stim_ids;
    nstims = length(stim_names);
    nconds = length(cond_names);
    toffset = info.toffset;
    info.tvep = vep_inds;
    info.tstat = stat_inds;
    
    % iterate data
    allExcData = rampData.get_extracellular_data();
    nchans = length(allExcData);
    nbytes = fprintf('processing 1 of %d', nchans);
    chan_ind = 1;
    for excData = allExcData
        
        % extract name information
        labels = excData.get_labels;
        mouse = labels{1};
        session = labels{2};
        hemi = labels{4};
        experiment = labels{5};
        condition = labels{6};
        
        % extract event information
        evtInfo = excData.get_fileInfoObj().get_eventInfoObj();
        [evid, evts] = evtInfo.get_event_information();
        % note: you can use plot(evts, evid) to view the stimulus as a function of time
        ndata = excData.get_num_data();
        evinds = evtInfo.get_event_inds(ndata, freq);
        
        % transform data
        chan_data = excData.get_data();
        chan_data = chan_data - mean(chan_data);
        
        % detrend and filter data
        chan_data = locdetrend(chan_data, freq, [0.5 0.1])';
        if notch_bool
            chan_data = notch_filter(chan_data, opts); 
        end
        
        % iterate stims
        for istim = 1:nstims

            % extract flips/flops
            stim_name = stim_names{istim};
            stim_id = stim_ids(istim);
            ev_starts_temp = evinds(ismember(evid, stim_id));
            ev_starts = ev_starts_temp + toffset; % ballpark estimate account for weird lag
            pr = ev_starts + vep_inds';

            % extract stationary period (for spectral analysis)
            stat_pr = ev_starts + stat_inds'; 

            % store data
            data_struct.(experiment).(session).(mouse).(condition).(hemi).(stim_name).data = chan_data(pr);
            data_struct.(experiment).(session).(mouse).(condition).(hemi).(stim_name).stat_data = chan_data(stat_pr);

        end
            
        % update progress bar
        while nbytes > 0
            fprintf('\b')
            nbytes = nbytes - 1;
        end
        chan_ind = chan_ind + 1;
        if chan_ind <= nchans
            nbytes = fprintf('processing %d of %d', chan_ind, nchans);
        else
            fprintf('processed %d of %d\n', nchans, nchans);
        end
         
    end
    
end

function out = notch_filter(in, opts)
% INPUT:
%   in: data
%   opts: struct of options for data processing with IIR or butterworth
%   filter

% below taken from Intan system:

    % out = notch_filter(in, fSample, fNotch, Bandwidth)
    %
    % Implements a notch filter (e.g., for 50 or 60 Hz) on vector 'in'.
    % fSample = sample rate of data (in Hz or Samples/sec)
    % fNotch = filter notch frequency (in Hz)
    % Bandwidth = notch 3-dB bandwidth (in Hz).  A bandwidth of 10 Hz is
    %   recommended for 50 or 60 Hz notch filters; narrower bandwidths lead to
    %   poor time-domain properties with an extended ringing response to
    %   transient disturbances.
    %
    % Example:  If neural data was sampled at 30 kSamples/sec
    % and you wish to implement a 60 Hz notch filter:
    %
    % out = notch_filter(in, 30000, 60, 10);
 
    if strcmp(opts.filter, 'iir')
    
        tstep = 1/opts.freq;
        Fc = opts.notch_freq*tstep;

        L = length(in);

        % Calculate IIR filter parameters
        d = exp(-2*pi*(opts.bandwidth/2)*tstep);
        b = (1 + d*d)*cos(2*pi*Fc);
        a0 = 1;
        a1 = -b;
        a2 = d*d;
        a = (1 + d*d)/2;
        b0 = 1;
        b1 = -2*cos(2*pi*Fc);
        b2 = 1;

        out = zeros(size(in));
        out(1) = in(1);  
        out(2) = in(2);
        % (If filtering a continuous data stream, change out(1) and out(2) to the
        %  previous final two values of out.)

        % Run filter
        for i=3:L
            out(i) = (a*b2*in(i-2) + a*b1*in(i-1) + a*b0*in(i) - a2*out(i-2) - a1*out(i-1))/a0;
        end

    elseif strcmp(opts.filter, 'butter')
        
        out = filtfilt(opts.b, opts.a, in);
        
    end
    
end
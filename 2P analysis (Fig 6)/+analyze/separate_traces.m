function output_struct = separate_traces(data_struct)


    fn = fieldnames(data_struct.ttl_timing);
    n_recs = length(fn); % number of combined recordings
    
    traces = data_struct.traces;
    total_frames = size(traces.corrected_F, 2);
    rec_frames = total_frames / n_recs;
    
    for ii = 1:n_recs
        
        first_frame = (ii-1) * rec_frames + 1;
        last_frame = ii * rec_frames;
    
        new_traces.(fn{ii}).cells = traces.cells(:, first_frame:last_frame);
        new_traces.(fn{ii}).neuropil = traces.neuropil(:, first_frame:last_frame);
        new_traces.(fn{ii}).corrected_F = traces.corrected_F(:, first_frame:last_frame);
    end
    
    output_struct = data_struct;
    output_struct.traces = new_traces;

end
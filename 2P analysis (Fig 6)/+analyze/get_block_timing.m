function block_timing = get_block_timing(data_struct)


params = data_struct.params;

%% Find frames when each block and ibi starts
frame_timing = data_struct.ttl_timing.frame_timing;
total_frames = length(frame_timing);

block_frames = floor(params.Block_Length*params.fs);                        % number of frames in each block
ibi_frames = floor(params.Interblock_Interval*params.fs);                   % number of frames in each interblock interval
% ibi_frames = floor(1*params.fs);                                            % ibi = 1 sec preceding each block

block_onsets = data_struct.ttl_timing.block_start_timestamps;
block_onsets_frame = find_closest_value(block_onsets, frame_timing);

if block_onsets_frame(1) > ibi_frames
    ibi_onsets_frame = block_onsets_frame - ibi_frames;
else 
    ibi_onsets = data_struct.ttl_timing.ibi_timestamps;
    ibi_onsets_frame = find_closest_value(ibi_onsets, frame_timing);
end


%% account for grey period

if params.extra_grey_frames == 0
    grey_frames = block_onsets_frame(1) - 1;
    grey_onset_frame = 1;
    
elseif strcmp(params.grey_timing, 'start')
    grey_frames = params.extra_grey_frames;
    grey_onset_frame = 1;
    block_onsets_frame = block_onsets_frame + grey_frames;
    ibi_onsets_frame = ibi_onsets_frame + grey_frames;

elseif strcmp(params.grey_timing, 'end')
    grey_frames = params.extra_grey_frames;
    grey_onset_frame = length(data_struct.frame_timing) - grey_frames;
end

grey_idxs = grey_onset_frame : grey_onset_frame + grey_frames;

if strcmp(params.grey_timing, 'both')
    grey_idxs = [grey_idxs, block_onsets_frame(end) + block_frames : total_frames];
%     grey_idxs = [1:100, total_frames-99 : total_frames];
end



%% Save things

block_timing.block_onsets_frame = block_onsets_frame;
block_timing.block_frames = block_frames;
block_timing.ibi_onsets_frame = ibi_onsets_frame;
block_timing.ibi_frames = ibi_frames;
block_timing.grey_onset_frame = grey_onset_frame;
block_timing.grey_frames = grey_frames;
block_timing.grey_idxs = grey_idxs;

data_struct.params.frames_per_block = block_frames;

end
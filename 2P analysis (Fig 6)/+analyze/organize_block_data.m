function separated_traces = organize_block_data(data_struct, block_timing) %%% WORK IN PROGRESS %%%

    params = data_struct.params;
    traces = data_struct.traces;

%% Stimulus blocks
    n_cells = size(traces.corrected_F, 1);
    n_frames = block_timing.block_frames;
%     n_frames = 15;
    n_conditions = length(unique(params.Block_order));
    stimuli_ttls = unique(params.Block_order);

    block_order = params.Block_order(1:length(block_timing.block_onsets_frame))';

    for iStim = 1:n_conditions

        ttl = stimuli_ttls(iStim);                                          % ttl corresponding to each stimulus condition
        block_onsets = block_timing.block_onsets_frame(block_order==ttl);   % frame when each block starts
        n_blocks = length(block_onsets);                                    % number of blocks per stimulus condition

        corrected_F = nan(n_cells, n_frames, n_blocks);                     % preallocate
        for iBlock = 1:length(block_onsets)

            block_start = block_onsets(iBlock);                             % first frame for each block
            block_end = block_start + n_frames - 1;                         % last frame for each block
            corrected_F(:,:,iBlock) = traces.corrected_F(:, block_start:block_end);
        end

        separated_traces(iStim).stimulus = params.Block_order_Desc(iStim).trialType;
        separated_traces(iStim).corrected_F = corrected_F;
    end

%% interblock interval
    n_frames_ibi = block_timing.ibi_frames;
    ibi_onsets = block_timing.ibi_onsets_frame;
    if ibi_onsets(end)+n_frames_ibi < size(traces.corrected_F,2)
        n_blocks_ibi = length(ibi_onsets);
    else
        n_blocks_ibi = length(ibi_onsets) - 1; 
    end

    corrected_F_ibi = nan(n_cells, n_frames_ibi, n_blocks_ibi);
    for iBlock = 1:n_blocks_ibi

        block_start = ibi_onsets(iBlock);
        block_end = block_start + n_frames_ibi - 1;
        corrected_F_ibi(:,:,iBlock) = traces.corrected_F(:, block_start:block_end);
    end

    separated_traces(n_conditions+1).stimulus = "ibi"; 
    separated_traces(n_conditions+1).corrected_F = corrected_F_ibi; 


    %% grey period

%     grey_start = block_timing.grey_onset_frame;
%     grey_end = grey_start + block_timing.grey_frames - 1;
%     corrected_F_grey = traces.corrected_F(:, grey_start:grey_end);

    grey_idxs = block_timing.grey_idxs;
    corrected_F_grey = traces.corrected_F(:, grey_idxs);

    separated_traces(n_conditions+2).stimulus = "grey";
    separated_traces(n_conditions+2).corrected_F = corrected_F_grey;




% 
%     %% Get traces during individual and average blocks
% 
%     cell_num = size(corrected_F,1);
%     for iStim = unique(params.block_order)
%         traces(iStim).cells_frames_blocks = reshape(traces(iStim).corrected_F, ...
%             cell_num, block_frames, block_num(iStim));
% 
%         traces(iStim).average_traces = squeeze(mean(traces(iStim).cells_frames_blocks,3));
%     %     traces(iStim).average_corrected_F = mean(traces(iStim).average_traces,2); 
%     end
% 
%     data_struct.traces = traces;




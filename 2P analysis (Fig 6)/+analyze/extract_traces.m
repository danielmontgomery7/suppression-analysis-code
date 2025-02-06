function data_struct = extract_traces(data_struct)

%% Identify good cells (from suite2p gui)
cell_index = data_struct.suite2p_data.iscell(:,1);

cell_num = sum(cell_index); % number of cells
fprintf('\nNumber of cells = %d \n\n', cell_num)

%% Get cell and neuropil fluorescence
traces.cells = data_struct.suite2p_data.F(cell_index == 1, :);
traces.neuropil = data_struct.suite2p_data.Fneu(cell_index == 1, :);

%% Find corrected fluorescence (F-0.7*Fneu)
% traces.corrected_F = traces.cells;
% traces.corrected_F = traces.cells - 0.5*traces.neuropil;
traces.corrected_F = traces.cells - 0.7*traces.neuropil;
% traces.corrected_F = traces.neuropil;


%% Save fluorescence and corrected fluorescence traces for cells
data_struct.traces = traces;


end
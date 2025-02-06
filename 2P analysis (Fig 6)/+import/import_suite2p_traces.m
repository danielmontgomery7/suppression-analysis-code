function imaging_data = import_suite2p_traces(file_info)



%% Open FALL.MAT and NPY files

load([file_info.suite2p_folder, '\suite2p\plane0\Fall.mat'], 'stat')

% open .npy files instead of .mat files. Only .npy files are updated automatically by suite2p
iscell = readNPY([file_info.suite2p_folder, '\suite2p\plane0\iscell.npy']);
F = readNPY([file_info.suite2p_folder, '\suite2p\plane0\F.npy']);
Fneu = readNPY([file_info.suite2p_folder, '\suite2p\plane0\Fneu.npy']);
spks = readNPY([file_info.suite2p_folder, '\suite2p\plane0\spks.npy']);


%% Save calcium imaging data from Suite2P

imaging_data.iscell = iscell;
imaging_data.F = F;
imaging_data.Fneu = Fneu;
imaging_data.spks = spks;
imaging_data.stat = stat;








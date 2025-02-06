function [file_info] = OD_get_filenames(save_path, experiment_log_filename)
% Get folder and file locations for files generated by stimulus and recording computers
    % 1) save_path: folder containing suite2p output folder
        % e.g. 'D:\Daniel\2P\L6_SRP\DM716\day1'
    % 2) experiment_log_filename: file saved by stimulation computer with parameters and info about stimulus order
        % e.g. 'D:\Daniel\2P\ExperimentalRecords\26-Jan-2021\26-Jan-2021-132423.mat'

% Suite2p data (from imaging computer)
    if isempty(save_path)
        save_path = uigetdir; % Select folder containing suite2p output folder
    end
 
% Experiment log (from stimulus computer)
    if isempty(experiment_log_filename)
        experiment_log_filename = [save_path,'\*.mat'];
%         experiment_log_filename = uigetfile([save_path, '\*.mat'], ...
%             'Select experiment log file (from stimulus computer), or click Cancel to skip'); % need to test that this works
    end

% TTL timestamps (voltage recording from imaging computer)
    % get file names for csv and xml files
    folders = dir(save_path);
    temp_file=[];
    for ii = 1:length(folders)
        ifolder = [save_path,'\',folders(ii).name,'\*.csv'];
        if ~isempty(dir(ifolder))
            if isempty(temp_file) 
                temp_file = dir(ifolder);
                csv_filename.LE = [temp_file.folder,'\',temp_file.name];
                temp_xml_file = dir([temp_file.folder, '\*.xml']);
                xml_filename.LE = [temp_xml_file(1).folder,'\',temp_xml_file(1).name];
            else
                temp_file = dir(ifolder);
                csv_filename.RE = [temp_file.folder,'\',temp_file.name];
                temp_xml_file = dir([temp_file.folder, '\*.xml']);
                xml_filename.RE = [temp_xml_file(1).folder,'\',temp_xml_file(1).name];
%                 fprintf('\n\nWarning: multiple csv files found. Select correct csv file manually\n\n.')
%                 [temp_file, temp_path] = uigetfile([save_path, '\*.csv'], ...
%                     'Select .csv file with stimulus timing info, or click Cancel to skip');
%                 csv_filename = [temp_path, temp_file];
%                 temp_xml_file = dir([temp_path, '*.xml']);
%                 xml_filename = [temp_xml_file(1).folder,'\',temp_xml_file(1).name];
            end
        end
    end

file_info.suite2p_folder = save_path;
file_info.experiment_log = experiment_log_filename;
file_info.csv_filename = csv_filename;
file_info.xml_filename = xml_filename;
    
    
















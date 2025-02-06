function rampData = import_plx_data(varargin)

if nargin == 1
    path2folders = varargin{1};
    rampData = dataContainerClass();
elseif nargin == 2
    path2folders = varargin{2};
    rampData = varargin{1};
end
    
%     % create a data container to store all of your information in
%     rampData = dataContainerClass();
    
    % get folders in path
    folders = dir(path2folders);
    folders = folders([folders(:).isdir]);
    folders = folders(~ismember({folders(:).name}, {'.', '..'}));
    folders = {folders(:).name};
    
    % iterate folders
    for folder = folders
        
        % absolute folder name
%         folder_name = fullfile([path2folders, folder{:}, '/', [folder{:}, ' Day 4/']]); % last / is important
        folder_name = fullfile([path2folders, folder{:}, '\']); % last / is important
        %   depending on what OS you use you might need to change the / to a \
        disp(['Working on: ', folder_name])
        
        % get plx files within folder
%         files = strsplit(ls(folder_name));
        files_temp = strtrim(string(ls(folder_name)));
        files = files_temp(endsWith(files_temp, '.plx'));
        
        % iterate files
        for ii = 1:length(files)
            try
                file = files(ii);
                filename = fullfile(folder_name, file);
                import.extract_plx_file_data(rampData, filename{:});
            catch
                disp(['    Error: Skipping ', file{:}])
            end
        end
    end

end
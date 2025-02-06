function frame_timing = import_xml(file_info)


if ~isstruct(file_info.xml_filename)

    xml = xml2struct(file_info.xml_filename);           % convert xml file to struct, this step takes a while
    frame_info = [xml.PVScan.Sequence.Frame];           % get data struct with information about each frame
    n_frames = length(frame_info);                      % number of frames
    frame_timing = nan(n_frames,1);
    
    for ii = 1:n_frames
        frame_timing(ii) = str2num(frame_info{ii}.Attributes.relativeTime);
    end

else % For OD recordings with separate LE and RE recording files

    fn = fieldnames(file_info.csv_filename);
    for ii = 1:numel(fn)

        xml = xml2struct(file_info.xml_filename.(fn{ii}));           % convert xml file to struct, this step takes a while
        frame_info = [xml.PVScan.Sequence.Frame];           % get data struct with information about each frame
        n_frames = length(frame_info);                      % number of frames
        frame_timing_temp = nan(n_frames,1);
        
        for iii = 1:n_frames
            frame_timing_temp(iii) = str2num(frame_info{iii}.Attributes.relativeTime);
        end

        frame_timing.(fn{ii}) = frame_timing_temp;
    end
end

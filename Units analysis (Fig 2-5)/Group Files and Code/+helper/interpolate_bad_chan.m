function data_matrix = interpolate_bad_chan(data_matrix, depths, badObj, current_info)

    % determine if this is the correct bad channel
    if sum(ismember(badObj.get_labels(), current_info)) ~= length(current_info)
       return 
    end

    % collect bad index
    depth = badObj.get_labels();
    depth = depth{6};
    bad_ind = find(strcmp(depths, depth));
    
    % take average of neigbors and store
    above = data_matrix(bad_ind-1, :, :, :);
    below = data_matrix(bad_ind+1, :, :, :);
    avg = mean([above; below], 1);
    data_matrix(bad_ind, :, :, :) = avg;
    
end
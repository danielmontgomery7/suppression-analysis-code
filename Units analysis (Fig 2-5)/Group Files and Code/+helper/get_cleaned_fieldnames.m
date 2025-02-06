function cleaned_fieldnames = get_cleaned_fieldnames(data_struct)

    % ensure sorted order and row vector
    fnames = fieldnames(data_struct);
    cleaned_fieldnames = unique(fnames(:)');
    
    % eliminate any names that start with x_ (my marker for "extra" info
    % storage, like CSDs, channel name, etc)
    cleaned_fieldnames = cleaned_fieldnames(~startsWith(fnames, 'x_'));
    
end
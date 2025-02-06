function [x, y] = get_positions_from_names(shank, offset, xOffsetGain, tip)

    % convert to numbers
    shank = str2double(shank{:}(end-3:end));
    offset = str2double(offset{:}(end-3:end));
    tip = str2double(tip{:}(end-3:end));

    % get x/y position
    x = xOffsetGain*shank + offset;
    y = tip;

end
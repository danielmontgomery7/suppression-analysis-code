function [CSD, MUA] = CSD_MUA_analysis(group_struct)

    depth_range = [400, -600]; % distance above and below L4 to include data from

    n_chan = abs(diff(depth_range))/20 + 1;

    mice = fields(group_struct);    
    for iMouse = 1:length(mice)

        % get indices for correct depths for each mouse
        depths = group_struct.(mice{iMouse}).vec.depths <= depth_range(1) & ...
            group_struct.(mice{iMouse}).vec.depths >= depth_range(2);

        % Get CSDs and MUA for each condition
        conditions = fields(group_struct.(mice{iMouse}).CSD);
        for iCond = 1:length(conditions)
            CSD_data = group_struct.(mice{iMouse}).CSD.(conditions{iCond});
            MUA_data = group_struct.(mice{iMouse}).MUAe.(conditions{iCond});
            diff_chan = n_chan - sum(depths);

            if diff_chan ~= 0 && depths(1) == 1 % add padding for probes that are too shallow
                temp_CSD = squeeze(mean(CSD_data(:,:,depths), 2));
                temp_MUA = squeeze(mean(MUA_data(:,:,depths), 2));
                CSD.(conditions{iCond})(:,:,iMouse) = [nan(size(temp_CSD, 1), diff_chan), temp_CSD];
                MUA.(conditions{iCond})(:,:,iMouse) = [nan(size(temp_MUA, 1), diff_chan), temp_MUA];

            elseif diff_chan ~= 0 && depths(end) == 1 % add padding for probes that are too deep
                temp_CSD = squeeze(mean(CSD_data(:,:,depths), 2));
                temp_MUA = squeeze(mean(MUA_data(:,:,depths), 2));
                CSD.(conditions{iCond})(:,:,iMouse) = [temp_CSD, nan(size(temp_CSD, 1), diff_chan)];
                MUA.(conditions{iCond})(:,:,iMouse) = [temp_MUA, nan(size(temp_MUA, 1), diff_chan)];

            else
                CSD.(conditions{iCond})(:,:,iMouse) = squeeze(mean(CSD_data(:,:,depths), 2));
                MUA.(conditions{iCond})(:,:,iMouse) = squeeze(mean(MUA_data(:,:,depths), 2));
            end
        end
    end
end
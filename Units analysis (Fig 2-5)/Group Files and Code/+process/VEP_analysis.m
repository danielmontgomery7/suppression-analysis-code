function [VEP, VEP_stats, depth_VEPs] = VEP_analysis(group_struct)


    % Get L4 VEPs for each mouse
    mice = fields(group_struct);
    for iMouse = 1:length(mice)
        conditions = fields(group_struct.(mice{iMouse}).VEP);
%         L4{iMouse} = group_struct.(mice{iMouse}).vec.depths == 0;

        depths_temp = group_struct.(mice{iMouse}).vec.depths;
        L4{iMouse} = depths_temp == 0;
        all_depths{iMouse} = depths_temp <= 400 & depths_temp > -600;
        for iCond = 1:length(conditions)
            all_VEPs = group_struct.(mice{iMouse}).VEP.(conditions{iCond});
            VEP.(conditions{iCond})(:,iMouse) = mean(all_VEPs(:,:,L4{iMouse}), 2);

            depth_VEPs.(conditions{iCond})(:,:,iMouse) = squeeze(mean(all_VEPs(:,:,all_depths{iMouse}), 2)); %%%%

        end
    end

    % Get VEP magnitudes
    conditions = fields(VEP);
    for iCond = 1:length(conditions)
        struct_fields = fields(VEP);
        condition = struct_fields{iCond};
        avg_VEP.(condition) = mean(VEP.(condition), 2);
        
        neg(:,iCond) = min(VEP.(condition)(40:120, :));
        pos(:,iCond) = max(VEP.(condition)(60:220, :));
        mag(:,iCond) = pos(:,iCond) - neg(:,iCond);
    end

    % Store data
    VEP_stats.conditions = conditions;
    VEP_stats.mag = mag;
    VEP_stats.neg = neg;
    VEP_stats.pos = pos;
    VEP_stats.avg_VEP = avg_VEP;
end
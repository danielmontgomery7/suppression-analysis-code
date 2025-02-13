function [monoc_data, conc_data, disc_data] = get_IOS_data(data_struct)

mice = fields(data_struct);
n_mice = length(mice);

for ii = 1:n_mice

    mouse = mice{ii};
    mouse_data = data_struct.(mouse);



    n_cond = size(mouse_data.traces_dFF, 2);

%     t1 = 0; t2 = 10;
%     t1 = 0; t2 = 4;
    t1 = 0; t2 = mouse_data.params.Block_Length;
    fs = mouse_data.params.fs;


    cells = 1:size(mouse_data.traces_dFF(1).dFF, 1);
%     cells = mouse_data.traces_dFF(1).average_dFF > threshold | ...
%         mouse_data.traces_dFF(2).average_dFF > threshold;
%     cells = mouse_data.traces_dFF(monoc_idx).average_dFF > threshold | ...
%         mouse_data.traces_dFF(conc_idx).average_dFF > threshold | ...
%         mouse_data.traces_dFF(disc_idx).average_dFF > threshold; % responsive cells only
%     frames = 1:size(mouse_data.traces_dFF(1).dFF, 2);
    frames = round(fs*t1)+1:floor(fs*t2);
    blocks = 1:size(mouse_data.traces_dFF(1).dFF, 3);


%     for ii = 1:n_cond
%     
%         condition(ii).data = mouse_data.traces_dFF(ii).dFF(cells, frames, blocks)
%         varargout{ii}.mouse = squeeze(mean(condition(ii).data, 2))
%     
%     end
    

% %%%%%%%%%%%%%%%%%%%%%
%     % get index for each condition
%     monoc_idx = 1;
%     conc_idx = 3;
%     disc_idx = 5;
%     monoc_idx = 2;
%     conc_idx = 4;
%     disc_idx = 6;
%     threshold = 0;    
% 
%     cells = mouse_data.traces_dFF(monoc_idx).average_dFF > threshold | ...
%         mouse_data.traces_dFF(conc_idx).average_dFF > threshold | ...
%         mouse_data.traces_dFF(disc_idx).average_dFF > threshold; % responsive cells only
% 
% %     monoc_temp = mouse_data.traces_dFF(monoc_idx).dFF(cells, frames, blocks);
% %     conc_temp = mouse_data.traces_dFF(conc_idx).dFF(cells, frames, blocks);
% %     disc_temp = mouse_data.traces_dFF(disc_idx).dFF(cells, frames, blocks);
% 
%         monoc_temp1 = mouse_data.traces_dFF(1).dFF(cells, frames, blocks);
%         monoc_temp2 = mouse_data.traces_dFF(2).dFF(cells, frames, blocks);
%     monoc_temp = (monoc_temp1 + monoc_temp2) ./ 2;
%         conc_temp1 = mouse_data.traces_dFF(3).dFF(cells, frames, blocks);
%         conc_temp2 = mouse_data.traces_dFF(4).dFF(cells, frames, blocks);
%     conc_temp = (conc_temp1 + conc_temp2) ./ 2;
%         disc_temp1 = mouse_data.traces_dFF(5).dFF(cells, frames, blocks);
%         disc_temp2 = mouse_data.traces_dFF(6).dFF(cells, frames, blocks);
%     disc_temp = (disc_temp1 + disc_temp2) ./ 2;
% 
%     % output
% %     monoc_data.(mouse) = squeeze(mean(monoc_temp, 2));
% %     conc_data.(mouse) = squeeze(mean(conc_temp, 2));
% %     disc_data.(mouse) = squeeze(mean(disc_temp, 2));
% 
%     monoc_data.(mouse) = squeeze(mean(mean(monoc_temp, 2),3));
%     conc_data.(mouse) = squeeze(mean(mean(conc_temp, 2),3));
%     disc_data.(mouse) = squeeze(mean(mean(disc_temp, 2),3));
% %%%%%%%%%%%%%%%%




end




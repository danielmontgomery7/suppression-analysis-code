function [monoc_data, conc_data, disc_data] = get_phaseoffset_data(data_struct)

mice = fields(data_struct);
n_mice = length(mice);

for ii = 1:n_mice

    mouse = mice{ii};
    mouse_data = data_struct.(mouse);

%     % get index for each condition
    monoc_idx = 3;
    conc_idx = 1;
    disc_idx = 2;
%     monoc_idx = 6;
%     conc_idx = 4;
%     disc_idx = 5;

    

    t1 = 0; t2 = 10;
%     t1 = 0; t2 = 0.1;
%     threshold = 0;

    fs = mouse_data.params.fs;

    cells = 1:size(mouse_data.traces_dFF(1).dFF, 1);
%     cells = mouse_data.traces_dFF(monoc_idx).average_dFF > threshold | ...
%         mouse_data.traces_dFF(conc_idx).average_dFF > threshold | ...
%         mouse_data.traces_dFF(disc_idx).average_dFF > threshold; % responsive cells only
%     frames = 1:size(mouse_data.traces_dFF(1).dFF, 2);
    frames = floor(fs*t1)+1:floor(fs*t2);
    blocks = 1:size(mouse_data.traces_dFF(1).dFF, 3);


    monoc_temp = mouse_data.traces_dFF(monoc_idx).dFF(cells, frames, blocks);
    conc_temp = mouse_data.traces_dFF(conc_idx).dFF(cells, frames, blocks);
    disc_temp = mouse_data.traces_dFF(disc_idx).dFF(cells, frames, blocks);

%         monoc_temp1 = mouse_data.traces_dFF(3).dFF(cells, frames, blocks);
%         monoc_temp2 = mouse_data.traces_dFF(6).dFF(cells, frames, blocks);
%     monoc_temp = (monoc_temp1 + monoc_temp2) ./ 2;
%         conc_temp1 = mouse_data.traces_dFF(1).dFF(cells, frames, blocks);
%         conc_temp2 = mouse_data.traces_dFF(4).dFF(cells, frames, blocks);
%     conc_temp = (conc_temp1 + conc_temp2) ./ 2;
%         disc_temp1 = mouse_data.traces_dFF(2).dFF(cells, frames, blocks);
%         disc_temp2 = mouse_data.traces_dFF(5).dFF(cells, frames, blocks);
%     disc_temp = (disc_temp1 + disc_temp2) ./ 2;

    % output
    monoc_data.(mouse) = squeeze(mean(monoc_temp, 2));
    conc_data.(mouse) = squeeze(mean(conc_temp, 2));
    disc_data.(mouse) = squeeze(mean(disc_temp, 2));

end




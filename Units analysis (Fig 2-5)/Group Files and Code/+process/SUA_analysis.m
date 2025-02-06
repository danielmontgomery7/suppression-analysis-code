function [all_units, all_units_raster, unit_depths, spike_widths] = SUA_analysis(SUA_struct, layer_borders, good_cells_only)


    conditions = ["monocular", "concordant", "discordant", "antiphase"];
    layers = ["L23", "L4", "L5", "L6"];
    % layer_borders = [300, 100, -100, -300, -500];
    cell_types = ["pyr", "pv"];
    mice = fields(SUA_struct);
    
    % Make empty structure
    for iCond = 1:length(conditions)
        for iType = 1:length(cell_types)
            for iLayer = 1:length(layers)
                all_units.(cell_types{iType}).(layers(iLayer)).(conditions{iCond}) = [];
                all_units_raster.(cell_types{iType}).(layers(iLayer)).(conditions{iCond}) = [];
            end
            all_units.(cell_types{iType}).all.(conditions{iCond}) = [];
            all_units_raster.(cell_types{iType}).all.(conditions{iCond}) = [];
            unit_depths.(cell_types{iType}) = [];
            spike_widths.(cell_types{iType}) = []; %%%%%%% IN PROGRESS
        end
    end


    SUA_struct = process.get_spike_widths(SUA_struct);


    
    % Fill structure with data from each mouse
    for iMouse = 1:length(mice)
        for iCond = 1:length(conditions)
            for iType = 1:length(cell_types)
                mouse_SUA_data = SUA_struct.(mice{iMouse}).(conditions{iCond}).(cell_types{iType});
    
                % identify units that are responsive to monocular stimulus presentation
                if good_cells_only == true
                    test_condition = "monocular";
                    mouse_test_data = SUA_struct.(mice{iMouse}).(test_condition).(cell_types{iType});
                    mouse_good_cells = process.SUA_find_good_cells(mouse_test_data);

                    mouse_SUA_data.pr = mouse_SUA_data.pr(:,:,mouse_good_cells);
                    mouse_SUA_data.stat_pr = mouse_SUA_data.stat_pr(:,:,mouse_good_cells);
                    mouse_SUA_data.depths = mouse_SUA_data.depths(mouse_good_cells);
                end


                % get data for each layer
                for iLayer = 1:length(layers)
                    idx = mouse_SUA_data.depths < layer_borders(iLayer) & mouse_SUA_data.depths >= layer_borders(iLayer+1);                
                    mouse_data = squeeze(mean(mouse_SUA_data.pr(:,:,idx), 2));
%                     mouse_data = squeeze(mean(data_temp.stat_pr(:,:,idx), 2));
                    temp = [all_units.(cell_types{iType}).(layers(iLayer)).(conditions{iCond}), mouse_data];
                    all_units.(cell_types{iType}).(layers(iLayer)).(conditions{iCond}) = temp;


                    mouse_raster_data = mouse_SUA_data.pr(:,:,idx);
                    temp_raster = cat(3, all_units_raster.(cell_types{iType}).(layers(iLayer)).(conditions{iCond}), mouse_raster_data);
                    all_units_raster.(cell_types{iType}).(layers(iLayer)).(conditions{iCond}) = temp_raster;

                end
                
                % get data across all layers
                idx = mouse_SUA_data.depths < layer_borders(1) & mouse_SUA_data.depths >= layer_borders(end);                
                data_struct = squeeze(mean(mouse_SUA_data.pr(:,:,idx), 2));
%                 data_struct = squeeze(mean(data_temp.stat_pr(:,:,idx), 2));
                temp = [all_units.(cell_types{iType}).all.(conditions{iCond}), data_struct];
                all_units.(cell_types{iType}).all.(conditions{iCond}) = temp;

                mouse_raster_data = mouse_SUA_data.pr(:,:,idx);
                temp_raster = cat(3, all_units_raster.(cell_types{iType}).all.(conditions{iCond}), mouse_raster_data);
                all_units_raster.(cell_types{iType}).all.(conditions{iCond}) = temp_raster;

                % get depths for each unit
                if iCond == 1
                    depths = [unit_depths.(cell_types{iType}), mouse_SUA_data.depths];
                    depths = depths(depths>=layer_borders(end));
                    unit_depths.(cell_types{iType}) = depths;
                end




            end
        end
    end

end
function SUA_struct = get_spike_widths(SUA_struct)


time_vec = -0.6 : 0.04 : 1.8;


% spike_width_thresh = 44; %us


conditions = ["monocular", "concordant", "discordant", "antiphase"];
% layers = ["L23", "L4", "L5", "L6"];
% layer_borders = [300, 100, -100, -300, -500];
cell_types = ["pyr", "pv"];
mice = fields(SUA_struct);



    for iMouse = 1:length(mice)
        for iCond = 1:length(conditions)
            for iType = 1:length(cell_types)
                
                
                
%                     mouse_SUA_data = SUA_struct.(mice{iMouse}).(conditions{iCond}).(cell_types{iType});

                    wv_temp = SUA_struct.(mice{iMouse}).units.best_wv;
                
                
                
                    [~, min_idx] = min(wv_temp(1:20,:));
%                     min_idx = min_idx + 9;

                    [~, max_idx] = max(wv_temp(18:35,:));
                    max_idx = max_idx + 17;
                
                    spk_width = max_idx - min_idx;

                    spk_width_time = spk_width .* 0.04 % ms
                
                
                
%%%
        for icluster = 1:size(wv_temp,2)
            % get biggest negative waveform
            mn_spk = wv_temp(:, icluster);
            
            % normalize so largest point is 1
            mn_spk = mn_spk./max(abs(mn_spk));
            
%             % check if positive or negative at the time of spike
%             %   if positive; stop this loop
%     %         if sign(mn_spk(spike_onset-2)) == 1
%             if sign(mn_spk(spike_onset)) == 1
%                 f.UserData.labels(icluster) = {'pos'};
%                 continue
%             end
            

            peak_start = 24;
            trough_split = 40;

            % if the valley after the spike onset occurs before classifier,
            % it's a fast-spiking cell; after and it's a regular spiking cell
            [~, min_ind] = min(mn_spk(peak_start:end));
            min_ind = min_ind + peak_start - 1;
            if min_ind < trough_split
                f.UserData.labels(icluster) = {'pv'};
            else
                f.UserData.labels(icluster) = {'pyr'};
            end
        end















                


            end
        end
    end










end
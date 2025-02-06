function [zMUA, baseline_avg] = zscore_MUA(MUA)


% MUA format: 
% 4 fields
% frames x depths x mice


conditions = fields(MUA);
time_idx = 1:30;
all_data = [];

for ii = 1:length(conditions)
    all_data = [all_data; MUA.(conditions{ii})(time_idx,:,:)];
end

mn_data = mean(all_data, 1);
std_data = std(all_data, [], 1);


for ii = 1:length(conditions)
    zMUA.(conditions{ii}) = (MUA.(conditions{ii}) - mn_data)./std_data;
end

baseline_avg = squeeze(mean(mn_data,3))';


end
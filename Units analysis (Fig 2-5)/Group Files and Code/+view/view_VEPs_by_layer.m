function [] = view_VEPs_by_layer(depth_VEPs)




%%
depth_vec = 360:-20:-520;

data = depth_VEPs.monocular(1:300,1:45,:);
% data = depth_VEPs.concordant(1:300,1:45,:);
% data = depth_VEPs.antiphase(1:300,1:45,:);
% data = depth_VEPs.discordant(1:300,1:45,:);

mn_VEPs = squeeze(mean(data, 3));
mn_VEPs = smoothdata(mn_VEPs, 'movmean', 1000/120);

figure(); hold on
plot(mn_VEPs + depth_vec, 'k')
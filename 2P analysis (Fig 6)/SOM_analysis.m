clear all;
close all;
addpath(genpath(pwd))

%%

DM868.sess1 = import.IOS_import_wrapper('DM868', 'IOS1');

DM942.sess1 = import.IOS_import_wrapper('DM942', 'IOS1');
DM943.sess1 = import.IOS_import_wrapper('DM943', 'IOS1');
DM945.sess1 = import.IOS_import_wrapper('DM945', 'IOS1');

%%

params.save_path = 'D:\Daniel\2P\IOS\Processed Data\';
params.F0 = 'preceding_ibi';
params.fs = 15.5;

IOS_SOM = [];
IOS_SOM.DM868 = analyze.IOS_analyze_wrapper(DM868.sess1, params);
IOS_SOM.DM942 = analyze.IOS_analyze_wrapper(DM942.sess1, params);
IOS_SOM.DM943 = analyze.IOS_analyze_wrapper(DM943.sess1, params);
IOS_SOM.DM945 = analyze.IOS_analyze_wrapper(DM945.sess1, params);


%% Plot all mouse data

plot.SOM_IOS_mouse_data(IOS_SOM)


%%
x=[];

x.monoc = ([IOS_SOM.DM868.traces_dFF(1).average_trace; ...
            IOS_SOM.DM942.traces_dFF(1).average_trace; ...
            IOS_SOM.DM943.traces_dFF(1).average_trace; ...
            IOS_SOM.DM945.traces_dFF(1).average_trace] + ...
           [IOS_SOM.DM868.traces_dFF(2).average_trace; ...
            IOS_SOM.DM942.traces_dFF(2).average_trace; ...
            IOS_SOM.DM943.traces_dFF(2).average_trace; ...
            IOS_SOM.DM945.traces_dFF(2).average_trace])/2;

x.conc  = ([IOS_SOM.DM868.traces_dFF(3).average_trace; ...
            IOS_SOM.DM942.traces_dFF(3).average_trace; ...
            IOS_SOM.DM943.traces_dFF(3).average_trace; ...
            IOS_SOM.DM945.traces_dFF(3).average_trace] + ...
           [IOS_SOM.DM868.traces_dFF(4).average_trace; ...
            IOS_SOM.DM942.traces_dFF(4).average_trace; ...
            IOS_SOM.DM943.traces_dFF(4).average_trace; ...
            IOS_SOM.DM945.traces_dFF(4).average_trace])/2;

x.disc  = ([IOS_SOM.DM868.traces_dFF(5).average_trace; ...
            IOS_SOM.DM942.traces_dFF(5).average_trace; ...
            IOS_SOM.DM943.traces_dFF(5).average_trace; ...
            IOS_SOM.DM945.traces_dFF(5).average_trace] + ...
           [IOS_SOM.DM868.traces_dFF(6).average_trace; ...
            IOS_SOM.DM942.traces_dFF(6).average_trace; ...
            IOS_SOM.DM943.traces_dFF(6).average_trace; ...
            IOS_SOM.DM945.traces_dFF(6).average_trace])/2;


[y, idx] = sort(mean(x.monoc,2), 'descend');

cells = 1:length(y);

z.monoc = x.monoc(idx(cells),:);
z.conc = x.conc(idx(cells),:);
z.disc = x.disc(idx(cells),:);



cmap = inferno(100);

figure(); hold on
    ops.x_axis = linspace(0,10,size(x.monoc,2));
    ops.alpha = 0.3;
    ops.color_area = [0 0 0];    % Black
    ops.color_line = [0 0 0];
plot_areaerrorbar(z.monoc, ops)
    ops.color_area = [0 0 1];    % Blue theme
    ops.color_line = [0 0 1];
plot_areaerrorbar(z.conc, ops)
    ops.color_area = [1 0 0];    % Red theme
    ops.color_line = [1 0 0];
plot_areaerrorbar(z.disc, ops)
vline(1:9)
xlabel('Time (seconds)'); ylabel('Average dF/F');
legend('','Monoc','','Concordant','','Discordant')



figure(); subplot(131)
C = [-0.2, 1.6];
imagesc(z.monoc, C)
xlabel('Time (frames)'); ylabel('Cell number'); title('Monocular')
subplot(132)
imagesc(z.conc, C)
xlabel('Time (frames)'); ylabel('Cell number'); title('Concordant')
subplot(133)
imagesc(z.disc, C)
xlabel('Time (frames)'); ylabel('Cell number'); title('Discordant')

colormap(cmap)



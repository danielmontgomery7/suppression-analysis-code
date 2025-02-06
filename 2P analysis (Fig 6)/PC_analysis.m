clear all;
close all;
% addpath(genpath(pwd))

%%


DM950.IOS = import.IOS_import_wrapper('DM950', 'IOS_preTTX');
DM951.IOS = import.IOS_import_wrapper('DM951', 'IOS_preTTX');
DM952.IOS = import.IOS_import_wrapper('DM952', 'IOS_preTTX');
DM953.IOS = import.IOS_import_wrapper('DM953', 'IOS_preTTX');
DM954.IOS = import.IOS_import_wrapper('DM954', 'IOS_preTTX');

DM969.IOS = import.IOS_import_wrapper('DM969', 'IOS');
DM970.IOS = import.IOS_import_wrapper('DM970', 'IOS');
DM974.IOS = import.IOS_import_wrapper('DM974', 'IOS');

DM996.IOS  = import.IOS_import_wrapper('DM996', 'IOS');
DM997.IOS  = import.IOS_import_wrapper('DM997', 'IOS');
DM999.IOS  = import.IOS_import_wrapper('DM999', 'IOS');
DM1000.IOS = import.IOS_import_wrapper('DM1000', 'IOS');
DM1001.IOS = import.IOS_import_wrapper('DM1001', 'IOS');



%%

params.save_path = 'D:\Daniel\2P\IOS\Processed Data\';
params.F0 = 'ibi';
params.fs = 15.5;

IOS = [];

IOS.DM950 = analyze.IOS_analyze_wrapper(DM950.IOS, params);
IOS.DM951 = analyze.IOS_analyze_wrapper(DM951.IOS, params);
IOS.DM952 = analyze.IOS_analyze_wrapper(DM952.IOS, params);
IOS.DM953 = analyze.IOS_analyze_wrapper(DM953.IOS, params);
IOS.DM954 = analyze.IOS_analyze_wrapper(DM954.IOS, params);

IOS.DM969 = analyze.IOS_analyze_wrapper(DM969.IOS, params);
IOS.DM970 = analyze.IOS_analyze_wrapper(DM970.IOS, params);
IOS.DM974 = analyze.IOS_analyze_wrapper(DM974.IOS, params);

IOS.DM996 = analyze.IOS_analyze_wrapper(DM996.IOS, params);
IOS.DM997 = analyze.IOS_analyze_wrapper(DM997.IOS, params);
IOS.DM999 = analyze.IOS_analyze_wrapper(DM999.IOS, params);
IOS.DM1000 = analyze.IOS_analyze_wrapper(DM1000.IOS, params);
IOS.DM1001 = analyze.IOS_analyze_wrapper(DM1001.IOS, params);

%% Plot individual mouse data


plot.IOS_mouse_data(IOS.DM950);
plot.IOS_mouse_data(IOS.DM951);
plot.IOS_mouse_data(IOS.DM952);
plot.IOS_mouse_data(IOS.DM953);
plot.IOS_mouse_data(IOS.DM954);

plot.IOS_mouse_data(IOS.DM969);
plot.IOS_mouse_data(IOS.DM970);
plot.IOS_mouse_data(IOS.DM974);

plot.IOS_mouse_data(IOS.DM996);
plot.IOS_mouse_data(IOS.DM997);
plot.IOS_mouse_data(IOS.DM999);
plot.IOS_mouse_data(IOS.DM1000);
plot.IOS_mouse_data(IOS.DM1001);

%% Plot combined data

plot.IOS_mouse_data(IOS);


%%


avg_data = [];
mice = fields(IOS);
all_cells = [];

for iMouse = 1:length(mice)

    mouse_data = IOS.(mice{iMouse}).average_dFF';
    avg_data(iMouse, :) = mean(mouse_data, 2);
    n_cells(iMouse,1) = size(mouse_data, 2);
    all_cells = [all_cells; mouse_data'];
end





%%
x=[];

x.monoc =  [IOS.DM950.traces_dFF(1).average_trace; ...
            IOS.DM951.traces_dFF(1).average_trace; ...
            IOS.DM952.traces_dFF(1).average_trace; ...
            IOS.DM953.traces_dFF(1).average_trace; ...
            IOS.DM954.traces_dFF(1).average_trace; ...
            IOS.DM969.traces_dFF(1).average_trace; ...
            IOS.DM970.traces_dFF(1).average_trace; ...
            IOS.DM974.traces_dFF(1).average_trace; ...
            IOS.DM996.traces_dFF(1).average_trace; ...
            IOS.DM997.traces_dFF(1).average_trace; ...
            IOS.DM999.traces_dFF(1).average_trace; ...
           IOS.DM1000.traces_dFF(1).average_trace; ...
           IOS.DM1001.traces_dFF(1).average_trace];

x.conc =   [IOS.DM950.traces_dFF(2).average_trace; ...
            IOS.DM951.traces_dFF(2).average_trace; ...
            IOS.DM952.traces_dFF(2).average_trace; ...
            IOS.DM953.traces_dFF(2).average_trace; ...
            IOS.DM954.traces_dFF(2).average_trace; ...
            IOS.DM969.traces_dFF(2).average_trace; ...
            IOS.DM970.traces_dFF(2).average_trace; ...
            IOS.DM974.traces_dFF(2).average_trace; ...
            IOS.DM996.traces_dFF(2).average_trace; ...
            IOS.DM997.traces_dFF(2).average_trace; ...
            IOS.DM999.traces_dFF(2).average_trace; ...
           IOS.DM1000.traces_dFF(2).average_trace; ...
           IOS.DM1001.traces_dFF(2).average_trace];


x.offset = [IOS.DM950.traces_dFF(4).average_trace; ...
            IOS.DM951.traces_dFF(4).average_trace; ...
            IOS.DM952.traces_dFF(4).average_trace; ...
            IOS.DM953.traces_dFF(4).average_trace; ...
            IOS.DM954.traces_dFF(4).average_trace; ...
            IOS.DM969.traces_dFF(4).average_trace; ...
            IOS.DM970.traces_dFF(4).average_trace; ...
            IOS.DM974.traces_dFF(4).average_trace; ...
            IOS.DM996.traces_dFF(4).average_trace; ...
            IOS.DM997.traces_dFF(4).average_trace; ...
            IOS.DM999.traces_dFF(4).average_trace; ...
           IOS.DM1000.traces_dFF(4).average_trace; ...
           IOS.DM1001.traces_dFF(4).average_trace];


x.disc =   [IOS.DM950.traces_dFF(3).average_trace; ...
            IOS.DM951.traces_dFF(3).average_trace; ...
            IOS.DM952.traces_dFF(3).average_trace; ...
            IOS.DM953.traces_dFF(3).average_trace; ...
            IOS.DM954.traces_dFF(3).average_trace; ...
            IOS.DM969.traces_dFF(3).average_trace; ...
            IOS.DM970.traces_dFF(3).average_trace; ...
            IOS.DM974.traces_dFF(3).average_trace; ...
            IOS.DM996.traces_dFF(3).average_trace; ...
            IOS.DM997.traces_dFF(3).average_trace; ...
            IOS.DM999.traces_dFF(3).average_trace; ...
           IOS.DM1000.traces_dFF(3).average_trace; ...
           IOS.DM1001.traces_dFF(3).average_trace];



[y, idx] = sort(mean(x.monoc,2), 'descend');

cells = 1:length(y);

z.monoc  = x.monoc(idx(cells),:);
z.conc   = x.conc(idx(cells),:);
z.offset = x.offset(idx(cells),:);
z.disc   = x.disc(idx(cells),:);



cmap = inferno(100);

figure(); hold on
%     ops.x_axis = linspace(0,3.8,size(x.monoc,2));
    ops.x_axis = linspace(0,4,size(x.monoc,2));
    ops.alpha = 0.3;
    ops.color_area = [0.5 0.5 0.5];    % Grey
    ops.color_line = [0.5 0.5 0.5];
plot_areaerrorbar(z.monoc, ops)
    ops.color_area = [0 0 0];    % Black 
    ops.color_line = [0 0 0];
plot_areaerrorbar(z.conc, ops)
    ops.color_area = [0.7 0.3 1];    % Purple 
    ops.color_line = [0.7 0.3 1];
plot_areaerrorbar(z.offset, ops)
    ops.color_area = [1 0 0];    % Red 
    ops.color_line = [1 0 0];
plot_areaerrorbar(z.disc, ops)
vline(1:3)
xlabel('Time (seconds)'); ylabel('Average dF/F');
legend('','Monoc','','Concordant','','Offset','','Discordant')


figure(); subplot(141)
C = [-0.2, 1.6];
imagesc(z.monoc, C)
xlabel('Time (frames)'); ylabel('Cell number'); title('Monocular')
subplot(142)
imagesc(z.conc, C)
xlabel('Time (frames)'); ylabel('Cell number'); title('Concordant')
subplot(143)
imagesc(z.offset, C)
xlabel('Time (frames)'); ylabel('Cell number'); title('Offset')
subplot(144)
imagesc(z.disc, C)
xlabel('Time (frames)'); ylabel('Cell number'); title('Discordant')
colormap(cmap)


%%






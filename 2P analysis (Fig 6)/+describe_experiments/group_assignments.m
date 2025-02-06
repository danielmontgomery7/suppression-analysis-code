function info = group_assignments(mouse, session)
% input mouse name and recording session (e.g. 'DM321_Baseline)
% output 


% inputs = strsplit(string(mouse), ["_", " "]);
% mouse = inputs{1};
% session = inputs{2};


%% Assign mice to experiments

% L23_SRP.mice = ["DM864", "DM865"];
% L5_SRP.mice = ["DM783", "DM784", "DM785", "DM787", "DM788", "DM789" "DM791", "DM849", "DM879", "DM880", "DM882"]; % DM792 not on analysis computer
% L6_SRP.mice = ["DM806", "DM807", "DM809", "DM858"]; % "DM768", "DM769", "DM772", "DM775" had different parameters
% L6_KO_SRP.mice = ["DM853", "DM873", "DM874", "DM875", "DM876"];

% IOS.mice = ["DM877", "DM883", "DM884", "DM885", "DM940", "DM941", "DM947", ...
%     "DM950", "DM951", "DM952", "DM953", "DM954", "DM968", "DM969", "DM970", "DM972", "DM974"];

IOS.mice = ["DM950", "DM951", "DM952", "DM953", "DM954", "DM968", "DM969", "DM970", "DM972", "DM974", ...
    "DM996", "DM997", "DM999", "DM1000", "DM1001"];

PV_IOS.mice = ["DM861", "DM862", "DM959", "DM960"];

SOM_IOS.mice = ["DM866", "DM868", "DM942", "DM943", "DM945"];

PV_TTX.mice = ["DM859", "DM862", "DM863"];

L23_OD.mice = ["DM941", "DM947", "DM951", "DM953", "DM968", "DM969", "DM970", "DM972", "DM974"];

    
%% Get info about individual experiments

% % if ismember(mouse, L6_SRP.mice) && contains(session, "SRP")
% %     info = describe_experiments.L6_SRP_info(recording_session);
% % end
% %     
% % if ismember(mouse, L6_KO_SRP.mice) && contains(session, "SRP")
% %     info = describe_experiments.L6_KO_SRP_info(recording_session);
% % end
% %     
% % if ismember(mouse, L5_SRP.mice) && contains(session, "SRP")
% %     info = describe_experiments.L5_SRP_info(recording_session);
% % end
% %     
% % if ismember(mouse, L23_SRP.mice) && contains(session, "SRP")
% %     info = describe_experiments.L23_SRP_info(recording_session);
% % end
    
% if ismember(mouse, PV_TTX.mice) && contains(session, "SRP") 
%     info = describe_experiments.PV_TTX_info(mouse, session);
% end
    
if ismember(mouse, IOS.mice) && contains(session, "IOS") 
    info = describe_experiments.IOS_info(mouse, session);
end
    
if ismember(mouse, PV_IOS.mice) && contains(session, "IOS") 
    info = describe_experiments.PV_IOS_info(mouse, session);
elseif ismember(mouse, PV_TTX.mice) 
    info = describe_experiments.PV_TTX_info(mouse, session);
end
    
if ismember(mouse, SOM_IOS.mice) && contains(session, "IOS") 
    info = describe_experiments.SOM_IOS_info(mouse, session);
end
    
if ismember(mouse, L23_OD.mice) && contains(session, "OD") 
    info = describe_experiments.L23_OD_info(mouse, session);
end



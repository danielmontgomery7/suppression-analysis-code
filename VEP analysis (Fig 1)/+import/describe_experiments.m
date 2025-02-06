function info = describe_experiments(varargin)

    % specify important info for experiments
    info = struct();
    info.nblocks_per_stim = 1;
    info.npresentations = 75;
    info.toffset = 150; % the TTL pulse seems to precede stimulus onset by 100-200msec on the omniplex rig
    
    
     % describe experiment name
     if nargin == 0
 %        experiment = {'MD_ramps'};
%         experiment = {'Monoc_Binoc_ramps'};
%         experiment = {'Naive_ramps'};
%         experiment = {'Orientation_ramps'};
         experiment = {'SRP_experiment'};
%         experiment = {'SRP_training'};
%         experiment = {'High_spatial_freq_ramps'};
%         experiment = {'Monoc_conc_disc'};
%        experiment = {'P21_MD_ramps'};
%        experiment = {'Phase_offset_ramps'};
 %       experiment = {'TPOT'};
 %       experiment = {'TPOT_training'};
     else
         experiment = varargin{1};
     end
    
    
    sessions = containers.Map();
        sessions('MD_ramps') = {'nRamp1conc', 'nRamp2disc'};
%         sessions('MD_ramps') = {'IPSItest'}; % FOR IPSI VEPS
        sessions('Monoc_Binoc_ramps') = {'Monoc', 'Binoc'};
        sessions('Naive_ramps') = {'nRamp1conc', 'nRamp2disc'};
        sessions('Orientation_ramps') = {'OrientationRamp'};
        sessions('SRP_experiment') = {'testREfam', 'testREnov'};
%        sessions('SRP_training') = {'SRPd1', 'SRPd2', 'SRPd3', 'SRPd4'};
        sessions('High_spatial_freq_ramps') = {'DiscRamp020', 'DiscRamp040'};
        sessions('Monoc_conc_disc') = {'MonocConcDisc1'};
%        sessions('P21_MD_ramps') = {'nRamp1conc', 'nRamp2disc'};
        sessions('P21_MD_Ipsi_VEPs') = {'IPSItest'};
        sessions('P21_MD_TTX_ramps') = {'nRamp3conc', 'nRamp4disc'};
    %     sessions('TPOT') = {'BaselineLE', 'BaselineRE'}; % Baseline
        sessions('TPOT') = {'LEtestday', 'REtestday'}; % Testing
  %      sessions('TPOT_training') = {'TPOTd1', 'TPOTd2', 'TPOTd3', 'TPOTd4', 'TPOTd5'}; % Training
        sessions('Contrast_tuning') = {'ContrastTuning'};
 %       sessions('SRP_testing') = {'Baseline', 'Testing'};
        sessions('MD_acuity_ramps') = {'DiscRamp005', 'DiscRamp020', 'DiscRamp040'};
        sessions('MD_TTX_contrast_tuning') = {'ContrastTuningRec1', 'ContrastTuningRec2', 'ContrastTuningRec3', 'ContrastTuningRec4'};
        sessions('Phase_offset_ramps') = {'InPhaseConc', 'OutPhaseConc'};
        sessions('MD_acuity_ramps_flipped') = {'flipDiscRamp005', 'flipDiscRamp020', 'flipDiscRamp040'};
        
    
    groups = containers.Map();
        groups('MD_ramps') = {'MD', 'Sham'};
        groups('Monoc_Binoc_ramps') = {'None'};
        groups('Naive_ramps') = {'None'};
        groups('Orientation_ramps') = {'None'};
 %        groups('SRP_experiment') = {'Monoc', 'BinocDisc'};
        groups('SRP_experiment') = {'Monoc', 'BinocDisc', 'OccluderLE', 'BlackLE'};
%        groups('SRP_training') = {'Monoc', 'BinocDisc', 'OccluderLE', 'BlackLE'};
        groups('High_spatial_freq_ramps') = {'None'};
        groups('Monoc_conc_disc') = {'MD', 'Sham'};
        groups('P21_MD_ramps') = {'MD', 'Sham'};
        groups('P21_MD_Ipsi_VEPs') = {'MD', 'Sham'};
        groups('P21_MD_TTX_ramps') = {'MD_TTX', 'MD_Saline', 'Sham_TTX', 'Sham_Saline'};
        groups('TPOT') = {'MD_SRP', 'Sham_SRP', 'MD_TPOT', 'Sham_TPOT'};
 %       groups('TPOT_training') = {'MD_SRP', 'Sham_SRP', 'MD_TPOT', 'Sham_TPOT'};
        groups('Contrast_tuning') = {'None'};
        groups('SRP_testing') = {'None'};
        groups('MD_acuity_ramps') = {'MD', 'Sham'};
        groups('MD_TTX_contrast_tuning') = {'MD', 'Sham'};
        groups('Phase_offset_ramps') = {'MD', 'Sham'};
        groups('MD_acuity_ramps_flipped') = {'MD', 'Sham'};
        
    stims = containers.Map();
        stims('MD_ramps') = {'Con0', 'Con10', 'Con20', 'Con30', 'Con40', 'Con50'};
%         stims('MD_ramps') = {'Ipsi_VEP', 'ramp1', 'ramp2', 'ramp3', 'ramp4', 'ramp5'}; % FOR IPSI VEPS
%         stims('MD_ramps') = {'Ipsi_VEP'}; % FOR IPSI VEPS
        stims('Monoc_Binoc_ramps') = {'Con0', 'Con10', 'Con20', 'Con30', 'Con40', 'Con50'};
        stims('Naive_ramps') = {'Con0', 'Con10', 'Con20', 'Con30', 'Con40', 'Con50'};
        stims('Orientation_ramps') = {'deg0', 'deg5', 'deg10', 'deg15', 'deg20', 'deg25', 'deg30', 'deg90'};
        stims('SRP_experiment') = {'Stim'};
 %       stims('SRP_training') = {'Stim'};
        stims('High_spatial_freq_ramps') = {'Con0', 'Con10', 'Con20', 'ConLH30', 'Con40', 'Con50'};
        stims('Monoc_conc_disc') = {'Monoc50', 'Conc50', 'Disc50', 'Monoc100', 'Conc100', 'Disc100'};
        stims('P21_MD_ramps') = {'Con0', 'Con10', 'Con20', 'Con30', 'Con40', 'Con50'};
        stims('P21_MD_Ipsi_VEPs') = {'Ipsi_VEP'};
        stims('P21_MD_TTX_ramps') = {'Con0', 'Con10', 'Con20', 'Con30', 'Con40', 'Con50'};
         stims('TPOT') = {'cpd005', 'cpd02', 'cpd04'}; % Baseline
   %     stims('TPOT_training') = {'cpd005', 'cpd02', 'cpd04'}; % Training
   %     stims('TPOT') = {'Fam_005cpd', 'Fam_02cpd', 'Fam_04cpd', 'Nov_005cpd', 'Nov_02cpd', 'Nov_04cpd'}; % Testing
        stims('Contrast_tuning') = {'L_05cpd_c1', 'L_05cpd_c2', 'L_05cpd_c3', 'L_05cpd_c4', 'L_2cpd_c1', 'L_2cpd_c2', ...
            'L_2cpd_c3', 'L_2cpd_c4', 'L_4cpd_c1', 'L_4cpd_c2', 'L_4cpd_c3', 'L_4cpd_c4',...
            'R_05cpd_c1', 'R_05cpd_c2', 'R_05cpd_c3', 'R_05cpd_c4', 'R_2cpd_c1', 'R_2cpd_c2', ...
            'R_2cpd_c3', 'R_2cpd_c4', 'R_4cpd_c1', 'R_4cpd_c2', 'R_4cpd_c3', 'R_4cpd_c4'};
        stims('SRP_testing') = {'deg15', 'deg15', 'deg45', 'deg45', 'deg75', 'deg75', ...
            'deg105', 'deg105', 'deg135', 'deg135', 'deg165', 'deg165'}; % Baseline
        stims('MD_acuity_ramps') = {'Con0', 'Con10', 'Con20', 'Con50'};
        stims('MD_TTX_contrast_tuning') = {'Con6_005_LE', 'Con12_005_LE', 'Con25_005_LE', 'Con50_005_LE', ...
            'Con6_02_LE', 'Con12_02_LE', 'Con25_02_LE', 'Con50_02_LE',...
            'Con6_04_LE', 'Con12_04_LE', 'Con25_04_LE', 'Con50_04_LE',...
            'Con6_005_RE', 'Con12_005_RE', 'Con25_005_RE', 'Con50_005_RE', ...
            'Con6_02_RE', 'Con12_02_RE', 'Con25_02_RE', 'Con50_02_RE',...
            'Con6_04_RE', 'Con12_04_RE', 'Con25_04_RE', 'Con50_04_RE'};
        stims('Phase_offset_ramps') = {'Con0', 'Con10', 'Con20', 'Con30', 'Con40', 'Con50'};
        stims('MD_acuity_ramps_flipped') = {'Con0', 'Con10', 'Con20', 'Con50'};        
    
    stim_ids = containers.Map();
        stim_ids('MD_ramps') = [8203, 8213, 8223, 8233, 8243, 8253]; % (TTLS 10-60)
%         stim_ids('MD_ramps') =  [8203, 8213, 8223, 8233, 8243, 8253]; % (TTLs 1, 10-60) FOR IPSI VEPS
%         stim_ids('MD_ramps') =  8193; % (TTLs 1, 10-60) FOR IPSI VEPS
        stim_ids('Monoc_Binoc_ramps') = 8193:8198; % (TTLS 1-6)
        stim_ids('Naive_ramps') = [8203, 8213, 8223, 8233, 8243, 8253]; % (TTLS 10-60)
        stim_ids('Orientation_ramps') = 8203:10:8273; % (TTLS 1-8)
        stim_ids('SRP_experiment') = 8193; %  (TTL 1)
 %       stim_ids('SRP_training') = 8193; %  (TTL 1)
        stim_ids('High_spatial_freq_ramps') = 8193:8198; % (TTLS 1-6)
        stim_ids('Monoc_conc_disc') = 8193:8198; % (TTLS 1-6)
        stim_ids('P21_MD_ramps') = 8193:8198; % (TTLS 1-6)
        stim_ids('P21_MD_Ipsi_VEPs') =  8203; % (TTLs 10) FOR IPSI VEPS
        stim_ids('P21_MD_TTX_ramps') = 8193:8198; % (TTLS 1-6)
         stim_ids('TPOT') = 8193:8195; % (TTLS 1-3) Baseline
 %       stim_ids('TPOT_training') = 8193:8195; % (TTLS 1-3) Training
 %       stim_ids('TPOT') = 8193:8198; % (TTLS 1-6) Testing
        stim_ids('Contrast_tuning') = 8193:8216; % (TTLS 1-24)
        stim_ids('SRP_testing') = 8193:8204; % (TTLS 1-12)
        stim_ids('MD_acuity_ramps') = [8193, 8194, 8195, 8196]; %
%         stim_ids('MD_acuity_ramps') = [8203, 8213, 8223, 8233]; % (TTLS 10-60) Banana 
        stim_ids('MD_TTX_contrast_tuning') = 8193:8216; % (TTLS 1-24)
        stim_ids('Phase_offset_ramps') = 8203:8208; % (TTLS 1-6)
%         stim_ids('Phase_offset_ramps') = 8203:10:8253; % (TTLS 10-60) % for Halibut (wrong ttls) 
        stim_ids('MD_acuity_ramps_flipped') = [8257, 8258, 8259, 8260]; %    
        
        
        
    info.experiment = experiment;
    info.sessions = sessions(info.experiment{:});
    info.groups = groups(info.experiment{:});
    info.stims = stims(info.experiment{:});
    info.stim_ids = stim_ids(info.experiment{:});
    
    

        
end
function output = update_data_assignments(rampData)

    % create "dictionary" to hold information in
    dict_exp = containers.Map(); % for experiments
    dict_group = containers.Map(); % for groups each mouse is placed in

    % assign Lemon to experiments and groups
    for num = 53:62
        dict_exp(['Lemon', num2str(num)]) = 'MD_ramps';
    end
    
        dict_group('Lemon53') = 'None';
        dict_group('Lemon54') = 'Sham';
        dict_group('Lemon55') = 'MD';
        dict_group('Lemon56') = 'None';
        dict_group('Lemon57') = 'MD';
        dict_group('Lemon58') = 'Sham';
        dict_group('Lemon59') = 'None';
        dict_group('Lemon60') = 'Sham';
        dict_group('Lemon61') = 'MD';
        dict_group('Lemon62') = 'Sham';
        


     % assign Melon to experiments
    for num = [61 63 65 67 68]
        dict_exp(['Melon', num2str(num)]) = 'MD_ramps';
        dict_group(['Melon', num2str(num)]) = 'MD';
    end
    
    for num = [62 64 66 69 70 71 72]
        dict_exp(['Melon', num2str(num)]) = 'MD_ramps';
        dict_group(['Melon', num2str(num)]) = 'Sham';
    end
    
     % assign Olive to experiments
    for num = 79:88
        dict_exp(['Olive', num2str(num)]) = 'MD_ramps';
    end
        dict_group('Olive79') = 'Sham';
        dict_group('Olive80') = 'MD';
        dict_group('Olive81') = 'Sham';
        dict_group('Olive82') = 'MD';
        dict_group('Olive83') = 'MD';
        dict_group('Olive84') = 'MD';
        dict_group('Olive85') = 'Sham';
        dict_group('Olive86') = 'MD';
        dict_group('Olive87') = 'Sham';
        dict_group('Olive88') = 'Sham';
    
     % assign Ramen to experiments
    for num = 9:18
        dict_exp(['Ramen', num2str(num)]) = 'MD_ramps';
    end     
        dict_group('Ramen9') = 'MD';
        dict_group('Ramen10') = 'Sham';
        dict_group('Ramen11') = 'MD';
        dict_group('Ramen12') = 'Sham';
        dict_group('Ramen13') = 'MD';
        dict_group('Ramen14') = 'Sham';
        dict_group('Ramen15') = 'MD';
        dict_group('Ramen16') = 'Sham';
        dict_group('Ramen17') = 'MD';
        dict_group('Ramen18') = 'Sham';
    
     % assign Xigua to experiments
 %   for num = 54:63
%        dict_exp(['Xigua', num2str(num)]) = 'MD_ramps';
 %   end     
 %       dict_group('Xigua54') = 'None';
 %       dict_group('Xigua55') = 'None';
 %       dict_group('Xigua56') = 'None';
 %       dict_group('Xigua57') = 'Sham';
 %       dict_group('Xigua58') = 'Sham';
 %       dict_group('Xigua59') = 'MD';
 %       dict_group('Xigua60') = 'MD';
 %       dict_group('Xigua61') = 'Sham';
%        dict_group('Xigua62') = 'Sham';
%        dict_group('Xigua63') = 'Sham';
    
     % assign Banana to experiments
    for num = 11:20
        dict_exp(['Banana', num2str(num)]) = 'MD_acuity_ramps';
    end     
        dict_group('Banana11') = 'Sham';
        dict_group('Banana12') = 'None';
        dict_group('Banana13') = 'Sham';
        dict_group('Banana14') = 'None';
        dict_group('Banana15') = 'None';
        dict_group('Banana16') = 'MD';
        dict_group('Banana17') = 'None';
        dict_group('Banana18') = 'MD';
        dict_group('Banana19') = 'Sham';
        dict_group('Banana20') = 'None';

    
     % assign Jujube to experiments
    for num = 83:92
        dict_exp(['Jujube', num2str(num)]) = 'P28_MD_acuity_ramps'; %%%%%
    end     
        dict_group('Jujube83') = 'MD';
        dict_group('Jujube84') = 'Sham';
        dict_group('Jujube85') = 'MD';
        dict_group('Jujube86') = 'Sham';
        dict_group('Jujube87') = 'MD';
        dict_group('Jujube88') = 'Sham';
        dict_group('Jujube89') = 'MD';
        dict_group('Jujube90') = 'Sham';
        dict_group('Jujube91') = 'MD';
        dict_group('Jujube92') = 'Sham';

    
     % assign Velvet to experiments
    for num = 11:20
        dict_exp(['Velvet', num2str(num)]) = 'MD_acuity_ramps';
    end     
        dict_group('Velvet11') = 'MD';
        dict_group('Velvet12') = 'Sham';
        dict_group('Velvet13') = 'MD';
        dict_group('Velvet14') = 'Sham';
        dict_group('Velvet15') = 'MD';
        dict_group('Velvet16') = 'Sham';
        dict_group('Velvet17') = 'MD';
        dict_group('Velvet18') = 'Sham';
        dict_group('Velvet19') = 'MD';
        dict_group('Velvet20') = 'Sham';

    
     % assign Waffle to experiments
    for num = 21:30
        dict_exp(['Waffle', num2str(num)]) = 'MD_acuity_ramps';
    end     
        dict_group('Waffle21') = 'Sham';
        dict_group('Waffle22') = 'MD';
        dict_group('Waffle23') = 'Sham';
        dict_group('Waffle24') = 'MD';
        dict_group('Waffle25') = 'Sham';
        dict_group('Waffle26') = 'MD';
        dict_group('Waffle27') = 'Sham';
        dict_group('Waffle28') = 'MD';
        dict_group('Waffle29') = 'Sham';
        dict_group('Waffle30') = 'MD';

    
     % assign Xavier to experiments
    for num = 41:49
        dict_exp(['Xavier', num2str(num)]) = 'MD_acuity_ramps';
    end     
        dict_group('Xavier41') = 'Sham';
        dict_group('Xavier42') = 'MD';
        dict_group('Xavier43') = 'Sham';
        dict_group('Xavier44') = 'MD';
        dict_group('Xavier45') = 'Sham';
        dict_group('Xavier46') = 'MD';
        dict_group('Xavier47') = 'Sham';
        dict_group('Xavier48') = 'MD';
        dict_group('Xavier49') = 'MD';

    
     % assign Zagnut to experiments
    for num = 50:59
        dict_exp(['Zagnut', num2str(num)]) = 'MD_acuity_ramps';
    end     
        dict_group('Zagnut50') = 'MD';
        dict_group('Zagnut51') = 'Sham';
        dict_group('Zagnut52') = 'MD';
        dict_group('Zagnut53') = 'Sham';
        dict_group('Zagnut54') = 'MD';
        dict_group('Zagnut55') = 'Sham';
        dict_group('Zagnut56') = 'MD';
        dict_group('Zagnut57') = 'Sham';
        dict_group('Zagnut58') = 'MD';
        dict_group('Zagnut59') = 'MD';
    


%% 
        
%      % assign Kitkat to experiments and groups
%    for num = 5:8
%        dict_exp(['Kitkat', num2str(num)]) = 'P21_MD_ramps';
% %         dict_exp(['Kitkat', num2str(num)]) = 'P21_MD_Ipsi_VEPs';
%        dict_group(['Kitkat', num2str(num)]) = 'MD';
%    end     
%     
% %       assign Mussel to experiments and groups
%     for num = 19:28
%         dict_exp(['Mussel', num2str(num)]) = 'P21_MD_ramps';
% %          dict_exp(['Mussel', num2str(num)]) = 'P21_MD_Ipsi_VEPs';
%         dict_group(['Mussel', num2str(num)]) = 'MD';
%     end     
%     dict_group('Mussel19') = 'Sham';
%     dict_group('Mussel21') = 'Sham';
%     dict_group('Mussel24') = 'Sham';
%     dict_group('Mussel26') = 'Sham';
%     dict_group('Mussel28') = 'Sham';
%     
% %       assign Orange to experiments and groups
%     for num = 39:47
%         dict_exp(['Orange', num2str(num)]) = 'P21_MD_ramps';
% %          dict_exp(['Orange', num2str(num)]) = 'P21_MD_Ipsi_VEPs';
%         dict_group(['Orange', num2str(num)]) = 'MD';
%     end     
%     dict_group('Orange40') = 'Sham';
%     dict_group('Orange45') = 'Sham';
%     
% %       assign Salmon to experiments and groups
%     for num = 78:86
%         dict_exp(['Salmon', num2str(num)]) = 'P21_MD_ramps';
% %          dict_exp(['Salmon', num2str(num)]) = 'P21_MD_Ipsi_VEPs';
%         dict_group(['Salmon', num2str(num)]) = 'MD';
%     end     
%     dict_group('Salmon79') = 'Sham';
%     dict_group('Salmon81') = 'Sham';
%     dict_group('Salmon83') = 'Sham';
%     dict_group('Salmon85') = 'Sham';
%     
% %       assign Turkey to experiments and groups
%     for num = 87:96
%         dict_exp(['Turkey', num2str(num)]) = 'P21_MD_ramps';
% %          dict_exp(['Turkey', num2str(num)]) = 'P21_MD_Ipsi_VEPs';
%         dict_group(['Turkey', num2str(num)]) = 'MD';
%     end     
%     dict_group('Turkey87') = 'Sham';
%     dict_group('Turkey89') = 'Sham';
%     dict_group('Turkey91') = 'Sham';
%     dict_group('Turkey93') = 'Sham';
%     dict_group('Turkey95') = 'Sham';
    
    
    
    
        
      % assign Kitkat to experiments and groups
    for num = 5:8
        dict_exp(['Kitkat', num2str(num)]) = 'P21_MD_TTX_ramps';
        dict_group(['Kitkat', num2str(num)]) = 'MD';
    end     
    dict_group('Kitkat5') = 'Sham';
     
%        assign Mussel to experiments and groups
     for num = 19:28
         dict_exp(['Mussel', num2str(num)]) = 'P21_MD_TTX_ramps';
         dict_group(['Mussel', num2str(num)]) = 'None';
     end     
     dict_group('Mussel19') = 'Sham_Saline';
     dict_group('Mussel22') = 'MD_TTX';
     dict_group('Mussel23') = 'MD_Saline';
     dict_group('Mussel24') = 'Sham_Saline';
     dict_group('Mussel25') = 'MD_TTX';
     dict_group('Mussel27') = 'MD_Saline';
     dict_group('Mussel28') = 'Sham_TTX';
%     
%        assign Orange to experiments and groups
     for num = 39:47
         dict_exp(['Orange', num2str(num)]) = 'P21_MD_TTX_ramps';
     end     
     dict_group('Orange39') = 'MD_Saline';
     dict_group('Orange40') = 'Sham_TTX';
     dict_group('Orange41') = 'MD_TTX';
     dict_group('Orange42') = 'MD_Saline';     
     dict_group('Orange43') = 'MD_Saline';
     dict_group('Orange44') = 'MD_TTX';
     dict_group('Orange45') = 'Sham_Saline';
     dict_group('Orange46') = 'MD_TTX';
     dict_group('Orange47') = 'MD_TTX';
     
%        assign Salmon to experiments and groups
     for num = 78:86
         dict_exp(['Salmon', num2str(num)]) = 'P21_MD_TTX_ramps';
     end     
     dict_group('Salmon78') = 'MD_TTX';
     dict_group('Salmon79') = 'Sham_TTX';
     dict_group('Salmon80') = 'MD_TTX';
     dict_group('Salmon81') = 'Sham_TTX';
     dict_group('Salmon82') = 'MD_TTX';
     dict_group('Salmon83') = 'Sham_TTX';
     dict_group('Salmon84') = 'MD_TTX';
     dict_group('Salmon85') = 'Sham_TTX';
     dict_group('Salmon86') = 'MD_TTX';
     
     
     
%        assign Turkey to experiments and groups
     for num = 87:96
       dict_exp(['Turkey', num2str(num)]) = 'P21_MD_TTX_ramps';
     end     
     dict_group('Turkey87') = 'Sham_TTX';
     dict_group('Turkey88') = 'MD_TTX';
     dict_group('Turkey89') = 'Sham_TTX';
     dict_group('Turkey90') = 'MD_TTX';
     dict_group('Turkey91') = 'Sham_TTX';
     dict_group('Turkey92') = 'MD_TTX';
     dict_group('Turkey93') = 'Sham_TTX';
     dict_group('Turkey94') = 'MD_TTX';
     dict_group('Turkey95') = 'Sham_TTX';
     dict_group('Turkey96') = 'MD_TTX';
    
    
    
    
 %%   
        
        
     % assign Quail to experiments and groups
    for num = 1:8
        dict_exp(['Quail0', num2str(num)]) = 'Monoc_Binoc_ramps';
        dict_group(['Quail0', num2str(num)]) = 'None';
    end     

     % assign Sushi to experiments and groups
    for num = 19:25
        dict_exp(['Sushi', num2str(num)]) = 'Monoc_Binoc_ramps';
        dict_group(['Sushi', num2str(num)]) = 'None';
    end     

     % assign Trout to experiments and groups
    for num = 26:32
        dict_exp(['Trout', num2str(num)]) = 'Monoc_Binoc_ramps';
        dict_group(['Trout', num2str(num)]) = 'None';
    end        

     % assign Lentil to experiments and groups
    for num = 9:18
        dict_exp(['Lentil', num2str(num)]) = 'Monoc_Binoc_ramps';
        dict_group(['Lentil', num2str(num)]) = 'None';
    end        

     % assign Nutmeg to experiments and groups
    for num = 29:38
        dict_exp(['Nutmeg', num2str(num)]) = 'Monoc_Binoc_ramps';
        dict_group(['Nutmeg', num2str(num)]) = 'None';
    end        
    
    
    
     % assign Bacon to experiments and groups
    for num = 72:75
        dict_exp(['Bacon', num2str(num)]) = 'Naive_ramps';
        dict_group(['Bacon', num2str(num)]) = 'None';
    end     

     % assign Chili to experiments and groups
    for num = 76:82
        dict_exp(['Chili', num2str(num)]) = 'Naive_ramps';
        dict_group(['Chili', num2str(num)]) = 'None';
    end     

     % assign Hazel to experiments and groups
    for num = 15:22
        dict_exp(['Hazel', num2str(num)]) = 'Naive_ramps';
        dict_group(['Hazel', num2str(num)]) = 'None';
    end     

       % assign Umeboshi to experiments and groups
    for num = 21:23
        dict_exp(['Umeboshi', num2str(num)]) = 'Naive_ramps';
        dict_group(['Umeboshi', num2str(num)]) = 'None';
    end       

       % assign Xidoufen to experiments and groups
    for num = 33:39
        dict_exp(['Xidoufen', num2str(num)]) = 'Naive_ramps';
        dict_group(['Xidoufen', num2str(num)]) = 'None';
    end           

     % assign Umami to experiments and groups
    for num = 33:41
        dict_exp(['Umami', num2str(num)]) = 'Orientation_ramps';
        dict_group(['Umami', num2str(num)]) = 'None';
    end     
    
     % assign Vodka to experiments and groups
    for num = 42:51
        dict_exp(['Vodka', num2str(num)]) = 'Orientation_ramps';
        dict_group(['Vodka', num2str(num)]) = 'None';
    end     
        
    
    %%
     % assign Flank to experiments and groups
    for num = 1:7
        dict_exp(['Flank', num2str(num)]) = 'SRP_experiment';
      %  dict_exp(['Flank', num2str(num)]) = 'SRP_training';
    end     
        dict_group('Flank1') = 'BinocDisc';
        dict_group('Flank2') = 'Monoc';
        dict_group('Flank3') = 'BinocDisc';
        dict_group('Flank4') = 'Monoc';
        dict_group('Flank5') = 'BinocDisc';
        dict_group('Flank6') = 'Monoc';
        dict_group('Flank7') = 'BinocDisc';
    
     % assign Grape to experiments and groups
    for num = 8:14
        dict_exp(['Grape', num2str(num)]) = 'SRP_experiment';
   %      dict_exp(['Grape', num2str(num)]) = 'SRP_training';
    end     
        dict_group('Grape8') = 'BinocDisc';
        dict_group('Grape9') = 'Monoc';
        dict_group('Grape10') = 'BinocDisc';
        dict_group('Grape11') = 'Monoc';
        dict_group('Grape12') = 'BinocDisc';
        dict_group('Grape13') = 'Monoc';
        dict_group('Grape14') = 'Monoc';
    
     % assign Jello to experiments and groups
    for num = 37:44
        dict_exp(['Jello', num2str(num)]) = 'SRP_experiment';
     %    dict_exp(['Jello', num2str(num)]) = 'SRP_training';
    end     
        dict_group('Jello37') = 'Monoc';
        dict_group('Jello38') = 'BinocDisc';
        dict_group('Jello39') = 'OccluderLE';
        dict_group('Jello40') = 'OccluderLE';
        dict_group('Jello41') = 'Monoc';
        dict_group('Jello42') = 'BinocDisc';
        dict_group('Jello43') = 'OccluderLE';
        dict_group('Jello44') = 'OccluderLE';
    
     % assign Nacho to experiments and groups
    for num = 71:78
        dict_exp(['Nacho', num2str(num)]) = 'SRP_experiment';
     %    dict_exp(['Nacho', num2str(num)]) = 'SRP_training';
    end     
        dict_group('Nacho71') = 'BlackLE';
        dict_group('Nacho73') = 'Monoc';
        dict_group('Nacho74') = 'BinocDisc';
        dict_group('Nacho75') = 'BlackLE';
        dict_group('Nacho76') = 'BlackLE';
        dict_group('Nacho77') = 'Monoc';
        dict_group('Nacho78') = 'BlackLE';
    
     % assign Pizza to experiments and groups
    for num = 89:96
        dict_exp(['Pizza', num2str(num)]) = 'SRP_experiment';
    %     dict_exp(['Pizza', num2str(num)]) = 'SRP_training';
    end     
        dict_group('Pizza89') = 'BlackLE';
        dict_group('Pizza90') = 'BlackLE';
        dict_group('Pizza91') = 'Monoc';
        dict_group('Pizza92') = 'BinocDisc';
        dict_group('Pizza93') = 'BlackLE';
        dict_group('Pizza94') = 'BlackLE';
        dict_group('Pizza95') = 'Monoc';
        dict_group('Pizza96') = 'BinocDisc';
    
     % assign Danish to experiments and groups
    for num = 26:35
        dict_exp(['Danish', num2str(num)]) = 'SRP_experiment';
    %     dict_exp(['Danish', num2str(num)]) = 'SRP_training';
    end     
        dict_group('Danish26') = 'BinocDisc';
        dict_group('Danish27') = 'BlackLE';
        dict_group('Danish28') = 'Monoc';
        dict_group('Danish29') = 'BinocDisc';
        dict_group('Danish30') = 'BlackLE';
        dict_group('Danish31') = 'BlackLE';
        dict_group('Danish32') = 'Monoc';
        dict_group('Danish33') = 'BinocDisc';
        dict_group('Danish34') = 'BlackLE';
        dict_group('Danish35') = 'Monoc';
        
        
        
%%
     % assign Almond to experiments and groups
    for num = 1:10
        dict_exp(['Almond0', num2str(num)]) = 'High_spatial_freq_ramps';
        dict_group(['Almond0', num2str(num)]) = 'None';
    end     
        
     % assign Hummus to experiments and groups
    for num = 62:70
        dict_exp(['Hummus', num2str(num)]) = 'High_spatial_freq_ramps';
        dict_group(['Hummus', num2str(num)]) = 'None';
    end     
        
     % assign Raisin to experiments and groups
    for num = 68:77
        dict_exp(['Raisin', num2str(num)]) = 'High_spatial_freq_ramps';
        dict_group(['Raisin', num2str(num)]) = 'None';
    end     
    
        
        
     % assign Eclair to experiments and groups
    for num = 36:42
        dict_exp(['Eclair', num2str(num)]) = 'Monoc_conc_disc';
        dict_group(['Eclair', num2str(num)]) = 'Sham';
    end     
        
     % assign Fajita to experiments and groups
    for num = 43:51
        dict_exp(['Fajita', num2str(num)]) = 'Monoc_conc_disc';
        dict_group(['Fajita', num2str(num)]) = 'Sham';
    end     
        dict_group('Fajita46') = 'MD';
        dict_group('Fajita51') = 'MD';
        
     % assign Ginger to experiments and groups
    for num = 52:60
        dict_exp(['Ginger', num2str(num)]) = 'Monoc_conc_disc';
        dict_group(['Ginger', num2str(num)]) = 'Sham';
    end     
        dict_group('Ginger52') = 'MD';
        dict_group('Ginger54') = 'MD';
        dict_group('Ginger57') = 'MD';
        dict_group('Ginger59') = 'MD';

    
        
    
    
     % assign Idaho to experiments and groups
    for num = 23:36
        dict_exp(['Idaho', num2str(num)]) = 'Naive_ramps';
%         dict_exp(['Idaho', num2str(num)]) = 'Reverse_ramps';
        dict_group(['Idaho', num2str(num)]) = 'None';
    end     
    
     % assign Wheat to experiments and groups
    for num = 47:53
        dict_exp(['Wheat', num2str(num)]) = 'Naive_ramps';
%         dict_exp(['Wheat', num2str(num)]) = 'Reverse_ramps';
        dict_group(['Wheat', num2str(num)]) = 'None';
    end     
    

    
     % assign Quinoa to experiments and groups
    for num = [58:63, 65:67]
         dict_exp(['Quinoa', num2str(num)]) = 'TPOT';
%       dict_exp(['Quinoa', num2str(num)]) = 'TPOT_training';
    end     
        dict_group('Quinoa58') = 'MD_SRP';
        dict_group('Quinoa59') = 'Sham_TPOT';
        dict_group('Quinoa60') = 'MD_TPOT';
        dict_group('Quinoa61') = 'Sham_SRP';
        dict_group('Quinoa62') = 'MD_SRP';
        dict_group('Quinoa63') = 'Sham_TPOT';
 %       dict_group('Quinoa64') = '';
        dict_group('Quinoa65') = 'Sham_SRP';
        dict_group('Quinoa66') = 'MD_TPOT';
        dict_group('Quinoa67') = 'Sham_TPOT';
    
     % assign Potato to experiments and groups
    for num = 48:57
         dict_exp(['Potato', num2str(num)]) = 'TPOT';
%       dict_exp(['Potato', num2str(num)]) = 'TPOT_training';
    end     
        dict_group('Potato48') = 'MD_TPOT';
        dict_group('Potato49') = 'Sham_SRP';
        dict_group('Potato50') = 'MD_SRP';
        dict_group('Potato51') = 'Sham_TPOT';
        dict_group('Potato52') = 'MD_SRP';
        dict_group('Potato53') = 'Sham_SRP';
        dict_group('Potato54') = 'MD_TPOT';
        dict_group('Potato55') = 'Sham_SRP';
        dict_group('Potato56') = 'MD_TPOT';
        dict_group('Potato57') = 'Sham_TPOT';
    
     % assign Urchin to experiments and groups
    for num = 1:9
         dict_exp(['Urchin0', num2str(num)]) = 'TPOT';
%        dict_exp(['Urchin0', num2str(num)]) = 'TPOT_training';
    end     
         dict_exp('Urchin10') = 'TPOT';
   %     dict_exp('Urchin10') = 'TPOT_training';
        dict_group('Urchin01') = 'MD_SRP';
        dict_group('Urchin02') = 'Sham_SRP';
        dict_group('Urchin03') = 'MD_TPOT';
        dict_group('Urchin04') = 'Sham_TPOT';
        dict_group('Urchin05') = 'MD_SRP';
        dict_group('Urchin06') = 'MD_TPOT';
        dict_group('Urchin07') = 'Sham_TPOT';
        dict_group('Urchin08') = 'MD_SRP';
        dict_group('Urchin09') = 'Sham_SRP';
        dict_group('Urchin10') = 'MD_TPOT';
    
     % assign Yogurt to experiments and groups
    for num = [31:36, 39:40]
%        dict_exp(['Yogurt', num2str(num)]) = 'TPOT_training';
        dict_exp(['Yogurt', num2str(num)]) = 'TPOT';

    end     
        dict_group('Yogurt31') = 'MD_SRP';
        dict_group('Yogurt32') = 'Sham_TPOT';
        dict_group('Yogurt33') = 'MD_SRP';
        dict_group('Yogurt34') = 'Sham_SRP';
        dict_group('Yogurt35') = 'MD_TPOT';
        dict_group('Yogurt36') = 'MD_TPOT';
%         dict_group('Yogurt37') = '';
%         dict_group('Yogurt38') = '';
        dict_group('Yogurt39') = 'Sham_TPOT';
        dict_group('Yogurt40') = 'MD_SRP';

    
     % assign Nutella to experiments and groups
    for num = 90:93
         dict_exp(['Nutella', num2str(num)]) = 'TPOT';
%      dict_exp(['Nutella', num2str(num)]) = 'TPOT_training';
    end     
        dict_group('Nutella90') = 'MD_TPOT';
        dict_group('Nutella91') = 'MD_SRP';
        dict_group('Nutella92') = 'MD_TPOT';
        dict_group('Nutella93') = 'MD_SRP';

    
     % assign Oregano to experiments and groups
    for num = 1:9
         dict_exp(['Oregano0', num2str(num)]) = 'TPOT';
  %      dict_exp(['Oregano0', num2str(num)]) = 'TPOT_training';
    end     
        dict_exp('Oregano10') = 'TPOT';
         dict_exp('Oregano11') = 'TPOT';
 %      dict_exp('Oregano10') = 'TPOT_training';
  %      dict_exp('Oregano11') = 'TPOT_training';
        dict_group('Oregano01') = 'MD_TPOT';
        dict_group('Oregano02') = 'Sham_SRP';
        dict_group('Oregano03') = 'MD_SRP';
        dict_group('Oregano04') = 'Sham_SRP';
        dict_group('Oregano05') = 'MD_TPOT';
        dict_group('Oregano06') = 'Sham_SRP';
        dict_group('Oregano07') = 'MD_TPOT';
        dict_group('Oregano08') = 'Sham_TPOT';
        dict_group('Oregano09') = 'MD_SRP';
        dict_group('Oregano10') = 'Sham_TPOT';
        dict_group('Oregano11') = 'MD_SRP';
        
      % assign Nectacot to experiments and groups
    for num = 71:78
         dict_exp(['Nectacot', num2str(num)]) = 'TPOT';
%        dict_exp(['Nectacot', num2str(num)]) = 'TPOT_training';
    end     
        dict_group('Nectacot71') = 'MD_SRP';
        dict_group('Nectacot72') = 'Sham_SRP';
        dict_group('Nectacot73') = 'MD_TPOT';
        dict_group('Nectacot74') = 'MD_SRP';
        dict_group('Nectacot75') = 'MD_TPOT';
        dict_group('Nectacot76') = 'Sham_TPOT';
        dict_group('Nectacot77') = '';
        dict_group('Nectacot78') = 'Sham_TPOT';
        
      % assign Oliveoil to experiments and groups
    for num = 79:88
         dict_exp(['Oliveoil', num2str(num)]) = 'TPOT';
%        dict_exp(['Oliveoil', num2str(num)]) = 'TPOT_training';
    end     

 
        dict_group('Oliveoil79') = 'Sham_TPOT';
        dict_group('Oliveoil80') = 'Sham_SRP';
        dict_group('Oliveoil81') = 'MD_SRP';
        dict_group('Oliveoil82') = 'Sham_SRP';
        dict_group('Oliveoil83') = 'Sham_SRP';
        dict_group('Oliveoil84') = 'MD_TPOT';
        dict_group('Oliveoil85') = 'Sham_SRP';
        dict_group('Oliveoil86') = 'Sham_TPOT';
        dict_group('Oliveoil87') = 'MD_SRP';
        dict_group('Oliveoil88') = 'Sham_TPOT';
           
    
        
     % assign Raisin to experiments and groups
    for num = 68:77
        dict_exp(['Raisin', num2str(num)]) = 'Contrast_tuning';
        dict_group(['Raisin', num2str(num)]) = 'None';
    end     
    
    
    
     % assign SRP mice to experiments and groups
    for num = 903:914
        dict_exp(['DM', num2str(num)]) = 'SRP_testing';
        dict_group(['DM', num2str(num)]) = 'None';
    end     
    
%%

    
     % assign Apricot to experiments and groups
    for num = 60:68
        dict_exp(['Apricot', num2str(num)]) = 'MD_TTX_contrast_tuning';
    end     
    dict_group('Apricot60') = 'MD';
    dict_group('Apricot61') = 'Sham';
    dict_group('Apricot62') = 'MD';
    dict_group('Apricot63') = 'Sham';
    dict_group('Apricot64') = 'MD';
    dict_group('Apricot65') = 'Sham';
    dict_group('Apricot66') = 'MD';
    dict_group('Apricot67') = 'Sham';
    dict_group('Apricot68') = 'Sham';

     % assign Biscuit to experiments and groups
    for num = 70:79
        dict_exp(['Biscuit', num2str(num)]) = 'MD_TTX_contrast_tuning';
    end     
    dict_group('Biscuit70') = 'MD';
    dict_group('Biscuit71') = 'Sham';
    dict_group('Biscuit72') = 'MD';
    dict_group('Biscuit73') = 'Sham';
    dict_group('Biscuit74') = 'MD';
    dict_group('Biscuit75') = 'Sham';
    dict_group('Biscuit76') = 'MD';
    dict_group('Biscuit77') = 'Sham';
    dict_group('Biscuit78') = 'MD';
    dict_group('Biscuit79') = 'Sham';

     % assign Chicken to experiments and groups
    for num = 80:89
        dict_exp(['Chicken', num2str(num)]) = 'MD_TTX_contrast_tuning';
    end     
    dict_group('Chicken80') = 'Sham';
    dict_group('Chicken81') = 'Sham';
    dict_group('Chicken82') = 'MD';
    dict_group('Chicken83') = 'Sham';
    dict_group('Chicken84') = 'MD';
    dict_group('Chicken85') = 'MD';
    dict_group('Chicken86') = 'MD';
    dict_group('Chicken87') = 'Sham';
    dict_group('Chicken88') = 'MD';
    dict_group('Chicken89') = 'MD';
    
    
%% Phase offset ramps
    
    % assign Halibut to experiments and groups
%    for num = 30:35
%        dict_exp(['Halibut', num2str(num)]) = 'Phase_offset_ramps';
%        dict_group(['Halibut', num2str(num)]) = 'Sham';
%    end     
    
    % assign Juniper to experiments and groups
%    for num = 50:57
%        dict_exp(['Juniper', num2str(num)]) = 'Phase_offset_ramps';
%    end     
%    dict_group('Juniper50') = 'MD';
%    dict_group('Juniper51') = 'Sham';
%    dict_group('Juniper52') = 'MD';
%    dict_group('Juniper53') = 'Sham';
%    dict_group('Juniper54') = 'MD';
%    dict_group('Juniper55') = 'Sham';
%    dict_group('Juniper56') = 'MD';
%    dict_group('Juniper57') = 'Sham';

    % assign Ketchup to experiments and groups

    
    % assign Pretzel to experiments and groups
%    for num = 12:21
%        dict_exp(['Pretzel', num2str(num)]) = 'Phase_offset_ramps';
%    end     
%    dict_group('Pretzel12') = 'MD';
%    dict_group('Pretzel13') = 'Sham';
%    dict_group('Pretzel14') = 'MD';
%    dict_group('Pretzel15') = 'Sham';
%    dict_group('Pretzel16') = 'MD';
 %   dict_group('Pretzel17') = 'MD';
%    dict_group('Pretzel18') = 'Sham';
%    dict_group('Pretzel19') = 'MD';
%    dict_group('Pretzel20') = 'Sham';
%    dict_group('Pretzel21') = 'MD';

        % assign Cucumber to experiments and groups
    for num = 78:82
        dict_exp(['Ccucumber', num2str(num)]) = 'Phase_offset_ramps';
    end     
    dict_group('Ccucumber78') = 'Sham';
    dict_group('Ccucumber79') = 'Sham';
    dict_group('Ccucumber80') = 'Sham';
    dict_group('Ccucumber81') = 'Sham';
    dict_group('Ccucumber82') = 'Sham';

        % assign Dumpling to experiments and groups
    for num = 83:92
        dict_exp(['Ddumpling', num2str(num)]) = 'Phase_offset_ramps';
    end     
    dict_group('Ddumpling83') = 'Sham';
    dict_group('Ddumpling84') = 'Sham';
    dict_group('Ddumpling85') = 'Sham';
    dict_group('Ddumpling86') = 'Sham';
    dict_group('Ddumpling87') = 'Sham';
    dict_group('Ddumpling88') = 'Sham';
    dict_group('Ddumpling89') = 'Sham';
    dict_group('Ddumpling90') = 'Sham';
    dict_group('Ddumpling91') = 'Sham';
    dict_group('Ddumpling92') = 'Sham'; 

%% Phase offset acuity ramps- flipped

      % assign Quindim to experiments and groups
    for num = 22:26
        dict_exp(['Quindim', num2str(num)]) = 'MD_acuity_ramps_flipped';
    end
    
        dict_group('Quindim22') = 'MD';
        dict_group('Quindim23') = 'Sham';
        dict_group('Quindim24') = 'MD';
        dict_group('Quindim25') = 'Sham';
        dict_group('Quindim26') = 'MD';
 
      % assign Ravioli to experiments and groups
    for num = 27:39
        dict_exp(['Ravioli', num2str(num)]) = 'MD_acuity_ramps_flipped';
    end
    
        dict_group('Ravioli27') = 'Sham';
        dict_group('Ravioli28') = 'MD';
        dict_group('Ravioli29') = 'Sham';
        dict_group('Ravioli30') = 'MD';
        dict_group('Ravioli31') = 'Sham';
        dict_group('Ravioli32') = 'MD';
        dict_group('Ravioli33') = 'Sham';
        dict_group('Ravioli34') = 'MD';
        dict_group('Ravioli35') = 'Sham';
        dict_group('Ravioli36') = 'MD';        
        dict_group('Ravioli37') = 'Sham';
        dict_group('Ravioli38') = 'MD';
        dict_group('Ravioli39') = 'Sham';
    
    

        

%%
    % iterate data
    allExcData = rampData.get_extracellular_data();
    for excData = allExcData
        
        % extract name information
        labels = excData.get_labels;
        animal = labels{1};
        
        % update w/ appropriate experiment 
        excData.add_labels({dict_exp(animal)});
        excData.add_labels({dict_group(animal)});
        
    end
        
end
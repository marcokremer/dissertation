%this script evokes single games from the simulation table named after
%heuristic_game_anz_strat
% save EIPSIMEquilibrium EIPSIMEquilibrium;
heuristic_list={'Random' 'Altruist' 'Optimist' 'Pessimist' 'Naiive' 'L2' 'D1' 'D2' 'Equilibrium'};
for h=1:9
    game_data=strcat('EIP_SIM_', heuristic_list{h},'_col.mat');
    load(game_data);
    
    numrows=height(sim_erg_table);
    
    for k=0:floor(numrows/466)-1
%         heuristic=EIPSIMEquilibrium{1+k*466,1};
        game=sim_erg_table{1+k*466,2};
        numstrats=num2str(sim_erg_table{(1+k*466),3}{1,1});
        name=strcat(heuristic_list{h},'_',game,'_',numstrats);
        varname=name{1,1};
        T=cell2mat(table2array(sim_erg_table((1+k*466):((k+1)*466),4:end)));
        mystruct.(varname)=T;
    end
    
end
% heuristic_struct=strcat('all_heuristics_Games.mat');
    save heuristic_col_struct mystruct;
heuristic_list={'D1' 'D2' 'Equilibrium' 'D1_col' 'D2_col' 'Equilibrium_col'};

for i=1:size(heuristic_list,2)
    heuristic_name=heuristic_list(i);
    load(['EIP_SIM_' heuristic_name{1,1}]);
    fehl=sim_erg_table.remain_strat;
    fehl_1=cell2mat(fehl);
    fehl_1(fehl_1<1)=1;
    fehl=num2cell(fehl_1);
    sim_erg_table.remain_strat=fehl;
    
    var_name=strcat('EIP_SIM_', heuristic_name, '.mat');
    save(var_name{1,1},'sim_erg_table');
    clearvars sim_erg_table;
end
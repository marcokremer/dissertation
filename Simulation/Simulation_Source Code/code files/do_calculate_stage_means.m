load('D1_Erg.mat')
D1_Erg=heuristic_Erg;
load('D2_Erg.mat')
D2_Erg=heuristic_Erg;
load('Altruist_Erg.mat')
Altruist_Erg=heuristic_Erg;
load('Equilibrium_Erg.mat')
Equilibrium_Erg=heuristic_Erg;
load('L2_Erg.mat')
L2_Erg=heuristic_Erg;
load('Naiive_Erg.mat')
Naiive_Erg=heuristic_Erg;
load('Optimist_Erg.mat')
Optimist_Erg=heuristic_Erg;
load('Pessimist_Erg.mat')
Pessimist_Erg=heuristic_Erg;
load('Random_Erg.mat')
Random_Erg=heuristic_Erg;
% load('Equilibrium_Games.mat') 
% load('Time_Limit.mat')
load('Equilibrium_only_equilibrium_Erg.mat')
Equilibrium_only_Erg=heuristic_Erg;
saturierung=[29 94 224 395]; %entspricht Zeilennummer i im Array
heuristic_mean_sum=zeros(4,10,4,3);
for g=1:3 %Goal=g+1
    for j=1:4 %size (complexity)
         heuristics_result_matrix_s=[Altruist_Erg{g,j} Random_Erg{g,j} Optimist_Erg{g,j} Pessimist_Erg{g,j} Naiive_Erg{g,j} L2_Erg{g,j} D1_Erg{g,j} D2_Erg{g,j} Equilibrium_Erg{g,j}];
        time_sat=saturierung(j);
        for i=1:4%time limit stages (1:early 2:middle 3:late 4:constant)
            lower_bound=1+ceil((i-1)*time_sat/3);
            upper_bound=ceil(i*time_sat/3);
            heuristic_mean_sum(i,1,j,g)=upper_bound;
            for h=1:9% heuristic
            if i==4
            heuristic_mean_sum(i,h+1,j,g)=heuristics_result_matrix_s(end,h);
            else
            heuristic_mean_sum(i,h+1,j,g)=mean(heuristics_result_matrix_s(lower_bound:upper_bound,h));
            end
            end
        end
    end
end
save 'heuristic_mean_sum' 'heuristic_mean_sum';
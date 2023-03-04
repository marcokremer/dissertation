load('D1_Erg.mat')
load('D2_Erg.mat')
load('Altruist_Erg.mat')
load('Equilibrium_Erg.mat')
load('L2_Erg.mat')
load('Naiive_Erg.mat')
load('Optimist_Erg.mat')
load('Pessimist_Erg.mat')
load('Random_Erg.mat')
load('Equilibrium_Games.mat') 
load('Time_Limit.mat')
load('pure_Equilibrium_Erg.mat')
saturierung=[29 79 164 304]; %entspricht Zeilennummer i im Array
heuristic_mean_sum=zeros(3,10,4,3);
for g=1:3 %Goal=g+1
    for j=1:4 %size (complexity)
         heuristics_result_matrix_s=[Altruist_Erg{g,j} Random_Erg{g,j} Optimist_Erg{g,j} Pessimist_Erg{g,j} Naiive_Erg{g,j} L2_Erg{g,j} D1_Erg{g,j} D2_Erg{g,j} Equilibrium_Erg{g,j}];
        time_sat=saturierung(j);
        for i=1:3%time limit stages
            lower_bound=1+ceil((i-1)*time_sat/3);
            upper_bound=ceil(i*time_sat/3);
            heuristic_mean_sum(i,1,j,g)=upper_bound;
            for h=1:9% heuristic
            heuristic_mean_sum(i,h+1,j,g)=mean(heuristics_result_matrix_s(lower_bound:upper_bound,h));
            %heuristic_mean_sum(h,i,g)= horzcat(upper_bound,mean(heuristics_result_matrix_s(lower_bound:upper_bound,:))); %Zuordung der SpeicherDimensionen?
            end
        end
    end
end
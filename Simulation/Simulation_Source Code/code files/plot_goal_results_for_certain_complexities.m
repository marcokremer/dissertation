%plots results of heuristics in certain game size
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
load('Time_Limit.mat') %make time limit vector available %Ä

x_upper_limit=[70 400 800 1400];
% x_upper_limit=[600 1200 1800 2400];%Ä

y_upper_limit=[2.1 3.1 4.1 5.1
    30 1.5 2.5 2.5
    60 220 400 650];
y_lower_limit=[0.8 0.8 0.8 0.8
    10 -1 -0.5 -0.5
    0 0 0 0];


for i=1:3 %goal
    for j=1:4 %complexity
        matr_size=strcat(num2str(j+1),'x',num2str(j+1));
        heuristics_result_matrix_s=[Altruist_Erg{i,j} Random_Erg{i,j} Optimist_Erg{i,j} Pessimist_Erg{i,j} Naiive_Erg{i,j} L2_Erg{i,j} D1_Erg{i,j} D2_Erg{i,j} Equilibrium_Erg{i,j}];
        plot_goal_results(Time_Limit,heuristics_result_matrix_s,matr_size, x_upper_limit(1,j),y_upper_limit(i,j),y_lower_limit(i,j), i, j);
    end
end

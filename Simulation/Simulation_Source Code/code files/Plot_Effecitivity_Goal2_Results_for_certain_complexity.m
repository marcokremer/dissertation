%plots results of heuristics in certain game size
load('D1_Erg.mat')
load('D2_Erg.mat')
load('Altruist_Erg.mat')
load('Equilibrium_Erg.mat')
load('L2_Erg.mat')
load('Naiive_Erg.mat')
load('Optimist_Erg.mat')
load('Pessimist_Erg.mat')
load('Random_Erg.mat')
load('Equilibrium_Games.mat') %make mystruct_long available
load('Time_Limit.mat') %make time limit vector available %Ä

% load('no_rnd_D1_Erg.mat')
% load('no_rnd_D2_Erg.mat')
% load('no_rnd_Altruist_Erg.mat')
% load('no_rnd_Equilibrium_Erg.mat')
% load('no_rnd_L2_Erg.mat')
% load('no_rnd_Naiive_Erg.mat')
% load('no_rnd_Optimist_Erg.mat')
% load('no_rnd_Pessimist_Erg.mat')
% load('no_rnd_Random_Erg.mat')
% load('Equilibrium_Games.mat') %make mystruct_long available
% load('Time_Limit.mat') %make time limit vector available

x_upper_limit=[150 300 600 1200];

y_upper_limit=[2.1 3.1 4.1 5.1
    30 1.5 2.5 2.5
    70 200 350 600];
y_lower_limit=[0.8 0.8 0.8 0.8
    10 -1 -0.5 -0.5
    0 0 0 0];


for i=1:3 %goal
    for j=1:4 %complexity
        size=strcat(num2str(j+1),'x',num2str(j+1));
        heuristics_result_matrix_s=[Altruist_Erg{i,j} Random_Erg{i,j} Optimist_Erg{i,j} Pessimist_Erg{i,j} Naiive_Erg{i,j} L2_Erg{i,j} D1_Erg{i,j} D2_Erg{i,j} Equilibrium_Erg{i,j}];
        plot_effectivity_goal2(Time_Limit,heuristics_result_matrix_s,size, x_upper_limit(1,j),y_upper_limit(i,j),y_lower_limit(i,j), i, j);
    end
end

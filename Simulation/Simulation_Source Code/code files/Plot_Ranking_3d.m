%plots results of heuristics in certain game size
load('rank_matrix.mat')
heuristic_list={'Altruist' 'Random' 'Optimist' 'Pessimist' 'Naiive' 'L2' 'D1' 'D2' 'Equilibrium'};

% load('D2_Erg.mat')
% load('Altruist_Erg.mat')
% load('Equilibrium_Erg.mat')
% load('L2_Erg.mat')
% load('Naiive_Erg.mat')
% load('Optimist_Erg.mat')
% load('Pessimist_Erg.mat')
% load('Random_Erg.mat')
% load('Equilibrium_Games.mat') %make mystruct_long available
% load('Time_Limit.mat') %make time limit vector available
% load('Time_Limit_long.mat')%make time limit vector available
% load('Time_Limit_longer.mat')%make time limit vector available
for j=1:1
    for i=1:1
        switch j
            case 1 
                time_case='early';
            case 2 
                time_case='middle';
            case 3 
                time_case='late';
        end
        fig_name=strcat('Ranking_',num2str(j+1),'_x_',num2str(j+1),'_',time_case);
        fig=figure('name',fig_name);
        axes1 = axes('Parent',fig);
        box(axes1,'on');
        grid(axes1,'on');
        hold(axes1,'on');
        %view(axes1,[-24 -20]);
        view(axes1,[90 0]);
        %plot1 = plot(X1,YMatrix1,'Parent',axes1);
        % Create label
        xlabel('Remaining Alternatives');
        ylabel('Payoff');
        zlabel('Sum of EIPs');
%         x=final_erg_mtrx(i,:,j,1);
%         y=final_erg_mtrx(i,:,j,2);
%         z=final_erg_mtrx(i,:,j,3);
%         
%         plot1=stem3(x,y,z,'Parent',axes1);
        %set(plot1,'DisplayName',heuristic_list{1});
              
        
        %legend('-DynamicLegend');
        %hold on;
        for g=1:9
        x=final_erg_mtrx(i,g,j,1);
        y=final_erg_mtrx(i,g,j,2);
        z=final_erg_mtrx(i,g,j,3);
        
        plot1=stem3(x,y,z, 'DisplayName',heuristic_list{g});
       % set(plot1(1,g),'DisplayName',heuristic_list{g});
        %legend(heuristic_list{g}, '-DynamicLegend');
        %labelpoints (x, y, heuristic_list{g});
        end
        legend1 = legend(axes1,'show', heuristic_list{1:g});
        
        set(legend1,'Location','eastoutside','FontSize',9);
        %legend(heuristic_list{:});
        savefig(fig_name);
        saveas(fig,fig_name, 'meta');
    end
end

% size='2x2';
% upper_limit=30;
% heuristics_result_matrix_s=[Altruist_Erg{2,1} Random_Erg{2,1} Optimist_Erg{2,1} Pessimist_Erg{2,1} Naiive_Erg{2,1} L2_Erg{2,1} D1_Erg{2,1} D2_Erg{2,1} Equilibrium_Erg{2,1}];
% heuristics_result_matrix_m=[D1_Erg{2,1} Equilibrium_Erg{2,1}];
% heuristics_result_matrix_l=[D2_Erg{2,1}];
% plot_effectivity_goal2(Time_Limit,heuristics_result_matrix_s,size, upper_limit);
% plot_effectivity_goal2(Time_Limit,Time_Limit_long,Time_Limit_longer, heuristics_result_matrix_s,heuristics_result_matrix_m, heuristics_result_matrix_l,size, upper_limit);
% plot_effectivity_goal2(Time_Limit,Time_Limit_long, heuristics_result_matrix_s,heuristics_result_matrix_m,size, upper_limit);


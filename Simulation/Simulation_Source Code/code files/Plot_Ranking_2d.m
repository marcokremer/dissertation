%plots results of heuristics in certain game size
load('rank_matrix.mat')
% load('rank_matrix_sat.mat')
heuristic_list={'Altruist' 'Random' 'Optimist' 'Pessimist' 'Naiive' 'L2' 'D1' 'D2' 'Equilibrium'};
%load('Colormaps_2d','mycmap')

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
for j=1:4 %Complexity %Ä
    for i=1:4 %Time Limit %Ä
        switch i
            case 1
                time_case='early';
            case 2
                time_case='middle';
            case 3
                time_case='late';
            case 4
                time_case='constant';
        end
        %         time_case='constant';
        fig_name=strcat('Ranking_',num2str(j+1),'_x_',num2str(j+1),'_',time_case);
        fig_title=strcat({'Ranking -'},{' '},num2str(j+1),{'x'},num2str(j+1),{' '},time_case);
        fig=figure('name',fig_name);
        
        
        axes1 = axes('Parent',fig);
        
        box(axes1,'on');
        grid(axes1,'on');
        hold(axes1,'on');
        %view(axes1,[-24 -20]);
        %view(axes1,[90 0]);
        %plot1 = plot(X1,YMatrix1,'Parent',axes1);
        % Create label
        xlabel('Goal 2 - Remaining Alternatives');
        ylabel('Goal 3 - Payoff');
        xlim([1 9]);
        ylim([1 9]);
        
        %zlabel('Sum of EIPs');
        %         x=final_erg_mtrx(i,:,j,1);
        %         y=final_erg_mtrx(i,:,j,2);
        %         z=final_erg_mtrx(i,:,j,3);
        %
        %         plot1=stem3(x,y,z,'Parent',axes1);
        %set(plot1,'DisplayName',heuristic_list{1});
        
        
        %legend('-DynamicLegend');
        %hold on;
        for g=1:9 %Ranks
            x=final_erg_mtrx(i,g,j,1); %Goal2
            y=final_erg_mtrx(i,g,j,2); %Goal3
            z=final_erg_mtrx(i,g,j,3); %Goal4
            % normalize vector to go from zero to 1
            %normValue = (A(:,3)-min(A(:,3)))./(max(A(:,3))-min(A(:,3)))
            normValue = (z-1)/8;
            S=50;
            %             map_w = [1, 0, 0
            %             1, 2/8, 0
            %             1, 4/8, 0
            %             1, 6/8, 0
            %             1, 1, 0
            %             6/8, 1, 0
            %             4/8, 1, 0
            %             2/8, 1, 0
            %             0, 1, 0];
            map_w = gray(9);
            %RGB dark grey=Rank9 to light grey=Rank1;
            %             if normValue<=0.5
            %             %C = [2*normValue 1 zeros(size(normValue))];
            %             C = [2*normValue 1 0]; %Ä
            %             else
            %                 %C = [1 2*(1-normValue) zeros(size(normValue))];
            %                 C = [1 2*(1-normValue) 0];
            %             end
            C=[0 0 0]+ 1-0.1*g;
%             switch heuristic_list{g}
%                 %                 case 'D1'
%                 %                     switch j+1
%                 %                         case {4} %Ä{2,4}
%                 %                             plot1=scatter(x-0.1,y,S,C,'filled');
%                 %                             labelpoints (x-0.1, y, heuristic_list{g}, 'NW', 0.2, 1, 'FontSize', 12);
%                 %                         otherwise
%                 %                              plot1=scatter(x,y,S,C,'filled');
%                 %                             labelpoints (x, y, heuristic_list{g}, 'NW', 0.2, 1, 'FontSize', 12);
%                 %                     end
%                 case 'D2'
%                     switch j+1
%                         %                         case {2}
%                         %                             plot1=scatter(x+0.1,y,S,C,'filled');
%                         %                             labelpoints (x+0.1, y, heuristic_list{g}, 'NE', 0.2, 1, 'FontSize', 12);
%                         case {5}
%                             plot1=scatter(x-0.1,y,S,C,'filled');
%                             labelpoints (x-0.1, y, heuristic_list{g}, 'NW', 0.2, 1, 'FontSize', 12);
%                         otherwise
%                             plot1=scatter(x,y,S,C,'filled');
%                             labelpoints (x, y, heuristic_list{g}, 'NW', 0.2, 1, 'FontSize', 12);
%                     end
%                     case 'L2'
%                     switch j+1
%                         %                         case {2}
%                         %                             plot1=scatter(x+0.1,y,S,C,'filled');
%                         %                             labelpoints (x+0.1, y, heuristic_list{g}, 'NE', 0.2, 1, 'FontSize', 12);
%                         case {5}
%                             plot1=scatter(x-0.1,y,S,C,'filled');
%                             labelpoints (x-0.1, y, heuristic_list{g}, 'W', 0.2, 1, 'FontSize', 12);
%                         otherwise
%                             plot1=scatter(x,y,S,C,'filled');
%                             labelpoints (x, y, heuristic_list{g}, 'NW', 0.2, 1, 'FontSize', 12);
%                     end
%                 case 'Equilibrium'
%                     switch j+1
%                         case {5}
%                             plot1=scatter(x+0.1,y,S,C,'filled');
%                             labelpoints (x+0.1, y, heuristic_list{g}, 'NE', 0.2, 1, 'FontSize', 12);
%                         case {2}
%                             plot1=scatter(x,y,S,C,'filled');
%                             labelpoints (x, y, heuristic_list{g}, 'NE', 0.2, 1, 'FontSize', 12);
%                         otherwise
%                             plot1=scatter(x,y,S,C,'filled');
%                             labelpoints (x, y, heuristic_list{g}, 'NW', 0.2, 1, 'FontSize', 12);
%                     end
%                 case 'Naiive'
%                     switch j+1
%                         case {4,5}
%                             plot1=scatter(x,y,S,C,'filled');
%                             labelpoints (x, y, heuristic_list{g}, 'NE', 0.2, 1, 'FontSize', 12);
%                         otherwise
%                             plot1=scatter(x,y,S,C,'filled');
%                             labelpoints (x, y, heuristic_list{g}, 'NW', 0.2, 1, 'FontSize', 12);
%                     end
%                 otherwise
%                     plot1=scatter(x,y,S,C,'filled');
%                     labelpoints (x, y, heuristic_list{g}, 'NW', 0.2, 1, 'FontSize', 12);
%             end
            %             plot1=scatter(x,y,S,C,'filled');
            %             labelpoints (x, y, heuristic_list{g}, 'NW', 0.2, 1, 'FontSize', 12);
            if x<3
                horz_coord='E';
            else
                horz_coord='W';
            end
            
            if y>7
                vert_coord='S';
            else
                vert_coord='N';
            end
            
            plot1=scatter(x,y,S,C,'filled');
            labelpoints (x, y, heuristic_list{g}, [vert_coord horz_coord], 0.2, 1, 'FontSize', 12);
        end
        %legend1 = legend(axes1,'show', heuristic_list{1:g});
        %set(legend1,'Location','eastoutside','FontSize',9);
        %legend(heuristic_list{:});
        caxis([1,9]);
        x_line=[5,5];
        y_line=ylim;
        x_l=line(x_line,y_line,'lineWidth', 1.5);
        y_line=[5,5];
        x_line=xlim;
        y_l=line(x_line,y_line,'lineWidth', 1.5);
        y_l.Color=[0,0,0,0.5];
        x_l.Color=[0,0,0,0.5];
        
        %axis('equal');
        %h=colorbar(axes1,'southoutside', 'Ticks',[1,9],'TickLabels',{'Rank 9','Rank 1'});
        colormap(map_w);
        h=colorbar(axes1,'southoutside', 'Ticks',[1,9],'TickLabels',{'Rank 9','Rank 1'});
        h.Label.String = 'Goal 4 - Number of Consumed EIPs';
        %set(fig,'Colormap',h);
        title(fig_title, 'Color',[0.6,0.6,0.6]);
        savefig(fig_name);
        
        %saveas(fig,fig_name, 'jpg');
        saveas(fig,fig_name, 'meta');
                close(fig);
    end
end





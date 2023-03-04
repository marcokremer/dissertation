%this file analysizes the players' performance regarding the four
%aforementioned goals 1. decision making 2. reduction of alternatives 3.
%making payoff and 4. reducing number of EIPs; here: player based analysis
%not implemented yet: add plots in subplots with levels of single EIPs  
load('V1_EIP_data_160428.mat');
players=unique(Spielername);
anz_players=size(players,1);

% Exp_name_list=unique(ExpName);

i=0;
% fig=figure;
players_bin_hist=zeros();

for pl=1:anz_players
    
    %         fig=figure;
    i=i+1;
    %         timecase=ti;
    %         complexity=compl;
    pl_express= strcat('^',players(pl),'$'); %jeder Player_name, und genau der Spielername
    %         pl_express_cell= players(pl); %jeder Player_name
    %         pl_express=pl_express_cell{1};
    %         G = regexp(Spielername,'^K$','match');
    G = regexp(Spielername,pl_express,'match');
    F=~cellfun('isempty', G);
    EIP_sum_list=sum_EIPs(F==1); %alle EIPs von Spieler j
    Exp_name_list=ExpName(F==1); % alle ExpNamen von Spieler j
    a=size(Exp_name_list,1);
    
%     if a==1
    fig=figure;
    players_bin_hist=zeros(sum(F),1);
    for tc=1:sum(F)
        [index,]=find(strcmp(Exp_list,Exp_name_list(tc)));
        for bin_n=1:7
            if EIP_sum_list(tc)>=bin_edges(index,8-bin_n)
                players_bin_hist(tc)=8-bin_n;
                break;
            end
        end
    end
    
    Add_i_list=ADD_I(F==1);
    Add_ii_list=ADD_II(F==1);
    Choose_i_list=CHOOSE_I(F==1);
    Choose_ii_list=CHOOSE_II(F==1);
    Compare_i_list=COMPARE_I(F==1);
    Compare_ii_list=COMPARE_II(F==1);
    Eliminate_list=ELIMINATE(F==1);
    End_list=END(F==1);
    Focus_list=FOCUS(F==1);
    Move_list=MOVE(F==1);
    Open_list=OPEN(F==1);
    Read_list=READ(F==1);
    Store_list=STORE(F==1);
    all_EIPs=horzcat(Add_i_list, Add_ii_list,Choose_i_list,Choose_ii_list,Compare_i_list,Compare_ii_list,Eliminate_list,End_list,Focus_list,Move_list,Open_list,Read_list,Store_list);
    
    EIP_group_1=horzcat(Eliminate_list,End_list,Focus_list,Move_list,Open_list,Read_list);
    EIP_group_1_sum=Eliminate_list+End_list+Focus_list+Move_list+Open_list+Read_list+Store_list;
    EIP_group_2=horzcat(Add_i_list, Add_ii_list,Choose_i_list,Choose_ii_list,Compare_i_list,Compare_ii_list,Store_list);
    EIP_group_2_sum=Add_i_list+ Add_ii_list+Choose_i_list+Choose_ii_list+Compare_i_list+Compare_ii_list;
    %         uniq_Exp_name_list=unique(Exp_name_list);
    %         b=size(uniq_Exp_name_list,1);
    %         if a>b
    %             msgstr=strcat('Warnung: Doppelter Eintrag','Spieler: ',players(pl),'Experiment: ', Exp_name_list);
    %             msgbox(msgstr,'doppelter Eintrag');
    %         end
    
    time_code_list=regexprep(Exp_name_list,'_2.php','');
    Exp_name_list_neu = regexprep(time_code_list,'_','\_');
    
    
    % hs=subplot(8,8,i);
    % plot(x,EIP_sum_list,'d');
    if a==1 % hier entstehen Schwierigkeiten bei der diagrammerstellung wenn a=1 (also nur ein Spiel gespielt)
        %gestapelte Bars
        a=2;
        nan=[NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN];
        nan_binh=[NaN];
        all_EIPs=vertcat(all_EIPs,nan);
        players_bin_hist=vertcat(players_bin_hist,nan_binh);
    end    
        x=1:1:a;
        sp_1=subplot(2,2,[1,2]);
        
        bar(x,all_EIPs, 'stacked');
        %plot(x,all_EIPs);
        % errorbar(x,time_compl_matrx_erg(3,:) ,time_compl_matrx_erg(4,:),'d');
        ax = gca;
        ax.XTick = 1:1:a;
        ax.XTickLabel = Exp_name_list_neu;
        ax.XTickLabelRotation = 90;
        ax.TickLabelInterpreter = 'none';
        ax.XLim=[0 a+1];
        legend('ADD I',' ADD II','CHOOSE I',' CHOOSE II',' COMPARE I ','COMPARE II',' ELIMINATE',' END',' FOCUS',' MOVE',' OPEN',' READ',' STORE', 'Location','northwest','Location','eastoutside');%,'Interpreter', 'none' ,'Orientation','horizontal',,,
        
        act_player=players(pl);
        fig_name=strcat('V1_player_single_EIPs_',act_player{1});
        fig_name_title=strcat({'V1 - single EIPs of player '},{' '},players(pl));
        title(fig_name_title, 'Interpreter','none');
        
        
        %Anz single EIPs in bars gruppiert nach Time-Compl-Code
        sp=subplot(2,2,3);
        plot(x,EIP_group_1_sum,'--ro','LineWidth',1,'MarkerSize',2,'MarkerEdgeColor','k','MarkerFaceColor','r');
        hold on;
        plot(x,EIP_group_2_sum','--bo','LineWidth',1,'MarkerSize',2,'MarkerEdgeColor','k','MarkerFaceColor','b');
        legend('GRP 1', 'GRP 2','location','northwest');
%         bar(x,all_EIPs);
        ax = gca;
        ax.XTick = 1:1:a;
        ax.XTickLabel = Exp_name_list_neu;
        ax.XTickLabelRotation = 90;
        ax.TickLabelInterpreter = 'none';
        ax.XLim=[0 a+1];
        hold off;
        %Histogramm-Zugehörigkeit
        subplot(2,2,4);
        sp_4=barh(players_bin_hist,'hist','c');
        ax = gca;
        ax.YTick = 1:1:a;
        ax.YTickLabel = Exp_name_list_neu;
        ax.TickLabelInterpreter = 'none';
        ax.YLim=[0 a+1];
        ax.XLabel.String = 'Class Affiliation of EIP-Sum';
        ax.XLabel.FontSize= 10;
        fig_name=strcat(fig_name,'_Nr2');
        fig_name=strrep(fig_name, '.', '');
        
        savefig(fig, fig_name);
        saveas(fig,fig_name, 'meta');
        saveas(fig,fig_name, 'jpg');
        close(fig);
        
%     end
end
% fig_name='V1_all_players_EIPs';
% savefig(fig, fig_name);
% saveas(fig,fig_name, 'meta');
% saveas(fig,fig_name, 'jpg');
% close(fig);

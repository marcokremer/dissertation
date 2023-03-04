%this file analysizes the players' performance regarding the four
%aforementioned goals 1. decision making 2. reduction of alternatives 3.
%making payoff and 4. reducing number of EIPs; here: task-variable based
 load('V1_EIP_data_160428.mat');
Exp_name_list=unique(ExpName);
time_compl_matrx_erg=zeros(4,16);
time_compl_code=cell(1,16);
bin_edges=zeros(16,7); %Time/Compl-Code Edges of bins in number of EIPs
i=0;
fig=figure;
for ti=1:4
    for compl=2:5
        i=i+1;
        timecase=ti;
        complexity=compl;
        tc_express=strcat(num2str(timecase),'_',num2str(complexity),'x',num2str(complexity)); %ohne Player_namen
        tc_express_title=strcat(num2str(timecase),'\_',num2str(complexity),'x',num2str(complexity)); %ohne Player_namen
        
        % tc_express='4_2x2';
        % tc_express_title='4\_2x2';
        G = regexp(ExpName,tc_express,'match');
        F=~cellfun('isempty', G);
        
        Vgl_1= regexp(ExpName1,tc_express,'match');
        F1=~cellfun('isempty', Vgl_1);
        EIP_sum_list_0=sum_EIPs(F==1);
        
        delta=sum(F1)-sum(F);
        EIP_sum_list_1=zeros(delta,1);
        EIP_sum_list=vertcat(EIP_sum_list_0,EIP_sum_list_1);
        anz_player_str=strcat('\Sigma',num2str(sum(F1))); %Summe Anz Player
        
        hs=subplot(4,4,i);
        
        ha=histogram(EIP_sum_list,6);
        bin_edges(i,:)=ha.BinEdges;
        
%         title(tc_express_title);
%         
%         text(0.7,0.85,anz_player_str,'units','normalized');
%         
%         time_compl_matrx_erg(1,i)=ti;
%         time_compl_matrx_erg(2,i)=compl;
%         time_compl_matrx_erg(3,i)=mean(EIP_sum_list);
%         time_compl_matrx_erg(4,i)=std(EIP_sum_list);
%         time_compl_code(1,i)=cellstr(tc_express_title);


% here a diagram is needed that show the level of hight
    end
end

% %uncomment for producing and saving diagrams
% fig_name='V1_sumEIPs_histograms';
% savefig(fig, fig_name);
% saveas(fig,fig_name, 'meta');
% saveas(fig,fig_name, 'jpg');
% close(fig);
% % 
% % %plot time_compl_matrx_erg
% fig_2=figure;
% x=1:1:16;
% 
% errorbar(x,time_compl_matrx_erg(3,:) ,time_compl_matrx_erg(4,:),'d');
% ax = gca;
% ax.XTick = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];
% ax.XTickLabel = time_compl_code;
% ax.XTickLabelRotation = 90;
% fig_name='V1_sumEIPs_mean_std';
% fig_name_title='V1 - Mean and Std of EIPs Sum ';
% title(fig_name_title);
% 
% 
% savefig(fig_2, fig_name);
% saveas(fig_2,fig_name, 'meta');
% saveas(fig_2,fig_name, 'jpg');
% close(fig_2);
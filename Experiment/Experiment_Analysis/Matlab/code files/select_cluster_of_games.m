%count cluster members
load('cluster_erweiterte_ergebnisübersicht.mat');

% select_cluster_nr=1; %Clusternummer auswählen
select_exp_vers=1;
select_cluster_auswahl=1; %1 ges, 2 akq o ZD, ..., 6 Entsch
cluster_auswahl_name={'ges', 'akq o ZD', 'akq m ZD', 'verarb o ZD', 'verarb m ZD', 'entsch'};
cluster_auswahl_name_cc={'ges', 'akqoZD', 'akqmZD', 'verarboZD', 'verarbmZD', 'entsch'};

% select_game='1_2x2_2.php';
process_case={'info aquisation','info processing','decision making'};
spaltennamen={'H1-decision','H2-relative payoff','H3-eliminate alternatives','H4-payoff w COMP I','H5-payoff w/o COMP I','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H11-speeding up','H12-early decision and revision','H13-strategic EIPs+choice','H14-focus on own payoff','H15-open cells first'};
no_spaltennamen={'H12-early decision and revision','H15-open cells first','H11-speeding up','H14-focus on own payoff','H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
mean_cluster_erg=table;
for select_exp_vers=1:3
    switch select_exp_vers
        case 1
            dataset=ergebnisuebersicht_v1;
            
        case 2
            dataset=ergebnisuebersicht_v2;
            
        case 3
            
            dataset=ergebnisuebersicht_v3;
    end
    
    for j=1:16
        Exp_name_list=unique(dataset.(2));
        G = regexp(dataset.(2),Exp_name_list{j},'match');
        F=~cellfun('isempty', G);
        dataset_game_ges=dataset(F,:);
        durchschnittl_hypo_erg=zeros(size(unique(dataset_game_ges.(20+select_cluster_auswahl)),1),15);
        
        for select_cluster_auswahl=1:6
        
        for select_cluster_nr=1:size(unique(dataset_game_ges.(20+select_cluster_auswahl)),1)
            rows=dataset_game_ges.(20+select_cluster_auswahl)==select_cluster_nr;
            columns=1:26;
            dataset_select=dataset_game_ges(rows,columns);
            if size(dataset_select,1)>1
            durchschnittl_hypo_erg(select_cluster_nr,:)=mean(dataset_select{:,4:18});
            else
            durchschnittl_hypo_erg(select_cluster_nr,:) =double(dataset_select{1,4:18});
            end
            
            if j==1 
            mean_cluster_erg=horzcat([strcat('v',select_exp_vers),Exp_name_list{j},cluster_auswahl_name{select_cluster_auswahl},num2cell(select_cluster_nr)],num2cell(durchschnittl_hypo_erg(select_cluster_nr,:)));
            else
            mean_cluster_erg=vertcat(mean_cluster_erg,[strcat('v',select_exp_vers),Exp_name_list{j},cluster_auswahl_name{select_cluster_auswahl},num2cell(select_cluster_nr)],num2cell(durchschnittl_hypo_erg(select_cluster_nr,:)));
            end
        end
        
        
            
            %         new_order_hypo_erg=durchschnittl_hypo_erg(:,[12,15,11,14,3,6:10,1:2,4:5,13]);
%         
%         fig_name=strcat('Clusterauswertung v',num2str(select_exp_vers),'_',Exp_name_list{j}(1:7),'_',cluster_auswahl_name{select_cluster_auswahl});
%         fig=figure('name',fig_name);
        
        max_val=round(max(durchschnittl_hypo_erg),1);
        point_str=num2cell(max_val);
        no_rel_durchschnittl_hypo_erg=bsxfun(@rdivide,new_order_hypo_erg,max(new_order_hypo_erg,[],1));
        
%         plot(no_rel_durchschnittl_hypo_erg');
%         
%         
%         h=gca;
%         h.YLim=[0,1.2];
%         h.XLim=[0,16];
%         set(h,'xtick',1:15);
%         h.XTickLabel=no_spaltennamen;
%         h.XTickLabelRotation=270;
%         labelpoints([1:15], [1], point_str, 'N');
%         
%          x_lines=[0.5,4.5,2.5,10.4,10.6,15.5];
%         
%         
%         for l=1:6
% 
%         x_line=[x_lines(l),x_lines(l)];
%         y_line=[0,1];
% 
%         y_l=line(x_line,y_line,'lineWidth', 1.5);
%         switch l
%             case {1,2}
%         y_l.Color='green';
%         case {3,4}
%         y_l.Color='red';
%         case {5,6}
%         y_l.Color='blue';
%         end
%         
%         end
%         labelpoints (2.5, 1.1, process_case{1}, 'N', 0.2, 1, 'FontSize', 12, 'Color', 'green');
%         labelpoints (7.5, 1.1, process_case{2}, 'N', 0.2, 1, 'FontSize', 12, 'Color', 'red');
%         labelpoints (13.05, 1.1, process_case{3}, 'N', 0.2, 1, 'FontSize', 12, 'Color', 'blue');
%        
%         savefig(strcat(fig_name,'.fig'));
% 
%         %saveas(fig,fig_name, 'jpg');
%         saveas(fig,fig_name, 'meta');
%         close(fig);
        end
    end
end
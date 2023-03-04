%plot Cluster-centers for every cluster of every game and every version in
%a 4x4 subplot per game;
load('cluster_erweiterte_ergebnisübersicht.mat');

cc_names = fieldnames(cluster_cen);
rank_names=fieldnames(ranking_data);
% no_spaltennamen={'H12-early decision and revision','H15-open cells first','H11-speeding up','H14-focus on own payoff','H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
no_spaltennamen_kurz={'H12','H15','H11','H14','H3','H6','H7','H8','H9','H10','H1','H2','H4','H5','H13'};

process_case={'info aquisation','info processing','decision making'};
cluster_auswahl_name={'ges', 'akqoZD', 'akqmZD', 'verarboZD', 'verarbmZD', 'entsch'};

for v=1:3 %Version
    for c=1:6 %Cluster-Typ: 1 ges 2 'akqoZD', 3'akqmZD',4 'verarboZD', 5 'verarbmZD', 6 'entsch'
        fig_name=strcat('Clustercenterauswertung_v',num2str(v),'_',cluster_auswahl_name{c});
        fig=figure('name',fig_name);
        
        for i=1:16 %Anz Spiele
            subplot(4,4,i);
            a=(v-1)*96+c+(i-1)*6;
            b=(v-1)*16+i;%offset in der Spielauswahlliste
            % for a=1:size(cc_names)
            no_rel_durchschnittl_hypo_erg=bsxfun(@rdivide,cell2mat(cluster_cen.(cc_names{a})),max(cell2mat(cluster_cen.(cc_names{a})),[],1));
            max_val=round(max(cell2mat(cluster_cen.(cc_names{a}))),1);
            point_str=num2cell(max_val);
            
            
            switch logical(a)
                case ~isempty(strfind(cc_names{a},cluster_auswahl_name{1}))
                    new_order_hypo_erg=no_rel_durchschnittl_hypo_erg(:,[12,15,11,14,3,6:10,1:2,4:5,13]);
                    point_str=point_str(:,[12,15,11,14,3,6:10,1:2,4:5,13]);
                    xlim=15;
                    x_lines=[0.5,4.5,2.5,10.4,10.6,15.5];
                    l=6;
%                     no_spaltennamen={'H12-early decision and revision','H15-open cells first','H11-speeding up','H14-focus on own payoff','H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
                    no_spaltennamen_kurz={'H12','H15','H11','H14','H3','H6','H7','H8','H9','H10','H1','H2','H4','H5','H13'};
                    
                case ~isempty(strfind(cc_names{a},cluster_auswahl_name{2}))
                    new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
                    xlim=3;
                    l=0;
%                     no_spaltennamen={'H12-early decision and revision','H14-focus on own payoff','H15-open cells first'};
                    no_spaltennamen_kurz={'H12','H14','H15'};
                    
                case ~isempty(strfind(cc_names{a},cluster_auswahl_name{3}))
                    new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
                    xlim=4;
                    l=0;
%                     no_spaltennamen={'H11-speeding up','H12-early decision and revision','H14-focus on own payoff','H15-open cells first'};
                    no_spaltennamen_kurz={'H11','H12','H14','H15'};
                    
                case ~isempty(strfind(cc_names{a},cluster_auswahl_name{4}))
                    new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
                    xlim=7;
                    l=0;
%                     no_spaltennamen={'H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H14-focus on own payoff'};
                    no_spaltennamen_kurz={'H3','H6','H7','H8','H9','H10','H14'};
                    
                case ~isempty(strfind(cc_names{a},cluster_auswahl_name{5}))
                    new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
                    xlim=8;
                    l=0;
%                     no_spaltennamen={'H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H11-speeding up','H14-focus on own payoff','H1-decision'};
                    no_spaltennamen_kurz={'H3','H6','H7','H8','H9','H10','H11','H14','H1'};
                    
                case ~isempty(strfind(cc_names{a},cluster_auswahl_name{6}))
                    new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
                    xlim=5;
                    l=0;
%                     no_spaltennamen={'H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
                    no_spaltennamen_kurz={'H1','H2','H4','H5','H13'};
            end
            
           
            plot(new_order_hypo_erg');
            
            
            h=gca;
            h.YLim=[0,1.2];
            h.XLim=[0,xlim+1];
            set(h,'xtick',1:xlim);
            h.XTickLabel=no_spaltennamen_kurz;
            h.XTickLabelRotation=270;
%             labelpoints([1:xlim], [1], point_str, 'N');

           
            %     x_lines=[0.5,4.5,2.5,10.4,10.6,15.5];
            
%             if l>0
%                 for l=1:6
%                     
%                     x_line=[x_lines(l),x_lines(l)];
%                     y_line=[0,1];
%                     
%                     y_l=line(x_line,y_line,'lineWidth', 1.5);
%                     switch l
%                         case {1,2}
%                             y_l.Color='green';
%                         case {3,4}
%                             y_l.Color='red';
%                         case {5,6}
%                             y_l.Color='blue';
%                     end
%                     
%                 end
%                 
%                 labelpoints (2.5, 1.1, process_case{1}, 'N', 0.2, 1, 'FontSize', 12, 'Color', 'green');
%                 labelpoints (7.5, 1.1, process_case{2}, 'N', 0.2, 1, 'FontSize', 12, 'Color', 'red');
%                 labelpoints (13.05, 1.1, process_case{3}, 'N', 0.2, 1, 'FontSize', 12, 'Color', 'blue');
%             end
            
        end
        savefig(strcat(fig_name,'.fig'));
        
        %saveas(fig,fig_name, 'jpg');
        saveas(fig,fig_name, 'meta');
        close(fig);
    end
end
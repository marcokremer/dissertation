%plot Cluster-centers for every cluster of every game and every version
load('cluster_erweiterte_ergebnisübersicht.mat');

cc_names = fieldnames(cluster_cen);
no_spaltennamen={'H12-early decision and revision','H15-open cells first','H11-speeding up','H14-focus on own payoff','H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
process_case={'info aquisation','info processing','decision making'};
cluster_auswahl_name={'ges', 'akqoZD', 'akqmZD', 'verarboZD', 'verarbmZD', 'entsch'};
rank_names=fieldnames(ranking_data);
s_count=0;
  b=1;

for a=1:size(cc_names)
    no_rel_durchschnittl_hypo_erg=bsxfun(@rdivide,cell2mat(cluster_cen.(cc_names{a})),max(cell2mat(cluster_cen.(cc_names{a})),[],1));
    max_val=round(max(cell2mat(cluster_cen.(cc_names{a}))),1);
    point_str=num2cell(max_val);
    fig_name=strcat('Clustercenterauswertung_',cc_names{a});
    fig=figure('name',fig_name);
    s_count=s_count+1;

   switch logical(a)
        case ~isempty(strfind(cc_names{a},cluster_auswahl_name{1}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg(:,[12,15,11,14,3,6:10,1:2,4:5,13]);
            point_str=point_str(:,[12,15,11,14,3,6:10,1:2,4:5,13]);
            xlim=15;
            x_lines=[0.5,4.5,2.5,10.4,10.6,15.5];
            l=6;
            c=1;
            no_spaltennamen={'H12-early decision and revision','H15-open cells first','H11-speeding up','H14-focus on own payoff','H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
            
        case ~isempty(strfind(cc_names{a},cluster_auswahl_name{2}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            xlim=3;
            l=0;
            c=2;
            no_spaltennamen={'H12-early decision and revision','H14-focus on own payoff','H15-open cells first'};
            
        case ~isempty(strfind(cc_names{a},cluster_auswahl_name{3}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            xlim=4;
            l=0;
            c=3;
            no_spaltennamen={'H11-speeding up','H12-early decision and revision','H14-focus on own payoff','H15-open cells first'};
            
        case ~isempty(strfind(cc_names{a},cluster_auswahl_name{4}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            xlim=7;
            l=0;
            c=4;
            no_spaltennamen={'H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H14-focus on own payoff'};
            
        case ~isempty(strfind(cc_names{a},cluster_auswahl_name{5}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            xlim=8;
            l=0;
            c=5;
            no_spaltennamen={'H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H11-speeding up','H14-focus on own payoff''H1-decision'};
            
        case ~isempty(strfind(cc_names{a},cluster_auswahl_name{6}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            xlim=5;
            l=0;
            c=6;
            no_spaltennamen={'H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
    end
    
     %ermitteln Clustergrößen und eintragen in plot
            rank_game=ranking_data.(rank_names{b});
            goodness=round(goodness_clustering{b,c+2},2);
            if s_count==6
            b=b+1;
            s_count=0;
            end
            
            
            [cluster_member,cluster_edges] = histcounts(cell2mat(rank_game(:,c+2)), size(unique(cell2mat(rank_game(:,c+2))),1)); 
            
            legend_text=cell(1,size(cluster_member,2)+1);
            for d=1:size(cluster_member,2)
            legend_text(1,d)=strcat({'\Sigma:'},{num2str(cluster_member(1,d))});
            end
            legend_text(1,d+1)=strcat({'Goodness:'},{num2str(goodness)});
    plot(new_order_hypo_erg');
    hold on;
    
    h=gca;
    h.YLim=[0,1.2];
    h.XLim=[0,xlim+1];
    set(h,'xtick',1:xlim);
    h.XTickLabel=no_spaltennamen;
    h.XTickLabelRotation=270;
    labelpoints([1:xlim], [1], point_str, 'N');
    plot([0 0] ,[0 0],'w','Visible', 'off');
    %     x_lines=[0.5,4.5,2.5,10.4,10.6,15.5];
    
    if l>0
        for l=1:6
            
            x_line=[x_lines(l),x_lines(l)];
            y_line=[0,1];
            
            y_l=line(x_line,y_line,'lineWidth', 1.5);
            switch l
                case {1,2}
                    y_l.Color='green';
                case {3,4}
                    y_l.Color='red';
                case {5,6}
                    y_l.Color='blue';
            end
            
        end
        
        labelpoints (2.5, 1.1, process_case{1}, 'N', 0.2, 1, 'FontSize', 12, 'Color', 'green');
        labelpoints (7.5, 1.1, process_case{2}, 'N', 0.2, 1, 'FontSize', 12, 'Color', 'red');
        labelpoints (13.05, 1.1, process_case{3}, 'N', 0.2, 1, 'FontSize', 12, 'Color', 'blue');
         
    end
    
    
    legend(legend_text,'Location','eastoutside');
%     legend('boxoff');
%     text([1 1],goodness,'Units','normalized');
    hold off;
    savefig(strcat(fig_name,'.fig'));
    
    %saveas(fig,fig_name, 'jpg');
    saveas(fig,fig_name, 'meta');
    close(fig);
end

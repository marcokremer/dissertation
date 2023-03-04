%plots data of type member in color, with center
load('cluster_behavior_type_match.mat');

cc_names = fieldnames(cluster_cen);
no_spaltennamen={'H12-early decision and revision','H15-open cells first','H11-speeding up','H14-focus on own payoff','H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
process_case={'info aquisation','info processing','decision making'};
cluster_auswahl_name={'ges', 'akqoZD', 'akqmZD', 'verarboZD', 'verarbmZD', 'entsch'};
% type_names=fieldnames(cluster_cen_behave_type);
rank_names=fieldnames(ranking_data);
s_count=0;
b=1;
cluster_mem_entwickl_overview=struct();
cluster_mem_entwickl=zeros(48,14);

for a=1:size(cc_names)
%     no_rel_durchschnittl_hypo_erg=bsxfun(@rdivide,cell2mat(cluster_cen.(cc_names{a})),max(cell2mat(cluster_cen.(cc_names{a})),[],1));
   no_rel_durchschnittl_hypo_erg=cell2mat(cluster_cen.(cc_names{a}));
%     max_val=round(max(cell2mat(cluster_cen.(cc_names{a}))),1);
    %     point_str=num2cell(max_val);
    fig_name=strcat('Typisierung_',cc_names{a});
    fig=figure('name',fig_name);
    
    game_name=strcat(cc_names{a}(4:10),'.php');
    switch cc_names{a}(1:2)
        case 'v1'
            dataset=ergebnisuebersicht_v1;
            
            %             for j=1:size(spielnamen)
            G = regexp(dataset.(2),game_name,'match');
            F=~cellfun('isempty', G);
            dataset=table2cell(dataset);
            dataset=dataset(:,4:end);
            %             end
            offset_r=0;
        case 'v2'
            dataset=ergebnisuebersicht_v2;
            
            %             for j=1:size(spielnamen)
            G = regexp(dataset.(2),game_name,'match');
            F=~cellfun('isempty', G);
            dataset=table2cell(dataset);
            dataset=dataset(:,4:end);
            %             end
            offset_r=16;
        case 'v3'
            
            dataset=ergebnisuebersicht_v3;
            
            %             for j=1:size(spielnamen)
            G = regexp(dataset.(2),game_name,'match');
            F=~cellfun('isempty', G);
            dataset=table2cell(dataset);
            dataset=dataset(:,4:end);
            %                 spieleranz(j+32,1)=sum(F);
            %             end
            offset_r=32;
    end
    %     fig=figure('name',fig_name);
    s_count=s_count+1;
    
    switch logical(a)
        case ~isempty(strfind(cc_names{a},cluster_auswahl_name{1}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg(:,[12,15,11,14,3,6:10,1:2,4:5,13]);
            subject_results=dataset(F,[12,15,11,14,3,6:10,1:2,4:5,13]);
            %             point_str=point_str(:,[12,15,11,14,3,6:10,1:2,4:5,13]);
            xlim=15;
            x_lines=[0.5,4.5,2.5,10.4,10.6,15.5];
            l=6;
            c=1;
            anz_typ=3;
            offset=0;
            no_spaltennamen={'H12-early decision and revision','H15-open cells first','H11-speeding up','H14-focus on own payoff','H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
            
        case ~isempty(strfind(cc_names{a},cluster_auswahl_name{2}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            subject_results=dataset(F,[12,14,15]);
            xlim=3;
            l=0;
            c=2;
            anz_typ=2;
            offset=2;
            no_spaltennamen={'H12-early decision and revision','H14-focus on own payoff','H15-open cells first'};
            
        case ~isempty(strfind(cc_names{a},cluster_auswahl_name{3}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            subject_results=dataset(F,[11,12,14,15]);
            xlim=4;
            l=0;
            c=3;
            anz_typ=1;
            offset=3;
            no_spaltennamen={'H11-speeding up','H12-early decision and revision','H14-focus on own payoff','H15-open cells first'};
            
        case ~isempty(strfind(cc_names{a},cluster_auswahl_name{4}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            subject_results=dataset(F,[3,6:10,14]);
            xlim=7;
            l=0;
            c=4;
            anz_typ=3;
            offset=3;
            no_spaltennamen={'H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H14-focus on own payoff'};
            
        case ~isempty(strfind(cc_names{a},cluster_auswahl_name{5}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            subject_results=dataset(F,[3,6:11,14]);
            xlim=8;
            l=0;
            c=5;
            anz_typ=2;
            offset=5;
            no_spaltennamen={'H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H11-speeding up','H14-focus on own payoff''H1-decision'};
            
        case ~isempty(strfind(cc_names{a},cluster_auswahl_name{6}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            subject_results=dataset(F,[1,2,4,5,13]);
            xlim=5;
            l=0;
            c=6;
            anz_typ=3;
            offset=6;
            no_spaltennamen={'H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
    end
    
    %ermitteln Clustergrößen und eintragen in plot
    rank_game=ranking_data.(rank_names{b});
    goodness=round(goodness_clustering{b,c+2},2);
    
    
    
    [cluster_member,cluster_edges] = histcounts(cell2mat(rank_game(:,c+2)), size(unique(cell2mat(rank_game(:,c+2))),1));
    typen_matrix=cluster_cen_behave_type.(cc_names{a});
    typen_matrix=typen_matrix(:,1:anz_typ);
    %     typen_matrix=unique(typen_matrix);
    
    k=zeros(max(sum(typen_matrix,1)),size(typen_matrix,2));
    for g=1:size(typen_matrix,2)
        %k: welcher Typ besetzt welche Cluster? Spalte typen_matrix=Typ,
        %Zeile typen_matrix = Cluster, find gibt die Indizes der
        %typen_matrix zurück, welche für einen Typen die Cluster
        %identifizieren.
        [k(1:sum(typen_matrix(:,g)),g),~]=find(typen_matrix(:,g));
    end
    
    
    k=unique(k,'stable');
    k=k(k>0);
    
    %Spaltenerklärung: 1-3 'ges' Typ A-C(+D-E), 4-5 'akqoZD' Typ A-B, 6
    %'akqmZD' Typ A, 7-9 'verarboZD' Typ A-C(+D-E), 10-11 'verarbmZD' Typ
    %A-B, 12-14 'entsch' Typ A-C(D-E)
    %Anmerkung: Typen D,E werden als Mischformen C zugeschlagen
    anz_cluster_mem=cluster_member(:,1:size(cluster_member,2))*typen_matrix(:,1:min(anz_typ,size(cluster_member,2)));
    
    cluster_mem_entwickl(b,s_count+offset:s_count+offset+size(anz_cluster_mem,2)-1)=sum(anz_cluster_mem,1);
    
    if s_count==6
        b=b+1;
        s_count=0;
    end
    
    
    
    new_order_hypo_erg=new_order_hypo_erg(k(1,:),:);
    typen_matrix=typen_matrix(k(1,:),:);
    %     if sum(k==0)==0
    %
    %     else
    %
    %     end
    
    typs={'A ,','B ,','C ,','? ,'};
    typss={'A','B','C','C','C'};
    legend_text=cell(1,size(new_order_hypo_erg,1)+2);
    for d=1:size(new_order_hypo_erg,1)
        if sum(typen_matrix(d,:))==0
            legend_text(1,d)=strcat({'Typ '},typs{4},{'\Sigma:'},{num2str(cluster_member(1,d))});
        else
            legend_text(1,d)=strcat({'Typ '},typs{typen_matrix(d,:)>0},{'\Sigma:'},{num2str(cluster_member(1,d))});
        end
    end
    legend_text(1,d+1)={'Centroids'};
    legend_text(1,d+2)=strcat({'Goodness:'},{num2str(goodness)});
    
    K=regexp(dataset(:,24),typss{1});
    K=~cellfun('isempty', K);
    K=K(F);
    %      X=1:15;
    %      subject_results(:,[2,7,9:11])=double(subject_results(:,[2,7,9:11]));
    ciscellclass = cellfun('isclass',subject_results,class(subject_results{1}));
    %      subject_results(~ciscellclass)=double(subject_results{1,1});
    temp_res=cell2mat(subject_results(~ciscellclass));
    temp_res=double(temp_res);
    subject_results(~ciscellclass)=num2cell(temp_res);
    max_val=round(max(cell2mat(subject_results)),1);
    point_str=num2cell(max_val);
    enhanced_subject_results=vertcat(subject_results,num2cell(new_order_hypo_erg));
    subject_results=bsxfun(@rdivide,cell2mat(subject_results),max(cell2mat(subject_results),[],1));
    enhanced_subject_results=bsxfun(@rdivide,cell2mat(enhanced_subject_results),max(cell2mat(enhanced_subject_results),[],1));
    new_order_hypo_erg=enhanced_subject_results(end-1:end,:);
    col_vec={'bo','ro','yo','mo','go'};
    %     plot_data= cell2mat(subject_results(K,:));
    plot_data= subject_results(K,:);
    handler=gobjects(1,size(subject_results,1)+size(new_order_hypo_erg,1)+1);
    handler(1:size(plot_data,1))=plot(plot_data','bo');
    type_size=zeros(1,anz_typ);
    type_size(1)=size(plot_data,1);
    hold on;
%     handler_array=handler;
    for g=2:anz_typ
        K=regexp(dataset(:,24),typss{g});
        K=~cellfun('isempty', K);
        K=K(F);
        %         plot_data= cell2mat(subject_results(K,:));
        plot_data= subject_results(K,:);
        if size(plot_data,1)>0
        type_size(g)=type_size(g-1)+size(plot_data,1);
        handler(type_size(g-1)+1:type_size(g))=plot(plot_data',col_vec{g});
        end
    end
    %     hold on;
    handler(size(subject_results,1)+1:size(subject_results,1)+size(new_order_hypo_erg,1))=plot(new_order_hypo_erg','kx','MarkerSize',5,'LineWidth',2);
    
    
    
    h=gca;
    h.YLim=[0,1.2];
    h.XLim=[0,xlim+1];
    set(h,'xtick',1:xlim);
    h.XTickLabel=no_spaltennamen;
    h.XTickLabelRotation=270;
    labelpoints([1:xlim], [1.025], point_str, 'N');
    handler(size(subject_results,1)+2)=plot([0 0] ,[0 0],'w','Visible', 'off');
    %         x_lines=[0.5,4.5,2.5,10.4,10.6,15.5];
    
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
    
   
    legend([handler(type_size(type_size>0)),handler(size(subject_results,1)+1),handler(end-1)],legend_text,'Location','eastoutside');
    %     legend('boxoff');
    %     text([1 1],goodness,'Units','normalized');
    hold off;
    savefig(strcat(fig_name,'.fig'));
    
    %saveas(fig,fig_name, 'jpg');
    saveas(fig,fig_name, 'meta');
    close(fig);
    %
    
end
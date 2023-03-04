%plot types and hypothesis values of types in a 4x4 subplot
%plot types and size of groups over games
load('cluster_behavior_type_match.mat');
load('alternative_typecasting.mat');

cc_names = fieldnames(cluster_cen);
no_spaltennamen={'H12-early decision and revision','H15-open cells first','H11-speeding up','H14-focus on own payoff','H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
no_spaltennamen_kurz={'H12','H15','H11','H14','H3','H6','H7','H8','H9','H10','H1','H2','H4','H5','H13'};

process_case={'info aquisation','info processing','decision making'};
cluster_auswahl_name={'ges', 'akqoZD', 'akqmZD', 'verarboZD', 'verarbmZD', 'entsch'};
% type_names=fieldnames(cluster_cen_behave_type);
rank_names=fieldnames(ranking_data);
s_count=0;
b=1;
cluster_mem_entwickl_overview=struct();
cluster_mem_entwickl=zeros(48,36); %6 cluster types and at max 6 behavior types
type_power=struct();
version={'v1','v2','v3'};
type_centers=struct();
for a=1:3 %Experimentversionen
    for b=1:6 %Clustertypen
        fig_name=strcat('Typen_',version{a},'_',cluster_auswahl_name{b});
    fig=figure('name',fig_name);
    cluster_name=cluster_auswahl_name{b};
        search_expression=strcat(version{a},'(\w*)',cluster_name,'(\w*)');
        G = regexp(cc_names,search_expression,'match');
        F=~cellfun('isempty', G);
        temp_cluster_list=cc_names(F);
        search_expression=strcat(version{a},'(\w*)');
        RG = regexp(rank_names,search_expression,'match');
        RF=~cellfun('isempty', RG);
        temp_rank_list=rank_names(RF);
        
        for c=1:16 %Spiele
        
    no_rel_durchschnittl_hypo_erg=bsxfun(@rdivide,cell2mat(cluster_cen.(temp_cluster_list{c})),max(cell2mat(cluster_cen.(temp_cluster_list{c})),[],1));
    no_rel_durchschnittl_hypo_erg(isnan(no_rel_durchschnittl_hypo_erg))=0;
    max_val=round(max(cell2mat(cluster_cen.(temp_cluster_list{c}))),1);
    point_str=num2cell(max_val);
%     fig_name=strcat('Typen_',temp_cluster_list{c});
    
    s_count=s_count+1;
    
    switch logical(c)
        case ~isempty(strfind(temp_cluster_list{c},cluster_auswahl_name{1}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg(:,[12,15,11,14,3,6:10,1:2,4:5,13]);
            point_str=point_str(:,[12,15,11,14,3,6:10,1:2,4:5,13]);
            xlim=15;
            x_lines=[0.5,4.5,2.5,10.4,10.6,15.5];
            l=6;
            d=1;
%             anz_typ=3;
            offset=0;
            no_spaltennamen={'H12-early decision and revision','H15-open cells first','H11-speeding up','H14-focus on own payoff','H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
            no_spaltennamen_kurz={'H12','H15','H11','H14','H3','H6','H7','H8','H9','H10','H1','H2','H4','H5','H13'};
                    
        case ~isempty(strfind(temp_cluster_list{c},cluster_auswahl_name{2}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            xlim=3;
            l=0;
            d=2;
%             anz_typ=2;
            offset=5;
            no_spaltennamen={'H12-early decision and revision','H14-focus on own payoff','H15-open cells first'};
            no_spaltennamen_kurz={'H12','H14','H15'};
        case ~isempty(strfind(temp_cluster_list{c},cluster_auswahl_name{3}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            xlim=4;
            l=0;
            d=3;
%             anz_typ=1;
            offset=10;
            no_spaltennamen={'H11-speeding up','H12-early decision and revision','H14-focus on own payoff','H15-open cells first'};
            no_spaltennamen_kurz={'H11','H12','H14','H15'};
        case ~isempty(strfind(temp_cluster_list{c},cluster_auswahl_name{4}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            xlim=7;
            l=0;
            d=4;
%             anz_typ=3;
            offset=15;
            no_spaltennamen={'H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H14-focus on own payoff'};
            no_spaltennamen_kurz={'H3','H6','H7','H8','H9','H10','H14'};
        case ~isempty(strfind(temp_cluster_list{c},cluster_auswahl_name{5}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            xlim=8;
            l=0;
            d=5;
%             anz_typ=2;
            offset=20;
            no_spaltennamen={'H3-eliminate alternatives','H6-sum EIPs','H7-heuristics used?','H8-how much heuristics used','H9-Random decision?','H10-Equilibrium decision?','H11-speeding up','H14-focus on own payoff''H1-decision'};
             no_spaltennamen_kurz={'H3','H6','H7','H8','H9','H10','H11','H14','H1'};
                    
        case ~isempty(strfind(temp_cluster_list{c},cluster_auswahl_name{6}))
            new_order_hypo_erg=no_rel_durchschnittl_hypo_erg;
            xlim=5;
            l=0;
            d=6;
%             anz_typ=3;
            offset=25;
            no_spaltennamen={'H1-decision','H2-relative payoff','H4-payoff w COMP I','H5-payoff w/o COMP I','H13-strategic EIPs+choice'};
            no_spaltennamen_kurz={'H1','H2','H4','H5','H13'};
    end
    anz_typ=6;
    
    %ermitteln Clustergrößen und eintragen in plot
    rank_game=ranking_data.(temp_rank_list{c});
%     goodness=round(goodness_clustering{b,d+2},2);
    
    
    
    [cluster_member,cluster_edges] = histcounts(cell2mat(rank_game(:,d+2)), size(unique(cell2mat(rank_game(:,d+2))),1));
%     typen_matrix=cluster_cen_behave_type.(temp_cluster_list{c}); %alt
    typen_matrix=type_cluster_match.(temp_cluster_list{c}); %neu
%     typen_matrix=typen_matrix(:,1:anz_typ);
%     typen_matrix=unique(typen_matrix);
    
    k=zeros(max(sum(typen_matrix,1)),size(typen_matrix,2));
    for g=1:size(typen_matrix,2)
        %k: welcher Typ besetzt welche Cluster? Spalte typen_matrix=Typ,
        %Zeile typen_matrix = Cluster, find gibt die Indizes der
        %typen_matrix zurück, welche für einen Typen die Cluster
        %identifizieren.
        [k(1:sum(typen_matrix(:,g)),g),~]=find(typen_matrix(:,g));
    end
    
    
%     k=unique(k,'stable');
%     k=k(k>0);
    
    %alt Erklärung Anfang
    %Spaltenerklärung: 1-3 'ges' Typ A-C(+D-E), 4-5 'akqoZD' Typ A-B, 6
    %'akqmZD' Typ A, 7-9 'verarboZD' Typ A-C(+D-E), 10-11 'verarbmZD' Typ
    %A-B, 12-14 'entsch' Typ A-C(D-E)
    %Anmerkung: Typen D,E werden als Mischformen C zugeschlagen
    %alt Erklärung Ende
    
%     anz_cluster_mem=cluster_member(:,1:size(cluster_member,2))*typen_matrix(:,1:min(anz_typ,size(cluster_member,2)));
%    anz_cluster_mem=cluster_member*typen_matrix;
%    type_power.(temp_cluster_list{c})=anz_cluster_mem;
%     anz_cluster_mem=cluster_member(k);
    
%     cluster_mem_entwickl(b,s_count+offset:s_count+offset+size(anz_cluster_mem,2)-1)=sum(anz_cluster_mem,1);
    
%     if s_count==6
%         b=b+1;
%         s_count=0;
%     end
    
%     idx_data_zero=find(sum(new_order_hypo_erg,2)==0);
    
    if max(sum(typen_matrix))>1
        type_idx=find(sum(typen_matrix,1)>1);
        ommited_cluster=zeros((sum(sum(typen_matrix(:,type_idx),1))-size(type_idx,2)),size(new_order_hypo_erg,2));
        new_order_hypo_erg_n=new_order_hypo_erg;
        
        idx_ommited_cluster=zeros((max(sum(typen_matrix(:,type_idx),1))-1),size(typen_matrix,2));
        temp_cluster_member=cluster_member;
        for p=1:size(type_idx,2)
            idx_cluster=find(typen_matrix(:,type_idx(p)));
            idx_max_clustersize=find(temp_cluster_member==max(temp_cluster_member(idx_cluster')));
%             for m=1:size(idx_max_clustersize,2)
            idx_cluster(idx_cluster==idx_max_clustersize(1,1))=[];
            ommited_cluster(p:p+size(idx_cluster,1)-1,:)=new_order_hypo_erg_n(idx_cluster,:);
            typen_matrix(idx_cluster,:)=[];
            temp_cluster_member(:,idx_cluster)=[];
            new_order_hypo_erg_n(idx_cluster,:)=[];
%             anz_cluster_mem(idx_cluster,:)=[];
            idx_ommited_cluster(1:size(idx_cluster,1),type_idx(p))=idx_cluster;
        end
%         new_order_hypo_erg_n(idx_ommited_cluster(idx_ommited_cluster>0),:)=[];
%     idx_data_zero=find(sum(new_order_hypo_erg_n,2)==0);
    idx_data_zero=find(sum(typen_matrix,1)==0);
    new_order_hypo_erg_n=typen_matrix'*new_order_hypo_erg_n;
    new_order_hypo_erg_n(idx_data_zero,:)=[];
%     typen_matrix_temp=abs(sortrows(-typen_matrix));
%     new_order_hypo_erg=new_order_hypo_erg(k(1,:),:);
    else
%     new_order_hypo_erg_n=new_order_hypo_erg;
%     idx_data_zero=find(sum(new_order_hypo_erg_n,2)==0);
    idx_data_zero=find(sum(typen_matrix,1)==0);
    new_order_hypo_erg_n=typen_matrix'*new_order_hypo_erg;
    new_order_hypo_erg_n(idx_data_zero,:)=[];
%     [~,idx_all_data_zero_ok]=find(typen_matrix(idx_data_zero,:));
    end
%     typen_matrix=typen_matrix(k(1,:),:);
%     if sum(k==0)==0
%     
%     else
%         
%     end
    
    typs={'A ,','B ,','C ,','D ,','E ,','F ,'};
%     legend_text=cell(1,size(find(sum(new_order_hypo_erg,2)),1)+1);
    legend_text=cell(1,size(new_order_hypo_erg_n,1)+1);
%     for d=1:size(new_order_hypo_erg_n,1)
%         if sum(new_order_hypo_erg_n(d,:))==0
%             legend_text(1,d)=cellstr('empty');
%         else
% %             legend_text(1,d)=strcat({'Typ '},typs{typen_matrix(d,:)>0},{'\Sigma:'},{num2str(anz_cluster_mem(1,d))});
%         legend_text(1,d)=strcat({'Typ '},typs{d},{'\Sigma:'},{num2str(anz_cluster_mem(1,d))});
%         
%         end
%     end
%     legend_text(1,end)=strcat({'Goodness:'},{num2str(goodness)});
%     legend_text=legend_text(~strcmp(legend_text', 'empty'));
%     col_vec={'b-','r-','y-','m-','g-','c-'};
       co=[      0    0.4470    0.7410;
    0.8500    0.3250    0.0980;
    0.9290    0.6940    0.1250;
    0.4940    0.1840    0.5560;
    0.4660    0.6740    0.1880;
    0.3010    0.7450    0.9330;
    0.6350    0.0780    0.1840];
    
    subplot(4,4,c);

%     if idx_data_zero>0
% %     typen_matrix(idx_data_zero,:)=[];
% typen_matrix(:,idx_data_zero)=[];
%     end
    [~,idx_types]=find(typen_matrix);
    hnd=plot(new_order_hypo_erg_n');
    set(hnd, {'color'}, num2cell(co(idx_types,:),2));
    
%     temp_new_order_hypo_erg_n=new_order_hypo_erg_n(sum(new_order_hypo_erg_n,2)>0,:);
        temp_new_order_hypo_erg_n=new_order_hypo_erg_n;
    for g=1:size(idx_types,1)
        type_centers_name=strcat(version{a},'_',cluster_auswahl_name{b},'_Type_',typs{idx_types(g)}(1,1));
        if ~isfield(type_centers,type_centers_name)
            type_centers.(type_centers_name)= temp_new_order_hypo_erg_n(g,:);
        else
            type_centers.(type_centers_name)= vertcat(type_centers.(type_centers_name), temp_new_order_hypo_erg_n(g,:));
        end
    end
% if sum(k(:,1))>0
% plot(new_order_hypo_erg(1,:)');
% end
%  
% for f=2:size(k,2)
%     if sum(k(:,f))>0
%     plot(new_order_hypo_erg(f,:)');
%     end
% end
   
    hold on;
    h=gca;
%     h.YLim=[0,1.2];
%     h.XLim=[0,xlim+1];
    set(h,'xtick',1:xlim);
    h.XTickLabel=no_spaltennamen_kurz;
    h.XTickLabelRotation=270;
%     labelpoints([1:xlim], [1], point_str, 'N');
%     plot([0 0] ,[0 0],'w','Visible', 'off');
    %     x_lines=[0.5,4.5,2.5,10.4,10.6,15.5];
    
%     if l>0
%         for l=1:6
%             
%             x_line=[x_lines(l),x_lines(l)];
%             y_line=[0,1];
%             
%             y_l=line(x_line,y_line,'lineWidth', 1.5);
%             switch l
%                 case {1,2}
%                     y_l.Color='green';
%                 case {3,4}
%                     y_l.Color='red';
%                 case {5,6}
%                     y_l.Color='blue';
%             end
%             
%         end
%         
%         labelpoints (2.5, 1.1, process_case{1}, 'N', 0.2, 1, 'FontSize', 12, 'Color', 'green');
%         labelpoints (7.5, 1.1, process_case{2}, 'N', 0.2, 1, 'FontSize', 12, 'Color', 'red');
%         labelpoints (13.05, 1.1, process_case{3}, 'N', 0.2, 1, 'FontSize', 12, 'Color', 'blue');
%         
%     end
%     
%     
%     legend(legend_text,'Location','eastoutside');
    %     legend('boxoff');
    %     text([1 1],goodness,'Units','normalized');
    col_vec_ommit={'b--','r--','y--','m--','g--','c--'};
    
    if exist('ommited_cluster', 'var')
        [~,idx_types]=find(idx_ommited_cluster);
        col_vec_ommit=num2cell(co(idx_types,:),2);
    for v=1:size(ommited_cluster,1)
        temp_col=num2cell(co(idx_types(v),:),2);
    plot(ommited_cluster(v,:),'--', 'Color', temp_col{1,1});
    end
    
%     omt=plot(ommited_cluster,'--');
%     set(omt, {'color'}, num2cell(co(idx_types,:),2));
    clear ommited_cluster;
    end
    
    hold off;
    
        end
       savefig(strcat(fig_name,'.fig'));
    
    %saveas(fig,fig_name, 'jpg');
    saveas(fig,fig_name, 'meta');
    close(fig); 
    end
end
% save('cluster_member_entwicklung.mat','cluster_mem_entwickl');
% save('type_power.mat','type_power');
save('type_centers.mat','type_centers');
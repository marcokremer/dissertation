%cluster-Zuordnung: ordnet die Clusternummern den identifizierten Typen pro
%Cluster-Typ zu.
load('cluster_erweiterte_ergebnisübersicht.mat');
% load('cluster_behavior_type_match.mat');
alternative_cast=false; %set to true if type-casting by visualized characteristica
cc_names = fieldnames(cluster_cen);
rank_names=fieldnames(ranking_data);
cut_off_distance=1.0; %über dieser distance werden die Typen unterschieden; entspricht andere Orientierung in 2 Merkmalen
cluster_cen_behave_type=struct;
cluster_auswahl_name={'ges' 'akqoZD' 'akqmZD' 'verarboZD' 'verarbmZD' 'entsch'};
cluster_distances=struct();
type_cluster_match=struct();
%cluster_cen.Spiel --> no_rel_durchschnittl_hypo_erg für relative Daten
%damit dann in Prüfung: pro Hypothese wird eine Prüfung durchgeführt, für
%ja gibt es einen Punkt. Cluster mit höchster Punktzahl bekommt
%Typenzuschlag. Typ wird in ergebnisübersicht vermerkt.
s_count=0;
b=1;
for a=1:size(cc_names)
    %     a=2;
    no_rel_durchschnittl_hypo_erg=bsxfun(@rdivide,cell2mat(cluster_cen.(cc_names{a})),max(cell2mat(cluster_cen.(cc_names{a})),[],1));
    no_rel_durchschnittl_hypo_erg(isnan(no_rel_durchschnittl_hypo_erg))=0;
    s_count=s_count+1;
    game_name=strcat(cc_names{a}(4:10),'.php');
    switch cc_names{a}(1:2)
        case 'v1'
            dataset=ergebnisuebersicht_v1;
            
            %             for j=1:size(spielnamen)
            G = regexp(dataset.(2),game_name,'match');
            F=~cellfun('isempty', G);
            dataset=table2cell(dataset);
            dataset=dataset(F,4:end);
            %             end
            offset_r=0;
        case 'v2'
            dataset=ergebnisuebersicht_v2;
            
            %             for j=1:size(spielnamen)
            G = regexp(dataset.(2),game_name,'match');
            F=~cellfun('isempty', G);
            dataset=table2cell(dataset);
            dataset=dataset(F,4:end);
            %             end
            offset_r=16;
        case 'v3'
            
            dataset=ergebnisuebersicht_v3;
            
            %             for j=1:size(spielnamen)
            G = regexp(dataset.(2),game_name,'match');
            F=~cellfun('isempty', G);
            dataset=table2cell(dataset);
            dataset=dataset(F,4:end);
            %                 spieleranz(j+32,1)=sum(F);
            %             end
            offset_r=32;
    end
    
    match_typ_a=zeros(size(cluster_cen.(cc_names{a}),1),1);
    match_typ_b=zeros(size(cluster_cen.(cc_names{a}),1),1);
    match_typ_c=zeros(size(cluster_cen.(cc_names{a}),1),1);
    
    
    if alternative_cast==false
        %     %hier neu eingefügt ein hierarchisches Clustering
        %     %     dataset=table2cell(ergebnisuebersicht_v1(:,4:18));
        %     select_dataset=dataset(F,1:15);
        %     %     select_dataset=select_dataset(F);
        %     ciscellclass = cellfun('isclass',select_dataset,class(select_dataset{1,2}));
        %     %      subject_results(~ciscellclass)=double(subject_results{1,1});
        %     temp_res=cell2mat(select_dataset(~ciscellclass));
        %     temp_res=double(temp_res);
        %     select_dataset(~ciscellclass)=num2cell(temp_res);
%             search_array=cluster_cen_behave_type.(cc_names{a});
        %     dataset(isnan(dataset))=0;
        Z=linkage(no_rel_durchschnittl_hypo_erg,'ward');
        Z_distance=pdist(no_rel_durchschnittl_hypo_erg);
        Z_distance = squareform(Z_distance);
        cluster_distances.(cc_names{a})=Z_distance;
        
        write_col=s_count; %uncomment when alternative_clustering is false
        
        %     A_overcut=zeros(size(Z_distance,1));
        %     A_overcut(Z_distance>cut_off_distance)=1;
        %     ZZ=cluster(Z,'maxclust',size(no_rel_durchschnittl_hypo_erg,1));
        %     %number_counts ist geordnet nach Eintrag 1 --> Anzahl member Cluster 1, ..., Eintrag n
        %     %--> Anzahl member Cluster n
        %     [number_counts,~]=histcounts(sort(cell2mat(dataset(:,s_count+17))),size(unique(cell2mat(dataset(:,s_count+17))),1));
        %
        %     ZZ_names=strcat('\Sigma Cluster ',num2str(ZZ),':',num2str(number_counts'));
        %     HP=dendrogram(Z,'Labels',ZZ_names);
        %
        %     %ZZ enthält die Zuweisung zu Clustern und muss nun an geeigneter Stelle
        %     %abgeschnitten werden, damit die Typenbildenden Cluster verbleiben -->
        %     %Check Dendrogram first
            
        %
    end
    
    C=strsplit(cc_names{a},'_');
    exp_name=strcat(C(2),'_',C(3));
    exp_version=C(1);
    cluster_type=C(5);
    
    %hier ist der alternative Ansatz abgebildet bei der die Typen aus
    %beobachteten (visuellen) Charakteristika abgeleitet werden
    
    
    if alternative_cast==true
        typ_a_max=0;
        typ_b_max=0;
        typ_c_max=0;
        
        switch cluster_type{1}
            case 'ges'
                write_col=1;
                for i=1:size(cluster_cen.(cc_names{a}),1)
                    typ_a=0;
                    typ_b=0;
                    typ_c=0;
                    
                    if no_rel_durchschnittl_hypo_erg(i,1)>0.75
                        typ_a=typ_a+1;
                        typ_b=typ_b+1;
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,2)>0.75
                        typ_a=typ_a+1;
                        typ_b=typ_b+1;
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,3)>0.75
                        typ_a=typ_a+1;
                    else
                        if no_rel_durchschnittl_hypo_erg(i,3)<0.25
                            typ_b=typ_b+1;
                        end
                    end
                    
                    
                    
                    if no_rel_durchschnittl_hypo_erg(i,4)>0.75
                        typ_a=typ_a+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,4)>0.5
                        typ_c=typ_c+1;
                    end
                    
                    
                    
                    if no_rel_durchschnittl_hypo_erg(i,5)>0.75
                        %
                        typ_b=typ_b+1;
                    else
                        if no_rel_durchschnittl_hypo_erg(i,5)<0.25
                            typ_a=typ_a+1;
                            typ_c=typ_c+1;
                        end
                    end
                    
                    %nicht diskriminierend
                    if no_rel_durchschnittl_hypo_erg(i,6)>0.75
                        typ_a=typ_a+1;
                        if no_rel_durchschnittl_hypo_erg(i,6)<0.25
                            typ_b=typ_b+1;
                        end
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,6)<0.5
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,7)>0.75
                        typ_a=typ_a+1;
                        %                     typ_b=typ_b+1;
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,8)>0.75
                        typ_a=typ_a+1;
                        if no_rel_durchschnittl_hypo_erg(i,8)<0.25
                            typ_b=typ_b+1;
                        end
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,8)<0.5
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,9)>0.75
                        typ_c=typ_c+1;
                        typ_b=typ_b+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,10)>0.75
                        typ_a=typ_a+1;
                        %                     typ_b=typ_b+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,11)>0.75
                        
                        typ_b=typ_b+1;
                        if no_rel_durchschnittl_hypo_erg(i,11)<0.25
                            typ_a=typ_a+1;
                        end
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,11)<0.5
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,12)>0.75
                        typ_a=typ_a+1;
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,13)>0.75
                        typ_a=typ_a+1;
                        if no_rel_durchschnittl_hypo_erg(i,13)<0.25
                            typ_b=typ_b+1;
                            typ_c=typ_c+1;
                        end
                        %                     typ_b=typ_b+1;
                    end
                    
                    
                    if no_rel_durchschnittl_hypo_erg(i,14)>0.75
                        typ_a=typ_a+1;
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,15)>0.75
                        typ_a=typ_a+1;
                        %                     typ_b=typ_b+1;
                        %                     typ_c=typ_c+1;
                    end
                    
                    if typ_a<typ_a_max
                    else
                        if typ_a==typ_a_max
                            match_typ_a(i,1)=1;
                        else
                            match_typ_a(:,1)=0;
                            match_typ_a(i,1)=1;
                        end
                        typ_a_max=typ_a;
                    end
                    
                    if typ_b<typ_b_max
                    else
                        if typ_a==typ_a_max
                            match_typ_b(i,1)=1;
                        else
                            match_typ_b(:,1)=0;
                            match_typ_b(i,1)=1;
                        end
                        typ_b_max=typ_b;
                    end
                    
                    if typ_c<typ_c_max
                    else
                        if typ_c==typ_c_max
                            match_typ_c(i,1)=1;
                        else
                            match_typ_c(:,1)=0;
                            match_typ_c(i,1)=1;
                        end
                        typ_c_max=typ_c;
                    end
                end
                
            case 'akqoZD'
                write_col=2;
                
                for i=1:size(cluster_cen.(cc_names{a}),1)
                    typ_a=0;
                    typ_b=0;
                    if no_rel_durchschnittl_hypo_erg(i,1)>0.5
                        typ_a=typ_a+1;
                        typ_b=typ_b+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,2)>0.75
                        typ_a=typ_a+1;
                    else
                        typ_b=typ_b+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,3)>0.5
                        typ_a=typ_a+1;
                    else
                        typ_b=typ_b+1;
                    end
                    
                    
                    if typ_a<typ_a_max
                    else
                        if typ_a==typ_a_max
                            match_typ_a(i,1)=1;
                        else
                            match_typ_a(:,1)=0;
                            match_typ_a(i,1)=1;
                        end
                        typ_a_max=typ_a;
                    end
                    
                    if typ_b<typ_b_max
                    else
                        if typ_a==typ_a_max
                            match_typ_b(i,1)=1;
                        else
                            match_typ_b(:,1)=0;
                            match_typ_b(i,1)=1;
                        end
                        typ_b_max=typ_b;
                    end
                end
                
            case 'akqmZD'
                write_col=3;
                
                for i=1:size(cluster_cen.(cc_names{a}),1)
                    typ_a=0;
                    
                    if no_rel_durchschnittl_hypo_erg(i,1)<0.5
                        typ_a=typ_a+1;
                        
                    end
                    if no_rel_durchschnittl_hypo_erg(i,2)>0.75
                        typ_a=typ_a+1;
                        
                    end
                    if no_rel_durchschnittl_hypo_erg(i,3)>0.75
                        typ_a=typ_a+1;
                        
                    end
                    if no_rel_durchschnittl_hypo_erg(i,4)>0.5
                        typ_a=typ_a+1;
                        
                    end
                    
                    
                    if typ_a<typ_a_max
                    else
                        if typ_a==typ_a_max
                            match_typ_a(i,1)=1;
                        else
                            match_typ_a(:,1)=0;
                            match_typ_a(i,1)=1;
                        end
                        typ_a_max=typ_a;
                    end
                    
                    
                end
                
            case 'verarboZD'
                write_col=4;
                for i=1:size(cluster_cen.(cc_names{a}),1)
                    typ_a=0;
                    typ_b=0;
                    typ_c=0;
                    
                    if no_rel_durchschnittl_hypo_erg(i,1)>0.75
                        typ_a=typ_a+1;
                    else
                        if no_rel_durchschnittl_hypo_erg(i,1)<0.25
                            typ_b=typ_b+1;
                        end
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,2)>0.75
                        typ_a=typ_a+1;
                    else
                        if no_rel_durchschnittl_hypo_erg(i,2)<0.25
                            typ_b=typ_b+1;
                        end
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,2)>0.5
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,3)>0.75
                        typ_a=typ_a+1;
                        typ_b=typ_b+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,3)>0.5
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,4)>0.75
                        typ_a=typ_a+1;
                    else
                        if no_rel_durchschnittl_hypo_erg(i,4)<0.25
                            typ_b=typ_b+1;
                        end
                    end
                    
                    
                    
                    if no_rel_durchschnittl_hypo_erg(i,5)>0.75
                        %                     typ_a=typ_a+1;
                        typ_b=typ_b+1;
                    end
                    
                    %nicht diskriminierend
                    %                 if no_rel_durchschnittl_hypo_erg(i,6)>0.5
                    %                     typ_a=typ_a+1;
                    %                     typ_b=typ_b+1;
                    %                 end
                    
                    if no_rel_durchschnittl_hypo_erg(i,6)>0.75
                        typ_a=typ_a+1;
                        %                     typ_b=typ_b+1;
                        typ_c=typ_c+1;
                    end
                    
                    if typ_a<typ_a_max
                    else
                        if typ_a==typ_a_max
                            match_typ_a(i,1)=1;
                        else
                            match_typ_a(:,1)=0;
                            match_typ_a(i,1)=1;
                        end
                        typ_a_max=typ_a;
                    end
                    
                    if typ_b<typ_b_max
                    else
                        if typ_a==typ_a_max
                            match_typ_b(i,1)=1;
                        else
                            match_typ_b(:,1)=0;
                            match_typ_b(i,1)=1;
                        end
                        typ_b_max=typ_b;
                    end
                    
                    if typ_c<typ_c_max
                    else
                        if typ_c==typ_c_max
                            match_typ_c(i,1)=1;
                        else
                            match_typ_c(:,1)=0;
                            match_typ_c(i,1)=1;
                        end
                        typ_c_max=typ_c;
                    end
                end
                
            case 'verarbmZD'
                write_col=5;
                for i=1:size(cluster_cen.(cc_names{a}),1)
                    typ_a=0;
                    typ_b=0;
                    typ_c=0;
                    
                    if no_rel_durchschnittl_hypo_erg(i,1)>0.75
                        typ_a=typ_a+1;
                    else
                        if no_rel_durchschnittl_hypo_erg(i,1)<0.25
                            typ_b=typ_b+1;
                        end
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,2)>0.75
                        typ_a=typ_a+1;
                    else
                        if no_rel_durchschnittl_hypo_erg(i,2)<0.25
                            typ_b=typ_b+1;
                        end
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,2)>0.5
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,3)>0.75
                        typ_a=typ_a+1;
                        typ_b=typ_b+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,3)>0.5
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,4)>0.75
                        typ_a=typ_a+1;
                    else
                        if no_rel_durchschnittl_hypo_erg(i,4)<0.25
                            typ_b=typ_b+1;
                        end
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,5)>0.75
                        %                     typ_a=typ_a+1;
                        typ_b=typ_b+1;
                    end
                    
                    %nicht diskriminierend
                    %                 if no_rel_durchschnittl_hypo_erg(i,6)>0.5
                    %                     typ_a=typ_a+1;
                    %                     typ_b=typ_b+1;
                    %                 end
                  
                    
                    if no_rel_durchschnittl_hypo_erg(i,7)>0.75
                        typ_a=typ_a+1;
                        %                     typ_b=typ_b+1;
                        %                     typ_c=typ_c+1;
                    end
                    
                    if typ_a<typ_a_max
                    else
                        if typ_a==typ_a_max
                            match_typ_a(i,1)=1;
                        else
                            match_typ_a(:,1)=0;
                            match_typ_a(i,1)=1;
                        end
                        typ_a_max=typ_a;
                    end
                    
                    if typ_b<typ_b_max
                    else
                        if typ_a==typ_a_max
                            match_typ_b(i,1)=1;
                        else
                            match_typ_b(:,1)=0;
                            match_typ_b(i,1)=1;
                        end
                        typ_b_max=typ_b;
                    end
                    
                    %                 if typ_c<typ_c_max
                    %                 else
                    %                     if typ_c==typ_c_max
                    %                         match_typ_c(i,1)=1;
                    %                     else
                    %                         match_typ_c(:,1)=0;
                    %                         match_typ_c(i,1)=1;
                    %                     end
                    %                     typ_c_max=typ_c;
                    %                 end
                end
            case 'entsch'
                write_col=6;
                for i=1:size(cluster_cen.(cc_names{a}),1)
                    typ_a=0;
                    typ_b=0;
                    typ_c=0;
                    
                     %nicht diskriminierend
                    %                 if no_rel_durchschnittl_hypo_erg(i,1)>0.5
                    %                     typ_a=typ_a+1;
                    %                     typ_b=typ_b+1;
%                                         typ_c=typ_c+1;
                    %                 end
                    
                    if no_rel_durchschnittl_hypo_erg(i,2)>0.75
                        typ_a=typ_a+1;
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,2)>0.5
                        typ_b=typ_b+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,3)>0.75
                        typ_a=typ_a+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,4)>0.75
                        typ_a=typ_a+1;
                    else
                        if no_rel_durchschnittl_hypo_erg(i,4)<0.5
                            typ_b=typ_b+1;
                        end
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,4)>0.5
                        typ_c=typ_c+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,5)>0.75
                        %                     typ_a=typ_a+1;
                        typ_b=typ_b+1;
                    end
                    
                    if no_rel_durchschnittl_hypo_erg(i,6)<0.25
                        %                     typ_a=typ_a+1;
                        typ_b=typ_b+1;
                    end
                    
                    if typ_a<typ_a_max
                    else
                        if typ_a==typ_a_max
                            match_typ_a(i,1)=1;
                        else
                            match_typ_a(:,1)=0;
                            match_typ_a(i,1)=1;
                        end
                        typ_a_max=typ_a;
                    end
                    
                    if typ_b<typ_b_max
                    else
                        if typ_a==typ_a_max
                            match_typ_b(i,1)=1;
                        else
                            match_typ_b(:,1)=0;
                            match_typ_b(i,1)=1;
                        end
                        typ_b_max=typ_b;
                    end
                    
                    if typ_c<typ_c_max
                    else
                        if typ_c==typ_c_max
                            match_typ_c(i,1)=1;
                        else
                            match_typ_c(:,1)=0;
                            match_typ_c(i,1)=1;
                        end
                        typ_c_max=typ_c;
                    end
                end
        end
        
        
        
        BC=cell(sum(F),1);
        
        
        
        
        
        if sum(match_typ_c)>0 && size(match_typ_c,1)>2 && ~(strcmp(cluster_type,'akmZD'))
            for i=1:size(find(match_typ_c))
                k=find(match_typ_c);
                AB=cell2mat(dataset(:,write_col+17));
                
                BC(AB==k(i),1)=cellstr(deal('C'));
                %             dataset(dataset{F,write_col+17}==k(i))='C';
            end
            
        end
        
        if sum(match_typ_b)>0 && ~(strcmp(cluster_type,'akmZD'))
            for i=1:size(find(match_typ_b))
                k=find(match_typ_b);
                AB=cell2mat(dataset(:,write_col+17));
                
                BC(AB==k(i),1)=cellstr(deal('B'));
            end
        end
        
        for i=1:size(find(match_typ_a))
            k=find(match_typ_a);
            AB=cell2mat(dataset(:,write_col+17));
            
            BC(AB==k(i),1)=cellstr(deal('A'));
            %         cluster_cen_behave_type.(cc_names{a})(k(i),1)='A';
        end
        
        if s_count==1
            all_cluster_types=BC;
            %         clear BC;
        else
            all_cluster_types=[all_cluster_types,BC];
            %         clear BC;
        end
        
        if s_count==6
            %          CG=sum(F);
            if b==1
                all_cluster_games=all_cluster_types;
            else
                
                all_cluster_games=[all_cluster_games;all_cluster_types];
            end
            
            
            if b==16
                switch exp_version{1}
                    case 'v1'
                        ergebnisuebersicht_v1=horzcat(ergebnisuebersicht_v1,cell2table(all_cluster_games,'VariableNames',cluster_auswahl_name));
                        
                    case 'v2'
                        ergebnisuebersicht_v2=horzcat(ergebnisuebersicht_v2,cell2table(all_cluster_games,'VariableNames',cluster_auswahl_name));
                        
                    case 'v3'
                        
                        ergebnisuebersicht_v3=horzcat(ergebnisuebersicht_v3,cell2table(all_cluster_games,'VariableNames',cluster_auswahl_name));
                        
                end
                b=0;
            end
            
            b=b+1;
            s_count=0;
        end
        
    end
    %Begin Typecast via pdist (alternative typecast=false)
    if alternative_cast==false
        %     k_a=find(match_typ_a); %welches Cluster (=Index array) ist als Typ A identifiziert?
        %     k_b=find(match_typ_b);
        %     k_c=find(match_typ_c);
        %
        %     for k=1:size(cluster_cen.(cc_names{a}),1)
        %
        %         switch k
        %             case 1
        %                 k_s=k_a;
        %             case 2
        %                 k_s=k_b;
        %             case 3
        %                 k_s=k_c;
        %
        %         end
        %
        %         for l=1:size(k_a,1)
        %
        %
        %
        %             if(~isempty(find(Z_distance(k_a(l),:)>cutoff_distance,1)))
        %                 other_types=true;
        %             else
        %                 match_typ_a(match_typ_a<1)=1;
        %             end
        %
        %             if(other_types)
        %                 B=find(k_s==k_b);
        %                 C=find(k_s==k_c);
        %             end
        %
        %             if(~isempty(B))
        %
        %             else
        %                 match_typ_b(B)=1;
        %             end
        %
        %             if(~isempty(C))
        %
        %             else
        %                 match_typ_c(C)=1;
        %             end
        %
        %             Z_distance(k_s)=0;
        %         end
        %
        %     end
        
        Typ_matrix=cell(size(Z_distance,1),1);
        A_overcut=zeros(size(Z_distance,1));
        
        for k=1:size(Z_distance,1)
            
            A_overcut(Z_distance>cut_off_distance)=1;
            Typ_matrix(find(A_overcut,1))=cellstr(strcat('Typ',num2str(k)));
            Typ_matrix(~(find(A_overcut,1)))=cellstr(strcat('Typ',num2str(k+1)));
            
            if sum(A_overcut(k,k:end))>0
                Typ_matrix(k,1)=cellstr(strcat('Typ',num2str(k)));
            else
                Typ_matrix(k:end,1)=cellstr(strcat('Typ',num2str(k)));
                break;
            end
            %         A_overcut(k,:)=[];
            %         A_overcut(:,k)=[];
        end
        type_cluster_match.(cc_names{a})=Typ_matrix;
    end
    
    %End Typecast via pdist (alternative typecast=false)
        cluster_cen_behave_type.(cc_names{a})=[match_typ_a, match_typ_b, match_typ_c];
end
save('cluster_distances.mat','cluster_distances','type_cluster_match');
% save('cluster_behavior_type_match.mat', 'ergebnisuebersicht_v1', 'ergebnisuebersicht_v2', 'ergebnisuebersicht_v3', 'goodness_clustering', 'corr_data', 'proxi_data', 'ranking_data','cluster_cen', 'cluster_cen_behave_type');

%find similar types among players
load('alternative_typecasting.mat');
load('cluster_behavior_type_match.mat');
type_cluster_names = fieldnames(type_cluster_match);
cluster_auswahl_name={'ges', 'akqoZD', 'akqmZD', 'verarboZD', 'verarbmZD', 'entsch'};
version={'v1','v2','v3'};
for i=1:3 %loop Experimentversionen
    switch i
        case 1
            dataset=ergebnisuebersicht_v1;
            
        case 2
            dataset=ergebnisuebersicht_v2;
            
        case 3
            
            dataset=ergebnisuebersicht_v3;
    end
    
    for j=1:16 %loop Spiele
        Exp_name_list=unique(dataset.(2));
        
        G = regexp(dataset.(2),Exp_name_list{j},'match');
        F=~cellfun('isempty', G);
        
        
        for k=1:6 %Clustertypen
            dataset_game_cluster=(dataset{F,20+k});
            dataset_game_type=(dataset{F,26+k});
            search_exp=strcat(version{i},'_',Exp_name_list{j}(1:7),'CC_',cluster_auswahl_name{k});
            ST=regexp(type_cluster_names,search_exp,'match');
            idx_ST=~cellfun('isempty', ST);
            temp_type_cluster_names=type_cluster_names{idx_ST};
            typen_matrix=type_cluster_match.(temp_type_cluster_names);
            for l=1:size(typen_matrix,1) %size(typen_matrix,1) should be equal to size(unique(dataset_game_cluster)) 
            type=char(find(typen_matrix(l,:))+64);
            dataset_game_type(dataset_game_cluster==l)=cellstr(type);
            end
            dataset(F,26+k)=cell2table(dataset_game_type);
        end
    end
    %proceeding
    %1.wähle aus Datensätze zu einem Spiel
    %2.wähle aus Typenmatrix zu einem Spiel und einem clustertyp
    %3.bestimme Typ über Typenmatrix
    %4.schreibe Ergebnis in Tabelle
  switch i
        case 1
            ergebnisuebersicht_v1=dataset;
            
        case 2
            ergebnisuebersicht_v2=dataset;
            
        case 3
            
            ergebnisuebersicht_v3=dataset;
  end
end
save('cluster_type_match_ergebnisübersicht.mat', 'ergebnisuebersicht_v1', 'ergebnisuebersicht_v2', 'ergebnisuebersicht_v3');

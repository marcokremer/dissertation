%ermittelt die Wechselrate der Typen unter den Spielern
load('cluster_type_match_ergebnisübersicht.mat');
cluster_auswahl_name={'ges', 'akqoZD', 'akqmZD', 'verarboZD', 'verarbmZD', 'entsch'};
version={'v1','v2','v3'};

co=[      0    0.4470    0.7410;
    0.8500    0.3250    0.0980;
    0.9290    0.6940    0.1250;
    0.4940    0.1840    0.5560;
    0.4660    0.6740    0.1880;
    0.3010    0.7450    0.9330;
    0.6350    0.0780    0.1840];
compl_vec=num2cell([2 3 4 5 2 3 4 5 2 3 4 5 2 3 4 5]);
time_vec={'ineffective', 'moderate', 'tough', 'severe', 'ineffective', 'moderate', 'tough', 'severe','ineffective', 'moderate', 'tough', 'severe','ineffective', 'moderate', 'tough', 'severe' };
compl_time_vec=[compl_vec;time_vec];
order_vec=[1:16;1,5,9,13,2,6,10,14,3,7,11,15,4,8,12,16]';
label={'Complexity','Time_Limit'};
compl_txt_vec={'level 2','level 3','level 4','level 5'};
all_wechsel=struct();
all_bleiben=struct();

zahl_name=ergebnisuebersicht_v1.(3)(1);
% k_name='K';


for i=1:3 %loop Experimentversionen
    switch i
        case 1
            data_set=horzcat(ergebnisuebersicht_v1,cell2table(cell(size(ergebnisuebersicht_v1,1),2)));
        case 2
            data_set=horzcat(ergebnisuebersicht_v2,cell2table(cell(size(ergebnisuebersicht_v2,1),2)));
        case 3
            data_set=horzcat(ergebnisuebersicht_v3,cell2table(cell(size(ergebnisuebersicht_v3,1),2)));
    end
    
    game_list=unique(data_set(:,2));
    
    for f=1:size(data_set,1) %Namenänderungen in temporärem Datensatz sind nötig um Suchfunktion zu unterstützen
        if strcmp(data_set.(3)(f),zahl_name)
            data_set.(3)(f)=cellstr('AAZahl');
        end
        
        if strcmp(data_set.(3)(f),'K')
            data_set.(3)(f)=cellstr('K_name');
        end
        
        if strcmp(data_set.(3)(f),'in')
            data_set.(3)(f)=cellstr('in_name');
        end
        
        exp_name=data_set.(2){f,1};
        switch exp_name
            case game_list{1,1}
                data_set.(33)(f)=num2cell(order_vec(1,1));
                data_set.(34)(f)=num2cell(order_vec(1,2));
            case game_list{2,1}
                data_set.(33)(f)=num2cell(order_vec(2,1));
                data_set.(34)(f)=num2cell(order_vec(2,2));
            case game_list{3,1}
                data_set.(33)(f)=num2cell(order_vec(3,1));
                data_set.(34)(f)=num2cell(order_vec(3,2));
            case game_list{4,1}
                data_set.(33)(f)=num2cell(order_vec(4,1));
                data_set.(34)(f)=num2cell(order_vec(4,2));
            case game_list{5,1}
                data_set.(33)(f)=num2cell(order_vec(5,1));
                data_set.(34)(f)=num2cell(order_vec(5,2));
            case game_list{6,1}
                data_set.(33)(f)=num2cell(order_vec(6,1));
                data_set.(34)(f)=num2cell(order_vec(6,2));
            case game_list{7,1}
                data_set.(33)(f)=num2cell(order_vec(7,1));
                data_set.(34)(f)=num2cell(order_vec(7,2));
            case game_list{8,1}
                data_set.(33)(f)=num2cell(order_vec(8,1));
                data_set.(34)(f)=num2cell(order_vec(8,2));
            case game_list{9,1}
                data_set.(33)(f)=num2cell(order_vec(9,1));
                data_set.(34)(f)=num2cell(order_vec(9,2));
            case game_list{10,1}
                data_set.(33)(f)=num2cell(order_vec(10,1));
                data_set.(34)(f)=num2cell(order_vec(10,2));
            case game_list{11,1}
                data_set.(33)(f)=num2cell(order_vec(11,1));
                data_set.(34)(f)=num2cell(order_vec(11,2));
            case game_list{12,1}
                data_set.(33)(f)=num2cell(order_vec(12,1));
                data_set.(34)(f)=num2cell(order_vec(12,2));
            case game_list{13,1}
                data_set.(33)(f)=num2cell(order_vec(13,1));
                data_set.(34)(f)=num2cell(order_vec(13,2));
            case game_list{14,1}
                data_set.(33)(f)=num2cell(order_vec(14,1));
                data_set.(34)(f)=num2cell(order_vec(14,2));
            case game_list{15,1}
                data_set.(33)(f)=num2cell(order_vec(15,1));
                data_set.(34)(f)=num2cell(order_vec(15,2));
            case game_list{16,1}
                data_set.(33)(f)=num2cell(order_vec(16,1));
                data_set.(34)(f)=num2cell(order_vec(16,2));
        end
        
    end
    
    for n=1:2 %Perspektiven
        
        spieler_list=unique(data_set(:,3));
        
        max(cellfun(@uint8,sort(unique(data_set{:,29}))));
        
        tabelle_bleiben_ges=zeros(16,max(cellfun(@uint8,sort(unique(data_set{:,27}))))-64);
        tabelle_wechsel_ges=tabelle_bleiben_ges;
        tabelle_bleiben_acoZD=zeros(16,max(cellfun(@uint8,sort(unique(data_set{:,28}))))-64);
        tabelle_wechsel_acoZD=tabelle_bleiben_acoZD;
        tabelle_bleiben_acmZD=zeros(16,max(cellfun(@uint8,sort(unique(data_set{:,29}))))-64);
        tabelle_wechsel_acmZD=tabelle_bleiben_acmZD;
        tabelle_bleiben_verarboZD=zeros(16,max(cellfun(@uint8,sort(unique(data_set{:,30}))))-64);
        tabelle_wechsel_verarboZD=tabelle_bleiben_verarboZD;
        tabelle_bleiben_verarbmZD=zeros(16,max(cellfun(@uint8,sort(unique(data_set{:,31}))))-64);
        tabelle_wechsel_verarbmZD=tabelle_bleiben_verarbmZD;
        tabelle_bleiben_entsch=zeros(16,max(cellfun(@uint8,sort(unique(data_set{:,32}))))-64);
        tabelle_wechsel_entsch=tabelle_bleiben_entsch;
        tabelle_wechsel_list=table(tabelle_wechsel_ges,tabelle_wechsel_acoZD,tabelle_wechsel_acmZD,tabelle_wechsel_verarboZD,tabelle_wechsel_verarbmZD,tabelle_wechsel_entsch);
        tabelle_bleiben_list=table(tabelle_bleiben_ges,tabelle_bleiben_acoZD,tabelle_bleiben_acmZD,tabelle_bleiben_verarboZD,tabelle_bleiben_verarbmZD,tabelle_bleiben_entsch);
        
        
        %     spieler_list=unique(data_set(:,3));
        
        for j=1:size(spieler_list,1)
            %         char_data=cellfun(@char,data_set.(3),'UniformOutput',false);
            G = regexp(data_set.(3),spieler_list{j,1},'match');
            % G = regexp(char_data,spieler_list{j,1},'match');
            F=~cellfun('isempty', G);
            dataset_game_spieler=(data_set{F,[2:3,27:34]});
            dataset_game_spieler=sortrows(dataset_game_spieler,8+n);
            m=0;
            for k=1:size(dataset_game_spieler,1)-1
                m=m+1;
                if k<size(dataset_game_spieler,1) && strcmp(dataset_game_spieler(k,1),dataset_game_spieler(k+1,1))
                    m=m-1;
                else
                    for l=1:6
                        type=uint8(dataset_game_spieler{k,l+2})-64;
                        if strcmp(dataset_game_spieler(k+1,l+2),dataset_game_spieler(k,l+2))
                            tabelle_bleiben_list.(l)(m,type)=tabelle_bleiben_list.(l)(m,type)+1;
                        else
                            tabelle_wechsel_list.(l)(m,type)=tabelle_wechsel_list.(l)(m,type)+1; %sind nur 16 Zeilen lang
                        end
                    end
                end
            end
        end
        
        for l=1:6
            struct_field_title=strcat(version{i},'_',label{n},'_',cluster_auswahl_name{l});
            all_wechsel.(struct_field_title)=tabelle_wechsel_list.(l);
            all_bleiben.(struct_field_title)=tabelle_bleiben_list.(l);
        end
    end
end
save('alle_typen_wechsel_und_bleiben.mat', 'all_wechsel', 'all_bleiben');

%Darstellung Entwicklung von Wechseln und Bleiben in Boxplot-Diagrammen
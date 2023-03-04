%Korreliert die Ergebnisse der Spieler für die 15 Hypothesen pro Spiel
%miteinander. Korrelationen werden in eine Korrelationsmatrix geschrieben.
%Am Ende besteht pro Spiel eine Korrelationsmatrix (in Summe 16 pro
%Experimentversion). Davon kann mittels einer Heatmap Gruppierungen
%abgeleitet werden aufgrund ähnlichem Verhalten).
load('ergebnisübersicht_spieler_für_alle_hypothesen.mat');

corr_data=struct();
proxi_data=struct();
goodness_clustering=cell(48,8);
cluster_cen=struct();
cluster_auswahl_name={'ges', 'akqoZD', 'akqmZD', 'verarboZD', 'verarbmZD', 'entsch'};
% ranking_data=struct();
for i=1:3 %loop Experimentversionen
    switch i
        case 1
            dataset=ergebnisuebersicht_v1;
            
        case 2
            dataset=ergebnisuebersicht_v2;
            
        case 3
            
            dataset=ergebnisuebersicht_v3;
            
    end
    
    ranking_overview=cell(size(dataset,1),8);
    %     map_h = [1,0,0 %rot
    %             1,1/2,0 %orange
    %             1, 1, 0 %gelb
    %             1/2,1,0
    %             0, 1, 0 %grün
    %             ];
    %     cm=colormap(map_h);
    for j=1:16 %loop Spiele
        Exp_name_list=unique(dataset.(2));
        
        G = regexp(dataset.(2),Exp_name_list{j},'match');
        F=~cellfun('isempty', G);
        dataset_game_ges=(dataset{F,4:18})';
        dataset_game_Akquise_o_Zeitdruck=(dataset{F,[15,17:18]})';
        dataset_game_Akquise_m_Zeitdruck=(dataset{F,[14:15,17:18]})';
        dataset_game_Verarbeitung_o_Zeitdruck=(dataset{F,[6,9:12,17]})';
        dataset_game_Verarbeitung_m_Zeitdruck=(dataset{F,[6,9:12,14,17]})';
        dataset_game_Entscheidung=(dataset{F,[13,4:5,7:8,16]})';
        
        goodness_clustering((i-1)*16+j,1:2)=[dataset{1,1},Exp_name_list{j}];
        adjusted_game_ges=dataset_game_ges;
        proxi_game_ges=zeros(size(adjusted_game_ges));
        
        if sum(sum(isnan(dataset_game_ges)))>0
            
            delta_game_ges=double(~isnan(dataset_game_ges));
            
            for f=1:15
                switch f
                    case {1,7,9,10,15}%: Binary cases - no adjustment necessary
                        %                 case 7
                        %                 case 9
                        %                 case 10
                        %                 case 15
                    otherwise %verhältnisskalierte Cases - adjustment necessary
                        [~,~,adjusted_game_ges(f,:)]=unique(adjusted_game_ges(f,:));
                end
            end
            
            
            
            %         Berechnung der Abstandsmatrix (Proxi) zwischen den Spielern
            %         mithilfe von adjusted und delta matrizen
            adjusted_game_Akquise_o_Zeitdruck=adjusted_game_ges([12,14:15],[1:end]);
            adjusted_game_Akquise_m_Zeitdruck=adjusted_game_ges([11:12,14:15],[1:end]);
            adjusted_game_Verarbeitung_o_Zeitdruck=adjusted_game_ges([3,6:9,14],[1:end]);
            adjusted_game_Verarbeitung_m_Zeitdruck=adjusted_game_ges([3,6:9,11,14],[1:end]);
            adjusted_game_Entscheidung=adjusted_game_ges([10,1,2,4,5,13],1:end);
            
            delta_game_Akquise_o_Zeitdruck=delta_game_ges([12,14:15],[1:end]);
            delta_game_Akquise_m_Zeitdruck=delta_game_ges([11:12,14:15],[1:end]);
            delta_game_Verarbeitung_o_Zeitdruck=delta_game_ges([3,6:9,14],[1:end]);
            delta_game_Verarbeitung_m_Zeitdruck=delta_game_ges([3,6:9,11,14],[1:end]);
            delta_game_Entscheidung=delta_game_ges([10,1,2,4,5,13],1:end);
            
%             dataset_game_ges=adjusted_game_ges.*delta_game_ges;
%             dataset_game_Akquise_o_Zeitdruck=adjusted_game_Akquise_o_Zeitdruck.*delta_game_Akquise_o_Zeitdruck;
%             dataset_game_Akquise_m_Zeitdruck=adjusted_game_Akquise_m_Zeitdruck.*delta_game_Akquise_m_Zeitdruck;
%             dataset_game_Verarbeitung_o_Zeitdruck=adjusted_game_Verarbeitung_o_Zeitdruck.*delta_game_Verarbeitung_o_Zeitdruck;
%             dataset_game_Verarbeitung_m_Zeitdruck=adjusted_game_Verarbeitung_m_Zeitdruck.*delta_game_Verarbeitung_m_Zeitdruck;
%             dataset_game_Entscheidung=adjusted_game_Entscheidung.*delta_game_Entscheidung;
%             
            dataset_game_ges(isnan(dataset_game_ges))=0;
            dataset_game_Akquise_o_Zeitdruck(isnan(dataset_game_Akquise_o_Zeitdruck))=0;
            dataset_game_Akquise_m_Zeitdruck(isnan(dataset_game_Akquise_m_Zeitdruck))=0;
            dataset_game_Verarbeitung_o_Zeitdruck(isnan(dataset_game_Verarbeitung_o_Zeitdruck))=0;
            dataset_game_Verarbeitung_m_Zeitdruck(isnan(dataset_game_Verarbeitung_m_Zeitdruck))=0;
            dataset_game_Entscheidung(isnan(dataset_game_Entscheidung))=0;
            
            
            
            %                             proxi_game_Akquise_o_Zeitdruck=diag(ones(size(adjusted_game_ges,2),1));
            %                             proxi_game_Akquise_m_Zeitdruck=diag(ones(size(adjusted_game_ges,2),1));
            %                             proxi_game_Verarbeitung_o_Zeitdruck=diag(ones(size(adjusted_game_ges,2),1));
            %                             proxi_game_Verarbeitung_m_Zeitdruck=diag(ones(size(adjusted_game_ges,2),1));
            %                             proxi_game_Entscheidung=diag(ones(size(adjusted_game_ges,2),1));
            
            for g=1:size(adjusted_game_ges,2)
                for e=g+1:size(adjusted_game_ges,2)
                    %                 d_teil=0;
                    %if g+1>size(adjusted_game_ges,2)
                    %                 else
                    for f=1:15
                        switch f
                            case {1,7,9,10,15}%: Binary cases
                                if adjusted_game_ges(f,g)==adjusted_game_ges(f,e) %wenn Beobachtung gleich, dann kein Abstandsbeitrag (d=0 und damit die Teilsumme)
                                    %d_teil=0;
                                else
                                    %d_teil=1;
                                    proxi_game_ges(g,e)=proxi_game_ges(g,e)+delta_game_ges(f,e)*delta_game_ges(f,g)/sum(delta_game_ges(f,:));
                                end
                                %                             case 7
                                %                             case 9
                                %                             case 10
                                %                             case 15
                            otherwise %verhältnisskalierte Cases
                                proxi_game_ges(g,e)=proxi_game_ges(g,e)+abs(adjusted_game_ges(f,g)-adjusted_game_ges(f,e))/(sum(delta_game_ges(f,:))*range(adjusted_game_ges(f,:)));
                        end
                    end
                    %end
                    proxi_game_ges(e,g)=proxi_game_ges(g,e);
                end
            end
        end
        
        
        %match aller Spieler und Berechnung Korrelation des Gesamtprozesses
        %und der Prozessanteile Informationsakquise (ohne Zeitdruck:
        %Hypothesen 12,14,15 / mit Zeitdruck: 11,12,14,15),
        %Informationsverarbeitung (ohne Zeitdruck: 3,6-10,14 / mit
        %Zeitdruck: 3,6-11,14) und Entscheidung (1,2,4,5,13)
        
        %Gesamt
        CorrMatrix_ges=corrcoef(dataset_game_ges,'rows','pairwise');
        fig_e=figure;
        h=histogram(CorrMatrix_ges,5);
        counts=h.Values;
        close(fig_e);
        anz_cluster=min(size(counts(counts>0),2),size(dataset_game_ges,1)-1);
        %anz_cluster=min(size(counts(counts>0),2),size(proxi_game_ges,1)-1); %min anz hist_bins,anz_spiele_im_Datenset-1
        s_max=0;
        cluster_min=2;
        while s_max<0.5 && anz_cluster<10
            for cluster_count=cluster_min:anz_cluster
                
                [idx_val,cluster_center]=kmeans(dataset_game_ges',cluster_count,'replicates',5,'display','final');
                %idx_ges_proxi=kmeans(proxi_game_ges,anz_cluster,'replicates',5,'display','final');
                %Güte Clusterergebnis berechnen (nach Kaufman, Rouseeuw 1990)
                s_vec=silhouette(dataset_game_ges',idx_val);
                s_mean=mean(s_vec);
                if s_mean>s_max
                    idx_ges=idx_val;
                    cc_ges=cluster_center;
                    s_max=s_mean;
                end
            end
            cluster_min=anz_cluster+1;
            anz_cluster=anz_cluster+1;
        end
        goodness_clustering((i-1)*16+j,3)=num2cell(s_max);
%         cluster
        
        %Akquise_o_Zeitdruck
        CorrMatrix_Akquise_o_Zeitdruck=corrcoef(dataset_game_Akquise_o_Zeitdruck,'rows','pairwise');
        fig_e=figure;
        h=histogram(CorrMatrix_Akquise_o_Zeitdruck,5);
        counts=h.Values;
        close(fig_e);
        anz_cluster=min(size(counts(counts>0),2),size(dataset_game_Akquise_o_Zeitdruck,1)-1);
        s_max=0;
        cluster_min=2;
        while s_max<0.5 && anz_cluster<10
            for cluster_count=cluster_min:anz_cluster
                
                [idx_val,cluster_center]=kmeans(dataset_game_Akquise_o_Zeitdruck',cluster_count,'replicates',5,'display','final');
                %idx_ges_proxi=kmeans(proxi_game_ges,anz_cluster,'replicates',5,'display','final');
                %Güte Clusterergebnis berechnen (nach Kaufman, Rouseeuw 1990)
                s_vec=silhouette(dataset_game_Akquise_o_Zeitdruck',idx_val);
                s_mean=mean(s_vec);
                if s_mean>s_max
                    idx_Akquise_o_Zeitdruck=idx_val;
                    cc_Akquise_o_Zeitdruck=cluster_center;
                    s_max=s_mean;
                end
            end
            cluster_min=anz_cluster+1;
            anz_cluster=anz_cluster+1;
            
            
        end
        goodness_clustering((i-1)*16+j,4)=num2cell(s_max);
        
        %Akquise_m_Zeitdruck
        CorrMatrix_Akquise_m_Zeitdruck=corrcoef(dataset_game_Akquise_m_Zeitdruck,'rows','pairwise');
        fig_e=figure;
        h=histogram(CorrMatrix_Akquise_m_Zeitdruck,5);
        counts=h.Values;
        close(fig_e);
        anz_cluster=min(size(counts(counts>0),2),size(dataset_game_Akquise_m_Zeitdruck,1)-1);
        s_max=0;
        cluster_min=2;
        while s_max<0.5 && anz_cluster<10
            for cluster_count=cluster_min:anz_cluster
                [idx_val,cluster_center]=kmeans(dataset_game_Akquise_m_Zeitdruck',cluster_count,'replicates',5,'display','final');
                %idx_ges_proxi=kmeans(proxi_game_ges,anz_cluster,'replicates',5,'display','final');
                %Güte Clusterergebnis berechnen (nach Kaufman, Rouseeuw 1990)
                s_vec=silhouette(dataset_game_Akquise_m_Zeitdruck',idx_val);
                s_mean=mean(s_vec);
                if s_mean>s_max
                    idx_Akquise_m_Zeitdruck=idx_val;
                    cc_Akquise_m_Zeitdruck=cluster_center;
                    s_max=s_mean;
                end
                %if cluster_count==anz_cluster-1 &&
                
                %end
            end
            cluster_min=anz_cluster+1;
            anz_cluster=anz_cluster+1;
            
        end
        goodness_clustering((i-1)*16+j,5)=num2cell(s_max);
        
        %Verarbeitung_o_Zeitdruck
        CorrMatrix_Verarbeitung_o_Zeitdruck=corrcoef(dataset_game_Verarbeitung_o_Zeitdruck,'rows','pairwise');
        fig_e=figure;
        h=histogram(CorrMatrix_Verarbeitung_o_Zeitdruck,5);
        counts=h.Values;
        close(fig_e);
        anz_cluster=min(size(counts(counts>0),2),size(dataset_game_Verarbeitung_o_Zeitdruck,1)-1);
        s_max=0;
        cluster_min=2;
        while s_max<0.5 && anz_cluster<10
            for cluster_count=cluster_min:anz_cluster
                [idx_val,cluster_center]=kmeans(dataset_game_Verarbeitung_o_Zeitdruck',cluster_count,'replicates',5,'display','final');
                %idx_ges_proxi=kmeans(proxi_game_ges,anz_cluster,'replicates',5,'display','final');
                %Güte Clusterergebnis berechnen (nach Kaufman, Rouseeuw 1990)
                s_vec=silhouette(dataset_game_Verarbeitung_o_Zeitdruck',idx_val);
                s_mean=mean(s_vec);
                if s_mean>s_max
                    idx_Verarbeitung_o_Zeitdruck=idx_val;
                    cc_Verarbeitung_o_Zeitdruck=cluster_center;
                    s_max=s_mean;
                end
            end
            cluster_min=anz_cluster+1;
            anz_cluster=anz_cluster+1;
            
            
        end
        goodness_clustering((i-1)*16+j,6)=num2cell(s_max);
        
        %Verarbeitung_m_Zeitdruck
        CorrMatrix_Verarbeitung_m_Zeitdruck=corrcoef(dataset_game_Verarbeitung_m_Zeitdruck,'rows','pairwise');
        fig_e=figure;
        h=histogram(CorrMatrix_Verarbeitung_m_Zeitdruck,5);
        counts=h.Values;
        close(fig_e);
        anz_cluster=min(size(counts(counts>0),2),size(dataset_game_Verarbeitung_m_Zeitdruck,1)-1);
        s_max=0;
        cluster_min=2;
        while s_max<0.5 && anz_cluster<10
            for cluster_count=cluster_min:anz_cluster
                [idx_val,cluster_center]=kmeans(dataset_game_Verarbeitung_m_Zeitdruck',cluster_count,'replicates',5,'display','final');
                %idx_ges_proxi=kmeans(proxi_game_ges,anz_cluster,'replicates',5,'display','final');
                %Güte Clusterergebnis berechnen (nach Kaufman, Rouseeuw 1990)
                s_vec=silhouette(dataset_game_Verarbeitung_m_Zeitdruck',idx_val);
                s_mean=mean(s_vec);
                if s_mean>s_max
                    idx_Verarbeitung_m_Zeitdruck=idx_val;
                    cc_Verarbeitung_m_Zeitdruck=cluster_center;
                    s_max=s_mean;
                end
            end
            cluster_min=anz_cluster+1;
            anz_cluster=anz_cluster+1;
            
            
        end
        goodness_clustering((i-1)*16+j,7)=num2cell(s_max);
        
        %Entscheidung
        CorrMatrix_Entscheidung=corrcoef(dataset_game_Entscheidung,'rows','pairwise');
        fig_e=figure;
        h=histogram(CorrMatrix_Entscheidung,5);
        counts=h.Values;
        close(fig_e);
        anz_cluster=min(size(counts(counts>0),2),size(dataset_game_Entscheidung,1));
        s_max=0;
        cluster_min=2;
        while s_max<0.5 && anz_cluster<10
            for cluster_count=cluster_min:anz_cluster
                [idx_val,cluster_center]=kmeans(dataset_game_Entscheidung',cluster_count,'replicates',5,'display','final');
                %idx_ges_proxi=kmeans(proxi_game_ges,anz_cluster,'replicates',5,'display','final');
                %Güte Clusterergebnis berechnen (nach Kaufman, Rouseeuw 1990)
                s_vec=silhouette(dataset_game_Entscheidung',idx_val);
                s_mean=mean(s_vec);
                if s_mean>s_max
                    idx_Entscheidung=idx_val;
                    cc_Entscheidung=cluster_center;
                    s_max=s_mean;
                end
            end
            cluster_min=anz_cluster+1;
            anz_cluster=anz_cluster+1;
            
            
        end
        goodness_clustering((i-1)*16+j,8)=num2cell(s_max);
        
        
        CorrMatrix_Cluster=corrcoef([idx_ges,idx_Akquise_o_Zeitdruck,idx_Akquise_m_Zeitdruck,idx_Verarbeitung_o_Zeitdruck,idx_Verarbeitung_m_Zeitdruck,idx_Entscheidung],'rows','pairwise');
        %
        struct_field_title=['v',num2str(i),'_',strtok(Exp_name_list{j},'.')];
        
        for m=1:6
            struct_field_title_cc=['v',num2str(i),'_',strtok(Exp_name_list{j},'.'),'CC_',cluster_auswahl_name{m}];
            switch m
                case 1
                    cluster_cen.(struct_field_title_cc)=num2cell(cc_ges);
                case 2
                    cluster_cen.(struct_field_title_cc)=num2cell(cc_Akquise_o_Zeitdruck);
                case 3
                    cluster_cen.(struct_field_title_cc)=num2cell(cc_Akquise_m_Zeitdruck);
                case 4
                    cluster_cen.(struct_field_title_cc)=num2cell(cc_Verarbeitung_o_Zeitdruck);
                case 5
                    cluster_cen.(struct_field_title_cc)=num2cell(cc_Verarbeitung_m_Zeitdruck);
                case 6
                    cluster_cen.(struct_field_title_cc)=num2cell(cc_Entscheidung);
                    
            end
        end
        %
        corr_data.(struct_field_title)=CorrMatrix_ges;
        proxi_data.(struct_field_title)=proxi_game_ges;
        
        %                 corr_data_ges.(struct_field_title)=CorrMatrix_ges;
        %                 corr_data_Akquise_o_Zeitdruck.(struct_field_title)=CorrMatrix_Akquise_o_Zeitdruck;
        %                 corr_data_Akquise_m_Zeitdruck.(struct_field_title)=CorrMatrix_Akquise_m_Zeitdruck;
        %                 corr_data_Verarbeitung_o_Zeitdruck.(struct_field_title)=CorrMatrix_Verarbeitung_o_Zeitdruck;
        %                 corr_data_Verarbeitung_m_Zeitdruck.(struct_field_title)=CorrMatrix_Verarbeitung_m_Zeitdruck;
        %                 corr_data_Entscheidung.(struct_field_title)=CorrMatrix_Entscheidung;
        %                 corr_data_Cluster.(struct_field_title)=CorrMatrix_Cluster;
        
        %
        %         %         subplot(5,4,j);
        %         for l=1:7 %Anz Unterteilungen
        %             fig_2=figure;
        %             switch l
        %                 case 1
        %                     CorrMatrix=CorrMatrix_ges;
        %                     namenszusatz='ges';
        %                 case 2
        %                     CorrMatrix=CorrMatrix_Akquise_o_Zeitdruck;
        %                     namenszusatz='Akquise_o_Zeitdruck';
        %                 case 3
        %                     CorrMatrix=CorrMatrix_Akquise_m_Zeitdruck;
        %                     namenszusatz='Akquise_m_Zeitdruck';
        %                 case 4
        %                     CorrMatrix=CorrMatrix_Verarbeitung_o_Zeitdruck;
        %                     namenszusatz='Verarbeitung_o_Zeitdruck';
        %                 case 5
        %                     CorrMatrix=CorrMatrix_Verarbeitung_m_Zeitdruck;
        %                     namenszusatz='Verarbeitung_m_Zeitdruck';
        %                 case 6
        %                     CorrMatrix=CorrMatrix_Entscheidung;
        %                     namenszusatz='Entscheidung';
        %                 case 7
        %                     CorrMatrix=CorrMatrix_Cluster;
        %                     namenszusatz='Cluster';
        %             end
        %
        %             map_h = [1,0,0 %rot
        %                 1,1/2,0 %orange
        %                 1, 1, 0 %gelb
        %                 1/2,1,0
        %                 0, 1, 0 %grün
        %                 ];
        %             cm=colormap(map_h);
        %             %          subplot(1,2,1);
        %             h=imagesc(CorrMatrix);
        %             set(h,'alphadata',~isnan(CorrMatrix));
        %             %          subplot(1,2,2);
        %             %           pcolor(CorrMatrix);
        %             %         subplot(2,2,2);
        %             %         mesh(CorrMatrix);
        %             %         plotmatrix(CorrMatrix);
        %             %         contour(CorrMatrix);
        %
        %             caxis( [-1 1] ); %color axis scaling
        %             %         subplot(2,2,3:4);
        %             %         axis off;
        %             h=colorbar('southoutside', 'Ticks',[-1,0,1], 'TickDirection', 'out');
        %             h.Label.String = 'Pearson Correlation';
        %             fig_name_title=[namenszusatz,': v',num2str(i),' - Korrelation_',strtok(Exp_name_list{j},'.')];
        %             title(fig_name_title,'interpreter','none');
        %             fig_title=[namenszusatz,'_v',num2str(i),' - Korrelation_',strtok(Exp_name_list{j},'.')];
        %             savefig(fig_title);
        %             saveas(fig_2,fig_title, 'meta');
        %             saveas(fig_2,fig_title, 'jpg');
        %             close(fig_2);
        %         end
        
        %save ranking
        if j==1
            ranking_overview=[dataset{F,2}, dataset{F,3},num2cell(idx_ges),num2cell(idx_Akquise_o_Zeitdruck),num2cell(idx_Akquise_m_Zeitdruck),num2cell(idx_Verarbeitung_o_Zeitdruck),num2cell(idx_Verarbeitung_m_Zeitdruck),num2cell(idx_Entscheidung)];
        else
            ranking_overview=vertcat(ranking_overview,[dataset{F,2}, dataset{F,3},num2cell(idx_ges),num2cell(idx_Akquise_o_Zeitdruck),num2cell(idx_Akquise_m_Zeitdruck),num2cell(idx_Verarbeitung_o_Zeitdruck),num2cell(idx_Verarbeitung_m_Zeitdruck),num2cell(idx_Entscheidung)]);
        end
        ranking_data.(struct_field_title)=[dataset{F,2}, dataset{F,3},num2cell(idx_ges),num2cell(idx_Akquise_o_Zeitdruck),num2cell(idx_Akquise_m_Zeitdruck),num2cell(idx_Verarbeitung_o_Zeitdruck),num2cell(idx_Verarbeitung_m_Zeitdruck),num2cell(idx_Entscheidung)];
    end
    
    
    %         subplot(5,4,17:20);
    %         axis off;
    %         h=colorbar('southoutside','Ticks',[-1,0,1], 'TickDirection', 'out','Position', [0 0 1 1]);
    %         h.Label.String = 'Pearson Correlation';
    %         fig_name_title=['v',num2str(i),' - Korrelation'];
    %         suptitle(fig_name_title);
    %         savefig(fig_name_title);
    %         saveas(fig_2,fig_name_title, 'meta');
    %         saveas(fig_2,fig_name_title, 'jpg');
    %         close(fig_2);
    
    switch i
        case 1
            
            ergebnisuebersicht_v1 = sortrows(ergebnisuebersicht_v1,'ExpName','ascend');
            ergebnisuebersicht_v1=horzcat(ergebnisuebersicht_v1,cell2table(ranking_overview,'VariableNames',{'Version' 'Spieler' 'Clus_Ges' 'Clus_AkoZD' 'Clus_AkmZD' 'Clus_VeroZD' 'Clus_VermZD' 'Clus_Ent'}));
        case 2
            ergebnisuebersicht_v2 = sortrows(ergebnisuebersicht_v2,'ExpName','ascend');
            ergebnisuebersicht_v2=horzcat(ergebnisuebersicht_v2,cell2table(ranking_overview,'VariableNames',{'Version' 'Spieler' 'Clus_Ges' 'Clus_AkoZD' 'Clus_AkmZD' 'Clus_VeroZD' 'Clus_VermZD' 'Clus_Ent'}));
        case 3
            ergebnisuebersicht_v3 = sortrows(ergebnisuebersicht_v3,'ExpName','ascend');
            ergebnisuebersicht_v3=horzcat(ergebnisuebersicht_v3,cell2table(ranking_overview,'VariableNames',{'Version' 'Spieler' 'Clus_Ges' 'Clus_AkoZD' 'Clus_AkmZD' 'Clus_VeroZD' 'Clus_VermZD' 'Clus_Ent'}));
    end
end

save('cluster_erweiterte_ergebnisübersicht.mat', 'ergebnisuebersicht_v1', 'ergebnisuebersicht_v2', 'ergebnisuebersicht_v3', 'goodness_clustering', 'corr_data', 'proxi_data', 'ranking_data','cluster_cen');




% Modul calculates MW/StD bzw. portions p and corresponding Hypothesestests
% for V1 to V3
% Data Selection:
% H1 - Decisions: whole Table - portion
% H2 - Payoff all: alle decisions (relativer Payoff > 0) - MW/StD
% H3 - Reduction of Alternatives: only V1 & V2; adequate Mouse use - MW/StD
% H4 - Payoff COMPARE_I; adequate Mouse use - MW/StD
% H5 - Payoff no COMPARE_I; adequate Mouse use - MW/StD
% H6 - Number EIPs: only decision maker; adequate Mouse use - MW/StD
% H7 - Using heuristics qualitatively: adequate mouse use - portion
% H8 - using heuristics quantitatively: adequate Mouse use  - MW/StD
% H9 - use of Random: adequate Mouse use - portion
% H10 - use of Equilibrium: all data sets - portion
% H11 - speeding up: adequate Mouse use - MW/StD
% H12 - Early decision and revision: adequate Mouse use and decision - MW/StD
% H13 - strategic EIP and choice: adequate Mouse use and decision - MW/StD
% H14 - focus own payoff: adequate Mouse use - MW/StD
% H15 - open cells first: only V1; adequate Mouse use - portion

load('data_for_do_hypotheses_test.mat');
%geeignetes Datenset wählen
%-betroffene Experimentversionen einbinden
%-betroffene Tasks einbinden
%geeigneten Test wählen
%geeignete H0 wählen - hier: flexibel für Vgl. social apsects
%Ergebnisse Speichern in Tabelle
%new
spaltennamen={'ExpVersion','ExpName','Spielername','H1','H2','H3','H4','H5','H6','H7','H8','H9','H10','H11','H12','H13','H14','H15'};
for i=1:3 %Experimentversionen V1-V3
    
    
    switch i
        case 1
            
            dataset=V1_Data;
            H12=dataset.(61)./ dataset.(51);
            %
        case 2
            %             dataset=table2cell(V2_Data);
            %             daten_uebersicht=cell(578,16);
            dataset=V2_Data;
            H12=dataset.(60) ./ dataset.(51);
            %                 V3_Data_Source.(61)=V3_Data_Source.(60) ./ V3_Data_Source.(51);
        case 3
            %             dataset=table2cell(V3_Data);
            %             daten_uebersicht=cell(724,16);
            dataset=V3_Data;
            H12=dataset.(60) ./ dataset.(51);
    end
    
    for j=1:15 % Hypothesen (H12 bereits berechnet in switch i, s.o.)
        H0=dataset.(9);
        Expvers=dataset.(2);
        Expname=dataset.(4);
        
        switch j
            case 1
                %daten_uebersicht(:,2)=dataset(:,Test_Parameter{j,6});
                H1=dataset.(Test_Parameter.(7)(j))>Test_Parameter.(8)(j);
                %daten_uebersicht=horzcat(daten_uebersicht,dataset(:,(Test_Parameter{j,6})));
            case 2
                H2=dataset.(Test_Parameter{j,6});
            case 3
                H3=dataset.(Test_Parameter{j,6});
            case 4
                hilf=dataset.(Test_Parameter.(7)(j))>Test_Parameter.(8)(j);
                H4=dataset.(Test_Parameter{j,6}).*hilf;
            case 5
                hilf=dataset.(Test_Parameter.(7)(j))==Test_Parameter.(8)(j);
                H5=dataset.(Test_Parameter{j,6}).*hilf;
            case 6
                H6=dataset.(Test_Parameter{j,6});
            case 7
                H7=dataset.(Test_Parameter.(7)(j))>Test_Parameter.(8)(j)|dataset.(Test_Parameter.(9)(j))>Test_Parameter.(10)(j);
                
            case 8
                H8=dataset.(Test_Parameter{j,6});
            case 9
                H9=dataset.(Test_Parameter.(7)(j))>Test_Parameter.(8)(j);
            case 10
                H10=~cellfun('isempty',regexp(dataset.(Test_Parameter.(7)(j)),Test_Parameter.(11)(j),'match'));
            case 11
                H11=dataset.(Test_Parameter{j,6});
            case 12
                %             if g==1
                %             H12=dataset.(62);
                %             else
                %             H12=dataset.(61);
                %             end
            case 13
                hilf=~cellfun('isempty', regexp(dataset.(28),'D|E','match'));
                H13=dataset.(21).*double(hilf);
                
            case 14
                H14=dataset.(Test_Parameter{j,6});
            case 15
                H15=dataset.(Test_Parameter.(7)(j))>Test_Parameter.(8)(j);
        end
        
    end
   switch i
        case 1
            ergebnisuebersicht_v1=table(Expvers,Expname,H0,H1,H2,H3,H4,H5,H6,H7,H8,H9,H10,H11,H12,H13,H14,H15,'VariableNames',spaltennamen);
            ergebnisuebersicht_v1 = sortrows(ergebnisuebersicht_v1,'Spielername','ascend');
       case 2
           ergebnisuebersicht_v2=table(Expvers,Expname,H0,H1,H2,H3,H4,H5,H6,H7,H8,H9,H10,H11,H12,H13,H14,H15,'VariableNames',spaltennamen);
            ergebnisuebersicht_v2 = sortrows(ergebnisuebersicht_v2,'Spielername','ascend');
       case 3
           ergebnisuebersicht_v3=table(Expvers,Expname,H0,H1,H2,H3,H4,H5,H6,H7,H8,H9,H10,H11,H12,H13,H14,H15,'VariableNames',spaltennamen);
            ergebnisuebersicht_v3 = sortrows(ergebnisuebersicht_v3,'Spielername','ascend');
   end
end





%     %old
%     for i=1:15 %all Hypotheses
%         table_name_pattern={strcat('H',num2str(i),'compl'),strcat('H',num2str(i),'time')};
%
%         %select dataset
%         for k=1:3 %all exp_versions
%             players_v1=unique(Spielername);
%             anz_players_v1=size(players_v1,1);
%             select_test=Test_Parameter.(4)(i);
%             data_case=Test_Parameter.(5)(i);
%             data_source=Test_Parameter.(6)(i);
%
%             switch data_case{1,1}
%                 case 'whole'
%                     V1_Data_Source=V1_Data;
%                     V2_Data_Source=V2_Data;
%                     V3_Data_Source=V3_Data;
%                 case 'decisions'
%                     V1_Data_Source=V1_Data(V1_Data.(12)>0,:);
%                     V2_Data_Source=V2_Data(V2_Data.(12)>0,:);
%                     V3_Data_Source=V3_Data(V3_Data.(12)>0,:);
%                 case 'mouse'
%                     V1_Data_Source=V1_Data(V1_Data.(26)>0 & V1_Data.(29)~=1 & strcmp(V1_Data.(39),''),:);
%                     V2_Data_Source=V2_Data(V2_Data.(26)>0 & V2_Data.(29)~=1 & strcmp(V2_Data.(39),''),:);
%                     V3_Data_Source=V3_Data(V3_Data.(26)>0 & V3_Data.(29)~=1 & strcmp(V3_Data.(39),''),:);
%                 case 'decisions_mouse'
%                     V1_Data_Source=V1_Data(V1_Data.(26)>0 & V1_Data.(29)~=1 & strcmp(V1_Data.(39),'') & V1_Data.(12)>0,:);
%                     V2_Data_Source=V2_Data(V2_Data.(26)>0 & V2_Data.(29)~=1 & strcmp(V2_Data.(39),'') & V2_Data.(12)>0,:);
%                     V3_Data_Source=V3_Data(V3_Data.(26)>0 & V3_Data.(29)~=1 & strcmp(V3_Data.(39),'') & V3_Data.(12)>0,:);
%             end
%
%             if i==12 %Hypotheses XII requires precalculations
%                 V1_Data_Source.(62)=V1_Data_Source.(61)./ V1_Data_Source.(51);
%                 V2_Data_Source.(61)=V2_Data_Source.(60) ./ V2_Data_Source.(51);
%                 V3_Data_Source.(61)=V3_Data_Source.(60) ./ V3_Data_Source.(51);
%             end
%
%             if i==4
%                 V1_Data_Source=V1_Data_Source(V1_Data_Source.(21)>0,:);
%                 V2_Data_Source=V2_Data_Source(V2_Data_Source.(21)>0,:);
%                 V3_Data_Source=V3_Data_Source(V3_Data_Source.(21)>0,:);
%             end
%
%             if i==5
%                 V1_Data_Source=V1_Data_Source(V1_Data_Source.(21)==0,:);
%                 V2_Data_Source=V2_Data_Source(V2_Data_Source.(21)==0,:);
%                 V3_Data_Source=V3_Data_Source(V3_Data_Source.(21)==0,:);
%             end
%
%             for g=1:2 %  g=1: complexity or g=2: time limit - view
%                 %select dataset
%                 orientation=Test_Parameter.(g+1)(i);
%                 table_name=table_name_pattern{1,g};
%                 if i == 7 || i==13
%                     %confidence interval
%                     V1_Test_Data=do_portion_test_H7(V1_Data_Source,i, Test_Parameter); %revise
%                     V2_Test_Data=do_portion_test_H7(V2_Data_Source,i, Test_Parameter);
%                     V3_Test_Data=do_portion_test_H7(V3_Data_Source,i, Test_Parameter);
%                     CI=vertcat(V1_Test_Data,V2_Test_Data,V3_Test_Data);
%                     %eigene schleife für HVII und HXIII einfügen
%                     for j=1:16
%                         task_now=Tasks.(3)(Tasks.(g)==j);
%                         %                 V1_H0_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_now),:); %revise
%                         %                 V2_H0_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_now),:);
%                         %                 V3_H0_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_now),:);
%                         if i==13 %H13
%                             V1_H0_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_now) & cellfun('isempty', regexp(V1_Data_Source.(28),'D|E','match')),:); %revise
%                             V2_H0_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_now) & cellfun('isempty', regexp(V2_Data_Source.(28),'D|E','match')),:);
%                             V3_H0_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_now) & cellfun('isempty', regexp(V3_Data_Source.(28),'D|E','match')),:);
%                             V1_Comp_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_now) & ~cellfun('isempty', regexp(V1_Data_Source.(28),'D|E','match')),:); %.(21)
%                             V2_Comp_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_now) & ~cellfun('isempty', regexp(V2_Data_Source.(28),'D|E','match')),:);
%                             V3_Comp_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_now) & ~cellfun('isempty', regexp(V3_Data_Source.(28),'D|E','match')),:);
%                             V1_Test_Data=do_mean_test(V1_H0_Data_Set.(Test_Parameter.(6)(i)),V1_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
%                             V2_Test_Data=do_mean_test(V2_H0_Data_Set.(Test_Parameter.(6)(i)),V2_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
%                             V3_Test_Data=do_mean_test(V3_H0_Data_Set.(Test_Parameter.(6)(i)),V3_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
%
%                         else %H7
%
%                             V1_Test_Data=do_portion_test_H7(V1_H0_Data_Set,i, Test_Parameter); %revise
%                             V2_Test_Data=do_portion_test_H7(V2_H0_Data_Set,i, Test_Parameter);
%                             V3_Test_Data=do_portion_test_H7(V3_H0_Data_Set,i, Test_Parameter);
%                         end
%                         %store data in Table: one Table per Hypothesis and view = 30 Tables, with results of V1-V3 in one table
%                         if j ==1
%                             table_struct.(table_name)=[task_now,V1_Test_Data,V2_Test_Data,V3_Test_Data]; %ggf. transformieren?!
%                         else
%                             table_struct.(table_name)=vertcat(table_struct.(table_name),[task_now,V1_Test_Data,V2_Test_Data,V3_Test_Data]); %ggf. transformieren?!
%                         end
%                     end
%
%                 else
%
%                     for j=1:4 %all H0_tasks
%                         %H0-Data:
%                         task_H0=Tasks.(3)(Tasks.(g)==j); %Tasks.(1) = Order Complexity / Task.(2) = Order Time Limit
%                         %level_of_compl=regexp(task_H0(1,1),'\d_\dx\d','match');
%                         %table_name=strcat(table_name_pattern{1,g},'_',level_of_compl{1,1});
%                         V1_H0_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_H0),:); %selection of a single column possible? yes - just happend with .(Test_Parameter.(6)(Tasks.(g)==j))
%                         V2_H0_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_H0),:); %selection of a single column possible?
%                         V3_H0_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_H0),:); %selection of a single column possible?
%                         if j>1
%                             %                     if strcmp(select_test{1,1},'t')
%                             table_struct.(table_name)=vertcat(table_struct.(table_name),[task_H0,size(V1_H0_Data_Set,1),'H0','H0','H0','H0',size(V2_H0_Data_Set,1),'H0','H0','H0','H0',size(V3_H0_Data_Set,1),'H0','H0','H0','H0']);
%                             %                     else
%                             %                         table_struct.(table_name)=vertcat(table_struct.(table_name),[task_H0,size(V1_H0_Data_Set,1),'H0','H0',size(V2_H0_Data_Set,1),'H0','H0',size(V2_H0_Data_Set,1),'H0','H0']);
%                             %                     end
%                         else
%                             %                     if strcmp(select_test{1,1},'t')
%                             table_struct.(table_name)=[task_H0,size(V1_H0_Data_Set,1),'H0','H0','H0','H0',size(V2_H0_Data_Set,1),'H0','H0','H0','H0',size(V3_H0_Data_Set,1),'H0','H0','H0','H0'];
%                             %                     else
%                             %                         table_struct.(table_name)=[task_H0,size(V1_H0_Data_Set,1),'H0','H0',size(V2_H0_Data_Set,1),'H0','H0',size(V2_H0_Data_Set,1),'H0','H0'];
%                             %                     end
%                         end
%                         for k= 1:3 %all compare tasks
%                             task_Comp=Tasks.(3)(Tasks.(g)==(j+k*4));
%
%                             V1_Comp_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_Comp),:); %.(Test_Parameter.(6)(Tasks.(g)==j))
%                             V2_Comp_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_Comp),:);
%                             V3_Comp_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_Comp),:);
%
%
%                             %call test-function
%                             if strcmp(select_test,'t')
%                                 if i==12
%                                     V1_Test_Data=do_mean_test(V1_H0_Data_Set.(Test_Parameter.(6)(i)+1),V1_Comp_Data_Set.(Test_Parameter.(6)(i)+1),orientation);
%                                     V2_Test_Data=do_mean_test(V2_H0_Data_Set.(Test_Parameter.(6)(i)),V2_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
%                                     V3_Test_Data=do_mean_test(V3_H0_Data_Set.(Test_Parameter.(6)(i)),V3_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
%                                 else
%                                     V1_Test_Data=do_mean_test(V1_H0_Data_Set.(Test_Parameter.(6)(i)),V1_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
%                                     V2_Test_Data=do_mean_test(V2_H0_Data_Set.(Test_Parameter.(6)(i)),V2_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
%                                     V3_Test_Data=do_mean_test(V3_H0_Data_Set.(Test_Parameter.(6)(i)),V3_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
%                                 end
%                             else
%
%                                 V1_Test_Data=do_portion_test(V1_H0_Data_Set,V1_Comp_Data_Set,orientation,i, Test_Parameter); % test_parameter column 7 and 8 define resulting data-set  , in order to calculate p1, p2
%                                 V2_Test_Data=do_portion_test(V2_H0_Data_Set,V2_Comp_Data_Set,orientation,i, Test_Parameter);
%                                 V3_Test_Data=do_portion_test(V3_H0_Data_Set,V3_Comp_Data_Set,orientation,i, Test_Parameter);
%                             end
%                             %store data in Table: one Table per Hypothesis and view = 30 Tables, with results of V1-V3 in one table
%                             table_struct.(table_name)=vertcat(table_struct.(table_name),[task_Comp,V1_Test_Data,V2_Test_Data,V3_Test_Data]); %ggf. transformieren?!
%                         end
%                     end
%                 end
%             end
%         end
%     end

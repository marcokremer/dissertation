%vary "do_hypothesis_test in that way, that social aspects are varied
%rather than H0
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

load('data_for_do_hypotheses_test_social.mat')
%geeignetes Datenset wählen
%-betroffene Experimentversionen einbinden
%-betroffene Tasks einbinden
%geeigneten Test wählen
%geeignete H0 wählen - hier: flexibel für Vgl. social apsects
%Ergebnisse Speichern in Tabelle
for m=1:5%1:5 %sex, age, job, education, GT-preknowledge
    %tests remain the same, also basic data selection, just enlarged by the
    %corresponding social aspect
    social_pattern={'sex','age','job','education','GTpre'};
    
    for i=1:15 %all Hypotheses
        table_name_pattern={strcat(social_pattern{1,m},'H',num2str(i),'compl'),strcat(social_pattern{1,m},'H',num2str(i),'time')};
        
        %select dataset
        %for k=1:3 %all exp_versions
        select_test=Test_Parameter.(4)(i);
        data_case=Test_Parameter.(5)(i);
        data_source=Test_Parameter.(6)(i);
        
        switch data_case{1,1}
            case 'whole'
                V1_Data_Source=V1_Data;
                V2_Data_Source=V2_Data;
                V3_Data_Source=V3_Data;
            case 'decisions'
                V1_Data_Source=V1_Data(V1_Data.(12)>0,:);
                V2_Data_Source=V2_Data(V2_Data.(12)>0,:);
                V3_Data_Source=V3_Data(V3_Data.(12)>0,:);
            case 'mouse'
                V1_Data_Source=V1_Data(V1_Data.(26)>0 & V1_Data.(29)~=1 & strcmp(V1_Data.(39),''),:);
                V2_Data_Source=V2_Data(V2_Data.(26)>0 & V2_Data.(29)~=1 & strcmp(V2_Data.(39),''),:);
                V3_Data_Source=V3_Data(V3_Data.(26)>0 & V3_Data.(29)~=1 & strcmp(V3_Data.(39),''),:);
            case 'decisions_mouse'
                V1_Data_Source=V1_Data(V1_Data.(26)>0 & V1_Data.(29)~=1 & strcmp(V1_Data.(39),'') & V1_Data.(12)>0,:);
                V2_Data_Source=V2_Data(V2_Data.(26)>0 & V2_Data.(29)~=1 & strcmp(V2_Data.(39),'') & V2_Data.(12)>0,:);
                V3_Data_Source=V3_Data(V3_Data.(26)>0 & V3_Data.(29)~=1 & strcmp(V3_Data.(39),'') & V3_Data.(12)>0,:);
        end
        
        if i==12 %Hypotheses XII requires precalculations
            V1_Data_Source.(62)=V1_Data_Source.(61) ./ V1_Data_Source.(51);
            V2_Data_Source.(61)=V2_Data_Source.(60) ./ V2_Data_Source.(51);
            V3_Data_Source.(61)=V3_Data_Source.(60) ./ V3_Data_Source.(51);
        end
        
        if i==4
    V1_Data_Source=V1_Data_Source(V1_Data_Source.(21)>0,:);
    V2_Data_Source=V2_Data_Source(V2_Data_Source.(21)>0,:);
    V3_Data_Source=V3_Data_Source(V3_Data_Source.(21)>0,:);
    end
    
    if i==5
    V1_Data_Source=V1_Data_Source(V1_Data_Source.(21)==0,:);
    V2_Data_Source=V2_Data_Source(V2_Data_Source.(21)==0,:);
    V3_Data_Source=V3_Data_Source(V3_Data_Source.(21)==0,:);
    end
        
        for g=1:2 %  g=1: complexity or g=2: time limit - view
            %select dataset
            %orientation=Test_Parameter.(g+1)(i);
            orientation={'deviate'};
            %if i == 7 || i==13
            %eigene schleife für HVII und HXIII einfügen
            for n=1:Test_Parameter_Social.(6)(m) %depending on social aspect, two ore three categories needs to be testes, resulting in one or three rounds of this slope
                %what needs to be compared with which?
                switch n
                    case 1
                        o=1;
                        p=2;
                    case 2
                        o=1;
                        p=3;
                    case 3
                        o=2;
                        p=3;
                end
                switch m
                    case 2
                        table_name=strcat('age_',num2str(n), table_name_pattern{1,g}); % insert social aspect category
                    case 3
                        table_name=strcat(Test_Parameter_Social.(1){m},'_',num2str(n), table_name_pattern{1,g}); % insert social aspect category
                    otherwise
                        table_name=strcat(Test_Parameter_Social.(n+2){m}, table_name_pattern{1,g}); % insert social aspect category
                end
                for j=1:16
                    task_now=Tasks.(3)(Tasks.(g)==j);
                    %revised : ok
                    %determine H0-data
                    if m==2
                        if (n==1 || n==2) %age; comparison round 1 and 2
                            V1_H0_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_now) & (V1_Data_Source.(41)<26),:); %revise
                            V2_H0_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_now) & (V2_Data_Source.(41)<26),:);
                            V3_H0_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_now) & (V3_Data_Source.(41)<26),:);
                        else
                            
                            %age; comparison round 3
                            V1_H0_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_now) & (V1_Data_Source.(41)>25) & (V1_Data_Source.(41)<33),:); %revise
                            V2_H0_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_now) & (V2_Data_Source.(41)>25) & (V2_Data_Source.(41)<33),:);
                            V3_H0_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_now) & (V3_Data_Source.(41)>25) & (V3_Data_Source.(41)<33),:);
                        end
                    else
                        V1_H0_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_now) & strcmp(V1_Data_Source.(Test_Parameter_Social{m,2}), Test_Parameter_Social{m,o+2}) ,:); %revise
                        V2_H0_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_now) & strcmp(V2_Data_Source.(Test_Parameter_Social{m,2}), Test_Parameter_Social{m,o+2}),:);
                        V3_H0_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_now) & strcmp(V3_Data_Source.(Test_Parameter_Social{m,2}), Test_Parameter_Social{m,o+2}),:);
                    end
                    
                    %determine Compare-data, beginning with the special
                    %case of H13
                    if i==13
                        if m==2
                            if n==1 %Compare-data in round 1 is category 2
                                V1_Comp_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_now) & ~cellfun('isempty', regexp(V1_Data_Source.(28),'D|E','match')) &(V1_Data_Source.(41)>25) & (V1_Data_Source.(41)<33),:); %revise
                                V2_Comp_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_now) & ~cellfun('isempty', regexp(V2_Data_Source.(28),'D|E','match')) &(V2_Data_Source.(41)>25) & (V2_Data_Source.(41)<33),:);
                                V3_Comp_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_now) & ~cellfun('isempty', regexp(V3_Data_Source.(28),'D|E','match')) &(V3_Data_Source.(41)>25) & (V3_Data_Source.(41)<33),:);
                            else %Compare-data in round 2 and 3 is category 3
                                V1_Comp_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_now) & ~cellfun('isempty', regexp(V1_Data_Source.(28),'D|E','match')) &(V1_Data_Source.(41)>33),:); %revise
                                V2_Comp_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_now) & ~cellfun('isempty', regexp(V2_Data_Source.(28),'D|E','match')) &(V2_Data_Source.(41)>33),:);
                                V3_Comp_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_now) & ~cellfun('isempty', regexp(V3_Data_Source.(28),'D|E','match')) &(V3_Data_Source.(41)>33),:);
                            end
                        else
                            V1_Comp_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_now) & ~cellfun('isempty', regexp(V1_Data_Source.(28),'D|E','match')) & strcmp(V1_Data_Source.(Test_Parameter_Social{m,2}), Test_Parameter_Social{m,p+2}),:); %.(21)
                            V2_Comp_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_now) & ~cellfun('isempty', regexp(V2_Data_Source.(28),'D|E','match')) & strcmp(V2_Data_Source.(Test_Parameter_Social{m,2}), Test_Parameter_Social{m,p+2}),:);
                            V3_Comp_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_now) & ~cellfun('isempty', regexp(V3_Data_Source.(28),'D|E','match')) & strcmp(V3_Data_Source.(Test_Parameter_Social{m,2}), Test_Parameter_Social{m,p+2}),:);
                        end
                        V1_Test_Data=do_mean_test(V1_H0_Data_Set.(Test_Parameter.(6)(i)),V1_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
                        V2_Test_Data=do_mean_test(V2_H0_Data_Set.(Test_Parameter.(6)(i)),V2_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
                        V3_Test_Data=do_mean_test(V3_H0_Data_Set.(Test_Parameter.(6)(i)),V3_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
                        
                    else
                        if m==2
                            if (n==1)
                                V1_Comp_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_now) & (V1_Data_Source.(41)>25) & (V1_Data_Source.(41)<33),:);
                                V2_Comp_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_now) & (V2_Data_Source.(41)>25) & (V2_Data_Source.(41)<33),:);
                                V3_Comp_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_now) & (V3_Data_Source.(41)>25) & (V3_Data_Source.(41)<33),:);
                                
                            else
                                V1_Comp_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_now) & (V1_Data_Source.(41)>33),:);
                                V2_Comp_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_now) & (V2_Data_Source.(41)>33),:);
                                V3_Comp_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_now) & (V3_Data_Source.(41)>33),:);
                                
                            end
                        else
                            V1_Comp_Data_Set=V1_Data_Source(strcmp(V1_Data_Source.(4),task_now) & strcmp(V1_Data_Source.(Test_Parameter_Social{m,2}), Test_Parameter_Social{m,p+2}),:);
                            V2_Comp_Data_Set=V2_Data_Source(strcmp(V2_Data_Source.(4),task_now) & strcmp(V2_Data_Source.(Test_Parameter_Social{m,2}), Test_Parameter_Social{m,p+2}),:);
                            V3_Comp_Data_Set=V3_Data_Source(strcmp(V3_Data_Source.(4),task_now) & strcmp(V3_Data_Source.(Test_Parameter_Social{m,2}), Test_Parameter_Social{m,p+2}),:);
                        end
                        %call test-function
                        if strcmp(select_test,'t')
                            if i==12
                                V1_Test_Data=do_mean_test(V1_H0_Data_Set.(Test_Parameter.(6)(i)+1),V1_Comp_Data_Set.(Test_Parameter.(6)(i)+1),orientation);
                                V2_Test_Data=do_mean_test(V2_H0_Data_Set.(Test_Parameter.(6)(i)),V2_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
                                V3_Test_Data=do_mean_test(V3_H0_Data_Set.(Test_Parameter.(6)(i)),V3_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
                            else
                                V1_Test_Data=do_mean_test(V1_H0_Data_Set.(Test_Parameter.(6)(i)),V1_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
                                V2_Test_Data=do_mean_test(V2_H0_Data_Set.(Test_Parameter.(6)(i)),V2_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
                                V3_Test_Data=do_mean_test(V3_H0_Data_Set.(Test_Parameter.(6)(i)),V3_Comp_Data_Set.(Test_Parameter.(6)(i)),orientation);
                            end
                        else
                            
                            V1_Test_Data=do_portion_test(V1_H0_Data_Set,V1_Comp_Data_Set,orientation,i, Test_Parameter); % test_parameter column 7 and 8 define resulting data-set  , in order to calculate p1, p2
                            V2_Test_Data=do_portion_test(V2_H0_Data_Set,V2_Comp_Data_Set,orientation,i, Test_Parameter);
                            V3_Test_Data=do_portion_test(V3_H0_Data_Set,V3_Comp_Data_Set,orientation,i, Test_Parameter);
                        end
                        
                    end
                    %store data in Table: one Table per Hypothesis , view and comparison of two categories of one social aspect = 30 Tables, with results of V1-V3 in one table
                    if j ==1
                        table_struct_social.(table_name)=[task_now,V1_Test_Data,V2_Test_Data,V3_Test_Data]; %ggf. transformieren?!
                    else
                        table_struct_social.(table_name)=vertcat(table_struct_social.(table_name),[task_now,V1_Test_Data,V2_Test_Data,V3_Test_Data]); %ggf. transformieren?!
                    end
                end
            end
        end
    end
end


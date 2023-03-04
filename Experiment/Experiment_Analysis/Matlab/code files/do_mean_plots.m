% plot graphs of means and standard deviations or p from hypothesis test
load('hypothesistest_data.mat')
%tue for influence time and influence complexity
%tue, bis leere spalte kommt:
%select column (if "MW" im column name, also select next column "SD")
% select column 1 (Version)
% plot for all three versions in one plot results
% plotname =  if MW: "mean", else portion & Expversion
% figure name=file_name= select from Hypotheses-catalogue
%tue ende
%tables_names={'Influence_Complexity', 'Influence_time'};
tables_values={Influence_Complexity, Influence_Time};

order={'complexity','time'};
for i=1:2 %beide Sichten
    table_name=tables_values{i};
    %compl_time_code=strcat(num2str(table_name.(3)) , '-' , num2str(table_name.(4)),'|',num2str(table_name.(5)));
    compl_time_code=strcat(num2str(table_name.(3)) , '-' , table_name.(6));
    for j=10:47 %45 %alle Spalten
        status='';
        column_name=char(table_name.Properties.VariableNames(j));
        is_p=strfind(column_name,'p');
        is_mean=strfind(column_name,'MW');
        is_p0=strfind(column_name,'p0');
%         is_p=column_name(column_name=='p');
%         is_mean=column_name(column_name=='MW');
%         is_p0=column_name(column_name=='p0');
        if not(isempty(is_p)) && isempty(is_p0)
            status='Portion';
        end
        if not(isempty(is_mean))
            status='Mean';
        end
        
        if strcmp(status,'')
        else
            data_rows_V1=table_name.(j)(strcmp(table_name.(1),'V1'));
            data_rows_V2=table_name.(j)(strcmp(table_name.(1),'V2'));
            data_rows_V3=table_name.(j)(strcmp(table_name.(1),'V3'));
            compl_time_code_rows=compl_time_code(strcmp(table_name.(1),'V1'),:);
            hypothesis_ort=strfind(column_name,'_');
            hypothesis=column_name(1:hypothesis_ort(1,1)-1);
            plot_means(data_rows_V1,data_rows_V2,data_rows_V3,compl_time_code_rows,hypothesis,order{i},status);
        end
    end
end

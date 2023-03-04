% plot graphs of means and standard deviations or p from hypothesis test
load('data_for_do_mean_plot_for_struct.mat');

tables_values={Complexity_Pattern_V13, Time_Pattern_V13}; %V2 wird nur ben�tigt, wenn compl-time-code mit Zahlen als time limit erstellt werden soll
struct_var=table_struct_social_result; %insert name of actual struct
% order={'complexity','time'};
% fields=fieldnames(table_struct);
fields=fieldnames(struct_var);
hypotheses_nr={'I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII','XIII','XIV','XV'};
status={'portion','mean','mean','mean','mean','mean','portion','mean','portion','portion','mean','mean','mean','mean','portion'};
for i=1:size(fields,1) %alle fields

if isempty(regexp(fields{i},'time','match'))
    table_name=tables_values{1};
    order='Complexity';
    compl_time_code=num2str(table_name.(3));
else
    table_name=tables_values{2};
    order='Time';
    compl_time_code=table_name.(6);
end

%social aspect

% compl_time_code mit a) Zahlen oder b) Bezeichnung f�r time limit
    %compl_time_code=strcat(num2str(table_name.(3)) , '-' ,
    %num2str(table_name.(4)),'|',num2str(table_name.(5))); %a)
%     compl_time_code=strcat(num2str(table_name.(3)) , '-' , table_name.(6)); %b)
%     compl_code=num2str(table_name.(3));
%     time_code=table_name.(6);
            data_rows_V1_H0=struct_var.(fields{i})(:,3);
            data_rows_V1_HA=struct_var.(fields{i})(:,4);
            data_rows_V2_H0=struct_var.(fields{i})(:,6);
            data_rows_V2_HA=struct_var.(fields{i})(:,7);
            data_rows_V3_H0=struct_var.(fields{i})(:,9);
            data_rows_V3_HA=struct_var.(fields{i})(:,10);
            
            compl_time_code_rows=compl_time_code(strcmp(table_name.(1),'V1'),:);
            hypothesis_ort=strfind(fields{i},'H');
            social_aspect=fields{i}(1:hypothesis_ort-1);
            if (i>6 && i<11) || (i>24 && i<35) || (i>52 && i<65)
            hypothesis=str2num(fields{i}(hypothesis_ort+2));
            else
                hypothesis=str2num(fields{i}(hypothesis_ort+1:hypothesis_ort+1));
            end
            plot_means_struct_social(data_rows_V1_H0,data_rows_V2_H0,data_rows_V3_H0,data_rows_V1_HA,data_rows_V2_HA,data_rows_V3_HA,compl_time_code_rows,hypotheses_nr{1,hypothesis},order,status{1,hypothesis},social_aspect);
end

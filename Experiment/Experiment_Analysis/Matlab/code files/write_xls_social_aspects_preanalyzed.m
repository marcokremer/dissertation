load('results_hypothesis_test_comparsison_social_aspects_preanalyzation.mat');
fields_new=fieldnames(table_struct_social_result);
% pattern={'x','age','job','GTpre'};
for a=1:20
%pattern=strcat('h',num2str(a));
%     G = regexp(fields_new{:,1},pattern{1,a},'match');
%     myindices = ~cellfun(regexp(fields_new{:,:},pattern{1,a})); %not working
%     F=~cellfun('isempty', G);
% hypothesis=strcat('H',num2str(a));
sheet_name=fields_new(a);
xlswrite('Hypotheses_Test_Results_social_aspect_preanalyzed.xls',table_struct_social_result.(fields_new{a}),sheet_name{1,1});
end
xlswrite('Hypotheses_Test_Results_social_aspect_preanalyzed.xls',fields_new,'overview');

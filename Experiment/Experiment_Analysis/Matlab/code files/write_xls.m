load('results_hypothesis_test_comparsison_expvers.mat');
fields=fieldnames(table_struct);
for a=27:30
sheet_name=fields(a);
xlswrite('Hypotheses_Test_Results_all_ExpVersions.xls',table_struct.(fields{a}),sheet_name{1,1});
end
xlswrite('Hypotheses_Test_Results_all_ExpVersions.xls',fields,'overview');

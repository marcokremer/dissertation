%preanalysis of social aspects' impact
%result is a struct that contain all hypotheses tests where H0 is mainly
%rejected (in half of cases and more) for any experimental version
load('results_hypothesis_test_comparsison_social_aspects_new.mat');
fields=fieldnames(table_struct_social);
for a=1:270
hypothesis=strcat('H',num2str(a));
sheet_name=fields(a);   
% if size(table_struct_social.(sheet_name{1,1}),2)==10 %z-test: h={3,6,9}
%     if (sum(cell2mat(table_struct_social.(sheet_name{1,1})(:,3)))>7) || (sum(cell2mat(table_struct_social.(sheet_name{1,1})(:,6)))>7) || (sum(cell2mat(table_struct_social.(sheet_name{1,1})(:,9)))>7)
%     table_struct_social_result.(sheet_name{1,1})=table_struct_social.(sheet_name{1,1});
%     end
% else %t-test: 16 columns with h={5,10,15}
     if (sum(cell2mat(table_struct_social.(sheet_name{1,1})(:,5)))>3) || (sum(cell2mat(table_struct_social.(sheet_name{1,1})(:,10)))>3) || (sum(cell2mat(table_struct_social.(sheet_name{1,1})(:,15)))>3)
    table_struct_social_result.(sheet_name{1,1})=table_struct_social.(sheet_name{1,1});
     end
    
      if (sum(cell2mat(table_struct_social.(sheet_name{1,1})(:,5)))>3) 
    table_struct_social_result_V1.(sheet_name{1,1})=table_struct_social.(sheet_name{1,1});
      end
    
       if (sum(cell2mat(table_struct_social.(sheet_name{1,1})(:,10)))>3) 
    table_struct_social_result_V2.(sheet_name{1,1})=table_struct_social.(sheet_name{1,1});
       end
       
     if (sum(cell2mat(table_struct_social.(sheet_name{1,1})(:,15)))>3)
    table_struct_social_result_V3.(sheet_name{1,1})=table_struct_social.(sheet_name{1,1});
    end
end

%table_struct_social_result.(sheet_name)=table_struct_social.(sheet_name);
    
% end

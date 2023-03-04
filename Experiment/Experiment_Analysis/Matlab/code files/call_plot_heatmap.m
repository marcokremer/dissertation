%this file calls plot_heatmap with a selection of IDs
load('ID_struct.mat'); %brings structure with matrix-fields
load('IDs.mat'); %brings ID_List
load('info_tab.mat'); %brings Information_Table
for i=1:4 %time case
    for j=2:5 %complexity
%Parameter
complexity=j; %default (all='\d*') 2:5
timecase=i; %default (all='\d*') 1:4
playername='';%default (all?)

info_tab.ExpName; %ExpName; 1.Zeichen = Timecase, 3.Buchstabe =complexity

%looking for time or complexity
tc_express=strcat(num2str(timecase),'_',num2str(complexity)); %ohne Player_namen
G = regexp(info_tab.ExpName,tc_express,'match');

%looking for a player
% G = regexp(info_tab.Spielername,playername,'match');


F=~cellfun('isempty', G);
ID_list=info_tab.ID(F==1);
name_list=info_tab.Spielername(F==1);


%call function
% plot_heatmap(complexity,ID_list, timecase, name_list)
plot_heatmap(complexity,ID_list, timecase, playername)

    end
end
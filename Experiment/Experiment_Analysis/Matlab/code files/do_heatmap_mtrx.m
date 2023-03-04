%script transforms exp_data in heatmap basic matrix
load('exp_mousemove_data_150629_xlsfile.mat');
load('players1.mat');
matrix_abs=zeros(251, 501); %largest size is 5x5
matrix_rel=zeros(51,101); % single size is 1x1 cell

IDs=unique(ID);
[anz_IDs,n]=size(IDs);
players=unique(Spielername);
[anz_players,m]=size(players);
%ID_struct=struct(IDs);
%player_struct=struct(players);

save_ID_mtrx=zeros(251, 501);
save_player_mtrx=zeros(251, 501);

X=round(X);
Y=round(Y);
% [a,b]=size(X);
y_absolut=zeros(a);
x_absolut=zeros(a);
% for ti=1:4
% for compl=2:5
%     
% timecase=ti;
% complexity=compl;
% tc_express=strcat(num2str(timecase),'_',num2str(complexity)); %ohne Player_namen
% G = regexp(info_tab.ExpName,tc_express,'match');
% F=~cellfun('isempty', G);
% X_list=X(F==1);
%     switch compl
%         case 2
%            switch 
%                x_absolut(F==1)=X(F==1)+18;
%     end    
% 
% end
% end
ID_start=ID(2);
player_start=Spielername(2);
j=1;
k=1;
%players1 is a pure number and hence not a valid fieldname
%players1 came from extracting original players - List
Spielername(strcmp(Spielername,players1))=strcat('num_',players1);

for i=2:size(ID)
%     matrix_abs(round(y_absolut(i))+1,round(x_absolut(i))+1)=matrix_abs(round(y_absolut(i))+1,round(x_absolut(i))+1)+VerweildauerPkt(i);
%     matrix_rel(round(Y(i))+1,round(X(i))+1)=matrix_rel(round(Y(i))+1,round(X(i))+1)+VerweildauerPkt(i);


    if ID(i)==ID_start
    else
        %ID_struct.(strcat('num_',num2str(IDs(j))))=save_ID_mtrx;
        [ID_struct(:).(strcat('num_',num2str(ID(i-1))))]=save_ID_mtrx;
        save_ID_mtrx=zeros(251, 501);
        if j<anz_IDs
            j=j+1;
            ID_start=ID(i);
        end
    end
    save_ID_mtrx(y_absolut(i)+1,x_absolut(i)+1)=save_ID_mtrx(y_absolut(i)+1,x_absolut(i)+1)+VerweildauerPkt(i);
    
    %     if strcmp(Spielername(i),player_start)
    %     else
    %     player_struct.(Spielername(i))=player_struct.(Spielername(i))+save_player_mtrx;
    %     save_player_mtrx=zeros(501,251);
    %     k=k+1;
    %     player_start=Spielername(i);
    %     end
    %     save_player_mtrx(x_absolut(i)+1,y_absolut(i)+1)=save_player_mtrx(x_absolut(i)+1,y_absolut(i)+1)+VerweildauerPkt(i);
end




%Erstellt Tabelle mit Rankings der Heuristiken
%eine Tabelle pro Zeitphase und Komplexität ist vorgesehen (insg. 16)
%Spalte 1...n
%Gruppenzugehörigkeit(Heuristik) Heuristik Goal2(Abs/Rng) Goal3(Abs/Rng)
%Goal4(Abs/Rng) Schnitt Rng
%Zeilen1...10
%Heuristik 1 bis 9, Durchschnitt der einzelnen Spalten
heuristic_list={'Altruist' 'Random' 'Optimist' 'Pessimist' 'Naiive' 'L2' 'D1' 'D2' 'Equilibrium'};
four_heuristic_list=horzcat(heuristic_list, heuristic_list, heuristic_list, heuristic_list);
time_stage={'early','early','early','early','early','early','early','early','early','middle', 'middle', 'middle', 'middle','middle', 'middle', 'middle', 'middle','middle', 'late', 'late', 'late', 'late','late', 'late', 'late', 'late','late', 'constant', 'constant', 'constant', 'constant','constant', 'constant', 'constant', 'constant', 'constant'};
%load('rank_matrix.mat'); %Achtung: die Ergebnisse const fehlen hier 
%load('rank_matrix_sat.mat') %Achtung: darf erst geladen werden, wenn
%Inhalte rank_matrix verarbeitet sind, da Variable gleichnamig
%final_erg_matrix (3=time stage,10=1...9 heuristic 10 frei, 4=Complexity,
%3=Goals 2-4.
erg_mtrx=zeros(36,20);
pure_erg_mtrx=zeros(36,12);
colon_names={'time_stage' 'heuristic' 'G2_2x2' 'G3_2x2' 'G4_2x2' 'mean_C2' 'G2_3x3' 'G3_3x3' 'G4_3x3' 'mean_C3' 'G2_4x4' 'G3_4x4' 'G4_4x4' 'mean_C4' 'G2_5x5' 'G3_5x5' 'G4_5x5' 'mean_C5' 'mean_G2' 'mean_G3' 'mean_G4' 'mean_allG'};

% goal2_erg_mtrx=zeros(36,3);
% goal3_erg_mtrx=zeros(36,3);
% goal4_erg_mtrx=zeros(36,3);
Core_mtrx=zeros(10,4);%9 Heuristiken+1mean und 3 Goals+1Mean
pure_core_mtrx=zeros(9,3);%9 Heuristiken und 3 Goals
for i=1:4 %time stage
    load('rank_matrix.mat');
for j=1:4 %Complexity
    
    
%         if i==4
%         load('rank_matrix_sat.mat');
%         Core_mtrx=[final_erg_mtrx(1,1:9,j,1); final_erg_mtrx(1,1:9,j,2); final_erg_mtrx(1,1:9,j,3)]';
%         pure_core_mtrx=[final_erg_mtrx(1,1:9,j,1); final_erg_mtrx(1,1:9,j,2); final_erg_mtrx(1,1:9,j,3)]';
%         else
        Core_mtrx=[final_erg_mtrx(i,1:9,j,1); final_erg_mtrx(i,1:9,j,2); final_erg_mtrx(i,1:9,j,3)]';
        pure_core_mtrx=[final_erg_mtrx(i,1:9,j,1); final_erg_mtrx(i,1:9,j,2); final_erg_mtrx(i,1:9,j,3)]';
%         end
        M = mean(Core_mtrx,2);
        Core_mtrx(:,4)=M;
%         N=mean(Core_mtrx);
%         Core_mtrx(10,:)=N;
        erg_mtrx((i-1)*9+1:(i)*9, 1+(j-1)*4:(j)*4)=Core_mtrx;
        pure_erg_mtrx((i-1)*9+1:(i)*9, 1+(j-1)*3:(j)*3)=pure_core_mtrx;
    
end

end
goal2_erg_mtrx=[pure_erg_mtrx(:,1),pure_erg_mtrx(:,4),pure_erg_mtrx(:,7),pure_erg_mtrx(:,10)];
goal3_erg_mtrx=[pure_erg_mtrx(:,2),pure_erg_mtrx(:,5),pure_erg_mtrx(:,8),pure_erg_mtrx(:,11)];
goal4_erg_mtrx=[pure_erg_mtrx(:,3),pure_erg_mtrx(:,6),pure_erg_mtrx(:,9),pure_erg_mtrx(:,12)];
erg_mtrx(:,17)=mean(goal2_erg_mtrx,2); %mean of Goal2 over all Complexities
erg_mtrx(:,18)=mean(goal3_erg_mtrx,2); %mean of Goal2 over all Complexities
erg_mtrx(:,19)=mean(goal4_erg_mtrx,2); %mean of Goal2 over all Complexities
erg_mtrx(:,20)=mean(pure_erg_mtrx,2); %mean of Goal2 over all Complexities

erg_table=array2table(erg_mtrx);
erg_table=[time_stage' four_heuristic_list' erg_table];
%erg_table=[erg_table_heads;erg_table];
erg_table.Properties.VariableNames=colon_names;
save 'result_tab_one' erg_table;
save 'pure_result_tab_one' pure_erg_mtrx;
writetable(erg_table,'Erg_table_1.xlsx');

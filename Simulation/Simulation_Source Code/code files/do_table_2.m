%creats table 2 from pure_erg_mtrx from table 1
load pure_result_tab_one;
new_pure_erg_mtrx=zeros(16,27);
table_head={'time_stage' 'complexity' 'Altruist_G2' 'Altruist_G3' 'Altruist_G4' 'Random_G2' 'Random_G3' 'Random_G4' 'Optimist_G2' 'Optimist_G3' 'Optimist_G4' 'Pessimist_G2' 'Pessimist_G3' 'Pessimist_G4' 'Naiive_G2' 'Naiive_G3' 'Naiive_G4' 'L2_G2' 'L2_G3' 'L2_G4' 'D1_G2' 'D1_G3' 'D1_G4' 'D2_G2' 'D2_G3' 'D2_G4' 'Equilibrium_G2' 'Equilibrium_G3' 'Equilibrium_G4'};

time_stage={'early','early','early','early','early','middle', 'middle', 'middle', 'middle','middle', 'late', 'late', 'late', 'late','late', 'constant', 'constant', 'constant', 'constant', 'constant','mean_time'};
const_col={'2x2' '3x3' '4x4' '5x5' 'mean_compl'};
four_const_list=horzcat(const_col,const_col,const_col,const_col,'all_mean');

for i=1:4 %time
    for j=1:9 %heuristic
        for k=1:4 %complexity
            for l=1:3 %goal
              new_pure_erg_mtrx((i-1)*4+k,(j-1)*3+l)=pure_erg_mtrx((i-1)*9+j,(k-1)*3+l);  
            end
        end
    end
end
early_mtrx=mean(new_pure_erg_mtrx(1:4,:));
middle_mtrx=mean(new_pure_erg_mtrx(5:8,:));                
late_mtrx=mean(new_pure_erg_mtrx(9:12,:));
const_mtrx=mean(new_pure_erg_mtrx(13:16,:));  
all_mean_mtrx=[early_mtrx;middle_mtrx;late_mtrx;const_mtrx];
final_erg_mtrx_2=[new_pure_erg_mtrx(1:4,:);early_mtrx;new_pure_erg_mtrx(5:8,:);middle_mtrx;new_pure_erg_mtrx(9:12,:);late_mtrx;new_pure_erg_mtrx(13:16,:);const_mtrx;mean(all_mean_mtrx)];

erg_table_2=array2table(final_erg_mtrx_2);
erg_table_2=[time_stage' four_const_list' erg_table_2];
erg_table_2.Properties.VariableNames=table_head;
save 'result_tab_two' erg_table_2;
save 'pure_result_tab_two' new_pure_erg_mtrx;
writetable(erg_table_2,'Erg_table_2.xlsx');

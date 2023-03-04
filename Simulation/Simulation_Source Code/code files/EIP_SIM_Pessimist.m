% nachfolgende Funktion ist Produktionssystem Heuristik Pessimist
% If strategy chosen,	END game.
%If time limit reached AND Isempty(current max), chose alternative randomly (uniform distribution)
% If no new strategy,	CHOOSE strategy containing current max.
% If COMPARE finished,	MOVE to next new strategy, new cell.
% If current min < current max,	ELIMINATE current strategy. COMPARE finished.
% If current min > current max,	READ current min as current max. (Store containing strategy). COMPARE finished.
% If no new cell in strategy,	COMPARE to current max.
% If COMPARE  finished,	MOVE to next new cell.
% If payoff cell < current min,	READ (Store) payoff cell as new current min. COMPARE finished.
% If payoff cell > current min,	ELIMINATE cell. COMPARE finished.
% If new cell READ,	COMPARE to current min.
% If new cell open,	READ payoff.
% If new cell closed,	OPEN new cell.
% If game starts,	MOVE to first strategy, first cell. Current max = empty. Current min = empty. CHOOSE focus=own payoff

run 'EIP_SIM_Bring_Game_Matrix.m' %Var game_matrix verfügbar
epsilon=0.01;
sim_count=0;
sim_erg_matrix=zeros(sim_limit,15);
EIP_diff=1;
choice_diff=1;
remain_strat_diff=1;
focus=0;
choice_vec_p=zeros(1,anz_strat);
while (EIP_diff>epsilon || choice_diff>epsilon || remain_strat_diff>epsilon || sim_count<sim_min)
    if sim_count>sim_limit
        break
    end
    count_READ=0;
    count_COMPARE_I=0;
    count_COMPARE_II=0;
    count_OPEN=0;
    count_ADD_I=0;
    count_ADD_II=0;
    count_END=0;
    count_ELIMINATE=0;
    count_MOVE=0;
    count_CHOOSE=0;
    count_FOCUS=0;
    count_STORE=0;
    count_EIPs=0;
    strat_choice=0;
    current_max=-1000;
    current_max_old=0;
    own_payoff_cell=0;
    current_min=1000;
    current_min_old=0;
    remain_strat=anz_strat;
    rnd_row=randperm(anz_strat);
    break_ok=0;
    for h=1:anz_strat %row
        for g=1:anz_strat %col
            
            
            if count_EIPs<EIP_max_time-1
                count_MOVE=count_MOVE+1;
                count_EIPs=count_EIPs+1;
            else
                break_ok=1;
                break;
            end
            if count_EIPs<EIP_max_time-1
                count_OPEN=count_OPEN+1;
                count_EIPs=count_EIPs+1;
            else
                break_ok=1;
                break;
            end
            if count_EIPs<EIP_max_time-1
                count_READ=count_READ+1;
                count_EIPs=count_EIPs+1;
            else
                break_ok=1;
                break;
            end
            own_payoff_cell=game_matrix(rnd_row(h),2*g-1);
            
            if own_payoff_cell < current_min %COMPARE_II
                current_min_old=current_min;
                current_min = own_payoff_cell;
                if count_EIPs<EIP_max_time-1
                    count_STORE=count_STORE+1;
                    count_EIPs=count_EIPs+1;
                else
                    break_ok=1;
                    break;
                end
                if current_min_old==1000
                else
                    if count_EIPs<EIP_max_time-1
                        count_ELIMINATE=count_ELIMINATE+1;
                        count_EIPs=count_EIPs+1;
                    else
                        break_ok=1;
                        break;
                    end
                end
            else
                if count_EIPs<EIP_max_time-1
                    count_ELIMINATE=count_ELIMINATE+1;
                    count_EIPs=count_EIPs+1;
                else
                    break_ok=1;
                    break;
                end
            end
            if count_EIPs<EIP_max_time-1
                count_COMPARE_II=count_COMPARE_II+1;
                count_EIPs=count_EIPs+1;
            else
                break_ok=1;
                break;
            end
            
        end
        
        if current_max < current_min %COMPARE_II
            current_max_old=current_max;
            current_max = current_min;
            strat_choice=rnd_row(h);
%             remain_strat=1;
            if count_EIPs<EIP_max_time-1
                count_STORE=count_STORE+1;
                count_EIPs=count_EIPs+1;
            else
                break_ok=1;
                break;
            end
            if current_max_old==-1000
            else
                if count_EIPs<EIP_max_time-1
                    count_ELIMINATE=count_ELIMINATE+1;
                    count_EIPs=count_EIPs+1;
                    remain_strat=remain_strat-1;
                else
                    break_ok=1;
                    break;
                end
            end
        else
            if count_EIPs<EIP_max_time-1
                count_ELIMINATE=count_ELIMINATE+1; %ELIMINATE Strategy from concideration
                count_EIPs=count_EIPs+1;
                remain_strat=remain_strat-1;
            else
                break_ok=1;
                break;
            end
        end
        if count_EIPs<EIP_max_time-1
            count_COMPARE_II=count_COMPARE_II+1;
            count_EIPs=count_EIPs+1;
        else
            break_ok=1;
            break;
        end
        current_min=1000;
    end
    
    if count_EIPs<EIP_max_time
        count_CHOOSE=count_CHOOSE+1;
        count_EIPs=count_EIPs+1;
    end
    
    if count_EIPs<EIP_max_time
        count_END=count_END+1;
        count_EIPs=count_EIPs+1;
    end
    
    %anschließend muss zu strat_choice (also strategien) normativ eine
    %Zuordnung gewählt werden.
    if break_ok==1 && current_max==-1000
        strat_choice=randi([1 anz_strat]);
    end
    
    sim_count=sim_count+1;
    if sim_count==1
        %         EIP_diff=count_EIPs;
        %         choice_diff=strat_choice;
        %         remain_strat_diff=anz_strat;
    else
        EIP_diff=abs((mean(sim_erg_matrix(1:sim_count-1,13),1))-(sum(sim_erg_matrix(:,13),1)+count_EIPs)/sim_count);
        choice_diff=abs((mean(sim_erg_matrix(1:sim_count-1,14),1))-(sum(sim_erg_matrix(:,14),1)+strat_choice)/sim_count);
        remain_strat_diff=abs((mean(sim_erg_matrix(1:sim_count-1,15),1))-(sum(sim_erg_matrix(:,15),1)+remain_strat)/sim_count);
    end
    sim_erg_matrix(sim_count,1:15)=[count_READ count_COMPARE_I count_COMPARE_II count_OPEN count_ADD_I count_ADD_II count_END count_ELIMINATE count_MOVE count_CHOOSE count_FOCUS count_STORE count_EIPs strat_choice remain_strat];
end

sim_erg_matrix(sum(sim_erg_matrix,2)==0,:)=[];
for k=1:anz_strat
    choice_vec_p(1,k)=size(sim_erg_matrix(sim_erg_matrix(:,14)==k),1)/sim_count;
end
newrow=[heuristic_name game_name anz_strat EIP_max_time num2cell(mean(sim_erg_matrix,1)) focus choice_vec_p];
B=array2table(newrow);
B.Properties.VariableNames=A_heads;
A = exist('sim_erg_table', 'var');
if A
    sim_erg_table=[sim_erg_table;B];
else
    sim_erg_table=B;
end
% end function and go back to do_simulation.m

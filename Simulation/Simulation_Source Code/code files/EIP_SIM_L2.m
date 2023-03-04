% nachfolgende Funktion ist Produktionssystem Heuristik L2 (beste Antwort auf Naiive)
% If strategy chosen,	END game.
%If time limit reached AND Isempty(current max), chose alternative randomly (uniform distribution)
% If no new cell in max_strat,	CHOOSE own strategy containing current_max.
% If own payoff < current_max,	ELIMINATE cell containing own payoff.
% If own payoff > current_max,	own payoff = current max, MOVE to next cell in max_strat.
% If cell of max_strat READ,	COMPARE own payoff to current_max.
% if max_strat stored,	MOVE to first cell of max_strat.
% If no new strategy,	STORE opponent strategy containing current max as max_strat, All cells of max_strat = new cells, CHOOSE focus= own payoff, current_max=empty.
% If COMPARE finished,	MOVE to next new strategy, new cell.
% If current sum < current max,	ELIMINATE current strategy. Current sum = 0. COMPARE finished.
% If current sum > current max,	READ current sum as current max. (Store containing strategy). Current sum = 0. COMPARE finished.
% If no new cell in strategy,	COMPARE to current max.
% If ADD finished,	MOVE to next new cell.
% If new cell READ,	ADD to current sum.
% If new cell open,	READ focused payoff.
% If new cell closed,	OPEN new cell.
% If game starts,	MOVE to first opponent strategy, first cell. Current sum = 0. Current max = empty. CHOOSE focus= opponent payoff.

run 'EIP_SIM_Bring_Game_Matrix.m' %Var game_matrix verf�gbar
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
    strat_op_choice=1;
    current_max=-1000;
    current_sum=0;
    own_payoff_cell=0;
    break_ok=0;
    remain_strat=anz_strat;
    rnd_row=randperm(anz_strat);
    for g=1:anz_strat %row
        for h=1:anz_strat %col
            
            
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
            
            current_sum=current_sum+game_matrix(rnd_row(h), 2*g);
            if count_EIPs<EIP_max_time-1
                count_ADD_I=count_ADD_I+1;
                count_EIPs=count_EIPs+1;
            else
                break_ok=1;
                break;
            end
            
            
        end %col end
        
        if current_max < current_sum || current_max==-1000 %COMPARE_II
            current_max = current_sum;
            strat_op_choice=g;
            
            if count_EIPs<EIP_max_time-1
                count_STORE=count_STORE+1;
                count_EIPs=count_EIPs+1;
            else
                break_ok=1;
                break;
            end
        else
            if count_EIPs<EIP_max_time-1
                count_ELIMINATE=count_ELIMINATE+1; %ELIMINATE Strategy from concideration
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
        
        current_sum=0;
        if break_ok==1
            break;
        end
    end
    
    current_sum=-1000;
    rnd_row=randperm(anz_strat);
    for h=1:anz_strat
        if game_matrix(rnd_row(h),2*strat_op_choice-1)>current_sum
            current_sum=game_matrix(rnd_row(h),2*strat_op_choice-1);
            strat_choice=rnd_row(h);
            if h>1
                remain_strat=remain_strat-1;
                if count_EIPs<EIP_max_time-1
                    count_ELIMINATE=count_ELIMINATE+1;
                    count_EIPs=count_EIPs+1;
                else
                break
                end
            end
            
        else
            if count_EIPs<EIP_max_time-1
                count_ELIMINATE=count_ELIMINATE+1;
                count_EIPs=count_EIPs+1;
                remain_strat=remain_strat-1;
            else
                break;
            end
        end
        if count_EIPs<EIP_max_time-1
            count_COMPARE_II=count_COMPARE_II+1;
            count_EIPs=count_EIPs+1;
        else
            break;
        end
    end
    
    
    if count_EIPs<EIP_max_time
        count_CHOOSE=count_CHOOSE+1;
        count_EIPs=count_EIPs+1;
    end
    
    if count_EIPs<EIP_max_time
        count_END=count_END+1;
        count_EIPs=count_EIPs+1;
    end
    
    %anschlie�end muss zu strat_choice (also strategien) normativ eine
    %Zuordnung gew�hlt werden.
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

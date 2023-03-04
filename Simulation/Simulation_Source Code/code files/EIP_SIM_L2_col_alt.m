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

run 'EIP_SIM_Bring_Game_Matrix.m' %Var game_matrix verfügbar
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

for g=1:anz_strat %col
    for h=1:anz_strat %row
        
        
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
        
        current_sum=current_sum+game_matrix(g,2*h-1);
        if count_EIPs<EIP_max_time-1
            count_ADD_I=count_ADD_I+1;
            count_EIPs=count_EIPs+1;
        else
            break_ok=1;
            break;
        end
        
        
    end %col end
    
    if current_max < current_sum || (current_max==-1000)%COMPARE_II
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
for h=1:anz_strat
    if game_matrix(strat_op_choice,2*h)>current_sum
        current_sum=game_matrix(strat_op_choice,2*h);
        strat_choice=h;
        
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

%anschließend muss zu strat_choice (also strategien) normativ eine
%Zuordnung gewählt werden.
if break_ok==1 && isempty(current_max)
strat_choice=randi([1 anz_strat]);
end
newrow=[heuristic_name game_name anz_strat EIP_max_time count_READ count_COMPARE_I count_COMPARE_II count_OPEN count_ADD_I,count_ADD_II count_END count_ELIMINATE count_MOVE count_CHOOSE count_FOCUS count_STORE count_EIPs strat_choice remain_strat];
B=array2table(newrow);
B.Properties.VariableNames=A_heads;
A = exist('sim_erg_table', 'var');
if A
sim_erg_table=[sim_erg_table;B];
else
    sim_erg_table=B;
end
% end function and go back to do_simulation.m

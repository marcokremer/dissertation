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



% anz_strat und Game_Matrix (als Index) muss ?bergeben werden (vielleicht als globale Variablen von 
%do_simulation in workspace eingebracht?!

%game_matrix=give_me_matrix(anz_strat,i);
run 'EIP_SIM_Bring_Game_Matrix.m' %Var game_matrix verf?gbar
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
current_max;
own_payoff_cell=0;
current_min=1000;
remain_strat=anz_strat;

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
		own_payoff_cell=game_matrix(g,2*h); 
		
		if own_payoff_cell < current_min %COMPARE_II
			current_min = own_payoff_cell;
			if count_EIPs<EIP_max_time-1   
				count_STORE=count_STORE+1;
				count_EIPs=count_EIPs+1;
			else
				break_ok=1;
				break;
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

		if current_max < current_min || isempty(current_max)%COMPARE_II
			current_max = current_min;
			strat_choice=h;
			
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
		current_min=0;
	end

if count_EIPs<EIP_max_time
    	count_CHOOSE=count_CHOOSE+1;
    	count_EIPs=count_EIPs+1;
end

if count_EIPs<EIP_max_time   
	count_END=count_END+1;
	count_EIPs=count_EIPs+1;
end

    %anschlie?end muss zu strat_choice (also strategien) normativ eine
    %Zuordnung gew?hlt werden.
if break_ok==1 && isempty(current_max)
strat_choice=randi([1 anz_strat]);
end
newrow=[heuristic_name game_name anz_strat EIP_max_time count_READ count_COMPARE_I count_COMPARE_II count_OPEN count_ADD_I count_ADD_II count_END count_ELIMINATE count_MOVE count_CHOOSE count_FOCUS count_STORE count_EIPs strat_choice remain_strat];
B=array2table(newrow);
B.Properties.VariableNames=A_heads;
A = exist('sim_erg_table', 'var');
if A
sim_erg_table=[sim_erg_table;B];
else
    sim_erg_table=B;
end
% end function and go back to do_simulation.m 

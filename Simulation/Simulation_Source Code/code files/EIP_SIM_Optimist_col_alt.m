% nachfolgende Funktion ist Produktionssystem Heuristik Optimist
% If strategy chosen,	END game.
%If time limit reached AND Isempty(current max), chose alternative randomly (uniform distribution) 
% If no new strategy,	CHOOSE strategy containing current max.
% If no new cell in strategy,	MOVE to next new strategy, new cell.
% If COMPARE finished,	MOVE to next new cell.
% If own payoff cell > current max,	READ (Store) own payoff cell as new current max. COMPARE finished.
% If own payoff cell < current max,	ELIMINATE cell. COMPARE finished.
% If new cell READ,	COMPARE to current max. 
% If new cell open,	READ own payoff.
% If new cell closed,	OPEN new cell.
% If game starts,	MOVE to first strategy, first cell. Current max = empty.

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
current_max;
own_payoff_cell=0;


	for h=1:anz_strat %col
		for g=1:anz_strat %row

		
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
		
		if own_payoff_cell > current_max ||isempty(current_max)%COMPARE_II
			current_max = own_payoff_cell;
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
	end

if count_EIPs<EIP_max_time
    	count_CHOOSE=count_CHOOSE+1;
    	count_EIPs=count_EIPs+1;
end

if count_EIPs<EIP_max_time   
	count_END=count_END+1;
	count_EIPs=count_EIPs+1;
end

%remain_strat= ceil(((anz_strat*anz_strat) - count_ELIMINATE)/anz_strat)
%ist das gleich wie untere Zeile, nur weniger Berechnung:
remain_strat= ceil(anz_strat - count_ELIMINATE/anz_strat);
if remain_strat==0
    remain_strat=1;
end

%anschließend muss zu strat_choice (also strategien) normativ eine
%Zuordnung gewählt werden.
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

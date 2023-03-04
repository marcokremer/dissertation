%nachfolgend Production system for heuristic Random
% If strategy chosen,	END game.
% If game starts,	CHOOSE a strategy randomly.
% anz_strat und Game_Matrix (als Index) muss übergeben werden (vielleicht als globale Variablen von 
%do_simulation in workspace eingebracht?!
%game_matrix=Chicken(1:2,1:4);
%anz_strat=2;
%game_index=1;
%heuristic = Random
%game_matrix=give_me_matrix(anz_strat,i);
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


while count_END==0
    while count_CHOOSE==0
    strat_choice=randi([1 anz_strat]);
%Abbruchbedingung Anz EIPs: letzter EIP ist Random CHOOSE aus verbleibenden Strategienset oder END vorbehalten
    if count_EIPs<EIP_max_time
    count_CHOOSE=count_CHOOSE+1;
    count_EIPs=count_EIPs+1;
	else
		break_ok=1;
		break;
    end
    end 
%Abbruchbedingung Anz EIPs:
if count_EIPs<EIP_max_time   
count_END=count_END+1;
count_EIPs=count_EIPs+1;
else
	break_ok=1;
	break;
end
end

remain_strat=anz_strat;

% save data (count_*variables, strat_choice)
    %anschließend muss zu strat_choice (also strategien) normativ eine
    %Zuordnung gewählt werden.
if break_ok==1
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

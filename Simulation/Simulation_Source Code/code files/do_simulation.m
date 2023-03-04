%nachfolgende funktion bildet die klammer um die einzelnen module und führt
%mit einigen simulationsparameter die simulation aus
%Zwei Versionen Abbruchbedingung: 1. Ist Zeitende bekannt, wird letztes EIP CHOICE oder END
%2. Ist Zeitende unbekannt, ist letztes EIP frei - Wahl ist nicht zwingend erforderlich
%Beobachtetes Verhalten einer zufälligen Wahl am Anfang der Aufgabenbearbeitung stimmt mit Version 1. überein.

%Parameter

Games_Variablen_struct =load ('BasicGames.mat'); %lade Grundspiele-Variablen
Games_Variablen = matfile('BasicGames.mat');
heuristic_list={'Random' 'Altruist' 'Optimist' 'Pessimist' 'Naiive' 'L2' 'D1' 'D2' 'Equilibrium'};
% heuristic_list={'D2' 'Equilibrium'};
varlist = who(Games_Variablen);

%heuristic_name='Random';

%erstellt Tabelle
A_heads={'heuristic_name' 'game_name' 'anz_strat' 'EIP_max_time' 'count_READ' 'count_COMPARE_I' 'count_COMPARE_II' 'count_OPEN' 'count_ADD_I' 'count_ADD_II' 'count_END' 'count_ELIMINATE' 'count_MOVE' 'count_CHOOSE' 'count_FOCUS' 'count_STORE' 'count_EIPs' 'strat_choice' 'remain_strat' 'focus' 'choice_probs'};

%Simulationsschleifen: Zeit, Größe, Zufallszahl(?), Spiel
%Initialisierung Schleifenparameter
time_parameter=5:3:1400;
% time_parameter=1202:3:1400;
game_parameter=varlist; 
complex_paramter=2:5;


%in Schleifen:
 for i=1:size(heuristic_list,2)
% for i=7:9%1:9%Syntax
    total_runs=0;
    tic
    heuristic_name=heuristic_list(i);
    heuristic_dat= strcat('EIP_SIM_', heuristic_name, '.m');
%     load(['EIP_SIM_' heuristic_name{1,1}]);
    for m=1:size(varlist,1)
        game_name=varlist(m);
        %game_name='Stackelberg';
        for j=1:size(complex_paramter,2)
%          for j=4:4
            anz_strat=complex_paramter(j);
            if i>6
                sim_limit=50*j;
            else
                sim_limit=100*j;
            end
            %anz_strat=5;
            sim_min=7; % for two alternatives, each with probability 0.5, 
            %repeat simulation as often as the probability of chosing the 
            %same alternative is smaller 0.01 --> ceil(log_2(100))=7;  
            %alternative 
            if anz_strat>2
                switch game_name{1,1}
                    case {'Costa2a', 'Costa2b', 'Costa3a', 'Costa3b'}
                        break;
                end
            end
            for k=1:size(time_parameter,2) %Syntax
                EIP_max_time=time_parameter(k);
                %EIP_max_time=914;
                run (heuristic_dat{1,1});
                total_runs=total_runs+sim_count;
            end
        end
        %         sim_erg_file=fullfile(strcat('EIP_SIM_', heuristic_name, '.xls'));
        %         file_name=char(sim_erg_file);
        %         sim_erg_table.Properties.VariableNames=A_heads;
        %         writetable(sim_erg_table,file_name);
        
    end    
        var_name=strcat('EIP_SIM_', heuristic_name, '.mat');
        save(var_name{1,1},'sim_erg_table');
        sim_time=toc;
        msgtext=['Simulation of heuristic '  ' ' heuristic_name{1,1} ' completed.'];
        msgresults_1=['Duration:',' ', num2str(sim_time), ' s'];
        msgresults_2=['Runs:',' ', num2str(total_runs)];
        msgbox({msgtext,msgresults_1, msgresults_2},'Success','modal');
        clearvars sim_erg_table;
end




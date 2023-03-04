%Modul berechnet Effectivity_Goal_3: Payoff gegen andere Strategien
%Zunächst wird jede Strategie mit jeder anderen in jedem Spiel zu jeder
%Zeit zusammengespielt. Das Ergebnis wird in der matching_erg_struct gespeichert.
%Die Mittelwerte werden dann in die Heuristic_Erg.mat-Files in Zellen
%(2,:) geschrieben.
%load matching_erg_struct;

%get games aus do_simulation

load ('heuristic_col_struct.mat');
mystruct_col=mystruct;
load ('heuristic_struct.mat');
Games_Variablen_struct =load ('BasicGames.mat'); %lade Grundspiele-Variablen
Games_Variablen = matfile('BasicGames.mat');
heuristic_list={'Random' 'Altruist' 'Optimist' 'Pessimist' 'Naiive' 'L2' 'D1' 'D2' 'Equilibrium'};
varlist = who(Games_Variablen);

time_parameter=5:3:1400;
game_parameter=varlist; %hier muss in der Schleife die varlist (enthält alle Spielnamen) durchgegangen werden
complex_paramter=2:5;
game_names=fieldnames(mystruct);
%Initialisierung von matching_erg_struct und matching_erg_struct_col
% for k=1:252
% varname=game_names{k};
% matching_erg_struct.(varname)= mystruct.(varname)(1:399,1: 10);
% matching_erg_struct_col.(varname)= mystruct_col.(varname)(1:399,1: 10);
% end
% 
% save matching_erg_struct matching_erg_struct;
% save matching_erg_struct_col matching_erg_struct_col;
% 
%in Schleifen:
%for i=1:size(heuristic_list,2)
for i=1:9%Heuristik-Schleife
    heuristic_name=heuristic_list(i);
   
    for m=1:size(varlist,1)%Spieltyp-Schleife
        game_name=varlist(m);
        %game_name='Stackelberg';
        for j=1:size(complex_paramter,2)%Komplexitätsschleife
            anz_strat=complex_paramter(j);
            %anz_strat=5;
            if anz_strat>2
                switch game_name{1,1}
                    case {'Costa2a', 'Costa2b', 'Costa3a', 'Costa3b'}
                        break;
                end
            end
            field_name_struct_own= strcat(heuristic_name,'_',game_name,'_',num2str(anz_strat));
            %[c,d]=ismember(heuristic_name,heuristic_list);
            for l=1:9
                heuristic_name_opp=heuristic_list(l);
                field_name_struct_opp= strcat(heuristic_name_opp,'_',game_name,'_',num2str(anz_strat));
                for k=1:size(time_parameter,2) %Time_Limit-Schleife
                    %EIP_max_time=time_parameter(k);
                    %EIP_max_time=914;
                    %run (heuristic_dat{1,1});
                    T=field_name_struct_own{1,1};
                    T_col=field_name_struct_opp{1,1};
                    own_strat=mystruct.(T);
                    opp_strat=mystruct_col.(T_col);
                    [own_payoff, opp_payoff]=get_payoff_result(own_strat(k,18:end),opp_strat(k,18:end),game_name{1,1});
                    %Felder der Spalten 2-10 werden mit den
                    %matching_ergebnissen überschrieben. EIP_Erg sind
                    %nachwievor in der mystruct vorhanden. Spalte 1
                    %EIP_Time_Limit bleibt erhalten.

                    matching_erg_struct.(T)(k,1+l)=own_payoff;
                    matching_erg_struct_col.(T_col)(k,1+i)=opp_payoff;
                end
                matching_erg_struct.(T)(:,1)=time_parameter;
                matching_erg_struct_col.(T_col)(:,1)=time_parameter;
                
            end
        end
        
    end
    
end
save matching_erg_struct matching_erg_struct;
save matching_erg_struct_col matching_erg_struct_col;
% nachfolgende Funktion ist Produktionssystem Heuristik EQUILIBRIUM
% Zellen schließen automatisch nachdem Zeiger raus aus Bereich ist müssen dementsprechend wieder geöffnet werden zum anschauen --> Zählweise count_OPEN
% Ein kompletter Durchgang iterated elimination of dominated strategies betrachtet die vollständigen Strategien beider Spieler. In dieser Heuristik werden zwei Durchgänge durchgeführt.
% Ansatz für Verfeinerung (noch nicht umgesetzt): - count_OPEN auch für Experimentdesignes, wo Zellen offen bleiben anpassen
% - MOVE spezifizieren nach Richtung
% production system:
%If strategy chosen,	END game.
%If no more ELIMIMINATION after last two changes of foduc,	CHOOSE a strategy from remaining strategy set randomly.
%If all strategies compared to each other,	CHANGE focus. CHANGE_count = CHANGE_count +1
%If all payoffs in strategy compared,	ELIMINATE strategy not containing max. Next MOVE = MOVE to next new strategy, new cell.
%if no new cells in strategy,	all payoffs in strategy compared.
%If MOVE 3 + MOVE 2 not possible,	no new cells in strategy.
%If COMPARE finished,	Do next MOVE.
%COMPARE_strategies(a,b):
%case a=b:	next MOVE = MOVE 3 + MOVE 2. COMPARE_strategies finished.
%case else:	ELIMINATE payoff and strategies from STM. Next MOVE = MOVE to next new strategy, new cell.
%If two max containing strategies in STM,	COMPARE_strategies(strat1, strat2)
%COMPARE_payoff(a,b):
%case a>b:	max=a. COMPARE_payoff finished.
%case else:	max=b. COMPARE_payoff finished.
%If two payoffs in STM,	COMPARE_payoffs(payoff_1, payoff_2). STORE max containing strategy in STM. ELIMINATE payoffs from STM.
%If one payoff in STM,	Next MOVE = MOVE 1. Do next MOVE.
%If cell read,	STORE payoff in STM.
%If cell open,	READ payoff.
%If payoff focus = opponent,	FOCUS on opponent payoff data. MOVE 1 = horizontal to new cell in next strategy, MOVE 2 = vertical to new cell in current strategy, MOVE 3 = -MOVE 1.
%If payoff focus = own,	FOCUS on own payoff data. MOVE 1 = vertical to new cell in next strategy, MOVE 2 = horizontal to new cell in current strategy, MOVE 3 = - MOVE 1.
%If cell closed,	OPEN cell.
%If game starts,	CHOOSE payoff focus. Current max = empty. MOVE to first (nearest) strategy, first cell. First strategy = current strategy. First cell = current cell. CHANGE_count=0

run 'EIP_SIM_Bring_Game_Matrix.m' %Var game_matrix verfügbar
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
%Initialisierung Variablen
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
current_sum=0;
current_max=-1000;
own_payoff_cell=0;
opponent_payoff_cell=0;
current_min=1000;
count_STM=0;
count_change=0;
STM=0;
next_move=0;
max_strat=0;
max_change=0;
it_dom_matrix=ones(1,anz_strat);
it_2_dom_matrix=ones(1,anz_strat);
it_1_dom_matrix=ones(1,anz_strat);
remain_alter_own=ones(1,anz_strat);
comp_strat_1=0;
comp_strat_2=0;
count_cell_comp=0;
max_strat_alt=0;
max_strat_count=0;
i=1;
count_strat_rng=0;
strat_rng=0;
ELIM_count=0;
time_break=0;
go_break=0;
neutr_count=0;
neutr=0;
remain_strat=anz_strat;
break_ok=0;
%Festlegen / CHOOSE Fokus
focus=randi(2)-1;    %focus=0; %own   %focus=1; %opponent

if count_EIPs<EIP_max_time-1
    count_CHOOSE=count_CHOOSE+1;
    count_EIPs=count_EIPs+1;
end


%undefined rounds eliminating dominated strategies = go through both players' strategies
while ELIM_count<2
    %neu Schleife
    if time_break==1
        break;
    end
    if i<3 
        dom_matrix=ones(1,anz_strat);
    else
        switch mod(i,2) 
            case 0
                dom_matrix=it_2_dom_matrix;
                it_dom_matrix=it_1_dom_matrix; %neu
            otherwise
                dom_matrix=it_1_dom_matrix;
                it_dom_matrix=it_2_dom_matrix; %neu
        end
    end
    
    %Schleifen durchlaufen alle paarweise Varianten Strategienvergleich
    for g=1:anz_strat
        %neu Schleife
        if time_break==1
            break;
        end
        if dom_matrix(g)~=0
            comp_strat_1=g; %comp_strat hat keine weitere Nutzung
        else
            break;
        end
        for gg=g+1:anz_strat
            %neu Schleife
            if time_break==1
                break;
            end
            if dom_matrix(gg)~=0
                comp_strat_2=gg; %findet keine weiter Verwendung
            else
                break;
            end
            %Zellenvergleich
            
            
            rnd_row=randperm(anz_strat);
            for m=1:anz_strat
                %neu Schleife
                if time_break==1
                    break;
                end
                if it_dom_matrix(rnd_row(m))==1
                    switch (EIP_max_time-(count_EIPs+1)) %ein EIP bleibt für Randomchoice
                        case 6
                            count_MOVE=count_MOVE+2;
                            count_OPEN=count_OPEN+2;
                            count_READ=count_READ+2;
                            count_EIPs=count_EIPs+6;
                            go_break=1;
                        case 5
                            count_MOVE=count_MOVE+2;
                            count_OPEN=count_OPEN+2;
                            count_READ=count_READ+1;
                            count_EIPs=count_EIPs+5;
                            go_break=1;
                        case 4
                            count_MOVE=count_MOVE+2;
                            count_OPEN=count_OPEN+1;
                            count_READ=count_READ+1;
                            count_EIPs=count_EIPs+4;
                            go_break=1;
                        case 3
                            count_MOVE=count_MOVE+1;
                            count_OPEN=count_OPEN+1;
                            count_READ=count_READ+1;
                            count_EIPs=count_EIPs+3;
                            go_break=1;
                        case 2
                            count_MOVE=count_MOVE+1;
                            count_OPEN=count_OPEN+1;
                            count_EIPs=count_EIPs+2;
                            go_break=1;
                        case 1
                            count_MOVE=count_MOVE+1;
                            count_EIPs=count_EIPs+1;
                            go_break=1;
                        otherwise
                            if (EIP_max_time-(count_EIPs+1))>6
                                count_MOVE=count_MOVE+2;
                                count_READ=count_READ+2;
                                count_OPEN=count_OPEN+2; %wie wird zwischen offenen und geschlossenen cells unterschieden?
                                count_COMPARE_I=count_COMPARE_I+1;
                                count_EIPs=count_EIPs+7;
                            else
                                go_break=1;
                            end
                    end
                    
                    %neue Schleife
                    if go_break==1
                        go_break=0;
                        time_break=1;
                        break;
                    end
                    
                    %Zellen öffnen und vergleichen
                    if focus
                        if game_matrix(rnd_row(m),2*g)>game_matrix(rnd_row(m),2*gg)
                            max_strat=g;
                        end
                        if game_matrix(rnd_row(m),2*g)==game_matrix(rnd_row(m),2*gg)
                            neutr_count=neutr_count+1;
                            neutr=1;
                        end
                        if game_matrix(rnd_row(m),2*g)<game_matrix(rnd_row(m),2*gg)
                            max_strat=gg;
                        end
                    else
                        if game_matrix(g,2*rnd_row(m)-1)>game_matrix(gg,2*rnd_row(m)-1)
                            max_strat=g;
                        end
                        if game_matrix(g,2*rnd_row(m)-1)==game_matrix(gg,2*rnd_row(m)-1)
                            neutr_count=neutr_count+1;
                            neutr=1;
                        end
                        if game_matrix(g,2*rnd_row(m)-1)<game_matrix(gg,2*rnd_row(m)-1)
                            max_strat=gg;
                        end
                    end
                    
                    if count_EIPs<EIP_max_time-1
                        count_STORE=count_STORE+1;
                        count_EIPs=count_EIPs+1;
                    else
                        time_break=1;
                        break;
                    end
                    
                    %if count_EIPs<EIP_max_time-1
                    %    count_COMPARE_I=count_COMPARE_I+1;
                    %    count_EIPs=count_EIPs+1;
                    %end
                    
                    if neutr~=1
                        if max_strat_alt ~= 0
                            if max_strat~=max_strat_alt
                                max_strat=0;
                                max_strat_alt=0;
                                max_strat_count=0;
                                
                                break; %Strategien dominieren sich nicht und müssen  deshalb nicht weiter verglichen werden --> break raus aus m:anzstrat und Erhöhung gg
                                
                            else
                                max_strat_count=max_strat_count+1;
                            end
                        else
                            max_strat_alt=max_strat;
                            max_strat_count=max_strat_count+1;
                        end
                    else
                        neutr=0;
                    end
                    
                    
                    %if max_strat_count==anz_strat
                    %neu (5 Zeilen)
                    if max_strat_count+neutr_count==sum(it_dom_matrix) % sum()=Anz nicht dominierter Strategien von own bzw. opponent
                        
                        if count_EIPs<EIP_max_time-1
                            count_ELIMINATE=count_ELIMINATE+1;
                            count_EIPs=count_EIPs+1;
                        else
                            time_break=1;
                            break;
                        end
                        
                        if max_strat==g
                            %gg wird dominiert
                            dom_matrix(gg)=0;
                        else
                            %g wird dominiert
                            dom_matrix(g)=0;
                            go_break=1;
                        end
                    end
                    if count_EIPs>EIP_max_time-1
                        break;
                    end
                end % zu if it_dom_matrix(m)==1
            end % zu for m=1:anz_strat
            neutr_count=0;
            % neue Schleife
            if go_break==1
                go_break=0;
                break;
            end
        end % zu for gg=g+1:anz_strat
    end  % zu for g=1:anz_strat
    
    switch mod(i,2)
        case 0
            if it_2_dom_matrix==dom_matrix %hier ist nicht ganz klar, wie das Ergebnis der Operation (alle Elemente der Arrays werden paarweise geprüft weiterverarbeitet wird)
                ELIM_count=ELIM_count+1;
            end
            it_2_dom_matrix=dom_matrix;
        otherwise
            if it_1_dom_matrix==dom_matrix
                ELIM_count=ELIM_count+1;
            end
            it_1_dom_matrix=dom_matrix;
    end
    
    %neu: Position Wechsel Fokus
    if focus
        focus=0;
        remain_alter_opp=dom_matrix;
    else
        focus=1;
        remain_alter_own=dom_matrix;
    end
    %neu: Position end zu for i=1:4
    max_strat=0;
    max_strat_alt=0;
    max_strat_count=0;
    neutr_count=0;
    i=i+1;
end % zu for i=1:4


remain_strat=sum(remain_alter_own);
if time_break~=1
    
    break_ok=0;
    rnd_row_n=randperm(anz_strat);
    for h=1:anz_strat %row
        if remain_alter_own(rnd_row_n(h))==1
            
            for g=1:anz_strat %col
                
                if remain_alter_opp(g)==1
                    if count_EIPs<EIP_max_time-1
                        count_MOVE=count_MOVE+1;
                        count_EIPs=count_EIPs+1;
                    else
                        break_ok=1;
                        time_break=1;
                        break;
                    end
                    if count_EIPs<EIP_max_time-1
                        count_OPEN=count_OPEN+1;
                        count_EIPs=count_EIPs+1;
                    else
                        break_ok=1;
                        time_break=1;
                        break;
                    end
                    if count_EIPs<EIP_max_time-1
                        count_READ=count_READ+1;
                        count_EIPs=count_EIPs+1;
                    else
                        break_ok=1;
                        time_break=1;
                        break;
                    end
                    
                    
                    if count_EIPs<EIP_max_time-1
                        count_ADD_I=count_ADD_I+1;
                        count_EIPs=count_EIPs+1;
                        current_sum=current_sum+game_matrix(rnd_row_n(h),2*g-1);
                    else
                        break_ok=1;
                        time_break=1;
                        break;
                    end
                    
                end
            end %col end
            
            if current_max == current_sum
                else
                    if current_max < current_sum %COMPARE_II
                        if count_EIPs<EIP_max_time-1
                            count_STORE=count_STORE+1;
                            count_EIPs=count_EIPs+1;
                        else
                            break_ok=1;
                            time_break=1;
                            break;
                        end
                        
                        current_max = current_sum;
                        strat_choice=rnd_row_n(h);
                    end
                    if h==1
                    else
                        if count_EIPs<EIP_max_time-1
                            count_ELIMINATE=count_ELIMINATE+1; %ELIMINATE Strategy from concideration
                            count_EIPs=count_EIPs+1;
                            remain_strat=remain_strat-1;
                        else
                            break_ok=1;
                            time_break=1;
                            break;
                        end
                    end
            end
                
            if count_EIPs<EIP_max_time-1
                count_COMPARE_II=count_COMPARE_II+1;
                count_EIPs=count_EIPs+1;
            else
                break_ok=1;
                time_break=1;
                break;
            end
            current_sum=0;
            if break_ok==1
                break;
            end
        end
    end %row end
end
    %Berechnung Random Choice
    %     strat_rng ist zufällige Strategienummer der verbliebenen Strategien.
    if time_break==1
        while strat_rng==0
            strat_rng=ceil(sum(remain_alter_own)*rand(1,1));
        end
        %remain_strat=sum(remain_alter_own);
        for v=1:anz_strat
            if remain_alter_own(v)==1
                count_strat_rng=count_strat_rng+1;
            end
            if count_strat_rng==strat_rng
                strat_choice=v;
                break;
            end
        end
    end


if count_EIPs<EIP_max_time-1
    count_CHOOSE=count_CHOOSE+1;
    count_EIPs=count_EIPs+1;
end

if count_EIPs<EIP_max_time-1
    count_END=count_END+1;
    count_EIPs=count_EIPs+1;
end

if remain_strat<1
   remain_strat=1;
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
A = exist('sim_erg_table','var');
if A
sim_erg_table=[sim_erg_table;B];
else
    sim_erg_table=B;
end
% end function and go back to do_simulation.m

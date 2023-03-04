function [own_payoff, opp_payoff] = get_payoff_result( g_own,h_opp, game)
%get_payoff_results berechnet den resultierenden Payoff eines Spiels
% game, wenn eigene Strategiewahl g und Opponent-Strategiewahl h ist.
%BasicGames.mat muss dafür geladen worden sein!
Games_Variablen_struct =load ('BasicGames.mat'); 
%A=char(game);
game_matrix=Games_Variablen_struct.(game);
own_payoff=0;
opp_payoff=0;
g_size=size(g_own,2);
h_size=size(h_opp,2);
g_vec=[1:g_size];
h_vec=[1:h_size];

for i=1:g_size
    for j=1:h_size
own_payoff=own_payoff+g_own(i)*h_opp(j)*game_matrix(g_vec(i),2*h_vec(j)-1);
opp_payoff=opp_payoff+g_own(i)*h_opp(j)*game_matrix(g_vec(i),2*h_vec(j));
    end
end
end


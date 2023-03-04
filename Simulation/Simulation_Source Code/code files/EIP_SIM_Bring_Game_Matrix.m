% nachfolgende Funktion soll Spiele in richtiger Größe und mit Zufallszahl
% gewichtet für Simulationsschleifen bereitstellen
% Var Index muss übergeben werden, um auf das richtige Spiel zurückgreifen
% zu können
% Var anz_stra muss übergeben werden damit die richtige anszahl an
% strategien zurückgegeben wird.
%nachfolgende drei Zeilen nach do_simulation verlagert--> 
%load BasicGames.mat %lade Grundspiele-Variablen
%Games_Variablen = matfile('BasicGames.mat');
%varlist = who(Games_Variablen);
%game_index=i;

%matrix1=varlist{game_index};
%matrix1=varlist{i};
%anz_strat=2;
% mit nachfolgender Zeile wird Inhalt varlist-element 1 (später Index) angesprochen
% hier muss noch eine Schleife rein, die die Größe des Spiels beinhaltet
% und das Grundspiel auf die entsprechende anz Strat korrigiert; Indexing-Reihenfolge:
% (row,col)
load('BasicGames.mat');
A=char(game_name);
game_matrix_full=Games_Variablen_struct.(A);
game_matrix=game_matrix_full(1:anz_strat,1: 2*anz_strat);


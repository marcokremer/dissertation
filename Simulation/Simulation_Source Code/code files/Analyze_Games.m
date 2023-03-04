%Skript wertet die Daten der Spiele aus

%lädt Spiele einer Heuristik
%vlt in for-Schleife?
load('Equilibrium_Games.mat');
%lädt Feldnamen der Struct in ein Cell-Array
game_names=fieldnames(mystruct);
%Zugriff auf die Spiele in mystruct

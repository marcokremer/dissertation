%Skript wertet die Daten der Spiele aus

%l�dt Spiele einer Heuristik
%vlt in for-Schleife?
load('Equilibrium_Games.mat');
%l�dt Feldnamen der Struct in ein Cell-Array
game_names=fieldnames(mystruct);
%Zugriff auf die Spiele in mystruct

%this file calculates the third goal of the heuristic performance concept
%in means of one heuristic in one size of games against all other
%heuristics.
load('matching_erg_struct.mat');
load('matching_erg_struct_col.mat');
% files=dir('Erg_Files');
% %Access to the file:
% path(path,'Erg_Files');
heuristic_list={'Random' 'Altruist' 'Optimist' 'Pessimist' 'Naiive' 'L2' 'D1' 'D2' 'Equilibrium'};
game_names=fieldnames(matching_erg_struct_col);
% is_col=0;
for g=1:2 %row and col
    if g==1
        is_col='';
    else
        is_col='_col';
    end
    
    heuristic_name=heuristic_list{9};
    heuristic_name_erg=[heuristic_name is_col '_Erg.mat'];
    heuristic_name_erg_new=[heuristic_name is_col '_only_equilibrium_Erg.mat'];
    load(heuristic_name_erg);
    
    for j=1:4
        search_expr=strcat('^.*',heuristic_name,'.*_',num2str(j+1),'.*$');
        G = regexp(game_names,search_expr,'match');  % Extract the matches
        G = [G{:}];%löschen aller leeren Einträge
        matches_games=G';
        [mx,~]=size(matches_games);
        %         E=matching_erg_struct.(matches_games{1});
        %         G=E(:,2:end);%ohne 3 = ohne rnd
        %         %for l=0:1
        %         %F=mean(E(:,2:end),2);
        %         F=mean(G,2); %Ä
        %         sumvec=F;
        %         sumvec=E(:,10);
        sumvec=0;
        for i=1:mx
            E=matching_erg_struct.(matches_games{i});
            sumvec=sumvec+E(:,10);%Equilibrium
        end
        sumvec_erg=sumvec/mx;
        heuristic_Erg{2,j}=sumvec_erg;
    end
    save(heuristic_name_erg_new,'heuristic_Erg');   
end

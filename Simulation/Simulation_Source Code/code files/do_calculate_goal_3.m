%this file calculates the third goal of the heuristic performance concept
%in means of one heuristic in one size of games against all other
%heuristics.
load('matching_erg_struct.mat');
load('matching_erg_struct_col.mat');
heuristic_list={'Random' 'Altruist' 'Optimist' 'Pessimist' 'Naiive' 'L2' 'D1' 'D2' 'Equilibrium'};
game_names=fieldnames(matching_erg_struct_col);
for g=1:2 %row and col
    if g==1
        is_col='';
    else
        is_col='_col';
    end
for f=1:size(heuristic_list,2)

    heuristic_name=heuristic_list{f};
    heuristic_name_erg=[heuristic_name is_col '_Erg.mat'];
    load(heuristic_name_erg);

    for j=1:4
        search_expr=strcat('^.*',heuristic_name,'.*_',num2str(j+1),'.*$');
        G = regexp(game_names,search_expr,'match');  % extract the matches
        G = [G{:}];%delete empty cells
        matches_games=G';
        [mx,~]=size(matches_games);
        sumvec=0;
        for i=1:mx
            E=matching_erg_struct.(matches_games{i});
            G=E(:,2:end);
            F=mean(G,2);
            sumvec=sumvec+F;
        end
        sumvec_erg=sumvec/mx;
        
        heuristic_Erg{2,j}=sumvec_erg;
    end
    save(heuristic_name_erg,'heuristic_Erg');
end
end

%test and aiding facility
%
load('Random_col_Games.mat');
game_names=fieldnames(mystruct_col);
%cell(1,:):Goal_2
%cell(2,:):Goal_3
%cell(3,:):Goal_4 of evaluation concept
Random_col_Erg=cell(3,4);
for j=1:4
    %G = regexp(game_names,'^.*Random.*_2.*$','match');  % Extract the matches
    switch j
        case 1
            G = regexp(game_names,'^.*Random.*_2.*$','match');
        case 2
            G = regexp(game_names,'^.*Random.*_3.*$','match');
        case 3
            G = regexp(game_names,'^.*Random.*_4.*$','match');
        case 4
            G = regexp(game_names,'^.*Random.*_5.*$','match');
    end
    G = [G{:}];
    matches_games=G';
    [mx,n]=size(matches_games);
    E=mystruct_col.(matches_games{1});
    for l=0:1
        sumvec=E(:,14+2*l);
        for i=2:mx
            E=mystruct_col.(matches_games{i});
            sumvec=sumvec+E(:,14+2*l);
        end
        sumvec_erg=sumvec/mx;
        Random_col_Erg{3-2*l,j}=sumvec_erg;
        save Random_col_Erg Random_col_Erg;
    end;
end
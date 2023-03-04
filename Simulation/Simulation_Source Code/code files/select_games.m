%test and aiding facility
%
heuristic_list={'Random' 'Altruist' 'Optimist' 'Pessimist' 'Naiive' 'L2' 'D1' 'D2' 'Equilibrium'};
for h=1:9

    load('heuristic_struct.mat');
    game_names=fieldnames(mystruct);
    %cell(1,:):Goal_2
    %cell(2,:):Goal_3
    %cell(3,:):Goal_4 of evaluation concept
    heuristic_Erg=cell(3,4);
    for j=1:4
        
        exp_txt=strcat('^.*',heuristic_list{h},'.*_',num2str(j+1),'.*$');
        G = regexp(game_names,exp_txt,'match');  % Extract the matches
%         switch j
%             case 1
%                 G = regexp(game_names,'^.*Random.*_2.*$','match');
%             case 2
%                 G = regexp(game_names,'^.*L2.*_3.*$','match');
%             case 3
%                 G = regexp(game_names,'^.*L2.*_4.*$','match');
%             case 4
%                 G = regexp(game_names,'^.*L2.*_5.*$','match');
%         end
        G = [G{:}];
        matches_games=G';
        [mx,n]=size(matches_games);
        E=mystruct.(matches_games{1});
        for l=0:1
            sumvec=E(:,14+2*l);
            for i=2:mx
                E=mystruct.(matches_games{i});
                sumvec=sumvec+E(:,14+2*l);
            end
            sumvec_erg=sumvec/mx;
            heuristic_Erg{3-2*l,j}=sumvec_erg;
            heuristic_var=strcat(heuristic_list{h},'_Erg.mat');
            
        end
    end
    save(heuristic_var, 'heuristic_Erg');
end
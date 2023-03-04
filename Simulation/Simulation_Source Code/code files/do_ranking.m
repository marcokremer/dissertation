%Script calculates rank of mean_results and stores in plotable facilities
%Ä: Einstellung für Berechnung Ranks im satutiertem Fall
load('heuristic_mean_sum.mat');
heuristic_list={'Altruist' 'Random' 'Optimist' 'Pessimist' 'Naiive' 'L2' 'D1' 'D2' 'Equilibrium'};

%initialization
%order_matrix=zeros(1, 10);
final_erg_mtrx=zeros(1,9,4,3); %Ä


for d=1:3 %Goals
    for c=1:4 %Complexity
        for a=1:4%Ä Time phases
            
            %             order_matrix=heuristic_mean_sum(a,2:10,c,d);
            %             order_matr_uni=unique(order_matrix);
            [~, ~, A] = unique(heuristic_mean_sum(a,2:10,c,d),'sorted');
            %             A=tiedrank(order_matrix);
            if d==2
                A=max(A)-A+1;
                %             else
                %                 Erg=A;
            end
            %             A=Erg;
            %
            if length(unique(A))<length(A)
                for x=1:9
                    b=length(A(A(:)==x));
                    if b>0
                        A(A(:)>x)=A(A(:)>x)+b-1;
                    end
                end
            end
            %             final_erg_mtrx(a,1:9,c,d)=floor(Erg);
            final_erg_mtrx(a,1:9,c,d)=A;
        end
    end
end
%contains order indices
save rank_matrix final_erg_mtrx;%Ä

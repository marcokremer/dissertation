%this file computes the regression function matrix for the heuristics.
load('D1_col_Erg.mat')
load('D2_col_Erg.mat')
load('Altruist_col_Erg.mat')
load('Equilibrium_col_Erg.mat')
load('L2_col_Erg.mat')
load('Naiive_col_Erg.mat')
load('Optimist_col_Erg.mat')
load('Pessimist_col_Erg.mat')
load('Random_col_Erg.mat')
load('Equilibrium_col_Games.mat')
load('pure_Equilibrium_Erg_col.mat')%make mystruct_long available
load('Time_Limit.mat')

%load('fitresult_2x2') %an zu berechnende Größe anpassen

for j=1:4
    heuristics_result_matrix_s=[Altruist_col_Erg{2,j} Random_col_Erg{2,j} Optimist_col_Erg{2,j} Pessimist_col_Erg{2,j} Naiive_col_Erg{2,j} L2_col_Erg{2,j} D1_col_Erg{2,j} D2_col_Erg{2,j} Equilibrium_col_Erg{2,j} pure_Equilibrium_Erg_col{1,j}];
    
    %% Initialization.
    
    % Initialize arrays to store fits and goodness-of-fit.
    fitresult = cell( 10, 1 );
    gof = struct( 'sse', cell( 10, 1 ), ...
        'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );
    %coeff_val=struct([]);
    for i=1:10
        %generate Variables:
        %% Fit.
        [xData, yData] = prepareCurveData( Time_Limit, heuristics_result_matrix_s(:,i) );
        
        % Set up fittype and options.
        ft = fittype( 'poly1' );
        opts = fitoptions( 'Method', 'LinearLeastSquares' );
        opts.Normalize = 'on';
        opts.Robust = 'off';
        
        % Fit model to data.
        %[fitresult{i}, gof(i),fitalgo(i)] = fit( xData, yData, ft, opts );
        [fitresult{i}, gof(i)] = fit( xData, yData, ft, opts );
        fitmodel= fit( xData, yData, ft, opts );
        %c=coeffvalues(fitmodel);
        %coeff_val.(i)=c;
    
    end
    
    
    %size='2x2';
    size=strcat(num2str(j+1),'x',num2str(j+1));
    
    switch j
        case 1
                upper_limit=30;
        otherwise
                upper_limit=2;
    end
    plot_effectivity_goal3(Time_Limit,fitresult,size, upper_limit);
    file_name=strcat('gof_col',char(i));
    file_name_2=strcat('fitalgo_col',char(i));
    gof_tab=struct2table(gof);
    %fitalgo_tab=struct2table(coeff_val);
    %final_tab=horzcat(gof_tab,fitalgo_tab);
    %writetable(final_tab,file_name);
    writetable(gof_tab,file_name);
    %save(fitresult{i},file_name_2);
end
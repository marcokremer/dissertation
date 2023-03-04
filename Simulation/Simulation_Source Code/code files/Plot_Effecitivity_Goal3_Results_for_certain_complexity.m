%this file computes the regression function matrix for the heuristics.
load('D1_Erg.mat')
load('D2_Erg.mat')
load('Altruist_Erg.mat')
load('Equilibrium_Erg.mat')
load('L2_Erg.mat')
load('Naiive_Erg.mat')
load('Optimist_Erg.mat')
load('Pessimist_Erg.mat')
load('Random_Erg.mat')
load('Equilibrium_Games.mat') %make mystruct_long available
load('Time_Limit.mat')
load('pure_Equilibrium_Erg.mat')
%load('fitresult_2x2') %an zu berechnende Größe anpassen

%[min_wert,ort]=min(heuristics_result_matrix_s(1,j));
x_upper_limit=[150 300 600 1200];
y_lower_limit=[10 -1 -0.5 -0.5];
y_upper_limit=[30 1.5 2.5 2.5];
for j=1:4
    heuristics_result_matrix_s=[Altruist_Erg{2,j} Random_Erg{2,j} Optimist_Erg{2,j} Pessimist_Erg{2,j} Naiive_Erg{2,j} L2_Erg{2,j} D1_Erg{2,j} D2_Erg{2,j} Equilibrium_Erg{2,j} pure_Equilibrium_Erg{1,j}];
    heuristics_result_matrix_goal1=[Altruist_Erg{1,j} Random_Erg{1,j} Optimist_Erg{1,j} Pessimist_Erg{1,j} Naiive_Erg{1,j} L2_Erg{1,j} D1_Erg{1,j} D2_Erg{1,j} Equilibrium_Erg{1,j} Equilibrium_Erg{1,j}];
    [min_wert,satpoint]=min(heuristics_result_matrix_goal1);
    satpoint(2)=4;
    %% Initialization.
    
    % Initialize arrays to store fits and goodness-of-fit.
    fitresult = cell( 10, 1 );
    fitresult_sat= cell (10,1);
    gof = struct( 'sse', cell( 10, 1 ), ...
        'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );
    gof_sat = struct( 'sse', cell( 10, 1 ), ...
        'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );
    for i=1:10
        %generate Variables:
        %% Fit.
        Time_Limit_sat=Time_Limit(satpoint(i):end);
        
        [xData, yData] = prepareCurveData(Time_Limit(1:satpoint(i)) , heuristics_result_matrix_s(1:satpoint(i),i) );
        [xData_sat, yData_sat] = prepareCurveData( Time_Limit_sat, heuristics_result_matrix_s(satpoint(i):end,i) );
        
        % Set up fittype and options.
        ft = fittype( 'poly1' );
        opts = fitoptions( 'Method', 'LinearLeastSquares' );
        opts.Normalize = 'on';
        opts.Robust = 'off';
        
        % Fit model to data.
        
        [fitresult_sat{i}, gof_sat(i)] = fit( xData_sat, yData_sat, ft, opts );
        [fitresult{i}, gof(i)] = fit( xData, yData, ft, opts );
    end
    
    
    f=j;
    plot_effectivity_goal3(Time_Limit,fitresult,fitresult_sat, x_upper_limit, y_upper_limit,y_lower_limit, satpoint, f);
    %plot_effectivity_goal3(Time_Limit_sat,fitresult_sat,size, upper_limit);
    file_name=strcat('gof',char(i));
    gof_tab=struct2table(gof);
    writetable(gof_tab,file_name);
end

function [fitresult, gof] = createFits_2x2(Time_Limit, Random_Erg400, Altruist_2x2, Optimist_2x2, Pessimist_2x2, Naiive_2x2, L2_2x2, D1_2x2, D2_2x2, Equilibrium_2x2)
%CREATEFITS(TIME_LIMIT,RANDOM_ERG400,ALTRUIST_2X2,OPTIMIST_2X2,PESSIMIST_2X2,NAIIVE_2X2,L2_2X2,D1_2X2,D2_2X2,EQUILIBRIUM_2X2)
%  Create fits.
%
%  Data for 'Random 2x2' fit:
%      X Input : Time_Limit
%      Y Output: Random_Erg400
%  Data for 'Altruist_2x2' fit:
%      X Input : Time_Limit
%      Y Output: Altruist_2x2
%  Data for 'Optimist_2x2' fit:
%      X Input : Time_Limit
%      Y Output: Optimist_2x2
%  Data for 'Pessimist_2x2' fit:
%      X Input : Time_Limit
%      Y Output: Pessimist_2x2
%  Data for 'Naiive_2x2' fit:
%      X Input : Time_Limit
%      Y Output: Naiive_2x2
%  Data for 'L2_2x2' fit:
%      X Input : Time_Limit
%      Y Output: L2_2x2
%  Data for 'D1_2x2' fit:
%      X Input : Time_Limit
%      Y Output: D1_2x2
%  Data for 'D2_2x2' fit:
%      X Input : Time_Limit
%      Y Output: D2_2x2
%  Data for 'Equilibrium_2x2' fit:
%      X Input : Time_Limit
%      Y Output: Equilibrium_2x2
%  Output:
%      fitresult : a cell-array of fit objects representing the fits.
%      gof : structure array with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 15-Jan-2016 13:17:41

%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 9, 1 );
gof = struct( 'sse', cell( 9, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'Random 2x2'.
[xData, yData] = prepareCurveData( Time_Limit, Random_Erg400 );

% Set up fittype and options.
ft = fittype( 'poly1' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Normalize = 'on';
opts.Robust = 'LAR';

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft, opts );

% Create a figure for the plots.
figure( 'Name', 'Random 2x2' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{1}, xData, yData, 'predobs' );
legend( h, 'Random_Erg400 vs. Time_Limit', 'Random 2x2', 'Lower bounds (Random 2x2)', 'Upper bounds (Random 2x2)', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel Random_Erg400
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{1}, xData, yData, 'residuals' );
legend( h, 'Random 2x2 - residuals', 'Zero Line', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel Random_Erg400
grid on

%% Fit: 'Altruist_2x2'.
[xData, yData] = prepareCurveData( Time_Limit, Altruist_2x2 );

% Set up fittype and options.
ft = fittype( 'poly1' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Normalize = 'on';
opts.Robust = 'LAR';

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft, opts );

% Create a figure for the plots.
figure( 'Name', 'Altruist_2x2' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{2}, xData, yData, 'predobs' );
legend( h, 'Altruist_2x2 vs. Time_Limit', 'Altruist_2x2', 'Lower bounds (Altruist_2x2)', 'Upper bounds (Altruist_2x2)', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel Altruist_2x2
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{2}, xData, yData, 'residuals' );
legend( h, 'Altruist_2x2 - residuals', 'Zero Line', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel Altruist_2x2
grid on

%% Fit: 'Optimist_2x2'.
[xData, yData] = prepareCurveData( Time_Limit, Optimist_2x2 );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{3}, gof(3)] = fit( xData, yData, ft, 'Normalize', 'on' );

% Create a figure for the plots.
figure( 'Name', 'Optimist_2x2' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{3}, xData, yData, 'predobs' );
legend( h, 'Optimist_2x2 vs. Time_Limit', 'Optimist_2x2', 'Lower bounds (Optimist_2x2)', 'Upper bounds (Optimist_2x2)', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel Optimist_2x2
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{3}, xData, yData, 'residuals' );
legend( h, 'Optimist_2x2 - residuals', 'Zero Line', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel Optimist_2x2
grid on

%% Fit: 'Pessimist_2x2'.
[xData, yData] = prepareCurveData( Time_Limit, Pessimist_2x2 );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{4}, gof(4)] = fit( xData, yData, ft );

% Create a figure for the plots.
figure( 'Name', 'Pessimist_2x2' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{4}, xData, yData, 'predobs' );
legend( h, 'Pessimist_2x2 vs. Time_Limit', 'Pessimist_2x2', 'Lower bounds (Pessimist_2x2)', 'Upper bounds (Pessimist_2x2)', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel Pessimist_2x2
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{4}, xData, yData, 'residuals' );
legend( h, 'Pessimist_2x2 - residuals', 'Zero Line', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel Pessimist_2x2
grid on

%% Fit: 'Naiive_2x2'.
[xData, yData] = prepareCurveData( Time_Limit, Naiive_2x2 );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{5}, gof(5)] = fit( xData, yData, ft, 'Normalize', 'on' );

% Create a figure for the plots.
figure( 'Name', 'Naiive_2x2' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{5}, xData, yData, 'predobs' );
legend( h, 'Naiive_2x2 vs. Time_Limit', 'Naiive_2x2', 'Lower bounds (Naiive_2x2)', 'Upper bounds (Naiive_2x2)', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel Naiive_2x2
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{5}, xData, yData, 'residuals' );
legend( h, 'Naiive_2x2 - residuals', 'Zero Line', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel Naiive_2x2
grid on

%% Fit: 'L2_2x2'.
[xData, yData] = prepareCurveData( Time_Limit, L2_2x2 );

% Set up fittype and options.
ft = fittype( 'poly1' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Robust = 'LAR';

% Fit model to data.
[fitresult{6}, gof(6)] = fit( xData, yData, ft, opts );

% Create a figure for the plots.
figure( 'Name', 'L2_2x2' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{6}, xData, yData, 'predobs' );
legend( h, 'L2_2x2 vs. Time_Limit', 'L2_2x2', 'Lower bounds (L2_2x2)', 'Upper bounds (L2_2x2)', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel L2_2x2
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{6}, xData, yData, 'residuals' );
legend( h, 'L2_2x2 - residuals', 'Zero Line', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel L2_2x2
grid on

%% Fit: 'D1_2x2'.
[xData, yData] = prepareCurveData( Time_Limit, D1_2x2 );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{7}, gof(7)] = fit( xData, yData, ft );

% Create a figure for the plots.
figure( 'Name', 'D1_2x2' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{7}, xData, yData, 'predobs' );
legend( h, 'D1_2x2 vs. Time_Limit', 'D1_2x2', 'Lower bounds (D1_2x2)', 'Upper bounds (D1_2x2)', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel D1_2x2
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{7}, xData, yData, 'residuals' );
legend( h, 'D1_2x2 - residuals', 'Zero Line', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel D1_2x2
grid on

%% Fit: 'D2_2x2'.
[xData, yData] = prepareCurveData( Time_Limit, D2_2x2 );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{8}, gof(8)] = fit( xData, yData, ft );

% Create a figure for the plots.
figure( 'Name', 'D2_2x2' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{8}, xData, yData, 'predobs' );
legend( h, 'D2_2x2 vs. Time_Limit', 'D2_2x2', 'Lower bounds (D2_2x2)', 'Upper bounds (D2_2x2)', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel D2_2x2
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{8}, xData, yData, 'residuals' );
legend( h, 'D2_2x2 - residuals', 'Zero Line', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel D2_2x2
grid on

%% Fit: 'Equilibrium_2x2'.
[xData, yData] = prepareCurveData( Time_Limit, Equilibrium_2x2 );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{9}, gof(9)] = fit( xData, yData, ft );

% Create a figure for the plots.
figure( 'Name', 'Equilibrium_2x2' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{9}, xData, yData, 'predobs' );
legend( h, 'Equilibrium_2x2 vs. Time_Limit', 'Equilibrium_2x2', 'Lower bounds (Equilibrium_2x2)', 'Upper bounds (Equilibrium_2x2)', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel Equilibrium_2x2
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{9}, xData, yData, 'residuals' );
legend( h, 'Equilibrium_2x2 - residuals', 'Zero Line', 'Location', 'NorthEast' );
% Label axes
xlabel Time_Limit
ylabel Equilibrium_2x2
grid on



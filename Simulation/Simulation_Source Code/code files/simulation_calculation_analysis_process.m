%whole simulation: integrating modules
%entire process runs for about 75 min under Matlab 2018a on a 64 bit Windows 7
%Intel Core i5, 6GB RAM

%Simulation
run 'do_simulation.m';
run 'do_simulation_col.m';

%Calculation
run 'extract_games_from_table.m';
run 'extract_games_from_table_col.m';
run 'select_games.m';
run 'select_games_col.m';
run 'do_matching.m';
run 'do_calculate_goal_3.m';
run 'do_calculate_goal_3_no_rnd.m';
run 'do_calculate_goal_3_only_equilibrium.m';
run 'do_calculate_stage_means.m';

%Analysis
run 'do_ranking.m';
run 'do_table_1.m';
run 'do_table_2.m';
run 'plot_goal_results_for_certain_complexities.m';
run 'plot_effecitivity_goal3_LS_results_for_certain_complexity.m';
run 'plot_goal_3_results_for_no_rnd.m';
run 'Plot_Ranking_2d.m';

% Script to test the convergence of the MonteCarlo function.

% Define number of trials and point list for variance study
num_trials = 100;
num_points_list = logspace(2,6,25);
pi_mean_values = zeros(size(num_points_list));
pi_variances = zeros(size(num_points_list));

for i = 1:length(num_points_list)
    num_points = round(num_points_list(i));
    [pi_mean_values(i), pi_variances(i)] = MCPiVar(num_points, num_trials);
end

Error = abs(pi_mean_values-pi);
PError = Error*100/pi;

figure
loglog(num_points_list,PError,'b-','lineWidth',1.5)
title('% Error in \pi estimate vs Number of Points')
xlabel('Number of Random Points')
ylabel('Absolute % Error in \pi value')
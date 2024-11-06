% Testing how variance (accuracy) in pi changes with more points.

% Define number of trials and point list for variance study
num_trials = 100;
num_points_list = logspace(2,6,25);
pi_mean_values = zeros(size(num_points_list));
pi_variances = zeros(size(num_points_list));
confidence = 1.6445; % z value for confidence interval of 90%

for i = 1:length(num_points_list)
    num_points = round(num_points_list(i));
    [pi_mean_values(i), pi_variances(i)] = MCPiVar(num_points, num_trials);
end

% Plot error bars that give 90% confidence interval of pi.
pi_confidence = confidence*sqrt(pi_variances/num_trials);

% Plot the variance against the number of points
figure;
semilogx(num_points_list, pi_mean_values,'black','LineWidth', 1.5);
hold on
% Plotting error bar for 1sd either side of the mean
errorbar(num_points_list,pi_mean_values,pi_confidence,'LineWidth',1)
plot([10^2 10^6],[pi pi],'red','Linewidth',1)
xlabel('Number of Random Points');
ylabel('Mean \pi');
title('Mean \pi Estimate vs. Number of Points','FontSize',12);
legend('\Pi Estimates','90% Confidence Interval','Exact \pi')
% Function to calculate the sample variance of the Monte Carlo estimates
function [pi_mean, pi_variance] = monte_carlo_pi_variance(num_points, num_trials)
    pi_estimates = zeros(1, num_trials);
    
    % Run multiple trials to get a sample of pi estimates
    for j = 1:num_trials
        pi_estimates(j) = monte_carlo_pi(num_points);
    end
    
    % Calculate the mean and variance of the pi estimates
    pi_mean = mean(pi_estimates);
    pi_variance = var(pi_estimates);  % Sample variance
end

% Define number of trials and point list for variance study
num_trials = 100;
pi_mean_values = zeros(size(num_points_list));
pi_variances = zeros(size(num_points_list));

for i = 1:length(num_points_list)
    num_points = round(num_points_list(i));
    [pi_mean_values(i), pi_variances(i)] = monte_carlo_pi_variance(num_points, num_trials);
end

% Plot the variance against the number of points
figure;
loglog(num_points_list, pi_variances, 'g-', 'LineWidth', 1.5);
xlabel('Number of Random Points');
ylabel('Variance of \pi Estimates');
title('Variance of Monte Carlo \pi Estimates vs. Number of Points');
grid on;

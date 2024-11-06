% Function to calculate the sample variance and mean of the Monte Carlo estimates
function [pi_mean, pi_variance] = MCPiVar(num_points, num_trials)
    piestimates = zeros(1, num_trials);
    
    % Run multiple trials to get a sample of pi estimates
    for j = 1:num_trials
        piestimates(j) = MCPiEstimate(num_points);
    end
    
    % Calculate the mean and variance of the pi estimates
    pi_mean = mean(piestimates);
    pi_variance = var(piestimates);  % Sample variance
end




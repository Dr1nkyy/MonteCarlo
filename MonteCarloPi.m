% Script to use MonteCarlo Method to estimate pi.
% Script Plots points inside and outside of quater circle.

NumberPoints = 1000;

% Make random points in the 1x1 square.
x = rand(NumberPoints,1);
y = rand(NumberPoints,1);

distances = sqrt(x.^2+y.^2);

total = 0;

theta = linspace(0,pi/2,1000);
circlex = cos(theta);
circley = sin(theta);

figure
plot(circlex,circley,'black','LineWidth',2)
xlim([0 1])
ylim([0 1])
hold on 
plot([0 0 1 1],[0 1 1 0],'black','LineWidth',1.5)

scatter(0.1,0.1,'green','filled')
scatter(0.8,0.8,'red','filled')
for i = 1:length(distances)
    if distances(i) <= 1
        total = total + 1;
        scatter(x(i),y(i),'green','filled')
    else
        scatter(x(i),y(i),'red','filled')
    end
end

piestimate = total*4/NumberPoints;
% Display text on the plot at specific coordinates (x, y)
pi_text = ['Estimated \pi = ' num2str(piestimate, '%.5f')];
xlabel( pi_text, 'FontSize', 12, 'Color', 'black')

axis equal
legend('','','Inside Circle','Outside Circle')
title('Estimating \pi using Monte Carlo Simulation (Number of Points = 1000)','FontSize','12')
hold off
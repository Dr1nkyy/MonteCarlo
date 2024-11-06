function PiEstimate = MCPiEstimate(NumberPoints)
% This function computes an approximation for pi using the Monte Carlo
% simultion method.
x = rand(NumberPoints,1);
y = rand(NumberPoints,1);

distances = sqrt(x.^2+y.^2);
total = 0;
for i = 1:length(distances)
    if distances(i) <= 1
        total = total + 1;
    end
end

PiEstimate = total*4/NumberPoints;

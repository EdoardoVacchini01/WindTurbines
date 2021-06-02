function [out1, out2, out3, out4] = gradient_logistic(windspeed, theta)
out1 = 1 ./ (1 + theta(2) * exp(- theta(3) * windspeed));
out2 = (- theta(1) * exp(- theta(3) * windspeed))./(1 + theta(2)*exp(- theta(3)*windspeed)).^2;
out3 = (theta(1) * theta(2) * windspeed .* exp(- theta(3) * windspeed)) ./ (1 + theta(2)*exp( - theta(3)*windspeed)).^2;
end


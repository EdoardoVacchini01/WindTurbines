function power = logistic(windspeed, theta)
    out = theta(1)./(1 + theta(2)*exp(- theta(3)*windspeed));
    
    temp = out(out > 3690);
    out(out > 3690) = 3690 * ones(length(temp), 1);
    
	power = out;
end


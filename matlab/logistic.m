function power = logistic(windspeed, theta)
    out = theta(1)./(1 + theta(2)*exp(theta(4) - theta(3)*windspeed));
	power = out;
end


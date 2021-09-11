function estimatepower = KNNModel(powerpoints, KNNRadius, windspeed)
% Restituisce la curva generata dal K-Nearest Neighbours. I parametri
% della funzione sono:
%   powerpoints: un vettore colonna che rappresenta la curva di potenza
%   KNNRadius: il raggio utilizzato nel KNN
%   windspeed: il valore in cui stimare la potenza

out = zeros(length(windspeed), 1);

lowerindex = floor(windspeed ./ (KNNRadius/2)) + 1;
upperindex = lowerindex + 1;

for i = 1 : length(upperindex)
    if mod(windspeed(i), (KNNRadius / 2)) == 0
        upperindex(i) = lowerindex(i);
    end
end
out = powerpoints(lowerindex) + ((powerpoints(upperindex) - powerpoints(lowerindex)) ./ (KNNRadius / 2)) .* (windspeed - (lowerindex - 1) .* (KNNRadius / 2));
estimatepower = out;


%bound1 = floor(windspeed .* (2 / KNNRadius)) + 1;
%bound1(bound1 == length(powerpoints)) = bound1(bound1 == length(powerpoints)) - 1;
%estimatepower = powerpoints(bound1) + ((powerpoints(bound1 + 1) - powerpoints(bound1)) .* (2 / KNNRadius)) .* (windspeed - (bound1 - 1) .* (KNNRadius / 2));
end


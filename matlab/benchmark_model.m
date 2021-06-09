function [estimatedPower] = benchmark_model(windspeed, theta, cutoutWindspeed, saturationValue)
% Restituisce il valore della stima della potenza generata. I parametri
% della funzione sono:
%   windspeed: un vettore colonna che rappresenta la velocità del vento.
%   theta: i pratametri del tratto cubico.
%   cutoutWindspeed: la velocità oltre la quale si ha saturazione
%   saturationValue: il valore della saturazione
    
    out = zeros(length(windspeed), 1);
    out(windspeed > cutoutWindspeed) = saturationValue;
    out(windspeed <= cutoutWindspeed) = (windspeed(windspeed <= cutoutWindspeed)).^3 * theta;

    estimatedPower = out;
end


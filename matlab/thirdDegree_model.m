function [estimatedPower] = thirdDegree_model(windspeed, theta, cutoutWindspeed, saturationValue, cutinWindspeed)
% Restituisce il valore della stima della potenza generata. I parametri
% della funzione sono:
%   windspeed: un vettore colonna che rappresenta la velocit? del vento.
%   theta: i pratametri del tratto cubico.
%   cutoutWindspeed: la velocit? oltre la quale si ha saturazione
%   saturationValue: il valore della saturazione
    
    out = ones(length(windspeed), 1);
    out(windspeed <= cutinWindspeed) = 0;
    out(windspeed >= cutoutWindspeed) = saturationValue;
    out(windspeed > cutinWindspeed & windspeed < cutoutWindspeed) = [ windspeed(windspeed > cutinWindspeed & windspeed < cutoutWindspeed), windspeed(windspeed > cutinWindspeed & windspeed < cutoutWindspeed).^2, windspeed(windspeed > cutinWindspeed & windspeed < cutoutWindspeed).^3 ] * theta;
    
    estimatedPower = out;
end

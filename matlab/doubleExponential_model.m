function [estimatedPower] = doubleExponential_model(windspeed, theta, cutoutWindspeed, saturationValue, cutinWindspeed, normalizationValue)
% Restituisce il valore della stima della potenza generata. I parametri
% della funzione sono:
%   windspeed: un vettore colonna che rappresenta la velocità del vento., n
%   theta: i pratametri del tratto cubico.
%   cutoutWindspeed: la velocità oltre la quale si ha saturazione
%   saturationValue: il valore della saturazione
    
    out = ones(length(windspeed), 1);
    out(windspeed <= cutinWindspeed) = 0;
    out(windspeed >= cutoutWindspeed) = saturationValue;
    out(windspeed > cutinWindspeed & windspeed < cutoutWindspeed) = normalizationValue * exp( -exp([ windspeed(windspeed > cutinWindspeed & windspeed < cutoutWindspeed), windspeed(windspeed > cutinWindspeed & windspeed < cutoutWindspeed).^2, windspeed(windspeed > cutinWindspeed & windspeed < cutoutWindspeed).^3 ] * theta ) );
    
    estimatedPower = out;
end


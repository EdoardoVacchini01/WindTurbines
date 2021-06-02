function [estimatePower] = benchmark_model(windspeed, theta, cutoutWindspeed, saturationValue)
% Restituisce il valore della stima della potenza generata. I parametri
% della funzione sono:
%   windspeed: un vettore colonna che rappresenta la velocità del vento.
%   theta: i pratametri del tratto cubico.
%   cutoutWindspeed: la velocità oltre la quale si ha saturazione
%   saturationValue: il valore della saturazione

    cutout = cutoutWindspeed;
    saturation = saturationValue;

    out = ones(length(windspeed), 1);
    out(windspeed > cutout) = saturation;
    out(windspeed <= cutout) = (windspeed(windspeed <= cutout)).^3 * theta;

    estimatePower = out;
end


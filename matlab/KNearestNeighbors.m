function [estimatePower,windspeed] = KNearestNeighbors(trainingPower, trainingWindspeed, upperboundWS, radius)
% Restituisce la curva generata dal K-Nearest Neighbours. I parametri
% della funzione sono:
%   trainingPower: un vettore colonna che rappresenta la potenza generata dal vento.
%   trainingWindspeed: un vettore colonna che rappresenta la velocità del vento.
%   lowerboundWS: il valore minimo della velocità del vento
%   upperboundWS: il valore massimo della velocità del vento
%   radius: il valore del raggio in cui prendere i vicini

outp = [];
for i = 0 : radius/2 : upperboundWS
    datainrange = trainingPower(trainingWindspeed >= i - radius & trainingWindspeed < i + radius);
    
    if isempty(datainrange) && (i == 0 || i == radius/2)
        outp = [outp; 0];
    elseif isempty(datainrange)
        outp = [outp; outp(floor(i/(radius/2)) - 1)];
    else
        outp = [outp; mean(datainrange)];
    end
end
estimatePower = outp;
windspeed = [0 : radius/2 : upperboundWS]';
end


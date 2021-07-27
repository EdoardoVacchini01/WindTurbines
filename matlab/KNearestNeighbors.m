function [estimatePower,windspeed] = KNearestNeighbors(trainingPower, trainingWindspeed, upperboundWS, radius)
% Restituisce la curva generata dal K-Nearest Neighbours. I parametri
% della funzione sono:
%   trainingPower: un vettore colonna che rappresenta la potenza generata dal vento.
%   trainingWindspeed: un vettore colonna che rappresenta la velocit� del vento.
%   lowerboundWS: il valore minimo della velocit� del vento
%   upperboundWS: il valore massimo della velocit� del vento
%   radius: il valore del raggio in cui prendere i vicini

outp = [];
outw = [];
for i = 0 : radius/2 : upperboundWS
    datainrange = trainingPower(trainingWindspeed >= i - radius & trainingWindspeed < i + radius);
    outp = [outp; mean(datainrange)];
    outw = [outw; i];
end
estimatePower = outp;
windspeed = outw;
end


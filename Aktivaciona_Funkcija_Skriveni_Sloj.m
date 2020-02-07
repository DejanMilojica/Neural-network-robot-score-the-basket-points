function [ y ] = Aktivaciona_Funkcija_Skriveni_Sloj(x)
global KONSTANTA_ReLU_FUNKCIJE
%AKTIVACIONA_FUNKCIJA_SKRIVENI_SLOJ 

    % Unipolarna sigmoidalna funkcija!
%y = 1./(1 + exp(-x));
% Kako je 'rezultat' neuralne mreže, ugao i po?etna brzina, pri ?emu su obe
% veli?ine uvijek pozitivne, i ve?e od 0, možemo testirati sa unipolarnom
% S.F-jom, koja uvijek daje pozitivne vrijednosti.

    % Sigmoidalna funkcija:
% y = tansig(x);

    % ArcTan:
 y = atan(x);

    % Eksponencijalna kvadratna funkcija:
% y = exp(-x.^2);

    % ReLU:
%  y = max(0,x);

    % Leaky ReLU:
%  y = max(KONSTANTA_ReLU_FUNKCIJE*x,x); % KONSTANTA: 0.1

    %SoftPlus
 %  y = log(1+exp(x));

end


function [ y ] = Aktivaciona_Funkcija_Izlazni_Sloj(x)
%AKTIVACIONA_FUNKCIJA_SKRIVENI_SLOJ 
global KONSTANTA_ReLU_FUNKCIJE

    % Unipolarna sigmoidalna funkcija!
%y = 1./(1 + exp(-x));

    % Sigmoidalna funkcija:
% y = tansig(x);

    % ArcTan:
% y = atan(x);

    % Eksponencijalna kvadratna funkcija:
% y = exp(-x.^2);

    % ReLU:
%  y = max(0,x);

    % Leaky ReLU:
 % y = max(KONSTANTA_ReLU_FUNKCIJE*x,x);
  
    %SoftPlus
   y = log(1+exp(x));

end


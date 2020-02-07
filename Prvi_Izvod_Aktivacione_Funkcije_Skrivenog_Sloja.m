function [ y_prim ] = Prvi_Izvod_Aktivacione_Funkcije_Skrivenog_Sloja( x )
global KONSTANTA_ReLU_FUNKCIJE
%PRVI_IZVOD_AKTIVACIONE_FUNKCIJE_SKRIVENOG_SLOJA 

    % Za Unipolarnau sigmoidalnu funkciju, prvi izvod:
%    y_prim = Aktivaciona_Funkcija_Skriveni_Sloj(x)*(1-Aktivaciona_Funkcija_Skriveni_Sloj(x));

    % Za  sigmoidalnu funkciju,tanH, prvi izvod:
%   y_prim = 1 - Aktivaciona_Funkcija_Skriveni_Sloj(x).^2;
    
    % Za  arctg funkciju, prvi izvod:
    y_prim = 1./(1 + x^2);
    
    % Za  exp kvadratnu funkciju, prvi izvod:
%    y_prim = exp(-x.^2)*(-2*x);
    
    % Za ReLU funkciju, prvi izvod:
%    if(x<0)
%        y_prim = 0;
%    else 
%        y_prim  = 1;
%    end
    
    % Za LReLU funkciju, prvi izvod:
%    if(x<0)
%        y_prim = KONSTANTA_ReLU_FUNKCIJE*x;
%    else
%        y_prim = 1;
%    end
    
 % Soft Plus:
 %y_prim = 1./(1 + exp(-x));
end


clc;
close all;
clear all;

global Gama Emax MaxIteracija PrivremeniGenerisaniIzlazi KONSTANTA_ReLU_FUNKCIJE

Gama = 10^(-4);                      % Težinski faktor neuralne mreze!
Emax =  0.001;                      % Maksimalno dopusteno odstupanje dobijene vrijednosti!
MaxIteracija = 20000000;              % Maksimalan broj dozvoljenih iteracija t.m.! 
BrojNeuronaSkrivenogSloja = 2;      % Ukupan broj neurona skrivenog sloja!
BrojTreningParova = 20;              % Ukupan broj trening parova!
KONSTANTA_ReLU_FUNKCIJE = 10^(-4);  % Konstanta kojom definisemo vrijednost negativnog ulaza ReLU funkcije.

% Formiranje slucajnih trening parova!
for(i=1 : BrojTreningParova)
     UlaziTreningParova(i,1) = Udaljenost_Bloka_rand();
     UlaziTreningParova(i,2) = Udaljenost_Kosarkasa_rand();
    [IzlaziTreningParova(i,1),IzlaziTreningParova(i,2)] = Formiranje_Trening_para(UlaziTreningParova(i,1),UlaziTreningParova(i,2));
end

% Obucavanje(Treniranje) neuralne mreze:
[w_12,w_23] = Obucavanje_Mreze(UlaziTreningParova, IzlaziTreningParova, BrojTreningParova, BrojNeuronaSkrivenogSloja);

% NAKON OBUCAVANJA MREZE, PRELAZIMO NA FAJL 'TESTIRANJENEUROSNKEMREZE', u
% kojem se vrsi testiranje projektovane neuronske mreze, za korisnicki
% odabrane ulaze.







% Poziv procedure, kojoj prosljedjujemo zeljene vrijednosti ulaza neuronske
% mreze, a ona nam kao rezultat dostavlja izlaze neuronske mreze.
%Udaljenost_Robota_Od_Kosa  = 15;
%Udaljenost_Robota_Od_Bloka = 1;
%[ Izlaz ] = Testiranje( w_12, w_23, Udaljenost_Robota_Od_Kosa, Udaljenost_Robota_Od_Bloka, BrojNeuronaSkrivenogSloja )
%[Ocekivan_Izlaz1,Ocekivan_Izlaz2]=Formiranje_Trening_para(Udaljenost_Robota_Od_Bloka,Udaljenost_Robota_Od_Kosa);
%fprintf('Ocekivano: (%.4f, %.4f) ',Ocekivan_Izlaz1,Ocekivan_Izlaz2);

%M =  Udaljenost_Suta + 0.43/tan(alfa);
%x = 0 : 0.1 : M;
%y = x*tan(alfa)-(g/2)*(x.^2)/(v.^2*cos(alfa).^2);
%figure
%subplot(1,1,1);
%plot(x,y);
%grid on


% Vrsimo citanje sadrzaja datoteke, 'Ulazi_za_testiranje.txt', gdje su
% smjesteni ulazi, za koje vrsimo testiranje projektovane N.M.
clc
%Definisane konstanti u slucaju korisnicki nekorektnih podataka.
MAX_UDALJENOST_KOSA = 18;
MAX_UDALJENOST_BLOKA = 3;
MIN_UDALJENOST_KOSA = 6.75;
MIN_UDALJENOST_BLOKA=1;


% Odredjivanje broja ulaza koji su smjesteni u datoteci:
 fid = fopen('Ulazi_za_testiranje.txt');
 res={};
 while ~feof(fid)
       thisline = fgetl(fid);
       if ~ischar(thisline);break; end
       res{end+1,1}=thisline;
 end
 fclose(fid);
 
 %Broj korisnickih parova, sa kojima radimo testiranje:
 BROJ_PAROVA_ZA_TESTIRANJE = numel(res);
 fprintf('Broj parova za testiranje: %d\n',BROJ_PAROVA_ZA_TESTIRANJE);

 %Otvaranje datoteke za citanje.
 fid = fopen('Ulazi_za_testiranje.txt');
 i=0;
while(i<BROJ_PAROVA_ZA_TESTIRANJE)
    fprintf('Korisnicki par: %d\n',i+1);
    Ulazi = fscanf(fid,'%f %f\n',2);       % Citanje ulaza,(Udaljenost kosa, Udaljenost bloka).
    
    %U slucaju nekorektnih ulaznih podataka, radimo dodjeljivanje
    %maksimalnih/minimalnih vrijednosti.
    if(Ulazi(1)>MAX_UDALJENOST_KOSA)
        Ulazi(1) = MAX_UDALJENOST_KOSA;
    elseif(Ulazi(1)<MIN_UDALJENOST_KOSA)
        Ulazi(1) = MIN_UDALJENOST_KOSA;
    end
    
    if(Ulazi(2)>MAX_UDALJENOST_BLOKA)
        Ulazi(2) = MAX_UDALJENOST_BLOKA;
    elseif(Ulazi(2)<MIN_UDALJENOST_BLOKA)
        Ulazi(2) = MIN_UDALJENOST_BLOKA;
    end
    
    fprintf('Ulazi: (%f, %f)\n',Ulazi(1),Ulazi(2));  % Ispis ulaza.
    [ Izlaz ] = Testiranje( w_12, w_23, Ulazi(1), Ulazi(2), BrojNeuronaSkrivenogSloja );% Propustanje ulaza kroz neuronsku mrezu.
    Izlaz
    [Ocekivan_Izlaz1,Ocekivan_Izlaz2]=Formiranje_Trening_para(Ulazi(2), Ulazi(1));      % Provjera vrijednosti koje ocekujemo da dobijemo na izlazu.
    fprintf('Ocekivano: (%.4f, %.4f) \n',Ocekivan_Izlaz1,Ocekivan_Izlaz2);              % Ispis ocekivanih vrijednosti.
    pause(2); % Pauza od 2 sekunde, cisto da dobijemo odredjen ugodjaj pri ispisu.
    i=i+1;
    fprintf('-----------------------------------------------\n');
end
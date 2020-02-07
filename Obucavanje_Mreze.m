function [w_12,w_23] = Obucavanje_Mreze(UlaziTreningParova, IzlaziTreningParova, BrojTreningParova, BrojNeuronaSkrivenogSloja)
%OBUCAVANJE_MREZE, sa ulaznim trening parovima!
% Pratimo algoritam koji definise neuralna mreza, kojim radimo treniranje!

global Gama Emax MaxIteracija PrivremeniGenerisaniIzlazi


% Inicijalizacija tezinskih faktora +-Gama/10:
for(i = 1: BrojNeuronaSkrivenogSloja)
    for(j = 1: 2) % Prve 2 kolone, reprezentuju tezinske faktore prva 2 sloja!
        w_12(i,j) = 2*Gama/10*rand()-Gama/10;
    end
end

for(i = 1: 2)
    for(j = 1: BrojNeuronaSkrivenogSloja) % Prva 2 reda, reprezentuju tezinske faktore druga 2 sloja!
        w_23(i,j) = 2*Gama/10*rand()-Gama/10;
    end
end

RedniBrojIteracije = 0;

while(RedniBrojIteracije<MaxIteracija)
  E = 0; % Inicijalizacija kumulativne greske! 
  %fprintf('Redni broj iteracije: %d\n',RedniBrojIteracije);
  PrivremenaGreskaManja = 0;

  for(k=1: BrojTreningParova)
    %Propagacija greske unaprijed: 
    
    %Odredjivanje ukupnih ulaza neurona skrivenog sloja!
    for(i = 1: BrojNeuronaSkrivenogSloja)
        qnet_s(i) = UlaziTreningParova(k,1)*w_12(i,1) + UlaziTreningParova(k,2)*w_12(i,2);   % Skriveni sloj!
    end
    
    %for(i = 1: BrojNeuronaSkrivenogSloja)    
    %    fprintf('Ulazi %dtog neurona skrivenog sloja: %f\n',i, qnet_s(i));
    %end 
    
    %Odredjivanje izlaza neurona skrivenog sloja:
    for(i = 1: BrojNeuronaSkrivenogSloja)
       qy_s(i) = Aktivaciona_Funkcija_Skriveni_Sloj(qnet_s(i));
    end
    
    %Odredjivanje ukupnih ulaza neurona izlaznog sloja!
    qnet_i(BrojNeuronaSkrivenogSloja) = 0;
    for(i = 1: 2)
        for(j = 1: BrojNeuronaSkrivenogSloja)
            qnet_i(i) = qnet_i(i) + qy_s(j)*w_23(i,j); % Izlazni sloj!
        end
    end
    
    %Odredjivanje izlaza neurona izlaznog sloja:
    for(i = 1: 2)
       qy_i(i) = Aktivaciona_Funkcija_Izlazni_Sloj(qnet_i(i));
       
       %Privremeno cuvanje izlaza:
       PrivremeniGenerisaniIzlazi(k,i) = qy_i(i);
    end
        
    % Racunanje trenutne(Privremene) greske Ep!
    Ep = 0;
    for(i=1: 2)
        Ep = Ep + 0.5*(IzlaziTreningParova(k,i)-qy_i(i)).^2;
    end
    
%    fprintf('Izlazi %d tog para: %f %f\n',k,qy_i(1),qy_i(2));    
   % fprintf('Greska: %f\n',Ep);
    
    %Ukupna kumulativna greska:
    E = E + Ep;
    
    % Ukoliko je Ep >= Emax, imamo propagaciju greske unazad!
    % Odnosno, racunanje novih vrijednosti tezinskih faktora mreze, kako
    % bismo smanjili gresku!
    if(Ep>=Emax)
        
       % Racunanje delta faktora izlaznog sloja:
       for(i=1:2)
           delta_izlazno(i) = Prvi_Izvod_Aktivacione_Funkcije_Izlaznog_Sloja(qnet_i(i))*(IzlaziTreningParova(k,i)-qy_i(i));
          % fprintf('Delta Izlazno %d par, %d neuron: %f\n',k,i,delta_izlazno(i));
       end
       
       %Racunanje korekcije tezinskih faktora skriveni-izlazni sloj:
       for(i=1:2)
            for(j=1:BrojNeuronaSkrivenogSloja)       
                delta_w(i,j) = Gama * delta_izlazno(i) * qy_s(j);
               % fprintf('Korekcija tezinskih faktora w%d%d: %f\n',i,j,delta_w(i,j));
                w_23(i,j) = w_23(i,j) + delta_w(i,j);
            end
       end

        % Racunanje delta faktora skrivenog sloja:
        for(i=1: BrojNeuronaSkrivenogSloja)
            suma = 0;
            for(j=1: 2)
                suma= suma + delta_izlazno(j)* w_23(j,i);
            end
            delta_skriveno(i) = Prvi_Izvod_Aktivacione_Funkcije_Skrivenog_Sloja(qnet_s(i))*suma;
        end
        
       % Racunanje korekcije tezinskih faktora ulazni-skriveni sloj:
       for(i=1:BrojNeuronaSkrivenogSloja)
            for(j=1:2)       
                delta_w_2(i,j) = Gama * delta_skriveno(i) * UlaziTreningParova(k,j);
                w_12(i,j) = w_12(i,j) + delta_w_2(i,j);
            end
       end
    else
        PrivremenaGreskaManja = PrivremenaGreskaManja + 1;
    end
    
  end

  % Ukoliko je kumulativna greska, manja od maksimalne, zavrsavamo
  % iteriranje!
   if(E<Emax | PrivremenaGreskaManja==BrojTreningParova)
       break;
   end
   
   % Povecavamo vrijednost broja iteracije!
   RedniBrojIteracije = RedniBrojIteracije + 1;
   if(mod(RedniBrojIteracije,100000)==0)
          fprintf('Greska: %d, Broj iteracija: %d\n',E,RedniBrojIteracije);
   end
   
end
   fprintf('Greska: %d, Broj iteracija: %d\n',E,RedniBrojIteracije);

end


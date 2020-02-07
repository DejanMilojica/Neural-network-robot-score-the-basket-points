function [ Izlaz ] = Testiranje( w_12, w_23, Udaljenost_kosa, Udaljenost_bloka, BrojNeuronaSkrivenogSloja )
%TESTIRANJE neuronske mreže, na osnovu odre?enih vrijednosti ulaza.

    % Odredjivanje ulaza neurona skrivenog sloja:
    for(i = 1: BrojNeuronaSkrivenogSloja)
        qnet_s_testiranje(i) = Udaljenost_bloka*w_12(i,1) + Udaljenost_kosa*w_12(i,2);   % Skriveni sloj!
    end
    

    %Odredjivanje izlaza neurona skrivenog sloja:
    for(i = 1: BrojNeuronaSkrivenogSloja)
       qy_s_testiranje(i) = Aktivaciona_Funkcija_Skriveni_Sloj(qnet_s_testiranje(i));
    end
    
    %Odredjivanje ukupnih ulaza neurona izlaznog sloja!
    qnet_i_testiranje(BrojNeuronaSkrivenogSloja) = 0;
    for(i = 1: 2)
        for(j = 1: BrojNeuronaSkrivenogSloja)
            qnet_i_testiranje(i) = qnet_i_testiranje(i) + qy_s_testiranje(j)*w_23(i,j); % Izlazni sloj!
        end
    end
    
    %Odredjivanje izlaza neurona izlaznog sloja:
    for(i = 1: 2)
       Izlaz(i) = Aktivaciona_Funkcija_Izlazni_Sloj(qnet_i_testiranje(i));
    end
end


function [ alfa, v ] = Formiranje_Trening_para( Udaljenost_Bloka, Udaljenost_Suta )
%FORMIRANJE_TRENING_PARA, odnosno, na osnovu poznatih velicina "Udaljenost
%kosarkasa od bloka", te, "Udaljenost kosarkasa od kosa", odredjujemo
%potreban ugao, i brzinu izbacaja suta, za trening par!
g = 9.81;

%alfa = atan(0.28/(Udaljenost_Bloka*(1-0.12/0.28))); % Ugao pod kojim robot izbacuje loptu!
alfa = atan(((2+(1.3)/Udaljenost_Suta)+sqrt((2+(1.3)/Udaljenost_Suta).^2+(3.44)/Udaljenost_Suta))/2);

M =  Udaljenost_Suta + 0.43/tan(alfa); % Za vrijednost 6.75-18[m], sto je udaljenost od kosa, te vrijednost gdje kriva ima vrijednost 0,sto je 0.43=(0.55-0.12) te /tg(ugao)!
v = sqrt(g*M/sin(2*alfa)); % Pocetna Brzina izbacivanja lopte!
end


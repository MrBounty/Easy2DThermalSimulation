function [Tresultats,dltatmax] = Calcul_2D(V,H,O)
clc
dimension=2;
choix=input('Temps de simulation ou stabilit�, 1 temps, 2 stabilit�, 3 les deux');
if choix==1
    V(3)=input('Temps de simulation [s]');
    sta=0;
elseif choix==2
    sta=input('Valeur de stabilit�');
    elseif choix==3
    V(3)=input('Temps de simulation [s]');
    sta=input('Valeur de stabilit�');
end
    
%Calculs des pas dimensionnels
[D] = Cal_Delta(V,dimension);
    
%Calcul de la stablilit�
[dltatmax] = Stabilite(V,D,dimension);
  
if V(4)<dltatmax %Si le systeme est stable on passe aux calculs

    [B] = MatB(V,D,H,O,dimension);%Creation de la matrice B

    [Tk] = VecTini(V,dimension,H);%Initialisation du vecteur Tk pour k=1 ou t=0s

    [C] = MatC(V,dimension);%Cr�ation de la matrice C

    [A] = MatA(V,D,H,dimension);%Cr�ation de la matrice A

    [Tresultats] = Calcul(A,C,B,V,Tk,dimension,O,sta,choix);%Calculs de Tk+1

    
else %Si ce n'est pas stable
    Tresultats=0;
    msgbox('Le pas de temps est trops grand pour �tre stable, pas de calcul. Pour voir le pas de temps max utilisable, lire la variable dltatmax','ATTENTION!')
end
end


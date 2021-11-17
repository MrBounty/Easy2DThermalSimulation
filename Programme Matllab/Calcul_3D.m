function [Tresultats,dltatmax] = Calcul_3D(V,H,O)
clc
dimension=3;
    
%Calculs des pas dimensionnels
[D] = Cal_Delta(V,dimension);
    
%Calcul de la stablilité
[dltatmax] = Stabilite(V,D,dimension);
  
if V(4)<dltatmax %Si le systeme est stable on passe aux calculs

    [B] = MatB(V,D,H,O,dimension);%Creation de la matrice B

    [Tk] = VecTini(V,dimension,H);%Initialisation du vecteur Tk pour k=1 ou t=0s

    [C] = MatC(V,dimension);%Création de la matrice C

    [A] = MatA(V,D,H,dimension);%Création de la matrice A

    [Tresultats] = Calcul(A,C,B,V,Tk,dimension,O);%Calculs de Tk+1
    
    
else %Si ce n'est pas stable
    Tresultats=0;
    msgbox('Le pas de temps est trops grand pour être stable, pas de calcul. Pour voir le pas de temps max utilisable, lire la variable dltatmax','ATTENTION!')
end
end


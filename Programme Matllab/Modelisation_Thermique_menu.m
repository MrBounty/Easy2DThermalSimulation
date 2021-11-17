%--------------------------------------------------------------------------
%               Programme de modélisation thermique
%    Fais par Adrien BOUVAIS durant son temps libre en Décembre 2019
%                    A utiliser avec le manuel
%                          Version 1.3
%--------------------------------------------------------------------------


%Choix entre valeurs, calculs et coubes
if exist('dimension') == 1
    ClcouCrb=input('Que voulez vous faire ? 1=Val, 2=Simu, 3=Graph, 4=reset');
else
    ClcouCrb=0;
end

%Valeurs
if ClcouCrb==1 || exist('dimension') == 0
    if exist('dimension') == 0 %Si on lance le programme pour le 1er fois
        dimension=input('Choix de la dimension 1D, 2D ou 3D');
        if dimension==1
            V(1)=0;H(1)=0;O(1)=2;
            [V,H,O] = Valeurs_1D(V,H,O);
            clc
        elseif dimension==2
            V(1)=0;H(1)=0;O(1)=2;
            [V,H,O] = Valeurs_2D(V,H,O);
            clc
        elseif dimension==3
            V(1)=0;H(1)=0;O(1)=2;
            [V,H,O] = Valeurs_3D(V,H,O);
            clc
        end
    elseif dimension==1
        [V,H,O] = Valeurs_1D(V,H,O);
        clc
    elseif dimension==2
        [V,H,O] = Valeurs_2D(V,H,O);
        clc
    elseif dimension==3
        [V,H,O] = Valeurs_3D(V,H,O);
        clc
    end

%Simulation
elseif ClcouCrb==2
    if dimension==1 || dimension==2 || dimension==3
        if dimension==1
            clc
            [Tresultats,dltatmax] = Calcul_1D(V,H,O);
            clc
        elseif dimension==2
            clc
            [Tresultats,dltatmax] = Calcul_2D(V,H,O);
            clc
        elseif dimension==3
            clc
            [Tresultats,dltatmax] = Calcul_3D(V,H,O);
            clc
        end
    end

%Graphiques
elseif ClcouCrb==3
    if dimension==1
        Courbes_1D(Tresultats,V);
    elseif dimension==2
        Courbes_2D(Tresultats,V);
    elseif dimension==3
        Courbes_3D(Tresultats,V);
end
clc;
    
%Reset
elseif ClcouCrb==4
    clear all; clc
end
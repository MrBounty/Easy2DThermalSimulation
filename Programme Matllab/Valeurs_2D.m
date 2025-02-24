function [V,H,O] = Valeurs_2D(V,H,O)
dimension=2;

if V(1)~=0
    choix=input('Que voulez-vous changer, 0 tout, 1 les donn�es, 2 les conditions limites, 3 les options');
end
if V(1)==0
    choix=10;
end

if choix==1 || choix==0 || V(1)==0
    prompt = {'Nombre de point en x', 'Alpha (=0 expli, =1 impli)','Delta t [s]','Longueur en x [m]','rCp [J.m-3.K-1]','Lambda x[W.m-1.K-1]','Temp�rature de l air','Temp�rature initial','Nombre de point en y, si �gale a 0 Ny=Nx','Largueur en y [m], si � 0 y=x','Lambda y[W.m-1.K-1], si � 0 �gale � lambda x'};
    dlgtitle = 'Input';
    dims = [1 45];
    definput = {'9','0','0.5','0.05','2000000','4','20','30','0','0','0'};
    answer = inputdlg (prompt, dlgtitle, dims, definput);
    answer=str2double(answer);
    for i=1:2
        V(i)=answer(i);
    end
    for i=4:12
        V(i)=answer(i-1);
    end
    if V(10)==0
        V(10)=V(1);
    end
    if V(11)==0
        V(11)=V(5);
    end
    if V(12)==0
        V(12)=V(7);
    end
    
    end
    
if choix==2 || choix==0 || H(1)==0
    prompt = {'Condition 1', 'Valeur 1','Condition 2', 'Valeur 2','Condition 3', 'Valeur 3','Condition 4', 'Valeur 4','Plus d options, 0 non, 1 oui'};
    dlgtitle = 'Condition limite';
    dims = [1 50];
    definput = {'1','20','3','500','1','20','3','500','0'};
    answer = inputdlg (prompt, dlgtitle, dims, definput);
    answer=str2double(answer);
    H(1,1)=answer(1);H(1,2)=answer(2);H(2,1)=answer(3);H(2,2)=answer(4);H(3,1)=answer(5);H(3,2)=answer(6);H(4,1)=answer(7);H(4,2)=answer(8);H(1,4)=answer(9);
end

if choix==3 || choix==0 || O(1)==2
    O=zeros(7,6);
    if H(1,4)==1
    prompt = {'Ajout un flux entre deux temps pour la limite 1, 0 non, 1 oui', 'Ajout un flux entre deux temps pour la limite 2, 0 non, 1 oui', 'Ajout un flux entre deux temps pour la limite 3, 0 non, 1 oui', 'Ajout un flux entre deux temps pour la limite 4, 0 non, 1 oui', 'Puissance volumique partout, 0 non, 1 oui','Puissance volumique pour un point, 0 non, 1 oui','Temp�rature d air diff�rentes pour chaque limites, 0 non, 1 oui'};
    dlgtitle = 'Plus d options';
    dims = [1 70];
    definput = {'0','0','0','0','0','0','0'};
    answer2 = inputdlg (prompt, dlgtitle, dims, definput);
    answer2=str2double(answer2);
    O(1,1)=answer2(1);O(2,1)=answer2(2);O(3,1)=answer2(3);O(4,1)=answer2(4);O(5,1)=answer2(5);O(6,1)=answer2(6);O(7,1)=answer2(7);
    end
    
    if O(1,1)==1
    prompt = {'puissance [W/m�]','Temps d�part [s]','Temps final [s]'};
    dlgtitle = 'Flux limite 1';
    dims = [1 60];
    definput = {'0','0','0'};
    answer3 = inputdlg (prompt, dlgtitle, dims, definput);
    answer3=str2double(answer3);
    O(1,2)=answer3(1);O(1,3)=answer3(2);O(1,4)=answer3(3);
    end
    
    if O(2,1)==1
    prompt = {'puissance [W/m�]','Temps d�part [s]','Temps final [s]'};
    dlgtitle = 'Flux limite 2';
    dims = [1 60];
    definput = {'0','0','0'};
    answer3 = inputdlg (prompt, dlgtitle, dims, definput);
    answer3=str2double(answer3);
    O(2,2)=answer3(1);O(2,3)=answer3(2);O(2,4)=answer3(3);
    end
    
    if O(3,1)==1
    prompt = {'puissance [W/m�]','Temps d�part [s]','Temps final [s]'};
    dlgtitle = 'Flux limite 3';
    dims = [1 60];
    definput = {'0','0','0'};
    answer3 = inputdlg (prompt, dlgtitle, dims, definput);
    answer3=str2double(answer3);
    O(3,2)=answer3(1);O(3,3)=answer3(2);O(3,4)=answer3(3);
    end
    
    if O(4,1)==1
    prompt = {'puissance [W/m�]','Temps d�part [s]','Temps final [s]'};
    dlgtitle = 'Flux limite 4';
    dims = [1 60];
    definput = {'0','0','0'};
    answer3 = inputdlg (prompt, dlgtitle, dims, definput);
    answer3=str2double(answer3);
    O(4,2)=answer3(1);O(4,3)=answer3(2);O(4,4)=answer3(3);
    end
    
    if O(5,1)==1
    prompt = {'puissance [W/m3]','Temps d�part [s]','Temps final [s]'};
    dlgtitle = 'Puissance volumique partout';
    dims = [1 60];
    definput = {'0','0','0'};
    answer5 = inputdlg (prompt, dlgtitle, dims, definput);
    answer5=str2double(answer5);
    O(5,2)=answer5(1);O(5,3)=answer5(2);O(5,4)=answer5(3);
    end
    
    if O(6,1)==1
    prompt = {'puissance [W/m3]','Temps d�part [s]','Temps final [s]','Point choisi en x, entre 1 et Nx','Point choisi en y, entre 1 et Ny'};
    dlgtitle = 'Puissance volumique 1 point';
    dims = [1 60];
    definput = {'0','0','0','1','1'};
    answer6 = inputdlg (prompt, dlgtitle, dims, definput);
    answer6=str2double(answer6);
    O(6,2)=answer6(1);O(6,3)=answer6(2);O(6,4)=answer6(3);O(6,5)=answer6(4);O(6,6)=answer6(5);
    end
    
    if O(7,1)==1
    prompt = {'Temp�rature limite 1','Temp�rature limite 2','Temp�rature limite 3','Temp�rature limite 4'};
    dlgtitle = 'Temp�rature d air';
    dims = [1 70];
    definput = {'0','0','0','0'};
    answer6 = inputdlg (prompt, dlgtitle, dims, definput);
    answer6=str2double(answer6);
    H(1,3)=answer6(1);H(2,3)=answer6(2);H(3,3)=answer6(3);H(4,3)=answer6(4);
    end
    
    
end
end


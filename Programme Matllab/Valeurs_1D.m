function [V,H,O] = Valeurs_1D(V,H,O)
dimension=1;

if V(1)~=0
    choix=input('Que voulez-vous changer, 0 tout, 1 les données, 2 les conditions limites, 3 les options');
end
if V(1)==0
    choix=0;
end

if choix==1 || choix==0 || V(1)==0
    prompt = {'Nombre de point en x', 'Alpha (=0 expli, =1 impli)','Delta t [s]','Longueur en x [m]','rCp [J.m-3.K-1]','Lambda x[W.m-1.K-1]','Température de l air','Température initial'};
    dlgtitle = 'Input';
    dims = [1 35];
    definput = {'9','0','300','0.5','0.05','2000000','4','20','30'};
    answer = inputdlg (prompt, dlgtitle, dims, definput);
    answer=str2double(answer);%Transfo chaine de caractere en nombres
    for i=1:2
        V(i)=answer(i);
    end
    for i=4:9
        V(i)=answer(i-1);
    end
end
    
if choix==2 || choix==0 || H(1)==0
    prompt = {'Condition 1', 'Valeur 1','Condition 2', 'Valeur 2','Plus d options, 0 non, 1 oui'};
    dlgtitle = 'Condition limite';
    dims = [1 50];
    definput = {'1','20','3','500','0'};
    answer = inputdlg (prompt, dlgtitle, dims, definput);
    answer=str2double(answer);%Transfo chaine de caractere en nombres
    %Mise des valeurs dans des variables séparé
    H(1,1)=answer(1);H(1,2)=answer(2);H(2,1)=answer(3);H(2,2)=answer(4);H(1,4)=answer(5);
    
    if H(1,3)==0
        O=[0 0 0 0 0;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0];
    end
end

if choix==3 || choix==0 || O(1)==2
    O=zeros(6,6);
    if H(1,4)==1
    prompt = {'Ajout un flux entre deux temps pour le point limite 1, 0 non, 1 oui', 'Ajout un flux entre deux temps pour le point limite 2, 0 non, 1 oui', 'Puissance volumique partout, 0 non, 1 oui','Puissance volumique pour un point, 0 non, 1 oui','Puissance volumique pour une ligne, 0 non, 1 oui','Température d air différentes pour chaque limites, 0 non, 1 oui'};
    dlgtitle = 'Plus d options';
    dims = [1 70];
    definput = {'0','0','0','0','0','0'};
    answer2 = inputdlg (prompt, dlgtitle, dims, definput);
    answer2=str2double(answer2);%Transfo chaine de caractere en nombres
    %Mise des valeurs dans des variables séparé
    O(1,1)=answer2(1);O(2,1)=answer2(2);O(3,1)=answer2(3);O(4,1)=answer2(4);O(5,1)=answer2(5);O(6,1)=answer2(6);
    end
    
    if O(1,1)==1
    prompt = {'puissance [W/m²]','Temps départ [s]','Temps final [s]'};
    dlgtitle = 'Flux limite 1';
    dims = [1 60];
    definput = {'0','0','0'};
    answer3 = inputdlg (prompt, dlgtitle, dims, definput);
    answer3=str2double(answer3);
    O(1,2)=answer3(1);O(1,3)=answer3(2);O(1,4)=answer3(3);
    end
    
    if O(2,1)==1
    prompt = {'puissance [W/m²]','Temps départ [s]','Temps final [s]'};
    dlgtitle = 'Flux limite 2';
    dims = [1 60];
    definput = {'0','0','0'};
    answer4 = inputdlg (prompt, dlgtitle, dims, definput);
    answer4=str2double(answer4);
    O(2,2)=answer4(1);O(2,3)=answer4(2);O(2,4)=answer4(3);
    end
    
    if O(3,1)==1
    prompt = {'puissance [W/m3]','Temps départ [s]','Temps final [s]'};
    dlgtitle = 'Puissance volumique partout';
    dims = [1 60];
    definput = {'0','0','0'};
    answer5 = inputdlg (prompt, dlgtitle, dims, definput);
    answer5=str2double(answer5);
    O(3,2)=answer5(1);O(3,3)=answer5(2);O(3,4)=answer5(3);
    end
    
    if O(4,1)==1
    prompt = {'puissance [W/m3]','Temps départ [s]','Temps final [s]','Point choisi, entre 1 et Nx'};
    dlgtitle = 'Puissance volumique 1 point';
    dims = [1 60];
    definput = {'0','0','0','1'};
    answer6 = inputdlg (prompt, dlgtitle, dims, definput);
    answer6=str2double(answer6);
    O(4,2)=answer6(1);O(4,3)=answer6(2);O(4,4)=answer6(3);O(4,5)=answer6(4);
    end
    
    if O(5,1)==1
    prompt = {'puissance [W/m3]','Temps départ [s]','Temps final [s]','Premier point, entre 1 et Nx','Deuxieme point, entre 1 et Nx et sup au 1er point'};
    dlgtitle = 'Puissance volumique une ligne';
    dims = [1 60];
    definput = {'0','0','0','1','2'};
    answer6 = inputdlg (prompt, dlgtitle, dims, definput);
    answer6=str2double(answer6);
    O(5,2)=answer6(1);O(5,3)=answer6(2);O(5,4)=answer6(3);O(5,5)=answer6(4);O(5,6)=answer6(5);
    end
    
    if O(6,1)==1
    prompt = {'Température limite 1','Température limite 2'};
    dlgtitle = 'Puissance volumique une ligne';
    dims = [1 70];
    definput = {'0','0'};
    answer6 = inputdlg (prompt, dlgtitle, dims, definput);
    answer6=str2double(answer6);
    H(1,3)=answer6(1);H(2,3)=answer6(2);
    end
end
end


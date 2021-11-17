function [H,O] = MatLimite(dimension)
if dimension==1
    prompt = {'Condition 1', 'Valeur 1','Condition 2', 'Valeur 2','Plus d options, 0 non, 1 oui'};
    dlgtitle = 'Condition limite';
    dims = [1 50];
    definput = {'1','20','3','500','0'};
    answer = inputdlg (prompt, dlgtitle, dims, definput);
    answer=str2double(answer);%Transfo chaine de caractere en nombres
    %Mise des valeurs dans des variables séparé
    H(1,1)=answer(1);H(1,2)=answer(2);H(2,1)=answer(3);H(2,2)=answer(4);H(1,3)=answer(5);
    
    if H(1,3)==0
        O=[0 0 0 0 0;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0];
    end
    
    if H(1,3)==1
    prompt = {'Ajout un flux entre deux temps pour le point limite 1, 0 non, 1 oui', 'Ajout un flux entre deux temps pour le point limite 2, 0 non, 1 oui', 'Puissance volumique partout, 0 non, 1 oui','Puissance volumique pour un point, 0 non, 1 oui','Puissance volumique pour une ligne, 0 non, 1 oui'};
    dlgtitle = 'Plus d options';
    dims = [1 70];
    definput = {'0','0','0','0','0'};
    answer2 = inputdlg (prompt, dlgtitle, dims, definput);
    answer2=str2double(answer2);%Transfo chaine de caractere en nombres
    %Mise des valeurs dans des variables séparé
    O(1,1)=answer2(1);O(2,1)=answer2(2);O(3,1)=answer2(3);O(4,1)=answer2(4);O(5,1)=answer2(5);
    end
    
    if O(1,1)==1
    prompt = {'puissance [W/m²]','Temps départ [s]','Temps final [s]'};
    dlgtitle = 'Flux limite 1';
    dims = [1 35];
    definput = {'0','0','0'};
    answer3 = inputdlg (prompt, dlgtitle, dims, definput);
    answer3=str2double(answer3);%Transfo chaine de caractere en nombres
    %Mise des valeurs dans des variables séparé
    O(1,2)=answer3(1);O(1,3)=answer3(2);O(1,4)=answer3(3);
    end
    
    if O(2,1)==1
    prompt = {'puissance [W/m²]','Temps départ [s]','Temps final [s]'};
    dlgtitle = 'Flux limite 2';
    dims = [1 35];
    definput = {'0','0','0'};
    answer4 = inputdlg (prompt, dlgtitle, dims, definput);
    answer4=str2double(answer4);%Transfo chaine de caractere en nombres
    %Mise des valeurs dans des variables séparé
    O(2,2)=answer4(1);O(2,3)=answer4(2);O(2,4)=answer4(3);
    end
    
    if O(3,1)==1
    prompt = {'puissance [W/m3]','Temps départ [s]','Temps final [s]'};
    dlgtitle = 'Puissance volumique partout';
    dims = [1 35];
    definput = {'0','0','0'};
    answer5 = inputdlg (prompt, dlgtitle, dims, definput);
    answer5=str2double(answer5);%Transfo chaine de caractere en nombres
    %Mise des valeurs dans des variables séparé
    O(3,2)=answer5(1);O(3,3)=answer5(2);O(3,4)=answer5(3);
    end
    
    if O(4,1)==1
    prompt = {'puissance [W/m3]','Temps départ [s]','Temps final [s]','Point choisi, entre 1 et Nx'};
    dlgtitle = 'Puissance volumique 1 point';
    dims = [1 35];
    definput = {'0','0','0','1'};
    answer6 = inputdlg (prompt, dlgtitle, dims, definput);
    answer6=str2double(answer6);%Transfo chaine de caractere en nombres
    %Mise des valeurs dans des variables séparé
    O(4,2)=answer6(1);O(4,3)=answer6(2);O(4,4)=answer6(3);O(4,5)=answer6(4);
    end
    
    if O(5,1)==1
    prompt = {'puissance [W/m3]','Temps départ [s]','Temps final [s]','Premier point, entre 1 et Nx','Deuxieme point, entre 1 et Nx et sup au 1er point'};
    dlgtitle = 'Puissance volumique une ligne';
    dims = [1 35];
    definput = {'0','0','0','1','2'};
    answer6 = inputdlg (prompt, dlgtitle, dims, definput);
    answer6=str2double(answer6);%Transfo chaine de caractere en nombres
    %Mise des valeurs dans des variables séparé
    O(5,2)=answer6(1);O(5,3)=answer6(2);O(5,4)=answer6(3);O(5,5)=answer6(4);O(5,6)=answer6(5);
    end
    
        
    
elseif dimension==2
    prompt = {'Condition 1', 'Valeur 1','Condition 2', 'Valeur 2','Condition 3', 'Valeur 3','Condition 4', 'Valeur 4'};
    dlgtitle = 'Condition limite';
    dims = [1 50];
    definput = {'1','20','3','500','1','20','3','500'};
    answer = inputdlg (prompt, dlgtitle, dims, definput);
    answer=str2double(answer);%Transfo chaine de caractere en nombres
    %Mise des valeurs dans des variables séparé
    H(1,1)=answer(1);H(1,2)=answer(2);H(2,1)=answer(3);H(2,2)=answer(4);H(3,1)=answer(5);H(3,2)=answer(6);H(4,1)=answer(7);H(4,2)=answer(8);
    
elseif dimension==3
    prompt = {'Condition 1', 'Valeur 1','Condition 2', 'Valeur 2','Condition 3', 'Valeur 3','Condition 4', 'Valeur 4','Condition 5', 'Valeur 5','Condition 6', 'Valeur 6'};
    dlgtitle = 'Condition limite';
    dims = [1 50];
    definput = {'2','20','2','20','2','20','2','20','2','20','2','20'};
    answer = inputdlg (prompt, dlgtitle, dims, definput);
    answer=str2double(answer);%Transfo chaine de caractere en nombres
    %Mise des valeurs dans des variables séparé
    H(1,1)=answer(1);H(1,2)=answer(2);H(2,1)=answer(3);H(2,2)=answer(4);H(3,1)=answer(5);H(3,2)=answer(6);H(4,1)=answer(7);H(4,2)=answer(8);H(5,1)=answer(9);H(5,2)=answer(10);H(6,1)=answer(11);H(6,2)=answer(12);
    
end
end


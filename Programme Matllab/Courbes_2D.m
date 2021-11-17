function [] = Courbes_2D(Tresultats,V)
%Courbes et graph en 2D
Nx=V(1);Ny=V(10);tf=V(3);dltat=V(4);Lx=V(5);Ly=V(11);dltax=Lx/(Nx-1);dltay=Ly/(Ny-1);
k=1;
for i=1:size(Tresultats,2)
    kplot(i)=i;
    X(i)=(i-1)/dltat;
end

choix=input('Choix du graphique (entre 1 et 7, voir PDF)');
    
%Choix du type de courbes
if choix==1 %Courbe de la température des 4 coins et du centre dans le temps
    plot(X,Tresultats(1,:),'g')
    hold on
    plot(X,Tresultats(Nx,:),'m')
    hold on
    plot(X,Tresultats(Nx*Ny,:),'y')
    hold on
    plot(X,Tresultats(Nx*Ny-Nx+1,:),'k')
    hold on
    x=round((Nx*Ny+1)/2);
    plot(X,Tresultats(x,:),'r')
    title('Température en fonction du temps pour les 4 coins et le centre')
    legend({'En haut à gauche','En haut à droite','En bas à droite','En bas à gauche','Centre'},'Location','northeast')
    ylabel('Température [°C]')
    xlabel('Temps [s]')
elseif choix==3 %Courbe de la température d'une ligne suivant x
    temps=input('Choisir le temps, t en [s] compris entre 1 et le temps final');
    ligne=input('Choisir la ligne, compris entre 1 et Nx');
    plot(1:Nx,Tresultats(Nx*(ligne-1)+1:Nx*ligne,temps/dltat))%Courbe de la température d'une ligne suivant x
    ylabel('Température [°C]')
    xlabel('Points x')
    title('Température en fonction de x pour une ligne et un temps choisis')
elseif choix==4 %Courbe de la température d'une ligne suivant x
    temps=input('Choisir le temps, t en [s] compris entre 1 et le temps final');
    col=input('Choisir la colonne, compris entre 1 et Nx');
    plot(1:Ny,Tresultats(col:Ny:Nx*Ny,temps/dltat))%Courbe de la température d'une ligne suivant x
    ylabel('Température [°C]')
    xlabel('Points y')
    title('Température en fonction de y pour une colonne et un temps choisis')
elseif choix==5
    temps=input('Choisir le temps, t en [s] compris entre 1 et le temps final');
    X=1:Nx;
    Y=1:Ny;
    for i=1:Nx
        for j=1:Ny
            Z(i,j)=Tresultats((i-1)*Nx+j,temps/dltat);
        end
    end
    surfc(X,Y,Z);
    title('Température en fonction de x et y pour un temps choisis')
    ylabel('Points y')
    xlabel('Points x')
    zlabel('Températures [°C]')
elseif choix==6
    x=input('Choisir la coordonnée en x, entre 1 et Nx');
    y=input('Choisir la coordonnée en y, entre 1 et Ny');
    td=input('Temps de départ [s]');
    tf=input('Temps de fin [s]');
    k=1;
    for i=td:dltat:tf
        Tr(1,k)=Tresultats(x+y*Nx-Nx,k);
        k=k+1;
    end
    plot(td:dltat:tf,Tr(1,:),'y')
    title('Température en fonction du temps pour un point et des temps choisi')
    ylabel('Température [°C]')
    xlabel('Temps [s]')
    
elseif choix==2 %Courbe de la température des 4 milieu de lignes et du centre dans le temps
    plot(kplot,Tresultats(round((Nx+1)/2),:),'g')
    hold on
    plot(kplot,Tresultats(round((Ny+1)/2)*Nx,:),'m')
    hold on
    plot(kplot,Tresultats(Nx*Ny-round((Nx+1)/2),:),'y')
    hold on
    plot(kplot,Tresultats(round((Ny+1)/2)*Nx-Nx+1,:),'k')
    hold on
    x=round((Nx*Ny+1)/2);
    plot(kplot,Tresultats(x,:),'r')
    title('Température en fonction du temps pour les 4 milieux de lignes et le centre')
    legend({'En haut','En bas','A droite','A gauche','Centre'},'Location','northeast')
    ylabel('Température [°C]')
    xlabel('Temps [s]')

elseif choix==7
    for i=kplot
        Tm(i)=sum(Tresultats(:,i))/(Nx*Ny);
        X(i)=(i-1)*dltat;
    end
    plot(X,Tm,'b')
    title('Température moyenne en fonction du temps')
    ylabel('Température [°C]')
    xlabel('Temps [s]')
end
end


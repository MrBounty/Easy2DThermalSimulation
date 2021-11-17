function [] = Courbes_3D(Tresultats,V)
%Courbes et graph en 3D
Nx=V(1);Ny=V(10);Nz=V(13);tf=V(3);dltat=V(4);Lx=V(5);Ly=V(11);Lz=V(14);dltax=Lx/(Nx-1);dltay=Ly/(Ny-1);dltaz=Lz/(Nz-1);
k=1;
for i=0:dltat:tf
    kplot(k)=i;
    k=k+1;
end

choix=input('Choix du graphique (entre 1 et 6, voir PDF)');
    
%Choix du type de courbes
if choix==1 %Courbe de la température des 8 coins et du centre dans le temps
    plot(kplot,Tresultats(1,:),'g--')
    hold on
    plot(kplot,Tresultats(Nx,:),'m--')
    hold on
    plot(kplot,Tresultats(Nx*Ny,:),'y--')
    hold on
    plot(kplot,Tresultats(Nx*Ny-Nx+1,:),'k--')
    hold on
    plot(kplot,Tresultats(Nx*Ny*Nz-Nx*Ny+1,:),'r--')
    hold on
    plot(kplot,Tresultats(Nx*Ny*Nz-Nx*Ny+Nx,:),'b--')
    hold on
    plot(kplot,Tresultats(Nx*Ny*Nz-Nx+1,:),'c--')
    hold on
    plot(kplot,Tresultats(Nx*Ny*Nz,:),'g-.')
    hold on
    x=round(Nx*Ny*Nz/2);
    plot(kplot,Tresultats(x,:),'r')
    title('Température en fonction du temps pour les 8 coins et le centre')
    legend({'Haut, gauche et devant [1]','Haut, droite et devant [2]','Haut, gauche et derriere [3]','Haut, droite et derriere [4]','Bas, gauche et devant [5]','Bas, droite et devant [6]','Bas, gauche et derriere [7]','Bas, droite et derriere [8]','Centre'},'Location','northeast')
    ylabel('Température [°C]')
    xlabel('Temps [s]')
    
elseif choix==2
    plot(kplot,Tresultats((Nx*Ny+1)/2,:),'g')
    hold on
    plot(kplot,Tresultats((((Nz+1)/2)-1)*Nx*Ny+((Ny+1)/2)*Nx,:),'b')
    hold on
    plot(kplot,Tresultats(Nx*Ny*Nz-(Nx*Ny+1)/2,:),'k')
    hold on
    plot(kplot,Tresultats((((Nz+1)/2)-1)*Nx*Ny+(((Ny+1)/2)-1)*Nx+1,:),'m')
    hold on
    plot(kplot,Tresultats((((Nz+1)/2)-1)*Nx*Ny+(Nx+1)/2,:),'c')
    hold on
    plot(kplot,Tresultats((((Nz+1)/2))*Nx*Ny+1-((Nx+1)/2),:),'y')
    hold on
    x=round(Nx*Ny*Nz/2);
    plot(kplot,Tresultats(x,:),'r')
    title('Température en fonction du temps pour les 6 centres des cotés et le centre')
    legend({'Haut [1]','Droite [2]','Bas [3]','Gauche [4]','Devant [5]','Derriere [6]','Centre'},'Location','northeast')
    ylabel('Température [°C]')
    xlabel('Temps [s]')
    
elseif choix==3
    t=input('Choisir le temps [s]');
    n=input('Choisir le point en x, entre 1 et Nx');
    X=1:Nz;
    Y=1:Ny;
    for i=1:Nz
        for j=1:Ny
            Z(i,j)=Tresultats(n+(i-1)*Nx+(j-1)*Nx*Ny,round(t/dltat));
        end
    end
    surfc(X,Y,Z);
    title('Température en fonction de y et z pour un temps choisis')
    ylabel('Points y')
    xlabel('Points z')
    zlabel('Températures [°C]')
    
elseif choix==4
    t=input('Choisir le temps [s]');
    n=input('Choisir le point en y, entre 1 et Ny');
    X=1:Nx;
    Y=1:Nz;
    for i=1:Nx
        for j=1:Nz
            Z(i,j)=Tresultats((n-1)*Nx+i+(j-1)*Nx*Ny,round(t/dltat));
        end
    end
    surfc(X,Y,Z);
    title('Température en fonction de x et z pour un temps choisis')
    ylabel('Points x')
    xlabel('Points z')
    zlabel('Températures [°C]')
    
elseif choix==5
    t=input('Choisir le temps [s]');
    n=input('Choisir le point en z, entre 1 et Nz');
    X=1:Nx;
    Y=1:Ny;
    for i=1:Nx
        for j=1:Ny
            Z(i,j)=Tresultats((n-1)*Nx*Ny+i+(j-1)*Nx,round(t/dltat));
        end
    end
    surfc(X,Y,Z);
    title('Température en fonction de x et y pour un temps choisis')
    ylabel('Points x')
    xlabel('Points z')
    zlabel('Températures [°C]')
    
elseif choix==6
    for i=1:tf/dltat
        Tm(i)=sum(Tresultats(:,i))/(Nx*Ny*Nz);
        X(i)=(i-1)*dltat;
    end
    plot(X,Tm,'b')
    title('Température moyenne en fonction du temps')
    ylabel('Température [°C]')
    xlabel('Temps [s]')
end


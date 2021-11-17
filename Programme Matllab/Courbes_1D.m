function [] = Courbes_1D(Tresultats,V)
Nx=V(1);tf=V(3);dltat=V(4);Lx=V(5);dltax=Lx/(Nx-1);
choix=input('Choix du graphique (entre 1 et 5, voir PDF)');
if choix==1
    for i=1:size(Tresultats,2)
        X(i)=(i-1)*dltat;
    end
    plot(X,Tresultats(1,:),'g')
    hold on
    x=round(Nx/2);
    plot(X,Tresultats(x,:),'r')
    hold on
    plot(X,Tresultats(Nx,:),'y')
    title('Température en fonction du temps pour les 2 cotés et le centre')
    legend({'Gauche','Centre','Droite'},'Location','northeast')
    ylabel('Température [°C]')
    xlabel('Temps [s]')
elseif choix==2
    t=input('Choisir le temps [s]');
    k=t/dltat;
    for i=1:Lx/dltax+1
        X(i)=(i-1)*dltax;
    end
    plot(X,Tresultats(:,k),'y')
    title('Champ de température pour un temps donné')
    ylabel('Température [°C]')
    xlabel('Longueur [m]')
elseif choix==3
    x=input('Choisir le point, entre 1 et Nx');
    td=input('Temps de départ [s]');
    tf=input('Temps de fin [s]');
    kd=td/dltat;
    kf=tf/dltat;
    if td==0
        kd=1;
    end
    for i=kd:kf
        Tr(1,i-kd+1)=Tresultats(x,i);
    end
    plot(kd:kf,Tr(1,:),'y')
    title('Température en fonction du temps pour un point et des temps choisi')
    ylabel('Température [°C]')
    xlabel('Temps [k]')
elseif choix==4
    td=input('Temps de départ [s]');
    if td==0
        td=1;
    end
    tf=input('Temps de final [s]');
    for i=1:Nx
        X(i)=dltax*(i-1);
    end
    h = animatedline;
    axis([0 Nx*dltax min(min(Tresultats)) max(max(Tresultats))])
    k=1;
    pt=(tf-td)/100;
    title('Champs de températures evoluant en fonction du temps')
    ylabel('Température [°C]')
    xlabel('Distance [m]')
    for i=round(td/dltat):round(((tf-td)/dltat)/300):round(tf/dltat)
        clearpoints(h)
        y = Tresultats(:,i);%round((k-1)*pt/dltat+(td/dltat))
        x=X(:);
        addpoints(h,x,y)
        drawnow 
        k=k+1;
        pause(1/30)
    end
elseif choix==5
    for i=1:size(Tresultats,2)
        Tm(i)=sum(Tresultats(:,i))/Nx;
        X(i)=(i-1)*dltat;
    end
    plot(X,Tm,'b')
    title('Température moyenne en fonction du temps')
    ylabel('Température [°C]')
    xlabel('Temps [s]')
    
end


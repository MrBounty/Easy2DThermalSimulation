function [Tresultats] = Calcul(A,C,B,V,Tk,dimension,O,sta,choix)
if dimension==1
Nx=V(1);alpha=V(2);tf=V(3);dltat=V(4);
k=1;t=0;
Tk1=zeros(Nx,1);%T k+1
Tresultats(:,k)=Tk(:);
if choix==1
while t<=tf
    if t~=0
    Tk=Tk1;
    end
    Bu(:,1)=B(:,1);
        for j=1:5
            if t>O(j,3) && t<O(j,4)
            Bu(:,1)=Bu(:,1)+B(:,j+1);
            end
        end
    Tresultats(:,k)=Tk(:);%Stockage des résultats
    Tk1=inv(C-alpha*A)*((C+(1-alpha)*A)*Tk+Bu);%Calcul de Tk+1
    k=k+1;t=t+dltat;
end
elseif choix==2
while abs(sum(Tk1)-sum(Tk))>sta*size(Tresultats,1)
    if t~=0
    Tk=Tk1;
    end
    Bu(:,1)=B(:,1);
        for j=1:5
            if t>O(j,3) && t<O(j,4)
            Bu(:,1)=Bu(:,1)+B(:,j+1);
            end
        end
    Tresultats(:,k)=Tk(:);%Stockage des résultats
    Tk1=inv(C-alpha*A)*((C+(1-alpha)*A)*Tk+Bu);%Calcul de Tk+1
    k=k+1;t=t+dltat;
end
elseif choix==3
while t<=tf && abs(sum(Tk1)-sum(Tk))>sta*size(Tresultats,1)
    if t~=0
    Tk=Tk1;
    end
    Bu(:,1)=B(:,1);
        for j=1:5
            if t>O(j,3) && t<O(j,4)
            Bu(:,1)=Bu(:,1)+B(:,j+1);
            end
        end
    Tresultats(:,k)=Tk(:);%Stockage des résultats
    Tk1=inv(C-alpha*A)*((C+(1-alpha)*A)*Tk+Bu);%Calcul de Tk+1
    k=k+1;t=t+dltat;
end
end

%--------------------------------------------------------------------------
elseif dimension==2
Nx=V(1);alpha=V(2);tf=V(3);dltat=V(4);Ny=V(10);
k=1;t=0;
Tk1=zeros(Nx*Ny,1);
Tresultats(:,k)=Tk(:);
if choix==1
while t<=tf
    Bu(:,1)=B(:,1);
        for j=1:6
            if t>O(j,3) && t<O(j,4)
            Bu(:,1)=Bu(:,1)+B(:,j+1);
            end
        end
    Tresultats(:,k)=Tk(:,1);%Stockage des résultats
    Tk1=inv(C-alpha*A)*((C+(1-alpha)*A)*Tk+Bu);%Calcul de Tk+1
    Tk=Tk1;
    k=k+1;t=t+dltat;
end
elseif choix==2
while abs(sum(Tk1)-sum(Tk))>sta*size(Tresultats,1)
    Tk=Tk1;
    Bu(:,1)=B(:,1);
        for j=1:6
            if t>O(j,3) && t<O(j,4)
            Bu(:,1)=Bu(:,1)+B(:,j+1);
            end
        end
    Tresultats(:,k)=Tk(:,1);%Stockage des résultats
    Tk1=inv(C-alpha*A)*((C+(1-alpha)*A)*Tk+Bu);%Calcul de Tk+1
    k=k+1;t=t+dltat;
end
elseif choix==3
while t<=tf && abs(sum(Tk1)-sum(Tk))>sta*size(Tresultats,1)
    Tk=Tk1;
    Bu(:,1)=B(:,1);
        for j=1:6
            if t>O(j,3) && t<O(j,4)
            Bu(:,1)=Bu(:,1)+B(:,j+1);
            end
        end
    Tresultats(:,k)=Tk(:,1);%Stockage des résultats
    Tk1=inv(C-alpha*A)*((C+(1-alpha)*A)*Tk+Bu);%Calcul de Tk+1
    k=k+1;t=t+dltat;
end
end

elseif dimension==3
Nx=V(1);alpha=V(2);tf=V(3);dltat=V(4);Ny=V(10);Nz=V(13);
k=1;
Tresultats=zeros(Nx*Ny*Nz,tf/dltat); %Matrice de stockage des résultats
Tk1=zeros(Nx*Ny*Nz,1);%T k+1
for i=0:dltat:tf
    Bu(:,1)=B(:,1);
        for j=1:7
            if i>O(j,3) && i<O(j,4)
            Bu(:,1)=Bu(:,1)+B(:,j+1);
            end
        end
    Tresultats(:,k)=Tk(:,1);%Stockage des résultats
    Tk1=inv(C-alpha*A)*((C+(1-alpha)*A)*Tk+Bu);%Calcul de Tk+1
    Tk=Tk1;
    k=k+1;
end
end
end


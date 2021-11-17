function [B] = MatB(V,D,H,O,dimension)
if dimension==1
    Nx=V(1);
    if O(6,1)==1
        Ta1=H(1,3);
        Ta2=H(2,3);
    else
        Ta1=V(8);
        Ta2=V(8);
    end
    dltax=D(1);
    B=zeros(Nx,6);
    if H(1,1)==1
        B(1,1)=0;
    elseif H(1,1)==2
        B(1,1)=(2*H(1,2)*Ta1)/(dltax^2);
    elseif H(1,1)==3
        B(1,1)=(2*H(1,2))/(dltax^2);
    end
    if H(2,1)==1
        B(Nx,1)=0;
    elseif H(2,1)==2
        B(Nx,1)=(2*H(2,2)*Ta2)/(dltax^2);
    elseif H(2,1)==3
        B(Nx,1)=(2*H(2,2))/(dltax^2);
    end
    if O(1,1)==1 && H(1,1)~=1
        B(1,2)=(2*O(1,2))/(dltax^2);
    end
    if O(2,1)==1 && H(2,1)~=1
        B(Nx,3)=(2*O(2,2))/(dltax^2);
    end
    if O(3,1)==1
        B(2:Nx-1,4)=O(3,2);
    end
    if O(4,1)==1
        B(O(4,5),5)=O(4,2);
    end
    if O(5,1)==1
        for i=O(5,5):O(5,6)
            B(i,6)=O(5,2);
        end
    end
    
%--------------------------------------------------------------------------
elseif dimension==2
    Nx=V(1);Ny=V(10);
    dltax=D(1);dltay=D(2);
    B=zeros(Nx*Ny,7);
    if O(7,1)==1
        Ta1=H(1,3);Ta2=H(2,3);Ta3=H(3,3);Ta4=H(4,3);
    else
        Ta1=V(8);Ta2=V(8);Ta3=V(8);Ta4=V(8);
    end
    if O(1,1)==1 && H(1,1)~=1
        for i=2:Nx-1
            B(i,2)=(2*O(1,2))/(dltay^2);
        end
    end
    if O(2,1)==1 && H(2,1)~=1
        for i=2*Nx:Nx:Nx*Ny-Nx
            B(i,3)=(2*O(2,2))/(dltax^2);
        end
    end
    if O(3,1)==1 && H(3,1)~=1
        for i=Nx*Ny-Nx+2:Nx*Ny-1
            B(i,4)=(2*O(3,2))/(dltay^2);
        end
    end
    if O(4,1)==1 && H(4,1)~=1
        for i=1+Nx:Nx:Nx*Ny-2*Nx+1
            B(i,5)=(2*O(4,2))/(dltax^2);
        end
    end
    if O(5,1)==1
        for i=2:Nx:Ny*Ny-Nx
            B(i:i+Nx-3,6)=O(5,2);
        end
    end
    if O(6,1)==1
        B(O(6,5)+(O(6,6)-1)*Nx,7)=O(6,2);
    end
    %Point 1 en haut à gauche
    if H(1,1)==1 || H(4,1)==1
        B(1,1)=0;
    elseif H(1,1)==2 && H(4,1)==2
        B(1,1)=(2*H(1,2)*Ta1)/(dltay^2)+(2*H(4,2)*Ta4)/(dltax^2);
    elseif H(1,1)==2 && H(4,1)==3
        B(1,1)=(2*H(1,2)*Ta1)/(dltay^2)+(2*H(4,2))/(dltax^2);
    elseif H(1,1)==3 && H(4,1)==2
        B(1,1)=(2*H(1,2))/(dltay^2)+(2*H(4,2)*Ta4)/(dltax^2);
    elseif H(1,1)==3 && H(4,1)==3
        B(1,1)=(2*H(1,2))/(dltay^2)+(2*H(4,2))/(dltax^2);
    end
    
    %Point 3 en haut à droite
    if H(1,1)==1 || H(2,1)==1
        B(Nx,1)=0;
    elseif H(1,1)==2 && H(2,1)==2
        B(Nx,1)=(2*H(1,2)*Ta1)/(dltay^2)+(2*H(2,2)*Ta2)/(dltax^2);
    elseif H(1,1)==2 && H(2,1)==3
        B(Nx,1)=(2*H(1,2)*Ta1)/(dltay^2)+(2*H(2,2))/(dltax^2);
    elseif H(1,1)==3 && H(2,1)==2
        B(Nx,1)=(2*H(1,2))/(dltay^2)+(2*H(2,2)*Ta2)/(dltax^2);
    elseif H(1,1)==3 && H(2,1)==3
        B(Nx,1)=(2*H(1,2))/(dltay^2)+(2*H(2,2))/(dltax^2);
    end
    
    %Point 7 en bas à gauche
    if H(3,1)==1 || H(4,1)==1
        B(Nx*Ny-Nx+1,1)=0;
    elseif H(3,1)==2 && H(4,1)==2
        B(Nx*Ny-Nx+1,1)=(2*H(4,2)*Ta4)/(dltax^2)+(2*H(3,2)*Ta3)/(dltay^2);
    elseif H(3,1)==2 && H(4,1)==3
        B(Nx*Ny-Nx+1,1)=(2*H(4,2))/(dltax^2)+(2*H(3,2)*Ta3)/(dltay^2);
    elseif H(3,1)==3 && H(4,1)==2
        B(Nx*Ny-Nx+1,1)=(2*H(4,2)*Ta4)/(dltax^2)+(2*H(3,2))/(dltay^2);
    elseif H(3,1)==3 && H(4,1)==3
        B(Nx*Ny-Nx+1,1)=(2*H(4,2))/(dltax^2)+(2*H(3,2))/(dltay^2);
    end
    
    %Point 9 en bas à droite
    if H(3,1)==1 || H(2,1)==1
        B(Nx*Ny,1)=0;
    elseif H(3,1)==2 && H(2,1)==2
        B(Nx*Ny,1)=(2*H(2,2)*Ta2)/(dltax^2)+(2*H(3,2)*Ta3)/(dltay^2);
    elseif H(3,1)==2 && H(2,1)==3
        B(Nx*Ny,1)=(2*H(2,2))/(dltax^2)+(2*H(3,2)*Ta3)/(dltay^2);
    elseif H(3,1)==3 && H(2,1)==2
        B(Nx*Ny,1)=(2*H(2,2)*Ta2)/(dltax^2)+(2*H(3,2))/(dltay^2);
    elseif H(3,1)==3 && H(2,1)==3
        B(Nx*Ny,1)=(2*H(2,2))/(dltax^2)+(2*H(3,2))/(dltay^2);
    end
    
    %Ligne en haut
    for i=2:Nx-1
        if H(1,1)==1
            B(i,1)=0;
        elseif H(1,1)==2
            B(i,1)=(2*H(1,2)*Ta1)/(dltay^2);
        elseif H(1,1)==3
            B(i,1)=(2*H(1,2))/(dltay^2);
        end
    end
    
    %Ligne en bas
    for i=Nx*Ny-Nx+2:Nx*Ny-1
        if H(3,1)==1
            B(i,1)=0;
        elseif H(3,1)==2
            B(i,1)=(2*H(3,2)*Ta3)/(dltay^2);
        elseif H(3,1)==3
            B(i,1)=(2*H(3,2))/(dltay^2);
        end
    end
    
    %Ligne à gauche
    for i=(Nx+1):Nx:Nx*Ny-2*Nx+2
        if H(4,1)==1
            B(i,1)=0;
        elseif H(4,1)==2
            B(i,1)=(2*H(4,2)*Ta4)/(dltax^2);
        elseif H(4,1)==3
            B(i,1)=(2*H(4,2))/(dltax^2);
        end
    end
    
    %Ligne à droite
    for i=2*Nx:Nx:Nx*Ny-Nx
        if H(2,1)==1
            B(i,1)=0;
        elseif H(2,1)==2
            B(i,1)=(2*H(2,2)*Ta2)/(dltax^2);
        elseif H(2,1)==3
            B(i,1)=(2*H(2,2))/(dltax^2);
        end
    end
    
%--------------------------------------------------------------------------
elseif dimension==3
    Nx=V(1);Ta=V(8);Ny=V(10);Nz=V(13);
    dltax=D(1);dltay=D(2);dltaz=D(3);
    B=zeros(Nx*Ny*Nz,7);
    if O(7,1)==0
        H(1,3)=V(8);H(2,3)=V(8);H(3,3)=V(8);H(4,3)=V(8);H(5,3)=V(8);H(6,3)=V(8);
    end
    if O(1,1)==1 && H(1,1)~=1
        for i=1:Nx*Ny
            B(i,2)=(2*O(1,2))/(dltay^2);
        end
        if H(5,1)==1
            for i=1:Nx
                B(i,2)=0;
            end
        end
        if H(6,1)==1
            for i=Nx*Ny-Nx+1:Nx*Ny
                B(i,2)=0;
            end
        end
        if H(2,1)==1
            for i=Nx:Nx:Nx*Ny
                B(i,2)=0;
            end
        end
        if H(4,1)==1
            for i=1:Nx:Nx*Ny-Nx+1
                B(i,2)=0;
            end
        end
    end
    
    if O(2,1)==1 && H(2,1)~=1
        for i=Nx:Nx:Nx*Ny*Nz
            B(i,3)=(2*O(1,2))/(dltax^2);
        end
        if H(1,1)==1
            for i=Nx:Nx:Nx*Ny
                B(i,3)=0;
            end
        end
        if H(3,1)==1
            for i=Nx*Ny*Nz-Nx*Ny+Nx:Nx:Nx*Ny*Nz
                B(i,3)=0;
            end
        end
        if H(6,1)==1
            for i=Nx*Ny:Nx*Ny:Nx*Ny*Nz
                B(i,3)=0;
            end
        end
        if H(5,1)==1
            for i=Nx:Nx*Ny:Nx*Ny*Nz-Nx*Ny+Nx
                B(i,3)=0;
            end
        end
    end
    
    if O(3,1)==1 && H(3,1)~=1
        for i=Nx*Ny*Nz-Nx*Ny+1:Nx*Ny*Nz
            B(i,4)=(2*O(1,2))/(dltay^2);
        end
        if H(2,1)==1
            for i=Nx*Ny*Nz-Nx*Ny+Nx:Nx:Nx*Ny*Nz
                B(i,4)=0;
            end
        end
        if H(4,1)==1
            for i=Nx*Ny*Nz-Nx*Ny+1:Nx:Nx*Ny*Nz-Nx+1
                B(i,4)=0;
            end
        end
        if H(6,1)==1
            for i=Nx*Ny*Nz-Nx+1:Nx*Ny*Nz
                B(i,4)=0;
            end
        end
        if H(5,1)==1
            for i=Nx*Ny*Nz-Nx*Ny+1:Nx*Ny*Nz-Nx*Ny+Nx
                B(i,4)=0;
            end
        end
    end
        
    if O(4,1)==1 && H(4,1)~=1
        for i=1:Nx:Nx*Ny*Nz-Nx+1
            B(i,5)=(2*O(1,2))/(dltay^2);
        end
        if H(1,1)==1
            for i=1:Nx:Nx*Ny-Nx+1
                B(i,5)=0;
            end
        end
        if H(3,1)==1
            for i=Nx*Ny*Nz-Nx*Ny+1:Nx:Nx*Ny-Nx+1
                B(i,5)=0;
            end
        end
        if H(6,1)==1
            for i=Nx*Ny-Nx+1:Nx*Ny:Nx*Ny*Nz-Nx+1
                B(i,5)=0;
            end
        end
        if H(5,1)==1
            for i=1:Nx*Ny:Nx*Ny*Nz-Nx*Ny+1
                B(i,5)=0;
            end
        end
    end
    
    if O(5,1)==1 && H(5,1)~=1
        for j=1:Nz
            for i=1:Nx
                B(i+(j-1)*Nx*Ny,6)=(2*O(1,2))/(dltaz^2);
            end
        end
        if H(1,1)==1
            for i=1:Nx
                B(i,6)=0;
            end
        end
        if H(2,1)==1
            for i=Nx:Nx*Ny:Nx*Ny*Nz-Nx*Ny+Nx
                B(i,6)=0;
            end
        end
        if H(3,1)==1
            for i=Nx*Ny*Nz-Nx*Ny+1:Nx*Ny*Nz-Nx*Ny+Nx
                B(i,6)=0;
            end
        end
        if H(4,1)==1
            for i=1:Nx*Ny:Nx*Ny*Nz-Nx*Ny+1
                B(i,6)=0;
            end
        end
    end
    
    if O(6,1)==1 && H(6,1)~=1
        for j=1:Nz
            for i=1:Nx
                B(i+j*Nx*Ny-Nx,7)=(2*O(1,2))/(dltaz^2);
            end
        end
        if H(1,1)==1
            for i=Nx*Ny-Nx+1:Nx*Ny
                B(i,7)=0;
            end
        end
        if H(2,1)==1
            for i=Nx*Ny:Nx*Ny:Nx*Ny*Nz
                B(i,7)=0;
            end
        end
        if H(3,1)==1
            for i=Nx*Ny*Nz-Nx+1:Nx*Ny*Nz
                B(i,7)=0;
            end
        end
        if H(4,1)==1
            for i=Nx*Ny-Nx+1:Nx*Ny:Nx*Ny*Nz-Nx+1
                B(i,7)=0;
            end
        end
    end
    if O(7,1)==1
        testB=zeros(Nx*Ny*Nz,1);
        for i=1:Nx*Ny
            testB(i,1)=1;
        end
        for i=Nx*Ny*Nz-Nx*Ny+1:Nx*Ny*Nz
            testB(i,1)=1;
        end
        for i=Nx:Nx:Nx*Ny*Nz
            testB(i,1)=1;
        end
        for i=1:Nx:Nx*Ny*Nz-Nx+1
            testB(i,1)=1;
        end
        for j=1:Nz
            for i=1:Nx
                testB(i+(j-1)*Nx*Ny,1)=1;
            end
        end
        for j=1:Nz
            for i=1:Nx
                testB(i+j*Nx*Ny-Nx,1)=1;
            end
        end
        for i=1:Nx*Ny*Nz
            if testB(i)~=1
                B(i,8)=O(7,2);
            end
        end
    end
%Les 6 surfaces
    %Surface 1
    for i=1:Nx*Ny
        if H(1,1)==1
            B(i,1)=0;
        elseif H(1,1)==2
            B(i,1)=(2*H(1,2)*H(1,3))/(dltay^2);
        elseif H(1,1)==3
            B(i,1)=(2*H(1,2))/(dltay^2);
        end
    end
    %Surface 2
    for i=Nx:Nx:Nx*Ny*Nz
        if H(2,1)==1
            B(i,1)=0;
        elseif H(2,1)==2
            B(i,1)=(2*H(2,2)*H(2,3))/(dltax^2);
        elseif H(2,1)==3
            B(i,1)=(2*H(2,2))/(dltax^2);
        end
    end
    %Surface 3
    for i=Nx*Ny*Nz-Nx*Ny+1:Nx*Ny*Nz
        if H(3,1)==1
            B(i,1)=0;
        elseif H(3,1)==2
            B(i,1)=(2*H(3,2)*H(3,3))/(dltay^2);
        elseif H(3,1)==3
            B(i,1)=(2*H(3,2))/(dltay^2);
        end
    end
    %Surface 4
    for i=1:Nx:Nx*Ny*Nz-Nx+1
        if H(4,1)==1
            B(i,1)=0;
        elseif H(4,1)==2
            B(i,1)=(2*H(4,2)*H(4,3))/(dltax^2);
        elseif H(4,1)==3
            B(i,1)=(2*H(4,2))/(dltax^2);
        end
    end
    %Surface 5
    for j=1:Nz
        for i=1:Nx
            if H(5,1)==1
                B(i+(j-1)*Nx*Ny,1)=0;
            elseif H(5,1)==2
                B(i+(j-1)*Nx*Ny,1)=(2*H(5,2)*H(5,3))/(dltaz^2);
            elseif H(5,1)==3
                B(i+(j-1)*Nx*Ny,1)=(2*H(5,2))/(dltaz^2);
            end
        end
    end
    %Surface 6
    for j=1:Nz
        for i=1:Nx
            if H(6,1)==1
                B(i+j*Nx*Ny-Nx,1)=0;
            elseif H(6,1)==2
                B(i+j*Nx*Ny-Nx,1)=(2*H(5,2)*H(5,3))/(dltaz^2);
            elseif H(6,1)==3
                B(i+j*Nx*Ny-Nx,1)=(2*H(5,2))/(dltaz^2);
            end
        end
    end
    
%Les 12 lignes
    %Ligne entre 1 et 2
    for i=1:Nx
        if H(1,1)==1 || H(5,1)==1
            B(i,1)=0;
        elseif H(1,1)==2 && H(5,1)==2
            B(i,1)=(2*H(5,2)*H(5,3))/(dltaz^2)+(2*H(1,2)*H(1,3))/(dltay^2);
        elseif H(1,1)==3 && H(5,1)==2
            B(i,1)=(2*H(5,2)*H(5,3))/(dltaz^2)+(2*H(1,2))/(dltay^2);
        elseif H(1,1)==2 && H(5,1)==3
            B(i,1)=(2*H(5,2))/(dltaz^2)+(2*H(1,2)*H(1,3))/(dltay^2);
        elseif H(1,1)==3 && H(5,1)==3
            B(i,1)=(2*H(5,2))/(dltaz^2)+(2*H(1,2))/(dltay^2);
        end
    end
    %Ligne entre 3 et 4
    for i=Nx*Ny-Nx+1:Nx*Ny
        if H(1,1)==1 || H(6,1)==1
            B(i,1)=0;
        elseif H(1,1)==2 && H(6,1)==2
            B(i,1)=(2*H(6,2)*H(6,3))/(dltaz^2)+(2*H(1,2)*H(1,3))/(dltay^2);
        elseif H(1,1)==3 && H(6,1)==2
            B(i,1)=(2*H(6,2)*H(6,3))/(dltaz^2)+(2*H(1,2))/(dltay^2);
        elseif H(1,1)==2 && H(6,1)==3
            B(i,1)=(2*H(6,2))/(dltaz^2)+(2*H(1,2)*H(1,3))/(dltay^2);
        elseif H(1,1)==3 && H(6,1)==3
            B(i,1)=(2*H(6,2))/(dltaz^2)+(2*H(1,2))/(dltay^2);
        end
    end
    %Ligne entre 5 et 6
    for i=Nx*Ny*Nz-Nx*Ny+1:Nx*Ny*Nz-Nx*Ny+Nx
        if H(3,1)==1 || H(5,1)==1
            B(i,1)=0;
        elseif H(3,1)==2 && H(5,1)==2
            B(i,1)=(2*H(5,2)*H(5,3))/(dltaz^2)+(2*H(3,2)*H(3,3))/(dltay^2);
        elseif H(3,1)==3 && H(5,1)==2
            B(i,1)=(2*H(5,2)*H(5,3))/(dltaz^2)+(2*H(3,2))/(dltay^2);
        elseif H(3,1)==2 && H(5,1)==3
            B(i,1)=(2*H(5,2))/(dltaz^2)+(2*H(3,2)*H(3,3))/(dltay^2);
        elseif H(3,1)==3 && H(5,1)==3
            B(i,1)=(2*H(5,2))/(dltaz^2)+(2*H(3,2))/(dltay^2);
        end
    end
    %Ligne entre 7 et 8
    for i=Nx*Ny*Nz-Nx+1:Nx*Ny*Nz
        if H(3,1)==1 || H(6,1)==1
            B(i,1)=0;
        elseif H(3,1)==2 && H(6,1)==2
            B(i,1)=(2*H(6,2)*H(6,3))/(dltaz^2)+(2*H(3,2)*H(3,3))/(dltay^2);
        elseif H(3,1)==3 && H(6,1)==2
            B(i,1)=(2*H(6,2)*H(6,3))/(dltaz^2)+(2*H(3,2))/(dltay^2);
        elseif H(3,1)==2 && H(6,1)==3
            B(i,1)=(2*H(6,2))/(dltaz^2)+(2*H(3,2)*H(3,3))/(dltay^2);
        elseif H(3,1)==3 && H(6,1)==3
            B(i,1)=(2*H(6,2))/(dltaz^2)+(2*H(3,2))/(dltay^2);
        end
    end
    %Ligne entre 1 et 3
    for i=1:Nx:Nx*Ny-Nx+1
        if H(4,1)==1 || H(1,1)==1
            B(i,1)=0;
        elseif H(4,1)==2 && H(1,1)==2
            B(i,1)=(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(1,2)*H(1,3))/(dltay^2);
        elseif H(1,1)==3 && H(4,1)==2
            B(i,1)=(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(1,2))/(dltay^2);
        elseif H(1,1)==2 && H(4,1)==3
            B(i,1)=(2*H(4,2))/(dltax^2)+(2*H(1,2)*H(1,3))/(dltay^2);
        elseif H(4,1)==3 && H(1,1)==3
            B(i,1)=(2*H(4,2))/(dltax^2)+(2*H(1,2))/(dltay^2);
        end
    end
    %Ligne entre 2 et 4
    for i=Nx:Nx:Nx*Ny
        if H(2,1)==1 || H(1,1)==1
            B(i,1)=0;
        elseif H(2,1)==2 && H(1,1)==2
            B(i,1)=(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(1,2)*H(1,3))/(dltay^2);
        elseif H(1,1)==3 && H(2,1)==2
            B(i,1)=(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(1,2))/(dltay^2);
        elseif H(1,1)==2 && H(2,1)==3
            B(i,1)=(2*H(2,2))/(dltax^2)+(2*H(1,2)*H(1,3))/(dltay^2);
        elseif H(2,1)==3 && H(1,1)==3
            B(i,1)=(2*H(2,2))/(dltax^2)+(2*H(1,2))/(dltay^2);
        end
    end
    %Ligne entre 5 et 7
    for i=Nx*Ny*Nz-Nx*Ny+1:Nx:Nx*Ny*Nz-Nx+1
        if H(4,1)==1 || H(3,1)==1
            B(i,1)=0;
        elseif H(4,1)==2 && H(3,1)==2
            B(i,1)=(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(3,2)*H(3,3))/(dltay^2);
        elseif H(3,1)==3 && H(4,1)==2
            B(i,1)=(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(3,2))/(dltay^2);
        elseif H(3,1)==2 && H(4,1)==3
            B(i,1)=(2*H(4,2))/(dltax^2)+(2*H(3,2)*H(3,3))/(dltay^2);
        elseif H(4,1)==3 && H(3,1)==3
            B(i,1)=(2*H(4,2))/(dltax^2)+(2*H(3,2))/(dltay^2);
        end
    end
    %Ligne entre 6 et 8
    for i=Nx*Ny*Nz-Nx*Ny+Nx:Nx:Nx*Ny*Nz
        if H(2,1)==1 || H(3,1)==1
            B(i,1)=0;
        elseif H(2,1)==2 && H(3,1)==2
            B(i,1)=(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(3,2)*H(3,3))/(dltay^2);
        elseif H(3,1)==3 && H(2,1)==2
            B(i,1)=(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(3,2))/(dltay^2);
        elseif H(3,1)==2 && H(2,1)==3
            B(i,1)=(2*H(2,2))/(dltax^2)+(2*H(3,2)*H(3,3))/(dltay^2);
        elseif H(2,1)==3 && H(3,1)==3
            B(i,1)=(2*H(2,2))/(dltax^2)+(2*H(3,2))/(dltay^2);
        end
    end
    %Ligne entre 1 et 5
    for i=1:Nx*Ny:Nx*Ny*Nz-Nx*Ny+1
        if H(4,1)==1 || H(5,1)==1
            B(i,1)=0;
        elseif H(4,1)==2 && H(5,1)==2
            B(i,1)=(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
        elseif H(5,1)==3 && H(4,1)==2
            B(i,1)=(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(5,2))/(dltaz^2);
        elseif H(5,1)==2 && H(4,1)==3
            B(i,1)=(2*H(4,2))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
        elseif H(4,1)==3 && H(5,1)==3
            B(i,1)=(2*H(4,2))/(dltax^2)+(2*H(5,2))/(dltaz^2);
        end
    end
    %Ligne entre 2 et 6
    for i=Nx:Nx*Ny:Nx*Ny*Nz-Nx*Ny+Nx
        if H(2,1)==1 || H(5,1)==1
            B(i,1)=0;
        elseif H(2,1)==2 && H(5,1)==2
            B(i,1)=(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
        elseif H(5,1)==3 && H(2,1)==2
            B(i,1)=(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(5,2))/(dltaz^2);
        elseif H(5,1)==2 && H(2,1)==3
            B(i,1)=(2*H(2,2))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
        elseif H(2,1)==3 && H(5,1)==3
            B(i,1)=(2*H(2,2))/(dltax^2)+(2*H(5,2))/(dltaz^2);
        end
    end
    %Ligne entre 3 et 7
    for i=Nx*Ny-Nx+1:Nx*Ny:Nx*Ny*Nz-Nx+1
        if H(4,1)==1 || H(6,1)==1
            B(i,1)=0;
        elseif H(4,1)==2 && H(6,1)==2
            B(i,1)=(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
        elseif H(6,1)==3 && H(4,1)==2
            B(i,1)=(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(6,2))/(dltaz^2);
        elseif H(6,1)==2 && H(4,1)==3
            B(i,1)=(2*H(4,2))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
        elseif H(4,1)==3 && H(6,1)==3
            B(i,1)=(2*H(4,2))/(dltax^2)+(2*H(6,2))/(dltaz^2);
        end
    end
    %Ligne entre 3 et 7
    for i=Nx*Ny:Nx*Ny:Nx*Ny*Nz
        if H(2,1)==1 || H(6,1)==1
            B(i,1)=0;
        elseif H(2,1)==2 && H(6,1)==2
            B(i,1)=(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
        elseif H(6,1)==3 && H(2,1)==2
            B(i,1)=(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(6,2))/(dltaz^2);
        elseif H(6,1)==2 && H(2,1)==3
            B(i,1)=(2*H(2,2))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
        elseif H(2,1)==3 && H(6,1)==3
            B(i,1)=(2*H(2,2))/(dltax^2)+(2*H(6,2))/(dltaz^2);
        end
    end
            
    
%Les 8 points
    %Point 1, haut gauche devant
    if H(1,1)==1 || H(4,1)==1 || H(5,1)==1
        B(1,1)=0;
    elseif H(1,1)==2 && H(4,1)==2 && H(5,1)==2
        B(1,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(1,1)==2 && H(4,1)==3 && H(5,1)==2
        B(1,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(1,1)==3 && H(4,1)==2 && H(5,1)==2
        B(1,1)=(2*H(1,2))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(1,1)==3 && H(4,1)==3 && H(5,1)==2
        B(1,1)=(2*H(1,2))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(1,1)==2 && H(4,1)==2 && H(5,1)==3
        B(1,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    elseif H(1,1)==2 && H(4,1)==3 && H(5,1)==3
        B(1,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    elseif H(1,1)==3 && H(4,1)==2 && H(5,1)==3
        B(1,1)=(2*H(1,2))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    elseif H(1,1)==3 && H(4,1)==3 && H(5,1)==3
        B(1,1)=(2*H(1,2))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    end
    
        %Point 2, haut droite devant
    if H(1,1)==1 || H(2,1)==1 || H(5,1)==1
        B(Nx,1)=0;
    elseif H(1,1)==2 && H(2,1)==2 && H(5,1)==2
        B(Nx,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(1,1)==2 && H(2,1)==3 && H(5,1)==2
        B(Nx,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(1,1)==3 && H(2,1)==2 && H(5,1)==2
        B(Nx,1)=(2*H(1,2))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(1,1)==3 && H(2,1)==3 && H(5,1)==2
        B(Nx,1)=(2*H(1,2))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(1,1)==2 && H(2,1)==2 && H(5,1)==3
        B(Nx,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    elseif H(1,1)==2 && H(2,1)==3 && H(5,1)==3
        B(Nx,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    elseif H(1,1)==3 && H(2,1)==2 && H(5,1)==3
        B(Nx,1)=(2*H(1,2))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    elseif H(1,1)==3 && H(2,1)==3 && H(5,1)==3
        B(Nx,1)=(2*H(1,2))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    end
    
    %Point 3, haut gauche derrière
    if H(1,1)==1 || H(4,1)==1 || H(6,1)==1
        B(Nx*Ny-Nx+1,1)=0;
    elseif H(1,1)==2 && H(4,1)==2 && H(6,1)==2
        B(Nx*Ny-Nx+1,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(1,1)==2 && H(4,1)==3 && H(6,1)==2
        B(Nx*Ny-Nx+1,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(1,1)==3 && H(4,1)==2 && H(6,1)==2
        B(Nx*Ny-Nx+1,1)=(2*H(1,2))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(1,1)==3 && H(4,1)==3 && H(6,1)==2
        B(Nx*Ny-Nx+1,1)=(2*H(1,2))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(1,1)==2 && H(4,1)==2 && H(6,1)==3
        B(Nx*Ny-Nx+1,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    elseif H(1,1)==2 && H(4,1)==3 && H(6,1)==3
        B(Nx*Ny-Nx+1,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    elseif H(1,1)==3 && H(4,1)==2 && H(6,1)==3
        B(Nx*Ny-Nx+1,1)=(2*H(1,2))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    elseif H(1,1)==3 && H(4,1)==3 && H(6,1)==3
        B(Nx*Ny-Nx+1,1)=(2*H(1,2))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    end
    
    %Point 4, haut droite derrière
    if H(1,1)==1 || H(2,1)==1 || H(6,1)==1
        B(Nx*Ny,1)=0;
    elseif H(1,1)==2 && H(2,1)==2 && H(6,1)==2
        B(Nx*Ny,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(1,1)==2 && H(2,1)==3 && H(6,1)==2
        B(Nx*Ny,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(1,1)==3 && H(2,1)==2 && H(6,1)==2
        B(Nx*Ny,1)=(2*H(1,2))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(1,1)==3 && H(2,1)==3 && H(6,1)==2
        B(Nx*Ny,1)=(2*H(1,2))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(1,1)==2 && H(2,1)==2 && H(6,1)==3
        B(Nx*Ny,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    elseif H(1,1)==2 && H(2,1)==3 && H(6,1)==3
        B(Nx*Ny,1)=(2*H(1,2)*H(1,3))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    elseif H(1,1)==3 && H(2,1)==2 && H(6,1)==3
        B(Nx*Ny,1)=(2*H(1,2))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    elseif H(1,1)==3 && H(2,1)==3 && H(6,1)==3
        B(Nx*Ny,1)=(2*H(1,2))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    end
    
    %Point 5, bas gauche devant
    if H(3,1)==1 || H(4,1)==1 || H(5,1)==1
        B(Nx*Ny*Nz-Nx*Ny+1,1)=0;
    elseif H(3,1)==2 && H(4,1)==2 && H(5,1)==2
        B(Nx*Ny*Nz-Nx*Ny+1,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(3,1)==2 && H(4,1)==3 && H(5,1)==2
        B(Nx*Ny*Nz-Nx*Ny+1,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(3,1)==3 && H(4,1)==2 && H(5,1)==2
        B(Nx*Ny*Nz-Nx*Ny+1,1)=(2*H(3,2))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(3,1)==3 && H(4,1)==3 && H(5,1)==2
        B(Nx*Ny*Nz-Nx*Ny+1,1)=(2*H(3,2))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(3,1)==2 && H(4,1)==2 && H(5,1)==3
        B(Nx*Ny*Nz-Nx*Ny+1,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    elseif H(3,1)==2 && H(4,1)==3 && H(5,1)==3
        B(Nx*Ny*Nz-Nx*Ny+1,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    elseif H(3,1)==3 && H(4,1)==2 && H(5,1)==3
        B(Nx*Ny*Nz-Nx*Ny+1,1)=(2*H(3,2))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    elseif H(3,1)==3 && H(4,1)==3 && H(5,1)==3
        B(Nx*Ny*Nz-Nx*Ny+1,1)=(2*H(3,2))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    end
    
        %Point 6, bas droite devant
    if H(3,1)==1 || H(2,1)==1 || H(5,1)==1
        B(Nx*Ny*Nz-Nx*Ny+Nx,1)=0;
    elseif H(3,1)==2 && H(2,1)==2 && H(5,1)==2
        B(Nx*Ny*Nz-Nx*Ny+Nx,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(3,1)==2 && H(2,1)==3 && H(5,1)==2
        B(Nx*Ny*Nz-Nx*Ny+Nx,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(3,1)==3 && H(2,1)==2 && H(5,1)==2
        B(Nx*Ny*Nz-Nx*Ny+Nx,1)=(2*H(3,2))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(3,1)==3 && H(2,1)==3 && H(5,1)==2
        B(Nx*Ny*Nz-Nx*Ny+Nx,1)=(2*H(3,2))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(5,2)*H(5,3))/(dltaz^2);
    elseif H(3,1)==2 && H(2,1)==2 && H(5,1)==3
        B(Nx*Ny*Nz-Nx*Ny+Nx,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    elseif H(3,1)==2 && H(2,1)==3 && H(5,1)==3
        B(Nx*Ny*Nz-Nx*Ny+Nx,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    elseif H(3,1)==3 && H(2,1)==2 && H(5,1)==3
        B(Nx*Ny*Nz-Nx*Ny+Nx,1)=(2*H(3,2))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    elseif H(3,1)==3 && H(2,1)==3 && H(5,1)==3
        B(Nx*Ny*Nz-Nx*Ny+Nx,1)=(2*H(3,2))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(5,2))/(dltaz^2);
    end
    
    %Point 7, bas gauche derrière
    if H(3,1)==1 || H(4,1)==1 || H(6,1)==1
        B(Nx*Ny*Nz-Nx+1,1)=0;
    elseif H(3,1)==2 && H(4,1)==2 && H(6,1)==2
        B(Nx*Ny*Nz-Nx+1,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(3,1)==2 && H(4,1)==3 && H(6,1)==2
        B(Nx*Ny*Nz-Nx+1,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(3,1)==3 && H(4,1)==2 && H(6,1)==2
        B(Nx*Ny*Nz-Nx+1,1)=(2*H(3,2))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(3,1)==3 && H(4,1)==3 && H(6,1)==2
        B(Nx*Ny*Nz-Nx+1,1)=(2*H(3,2))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(3,1)==2 && H(4,1)==2 && H(6,1)==3
        B(Nx*Ny*Nz-Nx+1,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    elseif H(3,1)==2 && H(4,1)==3 && H(6,1)==3
        B(Nx*Ny*Nz-Nx+1,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    elseif H(3,1)==3 && H(4,1)==2 && H(6,1)==3
        B(Nx*Ny*Nz-Nx+1,1)=(2*H(3,2))/(dltay^2)+(2*H(4,2)*H(4,3))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    elseif H(3,1)==3 && H(4,1)==3 && H(6,1)==3
        B(Nx*Ny*Nz-Nx+1,1)=(2*H(3,2))/(dltay^2)+(2*H(4,2))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    end
    
    %Point 8, bas droite derrière
    if H(3,1)==1 || H(2,1)==1 || H(6,1)==1
        B(Nx*Ny*Nz,1)=0;
    elseif H(3,1)==2 && H(2,1)==2 && H(6,1)==2
        B(Nx*Ny*Nz,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(3,1)==2 && H(2,1)==3 && H(6,1)==2
        B(Nx*Ny*Nz,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(3,1)==3 && H(2,1)==2 && H(6,1)==2
        B(Nx*Ny*Nz,1)=(2*H(3,2))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(3,1)==3 && H(2,1)==3 && H(6,1)==2
        B(Nx*Ny*Nz,1)=(2*H(3,2))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(6,2)*H(6,3))/(dltaz^2);
    elseif H(3,1)==2 && H(2,1)==2 && H(6,1)==3
        B(Nx*Ny*Nz,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    elseif H(3,1)==2 && H(2,1)==3 && H(6,1)==3
        B(Nx*Ny*Nz,1)=(2*H(3,2)*H(3,3))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    elseif H(3,1)==3 && H(2,1)==2 && H(6,1)==3
        B(Nx*Ny*Nz,1)=(2*H(3,2))/(dltay^2)+(2*H(2,2)*H(2,3))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    elseif H(3,1)==3 && H(2,1)==3 && H(6,1)==3
        B(Nx*Ny*Nz,1)=(2*H(3,2))/(dltay^2)+(2*H(2,2))/(dltax^2)+(2*H(6,2))/(dltaz^2);
    end
    
    %Ligne
end
end


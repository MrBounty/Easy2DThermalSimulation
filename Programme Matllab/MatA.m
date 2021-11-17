function [A] = MatA(V,D,H,dimension)
if dimension==1
Nx=V(1);lbx=V(7);
dltax=D(1);
A=zeros(Nx);
    %Point 1 à gauche
    if H(1,1)==1
        A(1,1)=1;
    elseif H(1,1)==2
        A(1,1)=-((2*lbx)/(dltax^2)+(2*H(1,2))/dltax^2);
        A(1,2)=(2*lbx)/(dltax^2);
    elseif H(1,1)==3
        A(1,1)=-(2*lbx)/(dltax^2);
        A(1,2)=(2*lbx)/(dltax^2);
    end
    
    %Point Nx à droite
    if H(2,1)==1
        A(Nx,Nx)=1;
    elseif H(2,1)==2
        A(Nx,Nx)=-((2*lbx)/(dltax^2)+(2*H(2,2))/dltax^2);
        A(Nx,Nx-1)=(2*lbx)/(dltax^2);
    elseif H(2,1)==3
        A(Nx,Nx)=-(2*lbx)/(dltax^2);
        A(Nx,Nx-1)=(2*lbx)/(dltax^2);
    end
    
    %Les autres
    for i=2:Nx-1
        A(i,i)=-(2*lbx)/(dltax^2);
        A(i,i+1)=(lbx)/(dltax^2);
        A(i,i-1)=(lbx)/(dltax^2);
    end
    
    
%--------------------------------------------------------------------------
elseif dimension==2
Nx=V(1);lbx=V(7);Ny=V(10);lby=V(12);
dltax=D(1);dltay=D(2);
A=zeros(Nx*Ny);

%Les 4 coins
%En haut à gauche, i=1 et j=1
    if H(1,1)==1 || H(4,1)==1
        A(1,1)=1;
    elseif H(1,1)==2 && H(4,1)==2
        A(1,1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(4,2)/(dltax^2))+(2*H(1,2)/(dltay^2)));
        A(1,2)=(2*lbx/(dltax^2));
        A(1,Nx+1)=(2*lby/(dltay^2));
    elseif H(1,1)==3 && H(4,1)==2
        A(1,1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(4,2)/(dltax^2)));
        A(1,2)=(2*lbx/(dltax^2));
        A(1,Nx+1)=(2*lby/(dltay^2));
    elseif H(1,1)==2 && H(4,1)==3
        A(1,1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(1,2)/(dltay^2)));
        A(1,2)=(2*lbx/(dltax^2));
        A(1,Nx+1)=(2*lby/(dltay^2));
    elseif H(1,1)==3 && H(4,1)==3
        A(1,1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2)));
        A(1,2)=(2*lbx/(dltax^2));
        A(1,Nx+1)=(2*lby/(dltay^2));
    end
    

%En haut à droite, i=Nx et j=1
    if H(1,1)==1 || H(2,1)==1
        A(Nx,Nx)=1;
    elseif H(1,1)==2 && H(2,1)==2
        A(Nx,Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(2,2)/(dltax^2))+(2*H(1,2)/(dltay^2)));
        A(Nx,Nx-1)=(2*lbx/(dltax^2));
        A(Nx,2*Nx)=(2*lby/(dltay^2));
    elseif H(1,1)==3 && H(2,1)==2
        A(Nx,Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(2,2)/(dltax^2)));
        A(Nx,Nx-1)=(2*lbx/(dltax^2));
        A(Nx,2*Nx)=(2*lby/(dltay^2));
    elseif H(1,1)==2 && H(2,1)==3
        A(Nx,Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(1,2)/(dltay^2)));
        A(Nx,Nx-1)=(2*lbx/(dltax^2));
        A(Nx,2*Nx)=(2*lby/(dltay^2));
    elseif H(1,1)==3 && H(2,1)==3
        A(Nx,Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2)));
        A(Nx,Nx-1)=(2*lbx/(dltax^2));
        A(Nx,2*Nx)=(2*lby/(dltay^2));
    end
    
    
%En bas à gauche, i=1 et j=Ny
    if H(4,1)==1 || H(3,1)==1
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=1;
    elseif H(4,1)==2 && H(3,1)==2
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(4,2)/(dltax^2))+(2*H(3,2)/(dltay^2)));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny-Nx+1,Nx*Ny-2*Nx+1)=(2*lby/(dltay^2));
    elseif H(4,1)==3 && H(3,1)==2
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(3,2)/(dltax^2)));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny-Nx+1,Nx*Ny-2*Nx+1)=(2*lby/(dltay^2));
    elseif H(4,1)==2 && H(3,1)==3
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(4,2)/(dltay^2)));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny-Nx+1,Nx*Ny-2*Nx+1)=(2*lby/(dltay^2));
    elseif H(4,1)==3 && H(3,1)==3
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2)));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny-Nx+1,Nx*Ny-2*Nx+1)=(2*lby/(dltay^2));
    end

    
%En bas à droite, i=Nx et j=Ny
    if H(2,1)==1 || H(3,1)==1
        A(Nx*Ny,Nx*Ny)=1;
    elseif H(2,1)==2 && H(3,1)==2
        A(Nx*Ny,Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(2,2)/(dltax^2))+(2*H(3,2)/(dltay^2)));
        A(Nx*Ny,Nx*Ny-1)=(2*lbx/(dltax^2));
        A(Nx*Ny,Nx*Ny-Nx)=(2*lby/(dltay^2));
    elseif H(2,1)==3 && H(3,1)==2
        A(Nx*Ny,Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(3,2)/(dltax^2)));
        A(Nx*Ny,Nx*Ny-1)=(2*lbx/(dltax^2));
        A(Nx*Ny,Nx*Ny-Nx)=(2*lby/(dltay^2));
    elseif H(2,1)==2 && H(3,1)==3
        A(Nx*Ny,Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(2,2)/(dltay^2)));
        A(Nx*Ny,Nx*Ny-1)=(2*lbx/(dltax^2));
        A(Nx*Ny,Nx*Ny-Nx)=(2*lby/(dltay^2));
    elseif H(2,1)==3 && H(3,1)==3
        A(Nx*Ny,Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2)));
        A(Nx*Ny,Nx*Ny-1)=(2*lbx/(dltax^2));
        A(Nx*Ny,Nx*Ny-Nx)=(2*lby/(dltay^2));
    end

    
    
%Les 4 cotés
%En haut, j=1
    for i=2:Nx-1
        if H(1,1)==1
            A(i,i)=1;
        elseif H(1,1)==2    
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(1,2)/(dltay^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
        elseif H(1,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
        end
    end
%En Bas, j=Ny
    for i=Nx*Ny-Nx+2:Nx*Ny-1
        if H(3,1)==1
            A(i,i)=1;
        elseif H(3,1)==2    
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(3,2)/(dltay^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
        elseif H(3,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
        end
    end
%A droite, i=Nx
    for i=Nx*2:Nx:Nx*Ny-Nx
        if H(2,1)==1
            A(i,i)=1;
        elseif H(2,1)==2    
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(2,2)/(dltay^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx)=(lby/(dltay^2));
        elseif H(2,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx)=(lby/(dltay^2));
        end
    end
%A gauche, i=1
    for i=Nx+1:Nx:Nx*Ny-Nx
        if H(4,1)==1
            A(i,i)=1;
        elseif H(4,1)==2    
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*H(4,2)/(dltay^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx)=(lby/(dltay^2));
        elseif H(4,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx)=(lby/(dltay^2));
        end
    end

%Pour le reste
    for i=1:Ny
        test(1,i)=Nx*i;
        test(2,i)=Nx*i+1;
    end
    for i=Nx+2:Nx*Ny-Nx-1
        if i~=test(1,:) & i~=test(2,:) %Si se n'est pas un bord
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2)));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
        end
    end
    
%--------------------------------------------------------------------------
elseif dimension==3
Nx=V(1);lbx=V(7);Ny=V(10);lby=V(12);Nz=V(13);lbz=V(15);
dltax=D(1);dltay=D(2);dltaz=D(3);
A=zeros(Nx*Ny*Nz);

%Les 12 lignes
%Ligne entre 1 et 2
    for i=2:Nx-1
        if H(1,1)==2 && H(5,1)==2   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2))+(2*H(5,2)/(dltaz^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(1,1)==3 && H(5,1)==2  
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(5,2)/(dltaz^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(1,1)==2 && H(5,1)==3   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(1,1)==3 && H(5,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        end
    end
    
%Ligne entre 3 et 4
    for i=Nx*Ny-Nx+2:Nx*Ny-1
        if H(1,1)==2 && H(6,1)==2   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2))+(2*H(6,2)/(dltaz^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(1,1)==3 && H(6,1)==2  
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(6,2)/(dltaz^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(1,1)==2 && H(6,1)==3   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(1,1)==3 && H(6,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        end
    end
    
%Ligne entre 5 et 6
    for i=Nx*Ny*Nz-Nx*Ny+2:Nx*Ny*Nz-Nx*Ny+Nx-1
        if H(3,1)==2 && H(5,1)==2   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2))+(2*H(5,2)/(dltaz^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(3,1)==3 && H(5,1)==2  
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(5,2)/(dltaz^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(3,1)==2 && H(5,1)==3   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(3,1)==3 && H(5,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        end
    end
    
%Ligne entre 7 et 8
    for i=Nx*Ny*Nz-Nx+2:Nx*Ny*Nz-1
        if H(3,1)==2 && H(6,1)==2   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2))+(2*H(6,2)/(dltaz^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(3,1)==3 && H(6,1)==2  
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(6,2)/(dltaz^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(3,1)==2 && H(6,1)==3   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(3,1)==3 && H(6,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        end
    end
    
%Ligne entre 1 et 3
    for i=Nx+1:Nx:Nx*Ny-2*Nx+1
        if H(1,1)==2 && H(4,1)==2   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2))+(2*H(4,2)/(dltax^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(1,1)==3 && H(4,1)==2  
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(1,1)==2 && H(4,1)==3   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(1,1)==3 && H(4,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        end
    end
    
%Ligne entre 2 et 4
    for i=2*Nx:Nx:Nx*Ny-Nx
        if H(1,1)==2 && H(2,1)==2   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2))+(2*H(2,2)/(dltax^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(1,1)==3 && H(2,1)==2  
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(1,1)==2 && H(2,1)==3   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(1,1)==3 && H(2,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
        end
    end
    
%Ligne entre 5 et 7
    for i=Nx*Ny*Nz-Nx*Ny+Nx+1:Nx:Nx*Ny*Nz-2*Nx+1
        if H(3,1)==2 && H(4,1)==2   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2))+(2*H(4,2)/(dltax^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(3,1)==3 && H(4,1)==2  
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(3,1)==2 && H(4,1)==3   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(3,1)==3 && H(4,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        end
    end
    
%Ligne entre 6 et 8
    for i=Nx*Ny*Nz-Nx*Ny+2*Nx:Nx:Nx*Ny*Nz-Nx
        if H(3,1)==2 && H(2,1)==2   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2))+(2*H(2,2)/(dltax^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(3,1)==3 && H(2,1)==2  
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(3,1)==2 && H(2,1)==3   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        elseif H(3,1)==3 && H(2,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
        end
    end
    
%Ligne entre 1 et 5
    for i=Nx*Ny+1:Nx*Ny:Nx*Ny*Nz-2*Nx*Ny+1
        if H(5,1)==2 && H(4,1)==2   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(5,2)/(dltaz^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        elseif H(5,1)==3 && H(4,1)==2  
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        elseif H(5,1)==2 && H(4,1)==3   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(5,2)/(dltaz^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        elseif H(5,1)==3 && H(4,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        end
    end
    
%Ligne entre 2 et 6
    for i=Nx*Ny+Nx:Nx*Ny:Nx*Ny*Nz-2*Nx*Ny+Nx
        if H(5,1)==2 && H(2,1)==2   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(5,2)/(dltaz^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        elseif H(5,1)==3 && H(2,1)==2  
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        elseif H(5,1)==2 && H(2,1)==3   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(5,2)/(dltaz^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        elseif H(5,1)==3 && H(2,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i+Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        end
    end
    
%Ligne entre 3 et 7
    for i=2*Nx*Ny-Nx+1:Nx*Ny:Nx*Ny*Nz-Nx*Ny+1-Nx
        if H(6,1)==2 && H(4,1)==2   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(6,2)/(dltaz^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        elseif H(6,1)==3 && H(4,1)==2  
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        elseif H(6,1)==2 && H(4,1)==3   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(6,2)/(dltaz^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        elseif H(6,1)==3 && H(4,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i+1)=(2*lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        end
    end
    
%Ligne entre 4 et 8
    for i=2*Nx*Ny:Nx*Ny:Nx*Ny*Nz-Nx*Ny
        if H(6,1)==2 && H(2,1)==2   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(6,2)/(dltaz^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        elseif H(6,1)==3 && H(2,1)==2  
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        elseif H(6,1)==2 && H(2,1)==3   
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(6,2)/(dltaz^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        elseif H(6,1)==3 && H(2,1)==3
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i-1)=(2*lbx/(dltax^2));
            A(i,i-Nx)=(2*lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        end
    end
    
%Les 8 coins
%Point 1
    if  H(1,1)==2 && H(4,1)==2 && H(5,1)==2
        A(1,1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(1,2)/(dltay^2))+(2*H(5,2)/(dltaz^2)));
        A(1,2)=(2*lbx/(dltax^2));
        A(1,Nx+1)=(2*lby/(dltay^2));
        A(1,Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(4,1)==2 && H(5,1)==2
        A(1,1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(5,2)/(dltaz^2)));
        A(1,2)=(2*lbx/(dltax^2));
        A(1,Nx+1)=(2*lby/(dltay^2));
        A(1,Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==2 && H(4,1)==3 && H(5,1)==2
        A(1,1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2))+(2*H(5,2)/(dltaz^2)));
        A(1,2)=(2*lbx/(dltax^2));
        A(1,Nx+1)=(2*lby/(dltay^2));
        A(1,Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(4,1)==3 && H(5,1)==2
        A(1,1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(5,2)/(dltaz^2)));
        A(1,2)=(2*lbx/(dltax^2));
        A(1,Nx+1)=(2*lby/(dltay^2));
        A(1,Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==2 && H(4,1)==2 && H(5,1)==3
        A(1,1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(1,2)/(dltay^2)));
        A(1,2)=(2*lbx/(dltax^2));
        A(1,Nx+1)=(2*lby/(dltay^2));
        A(1,Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(4,1)==2 && H(5,1)==3
        A(1,1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2)));
        A(1,2)=(2*lbx/(dltax^2));
        A(1,Nx+1)=(2*lby/(dltay^2));
        A(1,Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==2 && H(4,1)==3 && H(5,1)==3
        A(1,1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2)));
        A(1,2)=(2*lbx/(dltax^2));
        A(1,Nx+1)=(2*lby/(dltay^2));
        A(1,Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(4,1)==3 && H(5,1)==3
        A(1,1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
        A(1,2)=(2*lbx/(dltax^2));
        A(1,Nx+1)=(2*lby/(dltay^2));
        A(1,Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==1 || H(4,1)==1 || H(5,1)==1
        A(1,1)=1;
    end
    
%Point 2
    if  H(1,1)==2 && H(2,1)==2 && H(5,1)==2
        A(Nx,Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(1,2)/(dltay^2))+(2*H(5,2)/(dltaz^2)));
        A(Nx,Nx-1)=(2*lbx/(dltax^2));
        A(Nx,2*Nx)=(2*lby/(dltay^2));
        A(Nx,Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(2,1)==2 && H(5,1)==2
        A(Nx,Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(5,2)/(dltaz^2)));
        A(Nx,Nx-1)=(2*lbx/(dltax^2));
        A(Nx,2*Nx)=(2*lby/(dltay^2));
        A(Nx,Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(1,1)==2 && H(2,1)==3 && H(5,1)==2
        A(Nx,Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2))+(2*H(5,2)/(dltaz^2)));
        A(Nx,Nx-1)=(2*lbx/(dltax^2));
        A(Nx,2*Nx)=(2*lby/(dltay^2));
        A(Nx,Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(2,1)==3 && H(5,1)==2
        A(Nx,Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(5,2)/(dltaz^2)));
        A(Nx,Nx-1)=(2*lbx/(dltax^2));
        A(Nx,2*Nx)=(2*lby/(dltay^2));
        A(Nx,Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(1,1)==2 && H(2,1)==2 && H(5,1)==3
        A(Nx,Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(1,2)/(dltay^2)));
        A(Nx,Nx-1)=(2*lbx/(dltax^2));
        A(Nx,2*Nx)=(2*lby/(dltay^2));
        A(Nx,Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(2,1)==2 && H(5,1)==3
        A(Nx,Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2)));
        A(Nx,Nx-1)=(2*lbx/(dltax^2));
        A(Nx,2*Nx)=(2*lby/(dltay^2));
        A(Nx,Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(1,1)==2 && H(2,1)==3 && H(5,1)==3
        A(Nx,Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2)));
        A(Nx,Nx-1)=(2*lbx/(dltax^2));
        A(Nx,2*Nx)=(2*lby/(dltay^2));
        A(Nx,Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(2,1)==3 && H(5,1)==3
        A(Nx,Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
        A(Nx,Nx-1)=(2*lbx/(dltax^2));
        A(Nx,2*Nx)=(2*lby/(dltay^2));
        A(Nx,Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(1,1)==1 || H(2,1)==1 || H(5,1)==1
        A(Nx,Nx)=1;
    end
    
%Point 3
    if  H(1,1)==2 && H(4,1)==2 && H(6,1)==2
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(1,2)/(dltay^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny-Nx+1,2*Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(4,1)==2 && H(6,1)==2
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny-Nx+1,2*Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==2 && H(4,1)==3 && H(6,1)==2
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny-Nx+1,2*Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(4,1)==3 && H(6,1)==2
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny-Nx+1,2*Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==2 && H(4,1)==2 && H(6,1)==3
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(1,2)/(dltay^2)));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny-Nx+1,2*Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(4,1)==2 && H(6,1)==3
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2)));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny-Nx+1,2*Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==2 && H(4,1)==3 && H(6,1)==3
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2)));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny-Nx+1,2*Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(4,1)==3 && H(6,1)==3
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny-Nx+1,2*Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(1,1)==1 || H(4,1)==1 || H(6,1)==1
        A(Nx*Ny-Nx+1,Nx*Ny-Nx+1)=1;
    end
    
%Point 4
    if  H(1,1)==2 && H(2,1)==2 && H(6,1)==2
        A(Nx*Ny,Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(1,2)/(dltay^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny,Nx*Ny-1)=(2*lbx/(dltax^2));
        A(Nx*Ny,Nx*Ny-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny,2*Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(2,1)==2 && H(6,1)==2
        A(Nx*Ny,Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny,Nx*Ny-1)=(2*lbx/(dltax^2));
        A(Nx*Ny,Nx*Ny-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny,2*Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(1,1)==2 && H(2,1)==3 && H(6,1)==2
        A(Nx*Ny,Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny,Nx*Ny-1)=(2*lbx/(dltax^2));
        A(Nx*Ny,Nx*Ny-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny,2*Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(2,1)==3 && H(6,1)==2
        A(Nx*Ny,Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny,Nx*Ny-1)=(2*lbx/(dltax^2));
        A(Nx*Ny,Nx*Ny-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny,2*Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(1,1)==2 && H(2,1)==2 && H(6,1)==3
        A(Nx*Ny,Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(1,2)/(dltay^2)));
        A(Nx*Ny,Nx*Ny-1)=(2*lbx/(dltax^2));
        A(Nx*Ny,Nx*Ny-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny,2*Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(2,1)==2 && H(6,1)==3
        A(Nx*Ny,Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2)));
        A(Nx*Ny,Nx*Ny-1)=(2*lbx/(dltax^2));
        A(Nx*Ny,Nx*Ny-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny,2*Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(1,1)==2 && H(2,1)==3 && H(6,1)==3
        A(Nx*Ny,Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2)));
        A(Nx*Ny,Nx*Ny-1)=(2*lbx/(dltax^2));
        A(Nx*Ny,Nx*Ny-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny,2*Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(1,1)==3 && H(2,1)==3 && H(6,1)==3
        A(Nx*Ny,Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
        A(Nx*Ny,Nx*Ny-1)=(2*lbx/(dltax^2));
        A(Nx*Ny,Nx*Ny-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny,2*Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(1,1)==1 || H(2,1)==1 || H(6,1)==1
        A(Nx*Ny,Nx*Ny)=1;
    end
    
%Point 5
    if  H(3,1)==2 && H(4,1)==2 && H(5,1)==2
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(3,2)/(dltay^2))+(2*H(5,2)/(dltaz^2)));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1+Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-2*Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(4,1)==2 && H(5,1)==2
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(5,2)/(dltaz^2)));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1+Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-2*Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==2 && H(4,1)==3 && H(5,1)==2
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2))+(2*H(5,2)/(dltaz^2)));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1+Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-2*Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(4,1)==3 && H(5,1)==2
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(5,2)/(dltaz^2)));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1+Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-2*Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==2 && H(4,1)==2 && H(5,1)==3
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(3,2)/(dltay^2)));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1+Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-2*Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(4,1)==2 && H(5,1)==3
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2)));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1+Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-2*Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==2 && H(4,1)==3 && H(5,1)==3
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2)));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1+Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-2*Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(4,1)==3 && H(5,1)==3
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1+Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-2*Nx*Ny+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==1 || H(4,1)==1 || H(5,1)==1
        A(Nx*Ny*Nz-Nx*Ny+1,Nx*Ny*Nz-Nx*Ny+1)=1;
    end
    
%Point 6
    if  H(3,1)==2 && H(2,1)==2 && H(5,1)==2
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(3,2)/(dltay^2))+(2*H(5,2)/(dltaz^2)));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+2*Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-2*Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(2,1)==2 && H(5,1)==2
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(5,2)/(dltaz^2)));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+2*Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-2*Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(3,1)==2 && H(2,1)==3 && H(5,1)==2
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2))+(2*H(5,2)/(dltaz^2)));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+2*Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-2*Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(2,1)==3 && H(5,1)==2
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(5,2)/(dltaz^2)));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+2*Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-2*Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(3,1)==2 && H(2,1)==2 && H(5,1)==3
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(3,2)/(dltay^2)));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+2*Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-2*Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(2,1)==2 && H(5,1)==3
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2)));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+2*Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-2*Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(3,1)==2 && H(2,1)==3 && H(5,1)==3
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2)));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+2*Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-2*Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(2,1)==3 && H(5,1)==3
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+2*Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-2*Nx*Ny+Nx)=(2*lbz/(dltaz^2));
    elseif H(3,1)==1 || H(2,1)==1 || H(5,1)==1
        A(Nx*Ny*Nz-Nx*Ny+Nx,Nx*Ny*Nz-Nx*Ny+Nx)=1;
    end
    
%Point 7
    if  H(3,1)==2 && H(4,1)==2 && H(6,1)==2
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(3,2)/(dltay^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-2*Nx+1)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(4,1)==2 && H(6,1)==2
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-2*Nx+1)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==2 && H(4,1)==3 && H(6,1)==2
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-2*Nx+1)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(4,1)==3 && H(6,1)==2
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-2*Nx+1)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==2 && H(4,1)==2 && H(6,1)==3
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2))+(2*H(3,2)/(dltay^2)));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-2*Nx+1)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(4,1)==2 && H(6,1)==3
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2)));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-2*Nx+1)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==2 && H(4,1)==3 && H(6,1)==3
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2)));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-2*Nx+1)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(4,1)==3 && H(6,1)==3
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+1)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+2)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-2*Nx+1)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx*Ny-Nx+1)=(2*lbz/(dltaz^2));
    elseif H(3,1)==1 || H(4,1)==1 || H(6,1)==1
        A(Nx*Ny*Nz-Nx+1,Nx*Ny*Nz-Nx+1)=1;
    end
    
%Point 8
    if  H(3,1)==2 && H(2,1)==2 && H(6,1)==2
        A(Nx*Ny*Nz,Nx*Ny*Nz)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(3,2)/(dltay^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny*Nz,Nx*Ny*Nz-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(2,1)==2 && H(6,1)==2
        A(Nx*Ny*Nz,Nx*Ny*Nz)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny*Nz,Nx*Ny*Nz-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(3,1)==2 && H(2,1)==3 && H(6,1)==2
        A(Nx*Ny*Nz,Nx*Ny*Nz)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny*Nz,Nx*Ny*Nz-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(2,1)==3 && H(6,1)==2
        A(Nx*Ny*Nz,Nx*Ny*Nz)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(6,2)/(dltaz^2)));
        A(Nx*Ny*Nz,Nx*Ny*Nz-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(3,1)==2 && H(2,1)==2 && H(6,1)==3
        A(Nx*Ny*Nz,Nx*Ny*Nz)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2))+(2*H(3,2)/(dltay^2)));
        A(Nx*Ny*Nz,Nx*Ny*Nz-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(2,1)==2 && H(6,1)==3
        A(Nx*Ny*Nz,Nx*Ny*Nz)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2)));
        A(Nx*Ny*Nz,Nx*Ny*Nz-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(3,1)==2 && H(2,1)==3 && H(6,1)==3
        A(Nx*Ny*Nz,Nx*Ny*Nz)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2)));
        A(Nx*Ny*Nz,Nx*Ny*Nz-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(3,1)==3 && H(2,1)==3 && H(6,1)==3
        A(Nx*Ny*Nz,Nx*Ny*Nz)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
        A(Nx*Ny*Nz,Nx*Ny*Nz-1)=(2*lbx/(dltax^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx)=(2*lby/(dltay^2));
        A(Nx*Ny*Nz,Nx*Ny*Nz-Nx*Ny)=(2*lbz/(dltaz^2));
    elseif H(3,1)==1 || H(2,1)==1 || H(6,1)==1
        A(Nx*Ny*Nz,Nx*Ny*Nz)=1;
    end
    
    
%Les 6 faces
% %Creation de la matrice test
% test=zeros(Nx*Ny*Nz);
%     for i=1:Nx*Ny*Nz
%         if A(i,i)~=0
%             test(i)=1;
%         end
%     end
        
%Face 1, dessus
    for i=1:Nx*Ny
        if A(i,i)==0 %Si le point est pas déjà fais
            if H(1,1)==1
                A(i,i)=1;
            elseif H(1,1)==2
                A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(1,2)/(dltay^2)));
                A(i,i+1)=(lbx/(dltax^2));
                A(i,i-1)=(lbx/(dltax^2));
                A(i,i+Nx)=(lby/(dltay^2));
                A(i,i-Nx)=(lby/(dltay^2));
                A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
            elseif H(1,1)==3
                A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
                A(i,i+1)=(lbx/(dltax^2));
                A(i,i-1)=(lbx/(dltax^2));
                A(i,i+Nx)=(lby/(dltay^2));
                A(i,i-Nx)=(lby/(dltay^2));
                A(i,i+Nx*Ny)=(2*lbz/(dltaz^2));
            end
        end
    end
    
%Face 3, dessous
    for i=Nx*Ny*Nz-Nx*Ny+1:Nx*Ny*Nz
        if A(i,i)==0 %Si le point est pas déjà fais
            if H(3,1)==1
                A(i,i)=1;
            elseif H(3,1)==2
                A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(3,2)/(dltay^2)));
                A(i,i+1)=(lbx/(dltax^2));
                A(i,i-1)=(lbx/(dltax^2));
                A(i,i+Nx)=(lby/(dltay^2));
                A(i,i-Nx)=(lby/(dltay^2));
                A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
            elseif H(3,1)==3
                A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
                A(i,i+1)=(lbx/(dltax^2));
                A(i,i-1)=(lbx/(dltax^2));
                A(i,i+Nx)=(lby/(dltay^2));
                A(i,i-Nx)=(lby/(dltay^2));
                A(i,i-Nx*Ny)=(2*lbz/(dltaz^2));
            end
        end
    end
    
%Face 2, droite
    for i=Nx:Nx:Nx*Ny*Nz
        if A(i,i)==0 %Si le point est pas déjà fais
            if H(2,1)==1
                A(i,i)=1;
            elseif H(2,1)==2
                A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(2,2)/(dltax^2)));
                A(i,i-1)=(2*lbx/(dltax^2));
                A(i,i+Nx)=(lby/(dltay^2));
                A(i,i-Nx)=(lby/(dltay^2));
                A(i,i-Nx*Ny)=(lbz/(dltaz^2));
                A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            elseif H(2,1)==3
                A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
                A(i,i-1)=(2*lbx/(dltax^2));
                A(i,i+Nx)=(lby/(dltay^2));
                A(i,i-Nx)=(lby/(dltay^2));
                A(i,i-Nx*Ny)=(lbz/(dltaz^2));
                A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            end
        end
    end
    
%Face 4, gauche
    for i=Nx*Ny+Nx+1:Nx:Nx*Ny*Nz-Nx+1
        if A(i,i)==0 %Si le point est pas déjà fais
            if H(4,1)==1
                A(i,i)=1;
            elseif H(4,1)==2
                A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(4,2)/(dltax^2)));
                A(i,i+1)=(2*lbx/(dltax^2));
                A(i,i+Nx)=(lby/(dltay^2));
                A(i,i-Nx)=(lby/(dltay^2));
                A(i,i-Nx*Ny)=(lbz/(dltaz^2));
                A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            elseif H(4,1)==3
                A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
                A(i,i+1)=(2*lbx/(dltax^2));
                A(i,i+Nx)=(lby/(dltay^2));
                A(i,i-Nx)=(lby/(dltay^2));
                A(i,i-Nx*Ny)=(lbz/(dltaz^2));
                A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            end
        end
    end
    
%Face 5, devant
    for j=1:Nz
        for i=1:Nx
             if A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny)==0%test(i+(j-1)*Nx*Ny)==0 %Si le point est pas déjà fais
                if H(5,1)==1
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny)=1;
                elseif H(5,1)==2
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(5,2)/(dltaz^2)));
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny+1)=(lbx/(dltax^2));
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny-1)=(lbx/(dltax^2));
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny+Nx)=(2*lby/(dltay^2));
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny-Nx*Ny)=(lbz/(dltaz^2));
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny+Nx*Ny)=(lbz/(dltaz^2));
                elseif H(5,1)==3
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny+1)=(lbx/(dltax^2));
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny-1)=(lbx/(dltax^2));
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny+Nx)=(2*lby/(dltay^2));
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny-Nx*Ny)=(lbz/(dltaz^2));
                    A(i+(j-1)*Nx*Ny,i+(j-1)*Nx*Ny+Nx*Ny)=(lbz/(dltaz^2));
                end
            end
        end
    end
    
%Face 6, derriere
    for j=1:Nz
        for i=1:Nx
            if A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx)==0 %Si le point est pas déjà fais
                if H(6,1)==1
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx)=1;
                elseif H(6,1)==2
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2))+(2*H(6,2)/(dltaz^2)));
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx+1)=(lbx/(dltax^2));
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx-1)=(lbx/(dltax^2));
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx-Nx)=(2*lby/(dltay^2));
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx-Nx*Ny)=(lbz/(dltaz^2));
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx+Nx*Ny)=(lbz/(dltaz^2));
                elseif H(6,1)==3
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx+1)=(lbx/(dltax^2));
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx-1)=(lbx/(dltax^2));
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx-Nx)=(2*lby/(dltay^2));
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx-Nx*Ny)=(lbz/(dltaz^2));
                    A(i+j*Nx*Ny-Nx,i+j*Nx*Ny-Nx+Nx*Ny)=(lbz/(dltaz^2));
                end
            end
        end
    end
    
%On refais une matrice test
% test2=zeros(Nx*Ny*Nz);
%     for i=1:Nx*Ny*Nz
%         if A(i,i)~=0
%             test2(i)=1;
%         end
%     end

%Pour tout les autres point (intérieur)
    for i=1:Nx*Ny*Nz
        if A(i,i)==0
            A(i,i)=-((2*lbx/(dltax^2))+(2*lby/(dltay^2))+(2*lbz/(dltaz^2)));
            A(i,i+1)=(lbx/(dltax^2));
            A(i,i-1)=(lbx/(dltax^2));
            A(i,i+Nx)=(lby/(dltay^2));
            A(i,i-Nx)=(lby/(dltay^2));
            A(i,i+Nx*Ny)=(lbz/(dltaz^2));
            A(i,i-Nx*Ny)=(lbz/(dltaz^2));
        end
    end

    
end
end


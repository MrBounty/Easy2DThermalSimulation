function [Tk] = VecTini(V,dimension,H)
if dimension==1
    Nx=V(1);Ti=V(9);
    Tk=ones(Nx,1);
    Tk=Ti*Tk;
    if H(1,1)==1
        Tk(1,1)=H(1,2);
    end
    if H(2,1)==1
        Tk(Nx,1)=H(2,2);
    end
    
    
elseif dimension==2
    Nx=V(1);Ti=V(9);Ny=V(10);
    Tk=ones(Nx*Ny,1);
    Tk=Ti*Tk;
    if H(1,1)==1
        for i=1:Nx
        Tk(i,1)=H(1,2);
        end
    end
    if H(2,1)==1
        for i=Nx:Nx:Nx*Ny
        Tk(i,1)=H(2,2);
        end
    end
    if H(3,1)==1
        for i=Nx*Ny-Nx+1:Nx*Ny
        Tk(i,1)=H(3,2);
        end
    end
    if H(4,1)==1
        for i=1:Nx:Nx*Ny
        Tk(i,1)=H(4,2);
        end
    end
    if H(1,1)==1 && H(2,1)==1
        Tk(Nx,1)=(H(1,2)+H(2,2))/2;
    end
    if H(2,1)==1 && H(3,1)==1
        Tk(Nx*Ny,1)=(H(2,2)+H(3,2))/2;
    end
    if H(3,1)==1 && H(4,1)==1
        Tk(Nx*Ny-Nx+1,1)=(H(4,2)+H(3,2))/2;
    end
    if H(4,1)==1 && H(1,1)==1
        Tk(1,1)=(H(1,2)+H(4,2))/2;
    end
    
    
    
elseif dimension==3
    Nx=V(1);Ti=V(9);Ny=V(10);Nz=V(13);
    Tk=ones(Nx*Ny*Nz,1);
    Tk=Ti*Tk;
    
%Surfaces
    %Surface 1
    if H(1,1)==1
        for i=1:Nx*Ny
            Tk(i,1)=H(1,2);
        end
    end
    %Surface 2
    if H(2,1)==1
        for i=Nx:Nx:Nx*Ny*Nz
            Tk(i,1)=H(2,2);
        end
    end
    %Surface 3
    if H(3,1)==1
        for i=Nx*Ny*Nz-Nx*Ny+1:Nx*Ny*Nz
            Tk(i,1)=H(3,2);
        end
    end
    %Surface 4
    if H(4,1)==1
        for i=1:Nx:Nx*Ny*Nz
            Tk(i,1)=H(4,2);
        end
    end
    %Surface 5
    if H(5,1)==1
        for i=1:Nx*Ny:Nx*Ny*Nz
            for j=0:Nx-1
                Tk(i+j,1)=H(5,2);
            end
        end
    end
    %Surface 6
    if H(6,1)==1
        for i=Nx*Ny-Nx+1:Nx*Ny:Nx*Ny*Nz
            for j=0:Nx
                Tk(i+j,1)=H(6,2);
            end
        end
    end
    
%Lignes
    %Ligne entre point 1 et 2
    if H(5,1)==1 && H(1,1)==1
        for i=1:Nx
            Tk(i,1)=(H(1,2)+H(5,2))/2;
        end
    end
    %Ligne entre point 3 et 4
    if H(6,1)==1 && H(1,1)==1
        for i=Nx*Ny-Nx+1:Nx*Ny
            Tk(i,1)=(H(1,2)+H(6,2))/2;
        end
    end
    %Ligne entre point 1 et 3
    if H(4,1)==1 && H(1,1)==1
        for i=1:Nx:Nx*Ny
            Tk(i,1)=(H(1,2)+H(4,2))/2;
        end
    end
    %Ligne entre point 2 et 4
    if H(2,1)==1 && H(1,1)==1
        for i=Nx:Nx:Nx*Ny
            Tk(i,1)=(H(1,2)+H(2,2))/2;
        end
    end
    %Ligne entre point 5 et 6
    if H(5,1)==1 && H(3,1)==1
        for i=Nx*Ny*Nz-Nx*Ny+1:Nx*Ny*Nz-Nx*Ny+Nx
            Tk(i,1)=(H(5,2)+H(3,2))/2;
        end
    end
    %Ligne entre point 7 et 8
    if H(6,1)==1 && H(3,1)==1
        for i=Nx*Ny*Nz-Nx+1:Nx*Ny*Nz
            Tk(i,1)=(H(6,2)+H(3,2))/2;
        end
    end
    %Ligne entre point 5 et 7
    if H(4,1)==1 && H(3,1)==1
        for i=Nx*Ny*Nz-Nx*Ny+1:Nx:Nx*Ny*Nz
            Tk(i,1)=(H(4,2)+H(3,2))/2;
        end
    end
    %Ligne entre point 5 et 7
    if H(2,1)==1 && H(3,1)==1
        for i=Nx*Ny*Nz-Nx*Ny+Nx:Nx:Nx*Ny*Nz
            Tk(i,1)=(H(2,2)+H(3,2))/2;
        end
    end
    %Ligne entre point 1 et 5
    if H(4,1)==1 && H(5,1)==1
        for i=1:Nx*Ny:Nx*Ny*Nz
            Tk(i,1)=(H(4,2)+H(5,2))/2;
        end
    end
    %Ligne entre point 2 et 6
    if H(2,1)==1 && H(5,1)==1
        for i=Nx:Nx*Ny:Nx*Ny*Nz
            Tk(i,1)=(H(2,2)+H(5,2))/2;
        end
    end
    %Ligne entre point 3 et 7
    if H(4,1)==1 && H(6,1)==1
        for i=Nx*Ny-Nx+1:Nx*Ny:Nx*Ny*Nz
            Tk(i,1)=(H(4,2)+H(6,2))/2;
        end
    end
    %Ligne entre point 4 et 8
    if H(2,1)==1 && H(6,1)==1
        for i=Nx*Ny:Nx*Ny:Nx*Ny*Nz
            Tk(i,1)=(H(2,2)+H(6,2))/2;
        end
    end
    
%Points
    %point 1
    if H(4,1)==1 && H(1,1)==1 && H(5,1)==1
        Tk(1,1)=(H(1,2)+H(4,2)+H(5,2))/3;
    end
    %point 2
    if H(2,1)==1 && H(1,1)==1 && H(5,1)==1
        Tk(Nx,1)=(H(1,2)+H(2,2)+H(5,2))/3;
    end
    %point 3
    if H(4,1)==1 && H(1,1)==1 && H(6,1)==1
        Tk(Nx+Ny-Nx+1,1)=(H(1,2)+H(4,2)+H(6,2))/3;
    end
    %point 4
    if H(2,1)==1 && H(1,1)==1 && H(6,1)==1
        Tk(Nx*Ny,1)=(H(1,2)+H(2,2)+H(6,2))/3;
    end
    %point 5
    if H(4,1)==1 && H(3,1)==1 && H(5,1)==1
        Tk(Nx*Ny*Nz-Nx*Ny+1,1)=(H(3,2)+H(4,2)+H(5,2))/3;
    end
    %point 6
    if H(2,1)==1 && H(3,1)==1 && H(5,1)==1
        Tk(Nx*Ny*Nz-Nx*Ny+Nx,1)=(H(3,2)+H(2,2)+H(5,2))/3;
    end
    %point 7
    if H(4,1)==1 && H(3,1)==1 && H(6,1)==1
        Tk(Nx*Ny*Nz-Nx+1,1)=(H(3,2)+H(4,2)+H(6,2))/3;
    end
    %point 7
    if H(2,1)==1 && H(3,1)==1 && H(6,1)==1
        Tk(Nx*Ny*Nz,1)=(H(3,2)+H(2,2)+H(6,2))/3;
    end
end
end


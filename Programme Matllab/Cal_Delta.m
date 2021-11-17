function [D] = Cal_Delta(V,dimension)
if dimension==1
    Nx=V(1);Lx=V(5);
    dltax=Lx/(Nx-1);
    D(1)=dltax;
    
elseif dimension==2
    Nx=V(1);Lx=V(5);Ny=V(10);Ly=V(11);
    dltax=Lx/(Nx-1);
    dltay=Ly/(Ny-1);
    D(1)=dltax;
    D(2)=dltay;
    
elseif dimension==3
    Nx=V(1);Lx=V(5);Ny=V(10);Ly=V(11);Nz=V(13);Lz=V(14);
    dltax=Lx/(Nx-1);
    dltay=Ly/(Ny-1);
    dltaz=Lz/(Nz-1);
    D(1)=dltax;
    D(2)=dltay;
    D(3)=dltaz;
end
end


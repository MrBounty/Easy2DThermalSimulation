function [C] = MatC(V,dimension)
if dimension==1
    Nx=V(1);dltat=V(4);rcp=V(6);
    C=(rcp/dltat)*eye(Nx);

elseif dimension==2
    Nx=V(1);dltat=V(4);rcp=V(6);Ny=V(10);
    C=(rcp/dltat)*eye(Nx*Ny);

elseif dimension==3
    Nx=V(1);dltat=V(4);rcp=V(6);Ny=V(10);Nz=V(13);
    C=(rcp/dltat)*eye(Nx*Ny*Nz);

end
end


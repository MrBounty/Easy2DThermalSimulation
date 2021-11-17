function [dltatmax] = Stabilite(V,D,dimension)
if dimension==1
    rcp=V(6);lbx=V(7);
    dltax=D(1);
    ax=lbx/rcp;
    dltatmax=1/((4*ax/(dltax^2)));
    
elseif dimension==2
    rcp=V(6);lbx=V(7);lby=V(12);
    dltax=D(1);dltay=D(2);
    ax=lbx/rcp;
    ay=lby/rcp;
    dltatmax=1/((2*ax/(dltax^2))+(2*ay/(dltay^2)));
    
elseif dimension==3
    rcp=V(6);lbx=V(7);lby=V(12);lbz=V(15);
    dltax=D(1);dltay=D(2);dltaz=D(3);
    ax=lbx/rcp;
    ay=lby/rcp;
    az=lbz/rcp;
    dltatmax=1/((2*ax/(dltax^2))+(2*ay/(dltay^2))+(2*az/(dltaz^2)));
end
end


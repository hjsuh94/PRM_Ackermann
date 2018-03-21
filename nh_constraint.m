function e = nh_constraint(xi, yi, thetai, xf, yf, thetaf, tol, a)
%NH_CONSTRAINT Summary of this function goes here
%   Detailed explanation goes here
    posvec = rot2d(-thetai)*([xf-xi;yf-yi]);
    thetap = thetaf - thetai;
    xp = posvec(1);
    yp = posvec(2);
    
    R = radius(xp, yp, a);
    thetac = orientation(xp, yp, a);
    
    if R >= 10;
        if abs(thetac - thetap) < tol
            e = 1;
        else
            e = 0;
        end
    else
        e = 0;
    end
end


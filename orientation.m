function theta = orientation(x,y,a)
%ORIENTATION Summary of this function goes here
%   Detailed explanation goes here

    R = radius(x, y, a);
    p = (x + a) / sqrt(R^2 - (x + a)^2);
    if (y > 0) 
        theta = atan(p);
    elseif(y < 0)
        theta = -atan(p);
    else
        theta = 0;
    end
end


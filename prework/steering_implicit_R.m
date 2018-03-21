function e = steering_implicit_R(R, x, y, a2)
%STEERING_IMPLICIT_R Summary of this function goes here
%   Detailed explanation goes here
    if (y > 0)
        e = (x + a2)^2 + (y - sqrt(R^2 - a2^2))^2 - R^2;
    elseif (y < 0)
        e = (x + a2)^2 + (y + sqrt(R^2 + a2^2))^2 - R^2;
    else
        e = 1000;
    end
end


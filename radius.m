function R = radius(x, y, a)
%RADIUS Summary of this function goes here
%   Detailed explanation goes here
    R = sqrt(((x^2 + 2*a*x + y^2)/(2*y))^2 + a^2);
end


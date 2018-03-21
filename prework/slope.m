function theta = slope(x,R,a2)
%SLOPE Summary of this function goes here
%   Detailed explanation goes here
    theta = atan((x+a2)/sqrt(R^2-(x+a2)^2));
end


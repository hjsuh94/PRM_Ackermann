function y = steering_curve_R(R, x, a2, sign)
%STEERING_CURVE Summary of this function goes here
%   Detailed explanation goes here
    if (sign > 0) 
        y =-sqrt(R^2-(x+a2)^2)+sqrt(R^2-a2^2);
    elseif (sign < 0)
        y = sqrt(R^2-(x+a2)^2)-sqrt(R^2-a2^2);
    else
        y = 0;
    end
end


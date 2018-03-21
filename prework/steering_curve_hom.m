function e = steering_curve_hom(delta, x, y, a2, l)
%STEERING_CURVE Summary of this function goes here
%   Detailed explanation goes here
    R = sqrt(a2^2 + l^2*(cot(delta))^2);
    if (delta > 0) 
        e = -y -sqrt(R^2-(x+a2)^2)+sqrt(R^2-a2^2);
    elseif (delta < 0)
        e = -y + sqrt(R^2-(x+a2)^2)-sqrt(R^2-a2^2);
    else
        e = NaN;
    end
end


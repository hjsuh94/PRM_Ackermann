function y = steering_curve_symbolic(delta, x, a2, l)
%STEERING_CURVE Summary of this function goes here
%   Detailed explanation goes here
    R = sqrt(a2^2 + l^2*cot(delta)^2);
    y = -sqrt(R^2-(x+a2)^2)+sqrt(R^2-a2^2);
end
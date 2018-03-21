N = 11;
max_delta = deg2rad(26.85); 

delta = linspace(-max_delta,max_delta,N);
x = linspace(-5,4,1000);


l = convlength(106.3,'in','m');
a2 = l/2;
w = convlength(60.9,'in','m')/2;



figure
hold on
axis equal
fill([a2 a2 -a2 -a2], [w -w -w w], [0.6 0.9 0.6]);
for i=1:N
    f_plot = @(x) steering_curve(delta(i),x, a2, l);
    y = arrayfun(f_plot, x);
    
    plot(x, y, 'k-');
    if((delta(i) == -max_delta) || (delta(i) == max_delta))
        plot(x, y, 'r');
    end
end

R = sqrt(a2^2 + l^2*(cotd(26.85))^2);
res = sqrt(R^2+(R-a2)^2);
l = convlength(106.3,'in','m');
a2 = l/2;
w = convlength(60.9,'in','m')/2;
x = 3;
y = 0.5;

f = @(delta) steering_curve_hom(delta, x, y, a2, l);

[out, fval] = fsolve(f, 5);
delta_eval = real(double(out));

f_plot = @(x) steering_curve(delta_eval, x, a2, 1);


xt = linspace(-5, 5, 1000);
figure
hold on
axis equal
grid on
fill([a2 a2 -a2 -a2], [w -w -w w], [0.6 0.9 0.6]);
plot(x,y,'bo', 'MarkerSize',20);
yt = arrayfun(f_plot, xt);
plot(xt, yt, 'r');

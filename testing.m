clear all

l = convlength(106.3,'in','m');
a2 = l/2;
w = convlength(60.9,'in','m')/2;
x = 12;
y = -2;

R_eval = radius(x,y,a2);
f_plot = @(x) steering_curve_R(R_eval, x, a2, -1);


xt = linspace(-5, 5, 1000);
figure
hold on
axis equal
grid on
fill([a2 a2 -a2 -a2], [w -w -w w], [0.6 0.9 0.6]);
plot(x,y,'bo', 'MarkerSize',20);
%plot(-a2,sqrt(R_eval^2-a2^2),'ro','MarkerSize',20); 
yt = arrayfun(f_plot, xt);
plot(xt, yt, 'r');

disp(rad2deg(orientation(x,y,a2)));
disp(nh_constraint(0,0,0,x,y,deg2rad(-20.2594),0.5,a2));


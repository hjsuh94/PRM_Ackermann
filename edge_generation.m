clear all
objects = {};

% Vehicle Geometry
l = convlength(106.3,'in','m');
a = l/2;
w = convlength(60.9,'in','m')/2;

vehicle_res = 20;

% Obstacle Geometry
O = [22 22 0 0;
     3 0 0 3];
P = [50 50 0 0;
    50 6 6 50];
Q = [50 50 28 28;
     3 0 0 3];
R = [10 15 13 7 5;
     40 35 30 30 35];

objects = createobject(objects, O);
objects = createobject(objects, P);
objects = createobject(objects, Q);
%objects = createobject(objects, R);
robot = createrobot(l+0.1,2*w+0.1,vehicle_res);

%fill(B(1,:),B(2,:),[0 0 0]);

N = 15000; % number of samples on xy plane
Nt = 100; % number of samples along so(2)

% Fixed Spacing 
%x = linspace(0,10,N);
%y = linspace(0,10,N);
%theta = linspace(0,2*pi,N);

% Random Spacing
x = [];
y = [];
theta = [];
collision = [];

s = [20; 4; 0];
t = [24; 2; 0];
A = zeros(N,N);

while(true)
    xg = 15 + 20*rand();
    yg = 8*rand();
    thetag = 2*pi*rand();
    collision_test_result = testcollision(objects, robot, xg, yg, thetag, vehicle_res);
    if(collision_test_result == 0)
        x = [x xg];
        y = [y yg];
        theta = [theta thetag];
    end
    if(length(x) == N)
        break;
    end
end

x(end-1:end) = [s(1) t(1)];
y(end-1:end) = [s(2) t(2)];
theta(end-1:end) = [s(3) t(3)];

res = 2;
tol = 0.05;

for i=1:N
        P = [];
        % Proximity Search
        for j=1:N
            if (sqrt((x(i)-x(j))^2+(y(i)-y(j))^2) < res) && (i ~= j)
                P = [P; j];
            end
        end
        % Non-holonomic constraint
        for k=1:length(P)
            ix = P(k);
            e = nh_constraint(x(i),y(i),theta(i),x(ix),y(ix),theta(ix),tol,a);
            if e == 1
                A(P(k),i) = sqrt((x(ix)-x(i))^2+(y(ix)-y(i))^2);
                A(i,P(k)) = sqrt((x(ix)-x(i))^2+(y(ix)-y(i))^2);
            end
        end
end

G = graph(A);
path = shortestpath(G,N-1,N);

figure 
hold on
axis equal

for i=1:length(objects)
    object = cell2mat(objects(i));
    fill(object(1,:),object(2,:),[0.9 0.45 0.25]);
end

for i=1:N
    plot(x(i),y(i),'ko','Markersize',0.5);
end
for i=1:length(path)-1
   index1 = path(i);
   index2 = path(i+1);
   x1 = x(index1);
   y1 = y(index1);
   x2 = x(index2);
   y2 = y(index2);
   line([x1 x2], [y1 y2], 'Color', 'green', 'LineWidth', 3);
   
   % draw_car(x1, y1, theta(index1), a, w, 0);
end

draw_car(x(N-1),y(N-1),theta(N-1), a, w, 1);
draw_car(x(N),y(N),theta(N), a, w, 0);


            
            
            




clear all
objects = {};

% Vehicle Geometry
l = convlength(106.3,'in','m');
a = l/2;
w = convlength(60.9,'in','m')/2;

vehicle_res = 20;
res = 1;
tol = 0.1;

% Obstacle Geometry
O = [40 40 30 30;
     40 10 10 40];
P = [30 30 10 10;
    40 30 30 40];
Q = [20 20 10 10;
    20 10 10 20];

objects = createobject(objects, O);
objects = createobject(objects, P);
objects = createobject(objects, Q);
robot = createrobot(l+res,2*w+res,vehicle_res);

%fill(B(1,:),B(2,:),[0 0 0]);

N = 20000; % number of samples on xy plane
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

s = [45; 20; 0];
t = [25; 25; 0];

while(true)
    xg = 50*rand();
    yg = 50*rand();
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
        
% x = 50*rand(N,1);
% y = 50*rand(N,1);
% theta = -pi + 2*pi*rand(N,1);

A = zeros(N,N);

% for i=1:N
%         P = [];
%         % Proximity Search
%         for j=1:N
%             if (sqrt((x(i)-x(j))^2+(y(i)-y(j))^2) < res) && (i ~= j)
%                 P = [P; j];
%             end
%         end
%         % Non-holonomic constraint
%         for k=1:length(P)
%             ix = P(k);
%             A(P(k),i) = sqrt((x(ix)-x(i))^2+(y(ix)-y(i))^2);
%             A(i,P(k)) = sqrt((x(ix)-x(i))^2+(y(ix)-y(i))^2);
%         end
% end
% 
% G = graph(A);
% s = N - 1;
% t = N;
% path = shortestpath(G,s,t);

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
%plot(x(s),y(s),'ro','Markersize',9);
%plot(x(t),y(t),'bo','Markersize',9);
% for i=1:length(path)-1
%    index1 = path(i);
%    index2 = path(i+1);
%    x1 = x(index1);
%    y1 = y(index1);
%    x2 = x(index2);
%    y2 = y(index2);
%    line([x1 x2], [y1 y2], 'Color', 'green', 'LineWidth', 3);
%    
%    % draw_car(x1, y1, theta(index1), a, w, 0);
% end

% draw_car(x(s),y(s),theta(s), a, w, 0);
% draw_car(x(t),y(t),theta(t), a, w, 1);

figure 
hold on
axis equal
grid on
object = cell2mat(objects(3));
fill(object(1,:),object(2,:),[0.9 0.45 0.25]);
for i=1:(vehicle_res^2)
    rotated_robot = (rot2d(deg2rad(60)) * robot) + repmat([9.5; 9.5],1,vehicle_res^2);
    plot(rotated_robot(1,i), rotated_robot(2,i), 'bo', 'MarkerSize', 2);
end

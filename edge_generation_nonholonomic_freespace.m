clear all

% Vehicle Geometry
l = convlength(106.3,'in','m');
a = l/2;
w = convlength(60.9,'in','m')/2;

N = 100; % number of samples on xy plane
Nt = 100; % number of samples along so(2)

% Fixed Spacing 
%x = linspace(0,10,N);
%y = linspace(0,10,N);
%theta = linspace(0,2*pi,N);

% Random Spacing
xpre = 30*rand(N-2,1);
ypre = 30*rand(N-2,1);
xpre = [xpre; 10; 25];
ypre = [ypre; 15; 20];
thetapre = linspace(0,2*pi,Nt);

x = zeros(Nt*N,1);
y = zeros(Nt*N,1);
theta = zeros(Nt*N,1);

for i = 1:Nt
    x(N*(i-1)+1:N*(i-1)+N) = xpre;
    y(N*(i-1)+1:N*(i-1)+N) = ypre;
    theta(N*(i-1)+1:N*(i-1)+N) = thetapre(i)*ones(N,1);
end

A = zeros(N*Nt,N*Nt);

res = 5;
tol = 0.1;

for i=1:N*Nt
        P = [];
        % Proximity Search
        for j=1:N*Nt
            if ~((x(i) == x(j)) && (y(i) == y(j)))
                if sqrt((x(i)-x(j))^2+(y(i)-y(j))^2) < res
                    P = [P; j];
                end     
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
s = 999;
t = 5000;
path = shortestpath(G,s,t);

figure 
hold on
axis equal

for i=1:N
    plot(x(i),y(i),'ko','Markersize',1);
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

draw_car(x(s),y(s),theta(s), a, w, 1);
draw_car(x(t),y(t),theta(t), a, w, 0);

           

            
            
            




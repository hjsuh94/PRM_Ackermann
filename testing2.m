objects = {};

A = [1 1 -1 -2 -1 ; 
     1 -1 -1 0 1];

B = [20 20 19 19;
     20 19 19 20];
 
% Vehicle Geometry
l = convlength(106.3,'in','m');
a = l/2;
w = convlength(60.9,'in','m')/2;
 
objects = createobject(objects, A);
objects = createobject(objects, B);
robot = createrobot(l,2*w,20);

figure
hold on
axis equal
%fill(A(1,:),A(2,:),[0 0 0]);
fill(B(1,:),B(2,:),[0 0 0]);

for i = 1:size(robot,2)
    plot(robot(1,i),robot(2,i),'ro','Markersize',1);
end


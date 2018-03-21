function index = vertex_index(N,x,y,theta)
%VERTEX_INDEXING Summary of this function goes here
%   Detailed explanation goes here
    index = (x - 1) * N^2 + (y - 1) * N + (theta - 1) + 1;

end


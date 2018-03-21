function p = index_vertex(N, index)
%INDEX_VERTEX Summary of this function goes here
%   Detailed explanation goes here
    x = floor((index - 1)  / N^2) + 1;
    y = floor((index  - 1 - (x - 1) * N^2) / N) + 1;
    theta = rem(index - 1, N) + 1; 
    p = [x; y; theta];
end


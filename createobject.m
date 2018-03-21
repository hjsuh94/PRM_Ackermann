function objects = createobject(objects, mat)
    % mat is a matrix
    % objects is a cell of matrices
    [~, n] = size(objects);
    objects{1, n + 1} = mat;
end
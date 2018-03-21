function collision = testcollision(objects, robot, x, y, theta, res)
    [~, number] = size(objects);
    tr = [cos(theta), -sin(theta); sin(theta), cos(theta)];
    robot = (tr * robot) + repmat([x; y],1,res^2);
    for i = 1:number
        mat = cell2mat(objects(i));
        [~, n] = size(mat);
        cp = mean(mat, 2);
        x = cp(1);
        y = cp(2);
        [~, m] = size(robot);
        for j = 1:m
            collision = true;
            xr = robot(1, j);
            yr = robot(2, j);
            for k = 1:n - 1
                x1 = mat(1, k);
                y1 = mat(2, k);
                x2 = mat(1, k + 1);
                y2 = mat(2, k + 1);
                d1 = (x - x1)*(y2 - y1) - (y - y1)*(x2 - x1);
                d2 = (xr - x1)*(y2 - y1) - (yr - y1)*(x2 - x1);
                if (d1 * d2 < 0)
                    collision = false;
                    break;
                end
            end
            if (collision == true)
                x1 = mat(1, n);
                y1 = mat(2, n);
                x2 = mat(1, 1);
                y2 = mat(2, 1);
                d1 = (x - x1)*(y2 - y1) - (y - y1)*(x2 - x1);
                d2 = (xr - x1)*(y2 - y1) - (yr - y1)*(x2 - x1);
                if (d1 * d2 < 0)
                    collision = false;
                end
            end
            if (collision == true)
                break;
            end
        end
        if (collision == true)
                break;
        end
    end
end
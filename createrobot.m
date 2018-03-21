function robot = createrobot(robot_length, robot_width, res)
    l = robot_length / 2;
    w = robot_width / 2;
    robot = [l; w];
    for i = 0:res - 1
        for j = 0:res - 1
            if (i ~= 0 || j ~= 0)
                robot = [robot [l - 2*i*l/res; w - 2*j*w/res]];
            end
        end
    end
end
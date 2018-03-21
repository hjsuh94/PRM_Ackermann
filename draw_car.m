function [] = draw_car(x, y, theta, a, w, color)
%DRAW_CAR Summary of this function goes here
%   Detailed explanation goes here
    
    % representation in world frame
    
    % rotation around origin 
    p1 = rot2d(theta)*[a; w];
    p2 = rot2d(theta + pi/2)*[w;a];
    p3 = rot2d(theta + pi)*[a;w];
    p4 = rot2d(theta - pi/2)*[w;a];
   
    wbx = [p1(1) p2(1) p3(1) p4(1)];
    wby = [p1(2) p2(2) p3(2) p4(2)];
    
    wxp = wbx + x * ones(1,4);
    wyp = wby + y * ones(1,4);
    
    if(color == 0) 
        fill(wxp, wyp, [1 0 0]);
    else
        fill(wxp, wyp, [0 0 1]);
    end
    
    line([x 0.5*(wxp(1)+wxp(4))], [y 0.5*(wyp(1)+wyp(4))], 'Color', 'yellow', 'LineWidth', 4);
end


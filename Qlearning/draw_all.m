function draw_all( Q, visited )
%DRAW_ALL Summary of this function goes here
%   Detailed explanation goes here
    gwdraw();
    for i=1:10
        for j=1:15
            if visited(i,j)
                [value arg] = max(Q(i,j,:));
                gwplotarrow([i j], arg);
            end
        end
    end
    %pause;       
end


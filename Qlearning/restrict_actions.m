function [Q] = restrict_actions(Q)
%RESTRICT_ACTIONS put big negatives in actions we don't want the agent to
%do.
    for i=1:10
        Q(i,1,4) = -100.0;
        Q(i,end,3) = -100.0;
    end
    for i=1:15
        Q(1,i,2) = -100.0;
        Q(end,i,1) = -100.0;
    end
end


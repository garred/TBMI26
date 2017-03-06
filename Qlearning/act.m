function [ action, r, new_state ] = act( state, Q, epsilon )
%ACT Given an state and a Q table, choose an action and do it. Returns the
%action done, the reward obtained and the new state.

    % Choose greedy action or a random action.    
    if rand > epsilon
        pos = state.pos;
        action_probabilities = reshape(Q(pos(1), pos(2), :), [4,1]);
        [~, action] = max(action_probabilities);
    else
        action = randi([1 4]);
    end
    
    % Perform the action
    gwaction(action);
    new_state = gwstate();
    r = new_state.feedback;
end


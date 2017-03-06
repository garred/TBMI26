function [ Q, steps ] = run_one_episode( initial_world, Q, alpha, gamma, epsilon )
%RUN_ONE_EPISODE executes one episode and updates the Q table

    % Loads the world and reset the visited places
    gwinit(initial_world);
    visited = zeros(10,15);

    state = gwstate();
    steps = 0;
    while (~state.isterminal && steps<100)
        pos = state.pos;
        visited(pos(1), pos(2)) = 1;

        [action, r, new_state] = act(state, Q, epsilon);
        new_pos = new_state.pos;

        % Q-Learning
        Q(pos(1),pos(2), action) = ...
            (1-alpha) * Q(pos(1),pos(2), action) + ...
            alpha * (r + gamma * max(Q(new_pos(1),new_pos(2), :)));
        Q = restrict_actions(Q);

        % Update current state
        state = new_state;
        steps = steps + 1;
    end
end


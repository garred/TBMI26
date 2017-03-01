% Parameters

initial_world = 1;
alpha = 0.5;
gamma = 0.99;
MAX_EPISODES = 100;
numExperiments = 1;


% Main loop

episode = 0

experiments = [];
for m=1:numExperiments
    m
    Q = initialize();
    episode = 0;
    runs = [];
    while episode < MAX_EPISODES
        episode = episode + 1;
        %if (mod(episode,100)==0) 
            episode
        %end

        gwinit(initial_world);
        visited = zeros(10,15);

        state = gwstate();
        running = 0;
        while (~state.isterminal && running<1000)
            % Get the current state and possible actions 
            pos = state.pos;
            visited(pos(1),pos(2)) = 1;
            action_probabilities = reshape(Q(pos(1), pos(2), :), [4,1]);

            % Perform the action
            action = sample([1 2 3 4], action_probabilities);
            gwaction(action);
            new_state = gwstate();
            r = new_state.feedback;
            new_pos = new_state.pos;

            % Q-Learning
            Q(pos(1),pos(2), action) = ...
                (1-alpha) * Q(pos(1),pos(2), action) + ...
                alpha * (r + gamma * max(Q(new_pos(1), new_pos(2), :)));


            % Update current state
            state = new_state;        

            running = running + 1;
        end
        runs = [runs running];
    end
    experiments = [experiments; runs];
end

figure;
plot(mean(experiments));


% draw_all(Q, visited);
% figure;
% plot(runs);


%% Greedy algorithm

gwinit(initial_world);
state = gwstate();
%visited = zeros(10,15);
visited = ones(10,15);
running = 0
while (~state.isterminal && running<100)
    % Get the current state and possible actions 
    pos = state.pos;
    visited(pos(1),pos(2)) = 1;
    action_probabilities = reshape(Q(pos(1), pos(2), :), [4,1]);

    % Perform the action
    [value, action] = max(action_probabilities);
    %action = sample([1 2 3 4], action_probabilities);
    gwaction(action);
    state = gwstate();
    
    running = running + 1;
end
draw_all(Q, visited);
imagesc(max(Q, [], 3));
surface(max(Q, [], 3));
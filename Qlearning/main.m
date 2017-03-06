%% Parameters

clear all

initial_world = 4;
alpha = 0.1;
gamma = 1.0;
num_episodes = 10000;
num_runs = 1;


%% Main loop

Q = initialize();
episode = 0;
for episode = 1:num_episodes
    if mod(episode,100)==0
        episode
    end

    epsilon = (num_episodes - episode) / num_episodes;
    [Q, steps] = run_one_episode(initial_world, Q, alpha, gamma, epsilon);
end
%plot(mean(experiments));


%% Greedy algorithm

runs = [];
visited = zeros(10,15);
visited = ones(10,15);

for run = 1:num_runs
    gwinit(initial_world);
    state = gwstate();
    
    steps = 0;
    while (~state.isterminal && steps<1000)
        visited(state.pos(1), state.pos(2)) = 1;

        [action, r, new_state] = act(state, Q, 0.0);
        state = new_state;

        steps = steps + 1;
    end
    
    runs = [runs; steps];
end
draw_all(Q, visited);
mean(runs)

%% 
imagesc(max(Q, [], 3));
%surface(max(Q, [], 3));

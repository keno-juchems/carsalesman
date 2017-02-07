%% Handles the block structure

% SET UP THE PAIRS OF STIMULI FOR THE FIRST BLOCK
trials_per_block = params.n_trials_train_all/(params.n_bandits/2);

data.pairs = repmat(1:params.n_bandits,params.n_trials_train_all,1);

data.curr_pair = [ones(trials_per_block,1)*1;...
                  ones(trials_per_block,1)*3;...
                  ones(trials_per_block,1)*5];
data.curr_pair = [data.curr_pair,data.curr_pair + 1];
data.curr_pair = [data.pairs(1,data.curr_pair(:,1))',...
                  data.pairs(1,data.curr_pair(:,2))'];


% SHUFFLE BLOCK ORDER
order = shuffle(1:params.n_bandits/2);
new_pairs = nan(size(data.curr_pair));
new_pairs(1:trials_per_block,:) = data.curr_pair(((order(1)-1) * trials_per_block + 1):(order(1) * trials_per_block),:);
new_pairs(trials_per_block+1:2*trials_per_block,:) = data.curr_pair(((order(2)-1) * trials_per_block + 1):(order(2) * trials_per_block),:);
new_pairs(2*trials_per_block+1:3*trials_per_block,:) = data.curr_pair(((order(3)-1) * trials_per_block + 1):(order(3) * trials_per_block),:);
data.curr_pair = new_pairs;

% SET UP TEST BLOCK
test_pairs = repmat(nchoosek(1:params.n_bandits,2),params.n_trials_test_per_pair,1);
test_pairs = test_pairs(shuffle(1:size(test_pairs,1)),:);
data.curr_pair = [data.curr_pair;test_pairs];

% SHUFFLE FOR INTERLEAVED (IF DESIRED)
streams                     = 1:2:params.n_trials_train_all-1;
new_streams                 = shuffle(streams);
new_pairs                   = data.curr_pair(new_streams,:);
data.curr_pair(streams,:)     = new_pairs;
data.curr_pair(streams+1,:)   = new_pairs;

% ASSIGN BANDITS AND MEANS
tmp_shuffle    = randi([1,2],params.n_trials,1);
for trial = 1:params.n_trials
    data.bandit_left_mean(trial) = params.bandits_mean(data.curr_pair(trial,tmp_shuffle(trial)));
    data.bandit_left_shape(trial) = params.stim_shapes(1,data.curr_pair(trial,tmp_shuffle(trial)));
    
    if tmp_shuffle(trial) == 1
        data.bandit_right_mean(trial)= params.bandits_mean(data.curr_pair(trial,2));
        data.bandit_right_shape(trial) = params.stim_shapes(1,data.curr_pair(trial,2));
    else
        data.bandit_right_mean(trial)= params.bandits_mean(data.curr_pair(trial,1));
        data.bandit_right_shape(trial) = params.stim_shapes(1,data.curr_pair(trial,1));
    end
end

% DRAW FROM BANDIT DISTRIBUTIONS
data.bandit_right_thisdraw  = nan(params.n_trials,params.bandits_n_draw);
data.bandit_left_thisdraw   = nan(params.n_trials,params.bandits_n_draw);

% SET IF CHOICE IS SAMPLING OR CHOICE
data.ischoice([2:2:params.n_trials_train_all,params.n_trials_train_all:params.n_trials]) = 1; 

% SET BANDITS FOR ESTIMATION AT THE END
data.estimation_shape = shuffle(repmat(1:params.n_bandits,1,params.n_trials_est_per_bandit));
for i = 1:params.n_trials_est
    data.estimation_true_val(i) = params.bandits_mean(params.stim_shapes == data.estimation_shape(i));
end

clear order new_pairs trials_per_block tmp_shuffle test_pairs stream new_streams new_pairs;
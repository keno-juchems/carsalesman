%% INITIALIZES THE DATA STRUCTURE

data                = struct();

% SUBJECT
data.subject.dir    = curr_dir;
data.exp_subject    = ones(params.n_trials,1)*subject_nr;

% TASK
data.bandit_left_shape          = nan(params.n_trials,1);
data.bandit_right_shape         = nan(params.n_trials,1);
data.bandit_left_mean           = nan(params.n_trials,1);
data.bandit_right_mean          = nan(params.n_trials,1);
data.bandit_left_var            = ones(params.n_trials,1)*params.bandits_var;
data.bandit_right_var           = ones(params.n_trials,1)*params.bandits_var;
data.bandit_left_thisdraw       = nan(params.n_trials,1);
data.bandit_right_thisdraw      = nan(params.n_trials,1);
data.session                    = [ones(params.n_trials_train,1); ones(params.n_trials_test,1)*2];
data.ischoice                   = zeros(params.n_trials,1);
data.condition                  = repmat(randi([1,1],1,1),params.n_trials,1);

% CHOICE
data.choice                     = nan(params.n_trials,1);
data.rt                         = nan(params.n_trials,1);
data.outcome_shape              = nan(params.n_trials,1);
data.outcome_yield              = nan(params.n_trials,1);
data.noresponse                 = zeros(params.n_trials,1);

% TIMING
data.time_start                 = zeros(params.n_trials,1);
data.time_fixation              = zeros(params.n_trials,1);
data.time_stimuli               = zeros(params.n_trials,1);
data.time_feedback              = zeros(params.n_trials,1);
data.time_feedback_off          = zeros(params.n_trials,1);
data.time_responded             = zeros(params.n_trials,1);
data.time_starttrial            = zeros(params.n_trials,1);
data.time_end                   = zeros(params.n_trials,1);

% DO ITI WITH CONSTRAINT ON TOTAL LENGTH OF STUDY
data.ITI = zeros(params.n_trials,1) * params.time_ITI_max;
while abs(sum(data.ITI) - (params.n_trials * ((params.time_ITI_max + params.time_ITI_min) /2))) > params.time_tolerance
data.ITI                = params.time_ITI_min + ... % this is ITI BEFORE(!) trial
                        (params.time_ITI_max - params.time_ITI_min) * ...
                        rand(params.n_trials,1);
end
data.ITI_feedback = zeros(params.n_trials,1);

% RANKING
% Tesselate available space
x_range = [params.rect(1) + params.ranking_x_border,...
           params.rect(3) - params.ranking_x_border];
y_range = [params.rect(2) + params.ranking_y_border_top,...
           params.rect(4) - params.ranking_y_border_bottom];
% 2 rows, x columns
y = linspace(y_range(1),y_range(2),5);
x = linspace(x_range(1),x_range(2),params.n_bandits+1);

y_pos = [repmat(y(2),1,params.n_bandits/2),...
         repmat(y(4),1,params.n_bandits/2)]; 
x_pos = repmat(x(2:2:end),1,2);

data.ranking_bandits_init_x = x_pos;
data.ranking_bandits_init_y = y_pos;
data.ranking_bandits_final_x = x_pos;
data.ranking_bandits_final_y = y_pos;

order = shuffle(1:params.n_bandits);
data.ranking_bandits_show   = order;
data.ranking_bandits_shape  = params.stim_shapes(order);
data.ranking_bandits_mean   = params.bandits_mean(order);

data.estimation     = randi([0,500],1,params.n_trials_est_per_bandit * params.n_bandits);

clear x_range y_range x y y_pos x_pos order
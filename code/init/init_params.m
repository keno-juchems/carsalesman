KbName('UnifyKeyNames');

%% PARAMETERS
params                   = struct();

% PSYCHTOOLBOX
params.psych_background_black  = [127 127 127];
params.psych_background_white  = [255 255 255];
params.psych_text_color        = [255 255 255];
if ~exist('rect','var')
    params.rect                = [0 0 1920 1028];
else 
    params.rect                = rect;
end
if ~exist('ifi','var')
    params.time_ifi            = 0.0167;
else 
    params.time_ifi            = ifi;
end


% FOLDERS
params.dir_study         = fileparts(which('exp_main.m'));

% SETTINGS

params.response_keys     = [KbName('leftArrow'),...
                            KbName('rightArrow')...
                            ];
params.n_bandits         = 6;
params.n_blocks          = 1;
params.n_sessions        = 1;
params.n_trials_train    = 21; % must be a multiple of params.n_bandits/2
params.n_trials_train_all= 2 * params.n_trials_train;
params.n_trials_test_per_pair = 8;
params.n_trials_test     = 0.5 * params.n_trials_test_per_pair * params.n_bandits * (params.n_bandits-1);
params.n_trials          = params.n_trials_train_all + params.n_trials_test;
params.n_trials_est_per_bandit = 2;
params.n_trials_est      = params.n_trials_est_per_bandit * params.n_bandits;
                        
% BANDIT SETTINGS

params.bandits_mean      = [22,25,29,37,32,34];
params.bandits_var       = 3;%2
params.bandits_n_draw    = 10;

params.estimation_interval = params.rect(3) / 10;
params.estimation_offset   = params.estimation_interval / 2;

% TIMING
params.time_max_rt            = 4;
params.time_stim_present      = 4;
params.time_fixation          = 0.10;
params.time_ITI_min           = 0.25;
params.time_ITI_max           = 0.5;
params.time_feedback          = 0.75;
params.time_tolerance         = 0.5; % Tolerance for absolute length of ITIs
params.time_persample         = 0.75;
params.time_noresponse        = 2;
params.time_ranking           = 300;
params.time_ranking_rate      = params.time_ifi;
params.time_magnitude_est     = 60;
params.time_estimation_rate   = params.time_ifi;
params.time_sample_iti        = 0.15;      

% STIMULUS
params.stim_shapes              = shuffle(1:params.n_bandits);
params.screen_background        = [0 0 0];
params.stim_midpoint            = [0.5*params.rect(3),0.5*params.rect(4)];
params.stim_pos_left            = [0.4*params.rect(3),0.5*params.rect(4)]; %left bandit
params.stim_pos_right           = [0.6*params.rect(3),0.5*params.rect(4)]; %right bandit
params.stim_penwidth            = 5;
params.stim_size                = 0.1 * params.rect(3);
params.stim_size_ranking        = 0.1 * params.rect(3);
params.stim_size_estimation     = 0.1 * params.rect(3);
params.stim_size_button         = 0.02* params.rect(3);
params.stim_button_offset       = 0.05* params.rect(4);
params.stim_magnitude_offset    = 0.1 * params.rect(4);

% TEXTS
params.txt_feedback_idle = 'You did not respond.';
params.txt_choice        = 'Which symbol to play for your bonus?';
params.txt_sample        = 'Where to sample from first?';
params.txt_magnitude_est = ['Are you sure this is the correct value? \n\n',...
                            'Press space to continue,\n\n or any other key to keep adjusting the value'];
params.txt_estimation    = ['What is the value of this shape? \n\n',...
                            'Adjust it by clicking and dragging the button'];
params.txt_estimation_pre= ['On the following screen you will need to estimate what the true mean value of each symbol ',...
                                'is. \n\nYou can do this by dragging a button on the screen to ',...
                                'adjust the value shown above the symbol.\n\nYou will do this twice for each symbol \n'];
params.txt_size_instructions = 25;
params.txt_size_samples      = 35;

% RANKING
params.ranking_x_border         = 0.1 * params.rect(3);
params.ranking_y_border_top     = 0.1 * params.rect(4);
params.ranking_y_border_bottom  = 0.3 * params.rect(4);
params.ranking_color            = [0 0 0];
params.ranking_pen              = 10;
params.ranking_ypos             = 0.8 * params.rect(4);
params.ranking_x_border_box     = 20;
params.ranking_box_size         = 1.33 * params.stim_size_ranking;

% SUBJECTS STRUCTURE
sub = struct();

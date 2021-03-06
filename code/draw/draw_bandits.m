%% DRAWS THE BANDITS ON THE SCREEN

% ADD TEXTURES WITHIN THE FENCES
Screen('DrawTexture',w,img_textures{data.bandit_left_shape(trial)},...
                [],...
                [params.stim_pos_left(1) - params.stim_size/2,...
                 params.stim_pos_left(2) - params.stim_size/2,...
                 params.stim_pos_left(1) + params.stim_size/2,...
                 params.stim_pos_left(2) + params.stim_size/2]...
                );
Screen('DrawTexture',w,img_textures{data.bandit_right_shape(trial)},...
                [],...
                [params.stim_pos_right(1) - params.stim_size/2,...
                 params.stim_pos_right(2) - params.stim_size/2,...
                 params.stim_pos_right(1) + params.stim_size/2,...
                 params.stim_pos_right(2) + params.stim_size/2]...
                );               
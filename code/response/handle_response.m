
% WAIT FOR RESPONSE
await_response;

% SAVE RESPONSE DATA
if (RT <= params.time_max_rt)
    data.rt(trial)  = RT;
end
data.choice(trial) = response;

% CHECK RESPONSE
switch data.choice(trial)
    case 1
        DrawFormattedText(w,'Your choice was ','center',0.30*params.rect(4),params.psych_text_color,40);
        choice = 'left';
        psych_draw_left_bandit;
    case 2
        DrawFormattedText(w,'Your choice was ','center',0.30*params.rect(4),params.psych_text_color,40);
        choice = 'right';
        psych_draw_right_bandit;
    otherwise
        choice = nan;    
        data.noresponse(trial) = 1;
end
Screen('Flip',w);

% RESOLVE CHOICE
trial_gamble_resolve;

% LEAVE ONLY CHOSEN OPTION ON SCREEN


clear RT response choice;
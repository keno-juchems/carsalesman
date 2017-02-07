% Draw trial feedback
data.bandit_left_thisdraw(trial,:) = round(normrnd(data.bandit_left_mean(trial),...
                                                 data.bandit_left_var(trial),...
                                                 [1,params.bandits_n_draw]));
data.bandit_right_thisdraw(trial,:) = round(normrnd(data.bandit_right_mean(trial),...
                                                 data.bandit_right_var(trial),...
                                                 [1,params.bandits_n_draw]));



if ~isnan(data.choice(trial))
    choice = repmat(data.choice(trial),1,params.bandits_n_draw);
    if choice(1) == 1
        choice = [choice,ones(1,params.bandits_n_draw)*2];
    else
        choice = [choice,ones(1,params.bandits_n_draw)];
    end
    for i = 0:2*params.bandits_n_draw-1
        if choice(i+1) == 1
            % Put stimulus back on the screen                                             
            psych_draw_left_bandit;
            Screen('Flip',w);
            psych_wait(ifi,params.time_sample_iti);
            psych_draw_left_bandit;
            text = sprintf('%02d',data.bandit_left_thisdraw(trial,mod(i,params.bandits_n_draw)+1));
            DrawFormattedText(w,text,params.stim_pos_left(1)-20,params.stim_pos_left(2) + params.stim_size/2 + 40,params.psych_text_color,40);
        else
            % Put stimulus back on the screen                                             
            psych_draw_right_bandit;
            Screen('Flip',w);
            psych_wait(ifi,params.time_sample_iti);
            psych_draw_right_bandit;
            text = sprintf('%02d',data.bandit_right_thisdraw(trial,mod(i,params.bandits_n_draw)+1));
            DrawFormattedText(w,text,params.stim_pos_right(1)-20,params.stim_pos_right(2) + params.stim_size/2 + 40,params.psych_text_color,40);
        end
            Screen('Flip',w);
            psych_wait(ifi,params.time_persample);
    end
else
    text = sprintf('%s',params.txt_feedback_idle);
    DrawFormattedText(w,text,'center',params.stim_midpoint(2),params.psych_text_color,60);
    psych_wait(ifi,params.time_noresponse);
end

clear text choice
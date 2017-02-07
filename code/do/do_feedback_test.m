
switch data.choice(trial)
    case 1
        psych_draw_left_bandit;
    case 2
        psych_draw_right_bandit;
    otherwise
        draw_bandits;
end

Screen('Flip',w);
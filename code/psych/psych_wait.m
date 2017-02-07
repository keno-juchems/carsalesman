%% WAITS THE SPECIFIED AMOUNT OF TIME WHILE TAKING INTO ACCOUNT THE FLIP
% INTERVAL OF THE SCREEN

function psych_wait(ifi,time)

real_time = round(time/ifi) * ifi;
WaitSecs(real_time);

end

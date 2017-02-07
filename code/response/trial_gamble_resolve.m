%% RESOLVE TRIAL OUTCOME

% Resolve bandit
if ~isnan(choice)
    data.outcome_yield(trial) = data.(sprintf('bandit_%s_mean',choice))(trial); 
    data.choice_correct(trial)= max([data.bandit_left_mean(trial),data.bandit_right_mean(trial)]) == data.outcome_yield(trial);
else % For non-response
    data.outcome_yield(trial) = nan;
end
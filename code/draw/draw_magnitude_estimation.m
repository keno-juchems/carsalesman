DrawFormattedText(w,...
                sprintf('Value: %2.0f',data.estimation(trial_est)/10),...
                'center',...
                params.stim_midpoint(2) - params.stim_size_estimation/2 - params.stim_magnitude_offset,...
                params.psych_text_color);
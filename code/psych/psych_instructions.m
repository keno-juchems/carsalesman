%% HANDLES ALL SCREENS SPECIFIED IN INSTRUCTIONS AND DISPLAYS THEM

function psych_instructions(w,instructions,margin_left,margin_top,wrapat)

instructions = struct2cell(instructions);
for i = 1:max(size(instructions))
    text = instructions{i};
    DrawFormattedText(w,text,margin_left,margin_top,[255,255,255],wrapat,[],[],2);
    Screen('Flip',w);
    await_spacekey;
end
% Go back to blank screen
Screen('Flip',w);
end
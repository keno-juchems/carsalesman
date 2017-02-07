while 1
    [secs code] = KbStrokeWait();
    if sum(code) > 0
        break;
    end
end
clear secs 
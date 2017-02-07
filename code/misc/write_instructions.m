function write_instructions(condition)

screen1_file_all;
screen2_file_all;
screen3_file_all;
switch condition
    case 1 % Relative condition    
        screen4_file_relative;
    case 2 % Absolute condition
        screen4_file_absolute;
end
screen5_file_all;
screen6_file_all;

save([pwd(),filesep,'data',filesep,'texts',filesep,sprintf('text_welcome_%d.mat',condition)]);

end
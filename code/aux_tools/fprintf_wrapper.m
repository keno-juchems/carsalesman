%% THIS FUNCTION WRAPS THE FPRINTF FUNCTION AND PROVIDES NICE OUTPUT
% INPUT: NAMES OF 

function fprintf_wrapper(head_names,var_names,values,format)

% WILL OUTPUT LIST OF THE FORMAT:
% HEADER    HEADER      HEADER  ...
% VAR_NAME  value1      value2  ...

names = [head_names,var_names];
max_length = 0;
for i = 1:max(size(names))
    if length(names{i}) > max_length
        max_length = length(names{i});
    end
end

string = sprintf('%%-%ds\\t%%-%ds',max_length,max_length);
string = repmat(string,1,max(size(head_names))-1);
string = [string,'\n'];
val_string = sprintf('%%-%ds\\t%%-+%s',max_length,format);
val_string = [val_string,...
              repmat(sprintf('\\t%%-+%s',format),1,size(values,2)),'\n'];

for i = 1:max(size(head_names))
    if i == max(size(head_names))
        str = sprintf('%%-%ds\\n',max_length);
    else
        str = sprintf('%%-%ds\\t',max_length);
    end
        fprintf(str,head_names{i});
end
for i = 1:max(size(var_names))
    fprintf(val_string,var_names{i},values(i,:));
    fprintf('\n');
end

end






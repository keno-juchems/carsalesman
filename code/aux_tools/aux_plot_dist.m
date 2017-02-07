%% FUNCTION TO PLOT A DISTRIBUTION

function h = aux_plot_dist(name,params,range,h,options)

% INIT
dists = {'gauss','gausscdf'}; % Supported distributions

% CHECKS
if ~any(strcmp(name,dists))
    error('Distribution currently not supported.');
end
% Handle provided?
if isempty(h)
    h = aux_figure();
end
% Any options for plotting? (colour,size,...)
if nargin < 5
    options = {};
end

% FUNCTION CODE
x = linspace(range(1),range(2),200);
switch name
    case 'gauss'
        y = normpdf(x,params(1),params(2));
        plot(x,y);
    case 'gausscdf'
        y = normcdf(x,params(1),params(2));
        plot(x,y);
end

h = aux_figure(h);

if ~isempty(options)
    for i = 1:max(size(options))-1
        h.(options{i}) = options{i+1};
    end
end
end

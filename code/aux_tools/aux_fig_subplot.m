%% THIS FUNCTION PLOTS DATA INDIVIDUALLY FOR EACH SUBJECT
% INPUT:
% YData: Data to be put on Y-Axis
% XData: Data to be put on X-Axis
% subjects
% DEPENDENCIES: Needs jb_getvector

function [handle,m] = aux_fig_subplot(data,ydata,xdata,subs,use)

if ~exist('use','var')
    use = ones(size(data.(xdata)));
end

m = jb_getvector(data.(ydata)(use),data.exp_subject(use),data.(xdata)(use));
xlims = [min(data.(xdata)(use)),max(data.(xdata)(use))];
ylims = [min(min(m)),max(max(m))];

nsubs = max(size(subs));

if mod(nsubs,2) == 1
    nplots = nsubs + 1;
else
    nplots = nsubs;
end
div = divisors(nplots);
rows = div(floor(max(size(div))/2));
cols = div(floor(max(size(div))/2)+1);

% issquare?
if aux_issquare(nsubs) == 1
    rows = sqrt(nsubs);
    cols = sqrt(nsubs);
end

% FIGURE SETTINGS
handle = aux_figure();
handle.Color = [1 1 1];

for i = 1:nsubs
    subplot(rows,cols,i);
    curr_x = data.(xdata);
    curr_x = curr_x(data.exp_subject == subs(i) & use);
    aux_scatter(unique(curr_x),m(i,:));
    xlim(xlims);
    ylim(ylims);
    title(sprintf('subject %d',subs(i)));
end
hold off;
end

%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function fnc_plotting_plot3LineFromTo(from, to, col, wd)
if nargin < 4
    wd=1;
end
if nargin < 3
    col='k';
end
[a,b]=size(from);
for i=1:a
    scatter3(from(i,1), from(i,2), from(i,3), col, 'fill');
    scatter3(to(i,1), to(i,2), to(i,3), col, 'fill');
    plot3([from(i,1) to(i,1)],[from(i,2) to(i,2)], [from(i,3) to(i,3)],col,'linewidth',wd);
end
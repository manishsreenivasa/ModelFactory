function h=VisualizeLocalFrame(TR,opt)
% Visualize local frame of reference of an objected represented by a
% closed, triangular surface mesh.
%
% INPUT ARGUMENTS:
%   - TR    : triangular surface mesh specified in one of the following
%             formats:
%               a. 'TriRep' object (may be obsolete depending on your 
%                   current version of Matlab)
%               b. 'triangulation' object
%               c. Structure with the exact same fields as the one returned 
%                   by the 'isosurface' function; that is  
%                       TR.faces    : M-by-3 list of faces
%                       TR.vertices : N-by-3 list of vertex co-ordinates
%               d. Cell such TR={Tri X} where Tri is a M-by-3 list of faces
%                  and X is a N-by-3 list of vertex co-ordinates
%   - opt   : set opt=true to use a cuboit to help visualize the local
%             frame of reference (default) and set opt=false to use an
%             ellipsoid insted.
%
% OUTPUT:
%   - h     : vector containing handles for all graphical objects, so that
%             h=[h_prm h_arw] where h_prm are the handles returned by the 
%             the 'RBP_cuboid' or 'RBP_ellipsoid' functions and h_arw
%             contains handles for the arrows used to represent the local
%             frame of reference.
%
% AUTHOR: Anton Semechko (a.semechko@gmail.com)
% DATE  : April, 2015
%


if nargin<2 || isempty(opt), opt=true; end
opt=opt(1);

% Compute rigid body parameters and find a primitive with the same
% parameters
if opt
    [RBP,abc,R,h_prm]=RBP_cuboid(TR,true);
    abc=abc/2;
else
    [RBP,abc,R,h_prm]=RBP_ellipsoid(TR,true);
end
set(h_prm(1),'FaceAlpha',0.5,'FaceColor',0.5*[1 1 1],'EdgeColor','none')
delete(h_prm(end))

% Visualize local frame using the arrows
C=RBP.centroid;
col={'r' 'g' 'b'};
r=abc(3)/10;          % arrow radius
hf=1-0.4*abc(3)./abc; % arrow head fraction
h_arw=[0 0 0];
for j=1:3
    Vj=R(:,j);
    hj=arrow3d(abc(j)*[0 Vj(1)]+C(1),abc(j)*[0 Vj(2)]+C(2),abc(j)*[0 Vj(3)]+C(3),hf(j),r,2*r,col{j});
    h_arw(j)=hj;
end
h_prm(end)=light; lighting phong
if nargout>1, h=[h_prm h_arw]; end
%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
% dict_joint_sets

if exist('JointTypesDictionary','var')
    offsetID = length(JointTypesDictionary);
else
    offsetID = 0;
end

JointTypesDictionary(offsetID+1).name = 'Joint_Root3D_TXTYTZRYRXRZ';
JointTypesDictionary(offsetID+1).axes = [0., 0., 0., 1., 0., 0.;
    0., 0., 0., 0., 1., 0.;
    0., 0., 0., 0., 0., 1.;
    0., 1., 0., 0., 0., 0.;
    1., 0., 0., 0., 0., 0.;
    0., 0., 1., 0., 0., 0.];

JointTypesDictionary(offsetID+2).name = 'Joint_RYRXRZ';
JointTypesDictionary(offsetID+2).axes = [
    0., 1., 0., 0., 0., 0.;
    1., 0., 0., 0., 0., 0.;
    0., 0., 1., 0., 0., 0.];

JointTypesDictionary(offsetID+3).name = 'Joint_RYRX';
JointTypesDictionary(offsetID+3).axes = [ 0., 1., 0., 0., 0., 0.;
    1., 0., 0., 0., 0., 0.];


JointTypesDictionary(offsetID+4).name = 'Joint_RYRZ';
JointTypesDictionary(offsetID+4).axes = [ 0., 1., 0., 0., 0., 0.;
    0., 0., 1., 0., 0., 0.];

JointTypesDictionary(offsetID+5).name = 'Joint_RY';
JointTypesDictionary(offsetID+5).axes = [
    0., 1., 0., 0., 0., 0.];

JointTypesDictionary(offsetID+6).name = 'Joint_RYRXTZ';
JointTypesDictionary(offsetID+6).axes = [ 0., 1., 0., 0., 0., 0.;
    1., 0., 0., 0., 0., 0.;
    0., 0., 0., 0., 0., 1.];

JointTypesDictionary(offsetID+7).name = 'Joint_RYTZ';
JointTypesDictionary(offsetID+7).axes = [ 0., 1., 0., 0., 0., 0.;
    0., 0., 0., 0., 0., 1.];

JointTypesDictionary(offsetID+8).name = 'Joint_Root2D_TXTZRY';
JointTypesDictionary(offsetID+8).axes = [ 0., 0., 0., 1., 0., 0.;
    0., 0., 0., 0., 0., 1.;
     0., 1., 0., 0., 0., 0.];
 
JointTypesDictionary(offsetID+9).name = 'Joint_TZRY';
JointTypesDictionary(offsetID+9).axes = [ 0., 0., 0., 0., 0., 1.;
    0., 1., 0., 0., 0., 0.];

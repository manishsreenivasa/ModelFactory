%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%
function ui_close_gui(src,callbackdata)

	rmpath(genpath('./core'));
	rmpath(genpath('./customSetups'));
	delete(gcf)


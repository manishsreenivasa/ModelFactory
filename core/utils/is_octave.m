%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
% Subfunction that checks if we are in octave
function r = is_octave ()
  persistent x;
  if (isempty (x))
    x = exist ('OCTAVE_VERSION', 'builtin');
  end
  r = x;
end
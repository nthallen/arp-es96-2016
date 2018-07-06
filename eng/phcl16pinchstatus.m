function phcl16pinchstatus(varargin);
% phcl16pinchstatus( [...] );
% Pinch Status
h = ne_dstat({
  'C', 'PVStat', 7; ...
	'Z', 'PVStat', 6; ...
	'B', 'PVStat', 5; ...
	'A', 'PVStat', 4; ...
	'R', 'PVStat', 3; ...
	'D', 'PVStat', 2; ...
	'O', 'PVStat', 1; ...
	'I', 'PVStat', 0; ...
	'S', 'IXStt', 0 }, 'Status', varargin{:} );
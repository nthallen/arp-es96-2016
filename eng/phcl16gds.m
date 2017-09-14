function phcl16gds(varargin);
% phcl16gds( [...] );
% Gas Deck Status
h = ne_dstat({
  'CellExVlvS', 'DStat0', 1; ...
	'GDVlvS', 'DStat0', 2; ...
	'CalGasVlvS', 'DStat0', 3 }, 'Status', varargin{:} );

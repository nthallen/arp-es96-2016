function phcl16gdp(varargin);
% phcl16gdp( [...] );
% Gas Deck P
h = timeplot({'GasHP','GasLP'}, ...
      'Gas Deck P', ...
      'P', ...
      {'GasHP','GasLP'}, ...
      varargin{:} );
function phcl16gdpsia(varargin);
% phcl16gdpsia( [...] );
% Gas Deck PSIA
h = timeplot({'GasHPA','GasLPA'}, ...
      'Gas Deck PSIA', ...
      'PSIA', ...
      {'GasHPA','GasLPA'}, ...
      varargin{:} );
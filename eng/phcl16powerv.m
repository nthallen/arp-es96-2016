function phcl16powerv(varargin);
% phcl16powerv( [...] );
% Power Voltage
h = timeplot({'PM0V1','PM0V2'}, ...
      'Power Voltage', ...
      'Voltage', ...
      {'PM0V1','PM0V2'}, ...
      varargin{:} );
function phcl16powerc(varargin);
% phcl16powerc( [...] );
% Power Current
h = timeplot({'PM0I1','PM0I2','PmpsI','Pmps2I'}, ...
      'Power Current', ...
      'Current', ...
      {'PM0I1','PM0I2','PmpsI','Pmps2I'}, ...
      varargin{:} );

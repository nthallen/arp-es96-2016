function phcl16tict(varargin);
% phcl16tict( [...] );
% Temps Inlet CT
h = timeplot({'InletTSt','InletCT'}, ...
      'Temps Inlet CT', ...
      'Inlet CT', ...
      {'InletTSt','InletCT'}, ...
      varargin{:} );

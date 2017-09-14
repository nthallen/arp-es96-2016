function phcl16tshct(varargin);
% phcl16tshct( [...] );
% Temps Sp Ht CT
h = timeplot({'SpHtTSt','SpHt1CT','SpHt2CT'}, ...
      'Temps Sp Ht CT', ...
      'Sp Ht CT', ...
      {'SpHtTSt','SpHt1CT','SpHt2CT'}, ...
      varargin{:} );

function phcl16sspa(varargin);
% phcl16sspa( [...] );
% SSP Amp
h = timeplot({'SSP_amp0','SSP_amp1','SSP_noise0','SSP_noise1'}, ...
      'SSP Amp', ...
      'Amp', ...
      {'SSP\_amp0','SSP\_amp1','SSP\_noise0','SSP\_noise1'}, ...
      varargin{:} );

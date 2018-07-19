function cust_phcl16pinchs(h)
% cust_phcl16pinchs(h)
% Customize plot created by phcl16pinchs

% phcl16pinchs's definition:

% function phcl16pinchs(varargin);
% % phcl16pinchs( [...] );
% % Pinch Step
% h = timeplot({'PVStep'}, ...
%       'Pinch Step', ...
%       'Step', ...
%       {'PVStep'}, ...
%       varargin{:} );

% Example customizations include:
%   set(h,'LineStyle','none','Marker','.');
%   ax = get(h(1),'parent');
%   set(ax,'ylim',[0 800]);
PVStep = get(h,'YData');
v = PVStep > 60000;
PVStep(v) = PVStep(v) - 65536;
set(h,'YData',PVStep);

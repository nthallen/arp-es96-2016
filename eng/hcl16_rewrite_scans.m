function hcl16_rewrite_scans
% hcl16_rewrite_scans
scandir = find_scans_dir([]);
xform = [scandir '_xform.m'];
if exist(xform,'file')
  eval(['run ' xform]);
  if ~exist('M','var')
    error('Script %s did not define matrix M', xform);
  end
  tmpdir = [scandir 'i'];
  if exist(tmpdir,'dir')
    error('tmpdir %s already exists, rewrite already performed', tmpdir);
  else
    movefile(scandir,tmpdir)
    rewrite_scans(tmpdir,scandir,M);
  end
  newxform = [xform(1:end-2) 'ed.m'];
  movefile(xform, newxform);
else
  xformed = [scandir '_xformed.m'];
  if exist(xformed,'file')
    error('Xformed file indicates scans have already been rewritten');
  else
    error('No scan xform definition found');
  end
end

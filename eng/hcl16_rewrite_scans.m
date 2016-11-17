function hcl16_rewrite_scans
% hcl16_rewrite_scans
scandir = find_scans_dir([]);
tmpdir = [scandir 'i'];
if exist(tmpdir,'dir')
  error('tmpdir %s already exists, rewrite already performed', tmpdir);
else
  movefile(scandir,tmpdir)
  rewrite_scans(tmpdir,scandir,[1 0; 0 -1; 0 0]);
end

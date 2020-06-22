fprintf(1,'Looking for startup dir. If prompted for a directory,\nEnter the location of the HCl RAW directory\n');
runsdir = ne_load_runsdir('HCl16_DATA_DIR');
dirs = { runsdir, [ runsdir '/..' ], [ runsdir '/../..' ] };
for i = 1:length(dirs)
  cd(dir{i});
  [fd,msg] = fopen('runs.dat','r');
  if fd > 0
    tline = fgetl(fd);
    while ischar(tline)
      fprintf(1,'Processing: "%s"\n', tline);
      if exist(tline,'dir') == 7
        oldfolder = cd(tline);
        csv2mat;
        delete *.csv
        if exist('SSP_xform.m','file') && exist('SSP','dir')
          SSP_xform;
          movefile('SSP','SSP.orig');
          fprintf(1,'Rewriting scans from SSP.orig to SSP\n');
          rewrite_scans('SSP.orig','SSP',M);
          movefile('SSP_xform.m','SSP_xformed.m');
        end
        cd(oldfolder);
      end
      tline = fgetl(fd);
    end
    fclose(fd);
    delete runs.dat
    break
  end
end
ui_hcl16;

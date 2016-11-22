function hcl16_setup
  % hcl16_setup.m
  check_lib('arp-das-matlab','time2d');
  check_lib('arp-das-matlab/ne','ne_load');
  check_lib('arp-icosfit','scanview');
  
  % Add this library to the path
  ST = dbstack(0,'-completenames');
  if isempty(ST)
    error('Could not determine library path');
  else
    libpath = fileparts(ST(1).file);
  end
  addpath(libpath);
  NOK = savepath;
  if NOK == 1
    warning('Unable to save path');
  end
  
  % Locate Data analysis directory
  ddir = uigetdir([], ...
    'Where is the instrument''s data analysis directory?');
  if isnumeric(ddir)
    error( ...
      'No directory selected. Please create a data analysis directory and rerun hcl16_setup');
  end
  if ~exist(ddir,'dir')
    error('uigetdir did not return a directory: %s', ddir);
  end
  
  % Create RAW directory
  rawdir = [ddir filesep 'RAW'];
  if ~exist(rawdir,'dir')
    [success,message] = mkdir(rawdir);
    if success ~= 1
      error('mkdir RAW failed: %s', message);
    end
  end
  
  % Write HCl16_DATA_DIR.m into eng directory
  [fid,message] = fopen([libpath filesep 'HCl16_DATA_DIR.m'],'w');
  if fid < 0
    error('Writing to HCl16_DATA_DIR failed: %s', message);
  end
  fprintf(fid, 'function path = HCl16_DATA_DIR\n');
  fprintf(fid, '% path = HCl16_DATA_DIR;\n');
  fprintf(fid, 'path = ''%s'';\n', rawdir);
  fclose(fid);
  
  [success,message] = ...
    copyfile([libpath filesep 'getrun'],[ddir filesep 'getrun'],'f');
  if success ~= 1
    error('copy of getrun failed');
  end
  
  [success,message] = ...
    copyfile([libpath filesep 'hcl16_startup.m'],[ddir filesep 'startup.m'],'f');
  if success ~= 1
    error('copy of startup.m failed');
  end

  if length(rawdir) > 2 && rawdir(2) == ':'
    cwp = '';
    for cp = { 'C:\cygwin', 'C:\cygwin.hide', 'C:\cygwin64' }
      cwpt = [cp{1} '\bin\cygpath.exe'];
      if exist(cwpt,'file')
        cwp = cwpt;
        break;
      end
    end
    if ~isempty(cwp)
      [status, icosfit_path] = unix([cwp ' -u ' rawdir]);
      if status == 0
        if icosfit_path(end) == 10
          icosfit_path = icosfit_path(1:end-1);
        end
      else
        error('Bad status from cygpath: %d', status);
      end
    else
      warning('Unable to locate cygpath: guessing');
      icosfit_path = ['/cygdrive/' rawdir(1) rawdir(3:end) ];
    end
  else
    icosfit_path = rawdir;
  end

  % Setup for ICOSfit
  [fid,message] = fopen([ddir filesep 'ICOSfit_Config.m'],'w');
  if fid < 0
    error('Writing to ICOSfit_Config.m failed: %s', message);
  end
  fprintf(fid,'function ICOSfit_cfg = ICOSfit_Config\n');
  fprintf(fid,'ICOSfit_cfg.Matlab_Path = ''%s'';\n', rawdir);
  fprintf(fid,'ICOSfit_cfg.ICOSfit_Path = ''%s'';\n', icosfit_path);
  fprintf(fid,'ICOSfit_cfg.WavesFile = ''waves.m'';\n');
  fprintf(fid,'ICOSfit_cfg.ScanDir = ''SSP'';\n');
  fclose(fid);
end

function check_lib(library, func)
  path = which(func);
  if isempty(path)
    error('Library %s is not in your Matlab PATH', library);
  end
end
  

function ui_hcl16
f = ne_dialg('HCL16 Instrument',1);
f = ne_dialg(f, 'add', 0, 1, 'ghcl16t', 'Temps' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16tr', 'Rovers' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16ts', 'Skin' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16thb', 'Heater Block' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16tssp', 'SSP' );
f = ne_dialg(f, 'add', 0, 1, 'ghcl16p', 'Pumps' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16pv', 'V' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16pt', 'T' );
f = ne_dialg(f, 'add', 0, 1, 'ghcl16c', 'Cell' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16cp', 'P' );
f = ne_dialg(f, 'add', 0, 1, 'ghcl16lpv', 'LPV' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16lpvli', 'Laser I' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16lpvlt', 'Laser T' );
f = ne_dialg(f, 'add', 0, 1, 'ghcl16tm', 'T Mbase' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16tmtd', 'T Drift' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16tmcpu', 'CPU' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16tmram', 'RAM' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16tmd', 'Disk' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'add', 0, 1, 'ghcl16qcli', 'QCLI' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qcliw', 'Wave' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qclis', 'Scan' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qclissp', 'SSP' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qclio', 'Overflow' );
f = ne_dialg(f, 'add', 0, 1, 'ghcl16qcli_stat', 'QCLI stat' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qcli_statsn', 'SN' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qcli_stats', 'Stale' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qcli_staterr', 'err' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qcli_statfifodep', 'fifodep' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qcli_statflash', 'flash' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qcli_statmode', 'mode' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qcli_statrw', 'rw' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qcli_statstatus', 'status' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16qcli_statskip', 'Skip' );
f = ne_listdirs(f, 'HCl16_DATA_DIR', 15);
f = ne_dialg(f, 'newcol');
ne_dialg(f, 'resize');

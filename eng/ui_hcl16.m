function ui_hcl16
f = ne_dialg('HCL Instrument',1);
f = ne_dialg(f, 'add', 0, 1, 'ghcl16tm', 'T Mbase' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16tmtd', 'T Drift' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16tmcpu', 'CPU' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16tmram', 'RAM' );
f = ne_dialg(f, 'add', 1, 0, 'phcl16tmd', 'Disk' );
f = ne_listdirs(f, 'HCl16_DATA_DIR', 15);
f = ne_dialg(f, 'newcol');
ne_dialg(f, 'resize');

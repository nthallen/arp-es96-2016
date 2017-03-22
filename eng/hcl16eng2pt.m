function hcleng2pt
% Generates PT.mat from hcleng_1.mat
runs = ne_load_runsdir('HCl16_DATA_DIR');
run = getrun(1);
D = load_eng('hcl16eng_1.mat', runs, run);
PT.TPT = D.Thcl16eng_1;
% PT.Tavg = (D.TS4_T + D.TS5_T)/2 + 273.15;
PT.Tavg = ones(size(PT.TPT))*293; % No temp
PT.CellP = D.Cell_P; % The one currently on the cell
PT.ScanNum = D.SSP_Num;
PT.QCLI_Wave = D.QCLI_Wave;
save PT.mat -STRUCT PT

function E = load_eng(base, runs, run)
file = base;
if ~exist(file, 'file')
    file = [runs '/' run '/' file];
end
if exist(file, 'file')
    E = load(file);
else
    fprintf(1,'Unable to locate engineering data file "%s"\n', base);
    E = [];
end

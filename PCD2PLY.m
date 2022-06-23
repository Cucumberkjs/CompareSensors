sensor = 'SICK';
N_begin = 4;
N_end = 13;

exp = 'CALIB';
for i = N_begin:N_end
    fname = strcat(sensor, '/', exp, '_', sensor, '_', sprintf('%02d',i), '.pcd')
    ptCloud = pcread(fname);
    pcwrite(ptCloud, strcat(fname(1:19), 'ply'));
end

exp = 'BIN';
for i = N_begin:N_end
    fname = strcat(sensor, '/', exp, '_', sensor, '_', sprintf('%02d',i), '.pcd')
    ptCloud = pcread(fname);
    pcwrite(ptCloud, strcat(fname(1:17), 'ply'));
end
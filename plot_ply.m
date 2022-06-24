function [ output_args ] = plot_ply(sensor, index)
%PLOT_PLY �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ
    fname = strcat(sensor, '/BIN_', sensor,'_', sprintf('%02d',index), '.ply');
    ptCloud = pcread(fname);
    if length(ptCloud.Location) > 0
        pcshow(ptCloud.Location, ptCloud.Location(:,3));
    end
end


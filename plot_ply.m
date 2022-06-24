function [ output_args ] = plot_ply(sensor, index)
%PLOT_PLY 이 함수의 요약 설명 위치
%   자세한 설명 위치
    fname = strcat(sensor, '/BIN_', sensor,'_', sprintf('%02d',index), '.ply');
    ptCloud = pcread(fname);
    if length(ptCloud.Location) > 0
        pcshow(ptCloud.Location, ptCloud.Location(:,3));
    end
end


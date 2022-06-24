sensor = 'HELIOS';
offset = 50;
FLIP_X = true;
FLIP_Y = false;
FLIP_Z = true;
step = 56;
xlimval = 180;
ylimval = 150;
render_height = 120;

% sensor = 'SICK';
% offset = 80;
% FLIP_X = true;
% FLIP_Y = true;
% FLIP_Z = false;
% step = -56;
% xlimval = 180;
% ylimval = 150;
% render_height = 120;

% sensor = 'D455';
% offset = 0.050;
% FLIP_X = true;
% FLIP_Y = true;
% FLIP_Z = false;
% step = -0.056;
% xlimval = 0.180;
% ylimval = 0.150;
% render_height = 0.120;

Nmin = 4;
Nmax = 13;
fig = figure(1);
clf;
hold on;
for i = Nmin:Nmax 
    zmax = i*step + offset;
    zmin = zmax - render_height;
    subplot(2,5,i-Nmin+1);
    plot_ply(sensor, i);
    if abs(step) > 1
        title(sprintf("Height: %d mm", zmax));
    else
        title(sprintf("Height: %d mm", int32(zmax*1000)));
    end
    colormap jet;
    if FLIP_X
        set(gca, 'XDir','reverse');
    end
    if FLIP_Y
        set(gca, 'YDir','reverse');
    end
    if FLIP_Z
        set(gca, 'ZDir','reverse');
    end
    xlim([-xlimval xlimval]);
    ylim([-ylimval ylimval]);
    zlim([zmin, zmax]);
    caxis([zmin zmax]);
    view(180,60);
    drawnow;
end

% % SICK
if sensor == "SICK"
    ylim([-50 250]);
    view(180,60);
    drawnow;
end
saveas(fig, sprintf('Render/%s-all.png', sensor));
% saveas(fig, sprintf('Render/%s-best.png', sensor));

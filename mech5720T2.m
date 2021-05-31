% Thomas Jeong

clear;
clc;
clf;
close all;


load courtyard2.txt;
x = courtyard2(:,1);
y = courtyard2(:,2);
z = courtyard2(:,3);
ampl = courtyard2(:,4);

%% Scanned Data Processing
% Peter Nicol Russell Building

plot3(x,y,z,'.','Color', 'y');
axis([-200 200 -200 200 -100 150]);
whitebg('black');
grid on;

% remove the hemispherical shell
r=sqrt(x.^2+y.^2+z.^2);
nn = find(r>40);
x(nn)=0;
y(nn)=0;
z(nn)=0;
ampl(nn)=0;
% remove objects below the ground level
nn = find(z<-3);
x(nn)=0;
y(nn)=0;
z(nn)=0;
ampl(nn)=0;

% remove objects that are more than 10m tall
nn = find(z>10);
x(nn)=0;
y(nn)=0;
z(nn)=0;
ampl(nn)=0;
figure();
plot3(x,y,z,'.','Color', 'y', 'MarkerSize', 2);
axis equal;

%% Set 1:1:1 Aspect Ratio

% Part A
figure();
plot3(x,y,z,'.','Color', 'y', 'MarkerSize', 2);
axis normal;

% Part C
figure();
plot3(x,y,z,'.','Color', 'y', 'MarkerSize', 2);
view(2);

%% Draw Levels

% divide the height into 64 equal intervals and replot
% the image layer by layer with different colours
maxz=max(z);
minz=min(z);
dz=(maxz-minz)/63;
colormap(jet); % select an appropriate colormap
cmap=colormap;

figure();
for k=1:64
    zmin=minz+(k-1)*dz;
    zmax=minz+k*dz;
    n0 = find(z>zmin & z<zmax);
    col=cmap(k,:);
    plot3(x(n0),y(n0),z(n0),'o','MarkerSize',4,'MarkerEdgeColor' ...
        ,col,'MarkerFaceColor',col);
    if(k==1)
        hold;
    end
end
view(3);
xlabel('x-axis (m)');
ylabel('y-axis (m)');
grid;
axis equal;

%% Intensity Amplitude Levels

% divide the height into 64 equal intervals and replot
% the image layer by layer with different colours
maxAmpl=max(ampl);
minAmpl=min(ampl);
dAmpl=(maxAmpl-minAmpl)/63;
colormap(jet); % select an appropriate colormap
cmap=colormap;

figure();
for k=1:64
    amplMin=minAmpl+(k-1)*dAmpl;
    amplMax=minAmpl+k*dAmpl;
    n0 = find(ampl>amplMin & ampl<amplMax);
    col=cmap(k,:);
    plot3(x(n0),y(n0),z(n0),'o','MarkerSize',4,'MarkerEdgeColor' ...
        ,col,'MarkerFaceColor',col);
    if(k==1)
        hold;
    end
end

view(3);
xlabel('x-axis (m)');
ylabel('y-axis (m)');
grid;
axis equal;

% Part C
figure();
hist(ampl);
whitebg('white');

% Part E
maxAmpl=max(ampl);
minAmpl=74.5;
dAmpl=(maxAmpl-minAmpl)/63;
colormap(jet); % select an appropriate colormap
cmap=colormap;

figure();
for k=1:64
    amplMin=minAmpl+(k-1)*dAmpl;
    amplMax=minAmpl+k*dAmpl;
    n0 = find(ampl>amplMin & ampl<amplMax);
    col=cmap(k,:);
    plot3(x(n0),y(n0),z(n0),'o','MarkerSize',2,'MarkerEdgeColor' ...
        ,col,'MarkerFaceColor',col);
    if(k==1)
        hold;
    end
end

view(3);
xlabel('x-axis (m)')
ylabel('y-axis (m)')
grid
axis equal
whitebg('black');

%% Find Hidden Word

maxAmpl=max(ampl);
minAmpl=74.5;
dAmpl=(maxAmpl-minAmpl)/63;
colormap(jet); % select an appropriate colormap
cmap=colormap;

figure();

for k=1:64
    amplMin=minAmpl+(k-1)*dAmpl;
    amplMax=minAmpl+k*dAmpl;
    n0 = find(ampl>amplMin & ampl<amplMax);
    col=cmap(k,:);
    axis([-20 -15 -20 -15 2.5 7.5]);
    plot3(x(n0),y(n0),z(n0),'o','MarkerSize',1,'MarkerEdgeColor' ...
        ,col,'MarkerFaceColor',col);
    if(k==1)
        hold;
    end
end

axis([-20 -15 -20 -15 -inf inf]);
view(2);
xlabel('x-axis (m)')
ylabel('y-axis (m)')
grid

%% Determine Height of Trees
maxz=max(z);
minz=min(z);
dz=(maxz-minz)/63;
colormap(jet); % select an appropriate colormap
cmap=colormap;

figure();
for k=1:64
    zmin=minz+(k-1)*dz;
    zmax=minz+k*dz;
    n0 = find(z>zmin & z<zmax);
    col=cmap(k,:);
    plot3(x(n0),y(n0),z(n0),'o','MarkerSize',1,'MarkerEdgeColor' ...
        ,col,'MarkerFaceColor',col);
    if(k==1)
        hold;
    end
end
view(3);
xlabel('x-axis (m)');
ylabel('y-axis (m)');
grid;
axis equal;
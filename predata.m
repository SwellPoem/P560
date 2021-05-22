mdl_puma560;

start = [0 0.4 0];
ang=0:0.1:2*pi;
r = 0.4;
x = r*cos(ang);
y = r*sin(ang);
% z = r*sin(ang)+r*cos(ang);
tmp = [x;y;zeros(1,numcols(x))];  %zeros(1,numcols(x))
via = reshape(tmp', [63 3]);
path = mstraj(via, 1, [], start, 0.1, 1);

% first= [-0.2 0.7];
% last=[0.6 0];
% path = jtraj(first, last, 50);
x = path(:,1);
y = path(:,2);
t1 = 0:0.00793651:9.992067;

data1.time = t1;
data1.signals.values = [x, y];
data1.signals.dimensions = 2;
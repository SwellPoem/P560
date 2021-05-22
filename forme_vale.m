%% setup
mdl_puma560

%% points

start=[-0.4 0.4 0];

via = [0.5 0.2 0.3; 0.4 -0.4 0; -0.3 -0.6 0.4; start];


%cubo points
% start= [-0.4 0.4 0];
% via= [-0.4 0.4 0.4; 0.4 0.4 0.4; 0.4 0.4 0; start; -0.4 -0.4 0; 0.4 -0.4 0; 0.4 -0.4 0.4; -0.4 -0.4 0.4; 
%       -0.4 -0.4 0; 0.4 -0.4 0; 0.4 0.4 0; 0.4 -0.4 0; 0.4 -0.4 0.4; 0.4 0.4 0.4; -0.4 0.4 0.4; -0.4 -0.4 0.4];
  
  
%cerchio points
% start = [0 0.4 0];
% ang=0:0.1:2*pi;
% r = 0.4;
% x = r*cos(ang);
% y = 0.5*r*sin(ang);
% z = r*sin(ang)+r*cos(ang);
% tmp = [x;y;z];  %zeros(1,numcols(x))
% via = reshape(tmp', [63 3]);

%% traj
traj = mstraj(via, 1, [], start, 0.1, 1);
Tp= SE3(0, 0, 0) * SE3(traj) * SE3.oa( [0 0 1], [-1 0 0]);
q = p560.ikine6s(Tp);

%% plot
figure(1);
plot(traj);
grid;
figure(2);
plot3(traj(:,1), traj(:,2), traj(:,3));
hold on;
grid;
p560.plot(q, 'noshadow', 'notiles')

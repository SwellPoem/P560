%% setup
mdl_puma560

%% points
first= [-0.2 0.7 0];
last=[0.6 0 0];

%% traj
x = jtraj(first, last, 50);
Tp= SE3(0, 0, 0) * SE3(x) * SE3.oa( [0 0 1], [-1 0 0]);
q = p560.ikine6s(Tp);

%% plot
figure(1);
plot(x);
grid;
figure(2);
plot3(x(:,1), x(:,2), x(:,3));
hold on;
grid;
p560.plot(q, 'nobase', 'noshadow', 'notiles')

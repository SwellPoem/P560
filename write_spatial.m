%% setup
mdl_puma560
load hershey

%% letter
D = hershey{'D'};
D.stroke;
path= [0.5*D.stroke; zeros(1, numcols(D.stroke))];
k= find(isnan(path(1, :)));
path(:, k) = path(:, k-1);
path(3,k) = 0.3

%% trajectory
traj= mstraj(path(:,2:end)', [2 2 2], [], path(:,1)', 0.02, 0.2);
time = numrows(traj) * 0.02;

Tp= SE3(0.2, 0, 0) * SE3(traj) * SE3.oa( [0 0 1], [-1 0 0]);
q = p560.ikine6s(Tp);

%% plot
plot3(traj(:,1), traj(:,2), traj (:,3));
grid;
p560.plot(q)
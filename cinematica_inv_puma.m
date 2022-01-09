function ang = cinematica_inv_puma(px, py, pz)

%% inizializzo variabili link
a2 = 0.4318;    %l2
d3 = 0.15005;   %l4
a3 = 0.0203;    %l3
d4 = 0.4318;    %l5

% px = H1_e(1,4);
% py = H1_e(2,4);
% pz = H1_e(3,4);
ax = H0_6(1,3); %r13
ay = H0_6(2,3); %r23
az = H0_6(3,3); %r33
nx = H0_6(1,1); %r11
ny = H0_6(2,1); %r21
nz = H0_6(3,1); %r31

T1=atan2(py,px) - atan2(d3,sqrt(px^2 + py^2 - d3^2))

k = (px^2 + py^2 + pz^2 - a2^2 - a3^2 - d3^2 - d4^2)/(2*a2);
T3=atan2(a3,d4) - atan2(k, sqrt(a3^2 + d4^2 - k^2))

s23 = ((-a3-a2*cos(T3))*pz + (cos(T1)*px+sin(T1)*py)*(a2*sin(T3)-d4))/(pz^2 + (cos(T1)*px+sin(T1)*py)^2);
c23 = ((a2*sin(T3)-d4)*pz - (a3+a2*cos(T3))*(cos(T1)*px+sin(T1)*py))/(pz^2 + (cos(T1)*px+sin(T1)*py)^2);
T23 = atan2(s23,c23);
T2=T23 - T3

T4 = atan2(-ax*sin(T1)+ay*cos(T1),-ax*cos(T1)*c23-ay*sin(T1)*c23+az*s23)

s5 = -ax*(cos(T1)*c23*cos(T4)) - ay*(sin(T1)*c23*cos(T4) - cos(T1)*sin(T4)) + az*(s23*cos(T4));
c5 = ax*(-cos(T1)*s23) + ay*(-sin(T1)*s23) + az*(-c23);
T5= atan2(s5,c5)

s6= - nx*(cos(T1)*c23*sin(T4) - sin(T1)*cos(T4)) - ny*(sin(T1)*c23*sin(T4) + cos(T1)*cos(T4)) + nz*(s23*sin(T4));
c6= nx*((cos(T1)*c23*cos(T4) + sin(T1)*sin(T4))*cos(T5) - cos(T1)*s23*sin(T5)) + ny*((sin(T1)*c23*cos(T4) - cos(T1)*sin(T4))*cos(T5) - sin(T1)*s23*sin(T5)) - nz*(s23*cos(T4)*cos(T5) + c23*sin(T5));
T6 = atan2(s6,c6)


end
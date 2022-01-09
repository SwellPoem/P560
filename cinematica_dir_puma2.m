function cinematica_dir_puma2(t1,t2,t3,t4,t5,t6)
%% angoli in ingresso
%convertiti in radianti
% t1 = t1*pi/180;
% t2 = t2*pi/180;
% t3 = t3*pi/180;
% t4 = t4*pi/180;
% t5 = t5*pi/180;
% t6 = t6*pi/180;

%% inizializzo variabili link
a2 = 0.4318;    %l2
d3 = 0.15005;   %l4
a3 = 0.0203;    %l3
d4 = 0.4318;    %l5

%% genero le matrici di rotazione

H0_1 = trotz(t1);

H1_2 = trotx(-pi/2)*trotz(t2);

H2_3 = transl([a2,0,d3])*trotz(t3);

H3_4 = trotx(-pi/2)*transl([a3,0,d4])*trotz(t4);

H4_5 = trotx(pi/2)*trotz(t5);

H5_6 = trotx(-pi/2)*trotz(t6);

%%ottengo la matrice finale
H4_6 = H4_5*H5_6;

H3_6 = H3_4*H4_6;

H1_3 = H1_2*H2_3;

H1_6 = H1_3*H3_6;

H0_6 = H0_1*H1_6

end
syms t1 t2 t3 t4 t5 t6 a2 a3 d3 d4

H0_1 = trotz(t1)*trotx(pi/2)

H1_2 = trotz(t2)*transl([a2,0,0])

H2_3 = trotz(t3)*transl([a3,0,d3])*trotx(-pi/2)

H3_4 = trotz(t4)*transl([0,0,d4])*trotx(pi/2)

H4_5 = trotz(t5)*trotx(-pi/2)

H5_6 = trotz(t6)

H4_6 = H4_5*H5_6

H3_6 = H3_4*H4_6

H1_3 = H1_2*H2_3

H1_6 = H1_3*H3_6

H0_6 = H0_1*H1_6
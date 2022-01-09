function cinematica_diretta_p560(th1,th2,th3,th4,th5,th6)
    l2=0.2435;
    l3=0.43245;
    l4=0.0934;
    l5=0.35245;
    l6=0.082;

    th1=th1*pi/180;
    th2=th2*pi/180;
    th3=th3*pi/180;
    th4=th4*pi/180;
    th5=th5*pi/180;
    th6=th6*pi/180;
    
    H2_1=rotz(th1).*transl([l2,0,0]).*roty(pi/2).*rotz(pi/2);
    H3_2=rotz(th2).*transl([l3,0,-l4]);
    H4_3=rotz(th3).*hy(pi/2,[l5 0 0]);
    H5_4=rotz(th4).*rotx(0.2502).*hy(-pi/2,[0 -0.0203 l6]);
    H6_5=rotz(th5).*rotz(0.2502).*roty(pi/2);
    He_6=rotz(th6);
    
    H3_1=H2_1*H3_2;
    H4_1=H3_1*H4_3;
    H5_1=H4_1*H5_4;
    H6_1=H5_1*H6_5;
    He_1=H6_1*He_6
end


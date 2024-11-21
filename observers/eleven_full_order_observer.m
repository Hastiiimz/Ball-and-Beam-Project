
A = [0 1 0 0;
     0 0 -6.9819 0;
     0 0 0 1;
     0 0 0 0];
B = [0; 0; 0; 1];
C = [1 0 0 0];
observer_pole = [ -1 -2 -3 -4 ] ;
L_transpose = acker ( A' , C' , observer_pole ) ;
L = L_transpose'
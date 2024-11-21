clear 
clc
A = [0 1 0 0;
     0 0 -6.9819 0;
     0 0 0 1;
     0 0 0 0];
B = [0; 0; 0; 1];
C = [1 0 0 0];
 
 [ rA , cA ] = size(A) ; 
 [ rB , cB ] = size(B) ; 
 [ rC , cC ] = size(C) ; 
 
 A_bar = [ A zeros(rA,1); -C zeros( rC , 1 ) ] ; 
 B_bar = [ B ; zeros( rC , cB ) ] ; 
 Integral_controlability_rank = rank( ctrb ( A_bar , B_bar ) ) 

 state_feedback_integrators = [ -10 -11 -12 -13 -14 ] ;  
 K = acker ( A_bar , B_bar , state_feedback_integrators ) ; 
 K1 = K ( 1 : rA ) 
 K2 = K ( rA + 1 : rA + rC )

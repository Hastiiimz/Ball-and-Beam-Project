A = [0 1 0 0;
     0 0 -6.9819 0;
     0 0 0 1;
     0 0 0 0];
B = [0; 0; 0; 1];
C = [1 0 0 0];
state_feedback_pole = [ -2 -3 -4 -5 ] ; 
k = acker ( A , B , state_feedback_pole ) ;
N = inv ( -C * inv ( A - B * k ) * B ) ;
k
N
clear 
clc

A = [0 1 0 0;
     0 0 -6.9819 0;
     0 0 0 1;
     0 0 0 0];
B = [0; 0; 0; 1];
C = [1 0 0 0];
controllability_rank = rank( ctrb( A , B ) ) ; 
observability_rank = rank( obsv( A , C ) ) ;
controllability_rank
observability_rank
ctrb( A , B )
obsv( A , C )
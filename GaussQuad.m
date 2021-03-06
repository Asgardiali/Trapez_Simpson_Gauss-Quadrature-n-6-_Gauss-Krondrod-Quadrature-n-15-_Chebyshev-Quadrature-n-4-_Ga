function I=GaussQuad(f,a,b,k)

t=[-0.5773502692 -0.7745966692 -0.8611363116 -0.9061798459 -0.9324695142;
    0.5773502692  0            -0.3399810436 -0.5384693101 -0.6612093865;
    0             0.7745966692  0.3399810436  0            -0.2386191861;
    0             0             0.8611363116  0.5384693101  0.2386191861;
    0             0             0             0.9061798459  0.6612093865;
    0             0             0             0             0.9324695142];

c=[ 1             0.5555555555  0.3478548451  0.2369268850  0.1713244924;
    1             0.8888888888  0.6521451549  0.4786286705  0.3607615730;
    0             0.5555555555  0.6521451549  0.5688888889  0.4679139346;
    0             0             0.3478548451  0.4786286705  0.4679139346;
    0             0             0             0.2369268850  0.3607615730;
    0             0             0             0             0.1713244924];

x(1:k)=0.5*((b-a).*t(1:k,k-1)+b+a);
y=feval(f,x);
cc(1:k)=c(1:k,k-1);
int=y*cc';
I=int*(b-a)/2;
end
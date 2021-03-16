function int = chebquad(f,n,a,b)
% Chebyshev Quadrature denklemlerini a�a��da olu�turdum.
x = cos(((2*(1:n) - 1)/(2*n))*pi);
w = pi/n;
% [a b] aral��� i�in ayarlama yap�ld�.
fx = ((b-a)/2)*f(((b-a)/2)*x + (b+a)/2).*sqrt(1-x.^2);
int = sum(w.*fx);
end
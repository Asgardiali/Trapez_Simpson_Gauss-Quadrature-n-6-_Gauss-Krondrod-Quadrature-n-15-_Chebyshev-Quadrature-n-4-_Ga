function I=Trap(f,a,b,n)

h=(b-a)/n;
S=f(a);
for i=1:n-1
    x(i)=a+h*i;
    S=S+2*f(x(i));
end

S=S+f(b);
I=h*S/2

end
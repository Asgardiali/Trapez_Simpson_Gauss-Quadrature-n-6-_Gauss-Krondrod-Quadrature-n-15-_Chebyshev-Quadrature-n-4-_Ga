function I=Simp(f,a,b,n)

h=(b-a)/n;
S=feval(f,a);

for i=1:2:n-1
    x(i)=a+h*i;
    S=S+4*feval(f,x(i));
end
for i=2:2:n-2
    x(i)=a+h*i;
    S=S+2*feval(f,x(i));
end

S=S+feval(f,b);
I=h*S/3;

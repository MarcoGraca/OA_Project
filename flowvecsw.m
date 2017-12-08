function[tc,f,h,r]= flowvecsw(A,s,c,p,t)
[edges,~]=size(t);
[~,inst]=size(s);
As=A*diag(t);
cvx_begin
variable f(edges,inst)
variable h(edges,inst)
variable r(edges)
tc=dot(p,r);
minimize(tc)
subject to
for i = 1:inst
    0 <= f(:,i) <= r;
    0 <= h(:,i) <= r;
    r <= c;
    A*f(:,i) + s(:,i) <= 10^(-10);
    As*h(:,i) + s(:,i) <= 10^(-10);
end
cvx_end
end
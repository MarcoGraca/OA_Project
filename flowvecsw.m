function[tc,f1,f2,r]= flowvecsw(A,s,c,p,t)
[edges,~]=size(t);
[~,inst]=size(s);
As=A*diag(t);
cvx_begin
variable f1(edges,inst)
variable f2(edges,inst)
variable r(edges)
tc=dot(p,r);
minimize(tc)
subject to
for i = 1:inst
    0 <= f1(:,i) <= r;
    0 <= f2(:,i) <= r;
    r <= c;
    A*f1(:,i) == -s(:,i);
    As*f2(:,i) == -s(:,i);
end
cvx_end
end
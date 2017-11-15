function[f,r,tc]= flowvec(A,s,c,p,E)
[~,edges]=size(A);
[~,inst]=size(s);
cvx_begin
variables f(edges,inst)
variable r(edges)
tc=dot(p,r);
minimize(tc)
subject to
    r(:) <= c(:);
    0 <= f(:);
    for i = 1:inst
        f(:,i) <= r(:);
        A*f(:,i) == -s(:,i);
    end
cvx_end
end

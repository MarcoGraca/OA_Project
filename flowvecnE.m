function[f1,tc,r]= flowvecnE(A,s,c,p)

[~,edges]=size(A);
[~,inst]=size(s);

    cvx_begin
    variable f1(edges,inst)
    variable r(edges)
    tc=dot(p,r);
    minimize(tc)
    subject to
    for i = 1:inst
        A*f1(:,i)+s(:,i) <= 10^(-6);
        0 <= f1(:,i) <= r;
        r <= c;
    end
    cvx_end
    
disp(r);
end
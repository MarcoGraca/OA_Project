function[f]= flowvec(A,s,c,p,E)
[~,edges]=size(A);
[~,inst]=size(s);
cvx_begin
    variables f(edges,inst)
    r=max(f,[],2);
    for i = 1:edges
        if r(i)<10^(-9)
            E(i)=0;
        end
    end
    minimize(dot(p,r)+sum(E))
    subject to
    for i = 1:inst
        0<= f(:,i) <= c(i);
        A*f(:,i)== -s(:,i);
    end
cvx_end
end
function[f]= flowvec(A,s,c,p)
[~,edges]=size(A);
[~,inst]=size(s);
cvx_begin
    variables f(edges,inst)
    minimize( dot(p,max(f,[],2)) )
    subject to
    for i = 1:inst
        0<= f(:,i) <= c(i);
        A*f(:,i)== -s(:,i);
    end
cvx_end
end

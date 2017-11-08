function[f]= flowvec(A,s)
[~,edges]=size(A);
[~,inst]=size(s);
cvx_begin
    variables f(edges,inst)
    minimize( norm(max(f,[],edges),1) )
    subject to
    for i = 1:inst
        0<= f(:,i) <= 1;
        A*f(:,i)== -s(:,i);
    end
cvx_end
end

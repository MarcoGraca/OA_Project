function[f]= flowvec(A,s)
[~,edges]=size(A);
[~,inst]=size(s);
cvx_begin
    variables f(edges,inst) p(edges)
    minimize( norm(p,1) )
    subject to
    for i = 1:inst
        0<= f(:,i) <= 1;
        A*f(:,i)== -s(:,i);
    end
    p=max(f,[],edges);
%     for i=1:edges
%         p(i) = norm(f(i,:),Inf);
%     end
cvx_end
end
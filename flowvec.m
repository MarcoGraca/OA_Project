[nodes,edges]=size(A);
[~,inst]=size(s);
s1=s(:,1);
cvx_begin
    variables f(edges,inst) p(edges)
    minimize( norm(p,1) )
    subject to
    for i=1:inst
        0 <= f(:,i) <= 1;
        A*f(:,i)+s(:,i)=zeros(nodes);
    end
    p=max(f,[],edges);
    
cvx_end